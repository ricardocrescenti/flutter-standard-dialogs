import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:standard_dialogs/standard_dialogs.dart';
import 'package:standard_dialogs/widgets/patterns/options_dialog.dart';

class OptionsRadioDialog<T> extends OptionsDialog<T, T> {
	OptionsRadioDialog(
		Widget title, 
		Widget content,
		List<DialogOption> options) : super(title, content, options);

	@override
	List<Widget> buildOptions(BuildContext context, T currentValue, void Function(T newValue) setValue) {
		return options.map<GestureDetector>((e) {
			T value = e.value(context);

			return GestureDetector(
				onTap: () => setValue(value),
				child: Row(
					mainAxisAlignment: MainAxisAlignment.start,
					crossAxisAlignment: CrossAxisAlignment.center,
					children: [
						Radio<T>(
							value: value,
							groupValue: currentValue,
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

	@override
	List<Widget> buildActions(BuildContext context, T currentValue) {
		return [
			FlatButton(
				onPressed: () => confirmDialog(context, currentValue), 
				child: Text('OK'))
		];
	}

	Widget _buildTitle(BuildContext context, Widget title) {
		return buildTextWithStyle(title, Theme.of(context).textTheme.subtitle1);
	}

	Widget _buildDescription(BuildContext context, Widget description) {
		return (description != null ? buildTextWithStyle(description, Theme.of(context).textTheme.subtitle2) : null);
	}
}