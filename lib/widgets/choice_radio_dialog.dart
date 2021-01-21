import 'package:flutter/material.dart';
import 'package:standard_dialogs/standard_dialogs.dart';
import 'package:standard_dialogs/widgets/choice_dialog.dart';

/// Standard widget used by the [showChoicesRadioDialog] method.
class ChoiceRadioDialog<T> extends ChoiceDialog<T> {
	ChoiceRadioDialog(
		Widget title, 
		Widget content,
		List<DialogChoice<T>> choices,
		List<DialogAction> actions) : super(title, content, choices, actions);

	@override
	List<Widget> buildChoicesList(BuildContext context, List<DialogChoice<T>> selectedChoices, Function setState) {
		return choices.map<InkWell>((e) => InkWell(
			onTap: () {
				selectedChoices
					..clear()
					..add(e);
				setState();
			},
			child: Padding(
				padding: const EdgeInsets.only(left: 10, right: 24),	
				child: Row(
					mainAxisAlignment: MainAxisAlignment.start,
					children: [
						Radio<DialogChoice<T>>(
							value: e,
							groupValue: (selectedChoices.isEmpty ? null : selectedChoices.first),
							onChanged: null,
						),
						e.icon, 
						buildChoicesDetail(context, e)
					].where((element) => element != null).toList()
				)
			)
		)).toList();
	}

	@override
	List<Widget> buildActions(BuildContext context, List<DialogChoice<T>> selectedChoices) {
		return [
			FlatButton(
				onPressed: () => confirmDialog(context, selectedChoices), 
				child: actions[0].title),
			FlatButton(
				onPressed: () => cancelDialog(context), 
				child: actions[1].title)
		];
	}
}
