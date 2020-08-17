import 'package:flutter/material.dart';
import 'package:standard_dialogs/standard_dialogs.dart';

abstract class OptionsDialog<T> extends StatefulWidget {
	final Widget title;
	final Widget content;
	final List<DialogOption<T>> options;
	final List<DialogAction> actions;

	OptionsDialog(this.title, this.content, this.options, this.actions);

	List<Widget> buildOptionsList(BuildContext context, List<DialogOption<T>> selectedOptions, Function setValue);

	Widget buildOptionDetail(BuildContext context, DialogOption option) {
		return Expanded(
			child: Padding(
				padding: EdgeInsets.only(left: (option.icon != null ? 15 : 0)), 
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						buildTitle(context, option.title),
						buildDescription(context, option.subtitle)
					].where((element) => element != null).toList(),
				)
			)
		);
	}

	List<Widget> buildActions(BuildContext context, List<DialogOption<T>> selectedOptions);

	Widget buildTitle(BuildContext context, Widget title) {
		return buildTextWithStyle(title, Theme.of(context).textTheme.subtitle1);
	}

	Widget buildDescription(BuildContext context, Widget description) {
		return (description != null 
			? Padding(
				padding: EdgeInsetsDirectional.only(top: 2),
				child: buildTextWithStyle(description, Theme.of(context).textTheme.subtitle2)
			)
			: null);
	}

	Widget buildTextWithStyle(Widget widget, TextStyle textStyle) {

		if (widget is Text) {
			widget = AnimatedDefaultTextStyle(
				style: (widget as Text).style ?? textStyle,
				duration: kThemeChangeDuration,
				softWrap: (widget as Text).softWrap ?? true,
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

	confirmDialog(BuildContext context, List<DialogOption<T>> selectedOptions) {
		if ((selectedOptions ?? []).isNotEmpty) {
			Navigator.of(context).pop(selectedOptions.map<T>((e) => e.value(context)).toList());
		}
	}

	@override
  	State<StatefulWidget> createState() => _OptionsDialogState<T>();
}

class _OptionsDialogState<T> extends State<OptionsDialog<T>> {
	List<DialogOption<T>> selectedOptions = List();

	@override
	Widget build(BuildContext context) {

		return AlertDialog(
			title: widget.title,
			content: SingleChildScrollView(
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.stretch,
					mainAxisSize: MainAxisSize.min,
					children: [widget.content]
						..addAll(widget.buildOptionsList(context, selectedOptions, () => setState((){})))
						..removeWhere((element) => element == null)
				)
			),
			contentPadding: const EdgeInsets.only(top: 12),
			actions: widget.buildActions(context, selectedOptions),
		);

	}
}