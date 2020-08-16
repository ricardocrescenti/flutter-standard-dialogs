import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:standard_dialogs/standard_dialogs.dart';
import 'package:standard_dialogs/widgets/patterns/options_dialog.dart';

class OptionsCheckBoxDialog<R> extends OptionsDialog<R, List<R>> {
	OptionsCheckBoxDialog(
		Widget title, 
		Widget content,
		List<DialogOption> options) : super(title, content, options);

	@override
	List<Widget> buildOptions(BuildContext context, List<R> currentValue, void Function(List<R> newValue) setValue) {
		return options.map<GestureDetector>((e) {
			R value = e.value(context);

			return GestureDetector(
				onTap: () {
					if (currentValue != null && currentValue.contains(value)) {
						currentValue.remove(value);
					} else {
						currentValue ??= [];
						currentValue.add(value);
					}
					setValue(currentValue);
				},
				child: Row(
					mainAxisAlignment: MainAxisAlignment.start,
					crossAxisAlignment: CrossAxisAlignment.center,
					children: [
						Checkbox(
							value: (currentValue ?? []).contains(value),
							onChanged: null,
						),
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
			);
		}).toList();
	}

	Widget _buildTitle(BuildContext context, Widget title) {
		return buildTextWithStyle(title, Theme.of(context).textTheme.subtitle1);
	}

	Widget _buildDescription(BuildContext context, Widget description) {
		return (description != null ? buildTextWithStyle(description, Theme.of(context).textTheme.subtitle2) : null);
	}
}