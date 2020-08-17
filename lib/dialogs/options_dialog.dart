import 'package:flutter/material.dart';
import 'package:standard_dialogs/standard_dialogs.dart';
import 'package:standard_dialogs/widgets/options_button_dialog.dart';
import 'package:standard_dialogs/widgets/options_checkbox_dialog.dart';
import 'package:standard_dialogs/widgets/options_radio_dialog.dart';

enum DialogOptionsType { button, checkBok, radio }

Future<T> showButtonDialog<T>(BuildContext context, {
	Widget title, 
	Widget content, 
	@required List<DialogOption<T>> options, 
	Widget cancelWidget,
	bool barrierDismissible = false,
	Color barrierColor,
	bool useSafeArea = true,
	bool useRootNavigator = true,
	RouteSettings routeSettings}) async {

	List<T> result = await _showOptionsDialog<T>(
		context,
		title: title, 
		content: content, 
		optionType: DialogOptionsType.button,
		options: options, 
		cancelWidget: cancelWidget,
		barrierDismissible: barrierDismissible,
		barrierColor: barrierColor,
		useSafeArea: useSafeArea,
		useRootNavigator: useRootNavigator,
		routeSettings: routeSettings
	);

	return (result != null && result.isNotEmpty ? result[0] : null);
}

Future<T> showRadioDialog<T>(BuildContext context, {
	Widget title, 
	Widget content, 
	@required List<DialogOption<T>> options, 
	Widget cancelWidget,
	Widget confirmWidget,
	bool barrierDismissible = false,
	Color barrierColor,
	bool useSafeArea = true,
	bool useRootNavigator = true,
	RouteSettings routeSettings}) async {

	List<T> result = await _showOptionsDialog<T>(
		context,
		title: title, 
		content: content, 
		optionType: DialogOptionsType.radio,
		options: options, 
		cancelWidget: cancelWidget,
		confirmWidget: confirmWidget,
		barrierDismissible: barrierDismissible,
		barrierColor: barrierColor,
		useSafeArea: useSafeArea,
		useRootNavigator: useRootNavigator,
		routeSettings: routeSettings
	);

	return (result != null && result.isNotEmpty ? result[0] : null);
}

Future<List<T>> showCheckBoxDialog<T>(BuildContext context, {
	Widget title, 
	Widget content, 
	@required List<DialogOption<T>> options, 
	Widget cancelWidget,
	Widget confirmWidget,
	bool barrierDismissible = false,
	Color barrierColor,
	bool useSafeArea = true,
	bool useRootNavigator = true,
	RouteSettings routeSettings}) async {

	List<T> result = await _showOptionsDialog<T>(
		context,
		title: title, 
		content: content, 
		optionType: DialogOptionsType.checkBok,
		options: options, 
		cancelWidget: cancelWidget,
		confirmWidget: confirmWidget,
		barrierDismissible: barrierDismissible,
		barrierColor: barrierColor,
		useSafeArea: useSafeArea,
		useRootNavigator: useRootNavigator,
		routeSettings: routeSettings
	);

	return (result != null && result.isNotEmpty ? result : null);
}

Future<List<T>> _showOptionsDialog<T>(BuildContext context, {
	Widget title, 
	Widget content, 
	@required DialogOptionsType optionType,
	@required List<DialogOption<T>> options, 
	Widget cancelWidget,
	Widget confirmWidget,
	bool barrierDismissible = false,
	Color barrierColor,
	bool useSafeArea = true,
	bool useRootNavigator = true,
	RouteSettings routeSettings}) async {

	return showDialog<List<T>>(
		context: context, 
		builder: (context) {

			switch (optionType) {
				case DialogOptionsType.button: return OptionsButtonDialog<T>(title, content, options, [
					DialogAction(title: cancelWidget ?? Text('CANCEL'), value: null)
				]);
				case DialogOptionsType.checkBok: return OptionsCheckBoxDialog<T>(title, content, options, [
					DialogAction(title: cancelWidget ?? Text('CANCEL'), value: null),
					DialogAction(title: cancelWidget ?? Text('OK'), value: null),
				]);
				default: return OptionsRadioDialog<T>(title, content, options, [
					DialogAction(title: cancelWidget ?? Text('CANCEL'), value: null),
					DialogAction(title: cancelWidget ?? Text('OK'), value: null),
				]);
			}

		},
		barrierDismissible: barrierDismissible,
		barrierColor: barrierColor,
		useSafeArea: useSafeArea,
		useRootNavigator: useRootNavigator,
		routeSettings: routeSettings
	);

}
