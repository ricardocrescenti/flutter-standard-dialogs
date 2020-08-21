import 'package:flutter/material.dart';
import 'package:standard_dialogs/standard_dialogs.dart';
import 'package:standard_dialogs/widgets/result_dialog.dart';

/// Displays a dialog to indicate the result of an action that resulted in an
/// error.
/// 
/// The default color of the dialog is [Colors.red [300]] with the [Icons.error]
/// icon, if you want to modify the displayed icon, enter the [icon] parameter.
/// 
/// If you want to display more details about the operation, use the [content] 
/// parameter.
/// 
/// Example of using the dialog:
/// 
/// ```dart
/// await showErrorDialog(context, 
///     title: Text('Error creating user'));
/// ```
Future<T> showErrorDialog<T>(BuildContext context, {
	Widget icon = const Icon(Icons.error), 
	@required Widget title, 
	Widget content, 
	DialogAction<T> action, 
	bool barrierDismissible = false,
	Color barrierColor,
	bool useSafeArea = true,
	bool useRootNavigator = true,
	RouteSettings routeSettings}) {

	return showResultDialog(context, 
		backgroundColor: Colors.red[300], 
		textColor: Colors.white,
		icon: icon, 
		title: (title ?? Text(StandardDialogsLocalizations.of(context)[ResultDialogLocalizationsEnum.error])),
		content: content,
		action: action,
		barrierDismissible: barrierDismissible,
		barrierColor: barrierColor,
		useSafeArea: useSafeArea,
		useRootNavigator: useRootNavigator,
		routeSettings: routeSettings);

}

/// Displays a dialog to indicate the result of an action that has been 
/// successfully performed
/// 
/// The default color of the dialog is [Colors.lightGreen [400]] with the 
/// [Icons.check_circle] icon, if you want to modify the displayed icon, enter 
/// the [icon] parameter.
/// 
/// If you want to display more details about the operation, use the [content]
/// parameter.
/// 
/// Example of using the dialog:
/// 
/// ```dart
/// await showSuccessDialog(context, 
///     title: Text('User created'),
///     content: Text('User created successfully!'),
///     action: DialogAction(
///         title: Text('Get Started'),
///         action: null)
///     );
/// ```
Future<T> showSuccessDialog<T>(BuildContext context, {
	Widget icon = const Icon(Icons.check_circle), 
	@required Widget title,
	Widget content, 
	DialogAction<T> action, 
	bool barrierDismissible = false,
	Color barrierColor,
	bool useSafeArea = true,
	bool useRootNavigator = true,
	RouteSettings routeSettings}) {

	return showResultDialog(context, 
		backgroundColor: Colors.lightGreen[400],
		textColor: Colors.white, 
		icon: icon, 
		title: (title ?? Text(StandardDialogsLocalizations.of(context)[ResultDialogLocalizationsEnum.success])),
		content: content,
		action: action,
		barrierDismissible: barrierDismissible,
		barrierColor: barrierColor,
		useSafeArea: useSafeArea,
		useRootNavigator: useRootNavigator,
		routeSettings: routeSettings);

}

/// Displays a dialog to warn the user about something that needs attention.
/// 
/// The default color of the dialog is [Colors.orange [300]] with the [Icons.warning]
/// icon, if you want to modify the displayed icon, enter the [icon] parameter.
/// 
/// If you want to display more details about the operation, use the [content] 
/// parameter.
/// 
/// Example of using the dialog:
/// 
/// ```dart
/// await showWarningDialog(context, 
///     title: Text('User with pending issues'));
/// ```
Future<T> showWarningDialog<T>(BuildContext context, {
	Widget icon = const Icon(Icons.warning), 
	@required Widget title, 
	Widget content, 
	DialogAction<T> action, 
	bool barrierDismissible = false,
	Color barrierColor,
	bool useSafeArea = true,
	bool useRootNavigator = true,
	RouteSettings routeSettings}) {

	return showResultDialog(context, 
		backgroundColor: Colors.orange[300], 
		textColor: Colors.white,
		icon: icon, 
		title: (title ?? Text(StandardDialogsLocalizations.of(context)[ResultDialogLocalizationsEnum.warning])),
		content: content,
		action: action,
		barrierDismissible: barrierDismissible,
		barrierColor: barrierColor,
		useSafeArea: useSafeArea,
		useRootNavigator: useRootNavigator,
		routeSettings: routeSettings);

}

/// Generic method used to generate the dialogs of success, warning and error.
/// 
/// Use this method if you want to create a similar dialog with other colors and 
/// icons.
Future<T> showResultDialog<T>(BuildContext context, {
	@required Color backgroundColor,
	@required Color textColor,
	@required Widget icon, 
	@required Widget title, 
	Widget content, 
	DialogAction<T> action, 
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
				child: ResultDialog(
					backgroundColor: backgroundColor,
					textColor: textColor,
					icon: icon,
					title: title,
					content: content,
					action: (action ?? DialogAction<T>(
						title: Text(StandardDialogsLocalizations.of(context)[DialogResult.ok]), 
						action: null))
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