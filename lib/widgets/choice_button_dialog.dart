import 'package:flutter/material.dart';
import 'package:standard_dialogs/standard_dialogs.dart';
import 'package:standard_dialogs/widgets/choice_dialog.dart';

/// Standard widget used by the [showChoicesButtonDialog] method.
class ChoiceButtonDialog<T> extends ChoiceDialog<T> {

	const ChoiceButtonDialog(
		Key? key, 
		Widget title, 
		Widget? content,
		List<DialogChoice<T>> choices,
		List<DialogAction<T>> actions) : super(key, title, content, choices, actions);

	@override
	// ignore: avoid_renaming_method_parameters
	List<Widget> buildChoicesList(BuildContext context, List<DialogChoice<T>> selectedChoices, Function setState) {
		return choices.map<SimpleDialogOption>((e) => SimpleDialogOption(
			onPressed: () {
				confirmDialog(context, [e]);
			},
			child: Row(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					e.icon, 
					buildChoicesDetail(context, e)
				].where((element) => element != null).toList().cast()
			)
		)).toList();
	}

	@override
	List<Widget> buildActions(BuildContext context, List<DialogChoice<T>> selectedChoices) {
		return [
			TextButton(
				onPressed: () => cancelDialog(context), 
				child: actions[0].title)
		];
	}
}
