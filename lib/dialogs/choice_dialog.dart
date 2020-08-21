import 'package:flutter/material.dart';
import 'package:standard_dialogs/standard_dialogs.dart';
import 'package:standard_dialogs/widgets/choice_button_dialog.dart';
import 'package:standard_dialogs/widgets/choice_checkbox_dialog.dart';
import 'package:standard_dialogs/widgets/choice_radio_dialog.dart';

enum DialogChoicesType { button, checkBok, radio }

/// Displays a dialog with the choices informed in the parameter [choices] similar
/// to a [ListTile].
/// 
/// This dialog will be closed the moment you click on one of the choices listed
/// on the screen, or when the `Cancel` button is clicked.
/// 
/// Example of using the dialog:
/// 
/// ```dart
/// String result = await showChoicesButtonDialog<String>(context,
///     title: Text('Select user'),
///     choices: [
///         DialogChoice(
///             icon: Icon(Icons.person),
///             title: Text('Ricardo Crescenti'),
///             subtitle: Text('ricardo.crescenti@gmail.com'),
///             value: 'ricardo.crescenti'),
///         DialogChoice(
///             icon: Icon(Icons.person),
///             title: Text('Ana Luiza Crescenti'),
///             subtitle: Text('analuiza.crescenti@gmail.com'),
///             value: 'analuiza.crescenti'),
///         DialogChoice(
///             icon: Icon(Icons.person),
///             title: Text('Luis Otávio Crescenti'),
///             subtitle: Text('luisotavio.crescenti@gmail.com'),
///             value: 'luisotavio.crescenti'),
///         DialogChoice(
///             icon: Icon(Icons.add),
///             title: Text('Add new account'),
///             value: ''),
///     ]);
/// 
/// if (result != null) {
///     showBasicDialog(context, title: Text('Selected user'), content: Text(result));
/// }
/// ```
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

/// Displays a dialog with the choices informed in the parameter [choices] using
/// radio buttons.
/// 
/// To close the dialog, the user must select one of the choices listed on the 
/// screen and click on the `OK` action, or when the `Cancel` button is clicked.
/// 
/// Example of using the dialog:
/// 
/// ```dart
/// List<String> result = await showChoicesCheckBoxDialog<String>(context, 
///     title: Text('Select users'),
///     choices: [
///         DialogChoice(
///             icon: Icon(Icons.person),
///             title: Text('Ricardo Crescenti'),
///             subtitle: Text('ricardo.crescenti@gmail.com'),
///             value: 'ricardo.crescenti'),
///         DialogChoice(
///             icon: Icon(Icons.person),
///             title: Text('Ana Luiza Crescenti'),
///             subtitle: Text('analuiza.crescenti@gmail.com'),
///             value: 'analuiza.crescenti'),
///         DialogChoice(
///             icon: Icon(Icons.person),
///             title: Text('Luis Otávio Crescenti'),
///             subtitle: Text('luisotavio.crescenti@gmail.com'),
///             value: 'luisotavio.crescenti'),
///     ]);
/// 
/// if (result != null) {
///     showBasicDialog(context, title: Text('Selected users'), content: Text(result.reduce((value, element) => (value == null ? '' : value + ', ') + element)));
/// }
/// ```
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

/// Displays a dialog with the choices informed in the parameter [choices] using
/// checkboxes.
/// 
/// To close the dialog, the user must select one or more choices listed on the
/// screen and click on the `OK` action, or when the` Cancel` button is clicked.
/// 
/// Example of using the dialog:
/// 
/// ```dart
/// String result = await showChoicesRadioDialog<String>(context, 
///     title: Text('Select user'),
///     choices: [
///         DialogChoice(
///             icon: Icon(Icons.person),
///             title: Text('Ricardo Crescenti'),
///             subtitle: Text('ricardo.crescenti@gmail.com'),
///             value: 'ricardo.crescenti'),
///         DialogChoice(
///             icon: Icon(Icons.person),
///             title: Text('Ana Luiza Crescenti'),
///             subtitle: Text('analuiza.crescenti@gmail.com'),
///             value: 'analuiza.crescenti'),
///         DialogChoice(
///             icon: Icon(Icons.person),
///             title: Text('Luis Otavio Crescenti'),
///             subtitle: Text('luisotavio.crescenti@gmail.com'),
///             value: 'luisotavio.crescenti'),
///     ]);
/// 
/// if (result != null) {
///     showBasicDialog(context, title: Text('Selected user'), content: Text(result));
/// }
/// ```
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

/// This is the generic method used by [showChoicesButtonDialog], [showChoicesRadioDialog] 
/// and showChoicesCheckBoxDialog[] to show the choice dialogues. Each type of 
/// dialog will pass the parameters according to your need.
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
