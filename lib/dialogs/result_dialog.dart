import 'package:flutter/material.dart';
import 'package:standard_dialogs/standard_dialogs.dart';
import 'package:standard_dialogs/widgets/result_dialog.dart';

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
		title: (title ?? Text(StandardDialogsLocalizations.of(context)[ResultDialogLocalizationsEnum.sucess])),
		content: content,
		action: action,
		barrierDismissible: barrierDismissible,
		barrierColor: barrierColor,
		useSafeArea: useSafeArea,
		useRootNavigator: useRootNavigator,
		routeSettings: routeSettings);

}

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
						title: Text(StandardDialogsLocalizations.of(context)[DialogActionLocalizationsEnum.ok]), 
						value: null))
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