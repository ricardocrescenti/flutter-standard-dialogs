import 'package:flutter/material.dart';
import 'package:standard_dialogs/standard_dialogs.dart';
import 'package:standard_dialogs/widgets/choice_dialog.dart';

/// Standard widget used by the [showChoicesCheckBoxDialog] method.
class ChoiceCheckBoxDialog<T> extends ChoiceDialog<T> {
	
	const ChoiceCheckBoxDialog(
		Key? key, 
		Widget title, 
		Widget? content,
		List<DialogChoice<T>> choices,
		List<DialogAction<T>> actions) : super(key, title, content, choices, actions);

	@override
	// ignore: avoid_renaming_method_parameters
	List<Widget> buildChoicesList(BuildContext context, List<DialogChoice<T>> selectedChoices, Function setState) {
		return choices.map<InkWell>((e) => InkWell(
			onTap: () => onTap(e, selectedChoices, setState),
			child: Padding(
				padding: const EdgeInsets.only(left: 10, right: 24),	
				child: Row(
					mainAxisAlignment: MainAxisAlignment.start,
					children: [
						Checkbox(
							value: selectedChoices.contains(e),
							onChanged: (checked) => onTap(e, selectedChoices, setState),
						),
						e.icon, 
						buildChoicesDetail(context, e)
					].where((element) => element != null).toList().cast()
				)
			)
		)).toList();
	}

	@override
	List<Widget> buildActions(BuildContext context, List<DialogChoice<T>> selectedChoices) {
		return [
			TextButton(
				onPressed: () => confirmDialog(context, selectedChoices), 
				child: actions[0].title),
			TextButton(
				onPressed: () => cancelDialog(context), 
				child: actions[1].title)
		];
	}

	onTap(DialogChoice<T> dialogChoice, List<DialogChoice<T>> selectedChoices, Function setState) {

		if (selectedChoices.contains(dialogChoice)) {
			selectedChoices.remove(dialogChoice);
		} else {
			selectedChoices.add(dialogChoice);
		}
		setState();

	}
}
