import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:standard_dialogs/standard_dialogs.dart';
import 'package:standard_dialogs/widgets/patterns/options_dialog.dart';

class OptionsRadioDialog<T> extends OptionsDialog<T> {
	OptionsRadioDialog(
		Widget title, 
		Widget content,
		List<DialogOption<T>> options,
		List<DialogAction> actions) : super(title, content, options, actions);

	@override
	List<Widget> buildOptionsList(BuildContext context, List<DialogOption<T>> selectedOptions, Function setState) {
		return options.map<InkWell>((e) => InkWell(
			onTap: () {
				selectedOptions
					..clear()
					..add(e);
				setState();
			},
			child: Row(
				mainAxisAlignment: MainAxisAlignment.start,
				children: [
					Radio<DialogOption<T>>(
						value: e,
						groupValue: (selectedOptions.isEmpty ? null : selectedOptions.first),
						onChanged: null,
					),
					e.icon, 
					buildOptionDetail(context, e)
				].where((element) => element != null).toList()
			)
		)).toList();
	}

	@override
	List<Widget> buildActions(BuildContext context, List<DialogOption<T>> selectedOptions) {
		return [
			FlatButton(
				onPressed: () => cancelDialog(context), 
				child: actions[0].title),
			FlatButton(
				onPressed: () => confirmDialog(context, selectedOptions), 
				child: actions[1].title)
		];
	}
}
