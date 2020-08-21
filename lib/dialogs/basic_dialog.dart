import 'package:flutter/material.dart';
import 'package:standard_dialogs/standard_dialogs.dart';

/// Displays a basic dialog with title and simple content, with the possibility
/// to add customizable action buttons.
/// 
/// You can show the dialog only with the title, and optionally you can enter a 
/// content with details of the dialog.
/// 
/// It is also possible to add as many action buttons as needed, and each button
/// will have its action and return.
/// 
/// Below is an example of a dialog with title, content and two buttons to return 
/// true or false.
/// 
/// ```dart
/// final result = await showBasicDialog<bool>(context,
///     title: Text('Basic dialog example'),
///     content: Text('Content of the dialogue, here you can explain in detail the reason for the dialogue'),
///     actions: [
///         DialogAction(title: Text('NO'), value: (context) => false),
///         DialogAction(title: Text('YES'), value: (context) => true)
///     ]
/// );
/// ```
Future<T> showBasicDialog<T>(BuildContext context, {
	@required Widget title, 
	Widget content, 
	List<DialogAction<T>> actions, 
	bool barrierDismissible = false,
	Color barrierColor,
	bool useSafeArea = true,
	bool useRootNavigator = true,
	RouteSettings routeSettings}) async {

	return showDialog<T>(
		context: context, 
		builder: (context) {

			return WillPopScope(
				onWillPop: () => Future.value(barrierDismissible),
				child: AlertDialog(
					title: title,
					content: content,
					actions: (actions ?? [DialogAction<T>(title: Text(StandardDialogsLocalizations.of(context)[DialogResult.ok]), action: null,)]).map<FlatButton>((e) => FlatButton(
						onPressed: () => e.performClick(context),
						child: e.title)).toList(),
				)
			);

		},
		barrierDismissible: barrierDismissible,
		barrierColor: barrierColor,
		useSafeArea: useSafeArea,
		useRootNavigator: useRootNavigator,
		routeSettings: routeSettings
	);

}