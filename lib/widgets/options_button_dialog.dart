import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:standard_dialogs/standard_dialogs.dart';
import 'package:standard_dialogs/widgets/patterns/options_dialog.dart';

class OptionsButtonDialog<T> extends OptionsDialog<T> {
	OptionsButtonDialog(
		Widget title, 
		Widget content,
		List<DialogOption> options,
		List<DialogAction> actions) : super(title, content, options, actions);

	@override
	List<Widget> buildOptionsList(BuildContext context, List<DialogOption<T>> selectedOptions, Function setState) {
		return options.map<SimpleDialogOption>((e) => SimpleDialogOption(
			onPressed: () {
				confirmDialog(context, [e]);
			},
			child: Row(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
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
				child: actions[0].title)
		];
	}
}
