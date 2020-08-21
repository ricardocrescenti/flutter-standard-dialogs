import 'package:flutter/material.dart';
import 'package:standard_dialogs/standard_dialogs.dart';
import 'package:standard_dialogs/widgets/choice_button_dialog.dart';
import 'package:standard_dialogs/widgets/choice_checkbox_dialog.dart';
import 'package:standard_dialogs/widgets/choice_radio_dialog.dart';

enum DialogChoicesType { button, checkBok, radio }

/// 
Future<T> showChoicesButtonDialog<T>(BuildContext context, {
	Widget title, 
	Widget content, 
	@required List<DialogChoice<T>> choices, 
	Widget cancelWidget,
	bool barrierDismissible = false,
	Color barrierColor,
	bool useSafeArea = true,
	bool useRootNavigator = true,
	RouteSettings routeSettings}) async {

	List<T> result = await _showChoicesDialog<T>(
		context,
		title: title, 
		content: content, 
		choiceType: DialogChoicesType.button,
		choices: choices, 
		cancelWidget: cancelWidget,
		barrierDismissible: barrierDismissible,
		barrierColor: barrierColor,
		useSafeArea: useSafeArea,
		useRootNavigator: useRootNavigator,
		routeSettings: routeSettings
	);

	return (result != null && result.isNotEmpty ? result[0] : null);
}

/// 
Future<T> showChoicesRadioDialog<T>(BuildContext context, {
	Widget title, 
	Widget content, 
	@required List<DialogChoice<T>> choices, 
	Widget cancelWidget,
	Widget confirmWidget,
	bool barrierDismissible = false,
	Color barrierColor,
	bool useSafeArea = true,
	bool useRootNavigator = true,
	RouteSettings routeSettings}) async {

	List<T> result = await _showChoicesDialog<T>(
		context,
		title: title, 
		content: content, 
		choiceType: DialogChoicesType.radio,
		choices: choices, 
		cancelWidget: cancelWidget,
		okWidget: confirmWidget,
		barrierDismissible: barrierDismissible,
		barrierColor: barrierColor,
		useSafeArea: useSafeArea,
		useRootNavigator: useRootNavigator,
		routeSettings: routeSettings
	);

	return (result != null && result.isNotEmpty ? result[0] : null);
}

/// 
Future<List<T>> showChoicesCheckBoxDialog<T>(BuildContext context, {
	Widget title, 
	Widget content, 
	@required List<DialogChoice<T>> choices, 
	Widget cancelWidget,
	Widget confirmWidget,
	bool barrierDismissible = false,
	Color barrierColor,
	bool useSafeArea = true,
	bool useRootNavigator = true,
	RouteSettings routeSettings}) async {

	List<T> result = await _showChoicesDialog<T>(
		context,
		title: title, 
		content: content, 
		choiceType: DialogChoicesType.checkBok,
		choices: choices, 
		cancelWidget: cancelWidget,
		okWidget: confirmWidget,
		barrierDismissible: barrierDismissible,
		barrierColor: barrierColor,
		useSafeArea: useSafeArea,
		useRootNavigator: useRootNavigator,
		routeSettings: routeSettings
	);

	return (result != null && result.isNotEmpty ? result : null);
}

/// 
Future<List<T>> _showChoicesDialog<T>(BuildContext context, {
	Widget title, 
	Widget content, 
	@required DialogChoicesType choiceType,
	@required List<DialogChoice<T>> choices, 
	Widget cancelWidget,
	Widget okWidget,
	bool barrierDismissible = false,
	Color barrierColor,
	bool useSafeArea = true,
	bool useRootNavigator = true,
	RouteSettings routeSettings}) async {

	return showDialog<List<T>>(
		context: context, 
		builder: (context) {

			Widget child;
			switch (choiceType) {
				case DialogChoicesType.button: child = ChoiceButtonDialog<T>(title, content, choices, [
						DialogAction(title: cancelWidget ?? Text(StandardDialogsLocalizations.of(context)[DialogResult.cancel]), action: null)
					]);
					break;
				case DialogChoicesType.checkBok: child = ChoiceCheckBoxDialog<T>(title, content, choices, [
						DialogAction(title: okWidget ?? Text(StandardDialogsLocalizations.of(context)[DialogResult.ok]), action: null),
						DialogAction(title: cancelWidget ?? Text(StandardDialogsLocalizations.of(context)[DialogResult.cancel]), action: null),
					]);
					break;
				default: child = ChoiceRadioDialog<T>(title, content, choices, [
						DialogAction(title: okWidget ?? Text(StandardDialogsLocalizations.of(context)[DialogResult.ok]), action: null),
						DialogAction(title: cancelWidget ?? Text(StandardDialogsLocalizations.of(context)[DialogResult.cancel]), action: null),
					]);
					break;
			}

			return WillPopScope(
				onWillPop: () => Future.value(barrierDismissible),
				child: child
			);

		},
		barrierDismissible: barrierDismissible,
		barrierColor: barrierColor,
		useSafeArea: useSafeArea,
		useRootNavigator: useRootNavigator,
		routeSettings: routeSettings
	);

}
