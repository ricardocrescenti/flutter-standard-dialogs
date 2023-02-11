import 'package:flutter/material.dart';
import 'package:standard_dialogs/standard_dialogs.dart';

import 'choice_button_dialog.dart';
import 'choice_radio_dialog.dart';

/// Abstract widget used to set up the choices dialog
abstract class ChoiceDialog<T> extends StatefulWidget {

	final Widget title;
	final Widget? content;
	final List<DialogChoice<T>> choices;
	final List<DialogAction<T>> actions;

	const ChoiceDialog(Key? key, this.title, this.content, this.choices, this.actions) : super(key: key);

	List<Widget> buildChoicesList(BuildContext context, List<DialogChoice<T>> selectedChoices, Function setValue);

	Widget buildChoicesDetail(BuildContext context, DialogChoice choice) {
		return Expanded(
			child: Padding(
				padding: EdgeInsets.only(left: (choice.icon != null ? 15 : 0)), 
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						buildTitle(context, choice.title),
						buildDescription(context, choice.subtitle)
					].where((element) => element != null).toList().cast(),
				)
			)
		);
	}

	List<Widget> buildActions(BuildContext context, List<DialogChoice<T>> selectedChoices);

	Widget buildTitle(BuildContext context, Widget title) {
		return buildTextWithStyle(title, Theme.of(context).textTheme.subtitle1!);
	}

	Widget? buildDescription(BuildContext context, Widget? description) {

		if (description == null) {
			return null;
		}

		return Padding(
			padding: const EdgeInsetsDirectional.only(top: 2),
			child: buildTextWithStyle(description, Theme.of(context).textTheme.titleMedium!)
		);

	}

	Widget buildTextWithStyle(Widget widget, TextStyle textStyle) {

		if (widget is Text) {
			widget = AnimatedDefaultTextStyle(
				style: widget.style ?? textStyle,
				duration: kThemeChangeDuration,
				softWrap: widget.softWrap ?? true,
				overflow: TextOverflow.fade,
				child: widget,
			);
		}

		return widget;
		//return Expanded(child: widget);

	}
	
	cancelDialog(BuildContext context) {
		Navigator.of(context).pop();
	}

	confirmDialog(BuildContext context, List<DialogChoice<T>>? selectedChoices) {
		if ((selectedChoices ?? []).isNotEmpty) {
			Navigator.of(context).pop(selectedChoices!.map<T>((e) => e.value).toList());
		}
	}

	@override
  	State<StatefulWidget> createState() => _ChoiceDialogState<T>();
}

class _ChoiceDialogState<T> extends State<ChoiceDialog<T>> {

	late List<DialogChoice<T>> selectedChoices = [];

	@override
	void initState() {
		super.initState();
		
		selectedChoices = widget.choices.where((choice) => choice.checked).toList();
		if (this is! ChoiceButtonDialog) {
			
			if (this is ChoiceRadioDialog && selectedChoices.length > 1) {
				selectedChoices = [selectedChoices.elementAt(0)];
			}

		}
		
	}

	@override
	Widget build(BuildContext context) {

		return AlertDialog(
			title: widget.title,
			content: SingleChildScrollView(
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.stretch,
					mainAxisSize: MainAxisSize.min,
					children: [
						(widget.content ?? Container()),
						...widget.buildChoicesList(context, selectedChoices, () => setState((){}))
					]..removeWhere((Widget? element) => element == null)
				)
			),
			contentPadding: const EdgeInsets.only(top: 12),
			actions: widget.buildActions(context, selectedChoices),
		);

	}

}