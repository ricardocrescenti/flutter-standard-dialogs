import 'package:flutter/material.dart';
import 'package:standard_dialogs/standard_dialogs.dart';
import 'package:standard_dialogs/widgets/options_button_dialog.dart';
import 'package:standard_dialogs/widgets/options_checkbox_dialog.dart';
import 'package:standard_dialogs/widgets/options_radio_dialog.dart';

enum DialogChoiceType { button, checkBok, radio }

Future<T> showOptionsDialog<T>(BuildContext context, {
	Widget title, 
	Widget content, 
	@required DialogChoiceType choiceType,
	@required List<DialogOption<T>> options, 
	bool barrierDismissible = true,
	Color barrierColor,
	bool useSafeArea = true,
	bool useRootNavigator = true,
	RouteSettings routeSettings}) async {

	return showDialog<T>(
		context: context, 
		builder: (context) {

			switch (choiceType) {
				case DialogChoiceType.button: return OptionsButtonDialog<T>(title, content, options);
				case DialogChoiceType.checkBok: return OptionsCheckBoxDialog<T>(title, content, options);
				default: return OptionsRadioDialog<T>(title, content, options);
			}

		},
		barrierDismissible: barrierDismissible,
		barrierColor: barrierColor,
		useSafeArea: useSafeArea,
		useRootNavigator: useRootNavigator,
		routeSettings: routeSettings
	);

}
