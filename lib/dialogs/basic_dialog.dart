import 'package:flutter/material.dart';
import 'package:standard_dialogs/standard_dialogs.dart';

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

			return AlertDialog(
				title: title,
				content: content,
				actions: (actions ?? [DialogAction<T>(title: Text(StandardDialogsLocalizations.of(context)[DialogActionLocalizationsEnum.ok]), value: null,)]).map<FlatButton>((e) => FlatButton(
					onPressed: () => e.performClick(context),
					child: e.title)).toList(),
			);

		},
		barrierDismissible: barrierDismissible,
		barrierColor: barrierColor,
		useSafeArea: useSafeArea,
		useRootNavigator: useRootNavigator,
		routeSettings: routeSettings
	);

}