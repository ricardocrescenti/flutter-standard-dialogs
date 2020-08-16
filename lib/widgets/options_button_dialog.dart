import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:standard_dialogs/standard_dialogs.dart';
import 'package:standard_dialogs/widgets/patterns/options_dialog.dart';

class OptionsButtonDialog<T> extends OptionsDialog<T, T> {
	OptionsButtonDialog(
		Widget title, 
		Widget content,
		List<DialogOption> options) : super(title, content, options);

	@override
	List<Widget> buildOptions(BuildContext context, T currentValue, void Function(T newValue) setValue) {
		return options.map<SimpleDialogOption>((e) => SimpleDialogOption(
			onPressed: () {
				confirmDialog(context, e.value(context));
			}, 
			child: Row(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.center,
				children: [
					e.icon, 
					Padding(
						padding: EdgeInsets.only(left: (e.icon != null ? 15 : 0)), 
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								_buildTitle(context, e.title),
								_buildDescription(context, e.subtitle)
							].where((element) => element != null).toList(),
						))
				].where((element) => element != null).toList()
			)
		)).toList();
	}

	Widget _buildTitle(BuildContext context, Widget title) {
		return buildTextWithStyle(title, Theme.of(context).textTheme.subtitle1);
	}

	Widget _buildDescription(BuildContext context, Widget description) {
		return (description != null 
			? Padding(
				padding: EdgeInsetsDirectional.only(top: 2),
				child: buildTextWithStyle(description, Theme.of(context).textTheme.subtitle2)
			)
			: null);
	}
}