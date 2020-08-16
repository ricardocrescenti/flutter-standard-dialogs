import 'package:flutter/material.dart';
import 'package:standard_dialogs/standard_dialogs.dart';

abstract class OptionsDialog<R, T> extends StatefulWidget {
	final Widget title;
	final Widget content;
	final List<DialogOption<R>> options;

	OptionsDialog(this.title, this.content, this.options);

	List<Widget> buildChildren(Widget content, List<Widget> options) {
		List<Widget> list = [content]
			..addAll(options)
			..removeWhere((element) => element == null);
		return list;
	}

	List<Widget> buildOptions(BuildContext context, T currentValue, void Function(T newValue) setValue);

	List<Widget> buildActions(BuildContext context, T currentValue) => null;

	Widget buildTextWithStyle(Widget widget, TextStyle textStyle) {

		if (widget is! Text) {
			return widget;
		}

		if ((widget as Text).style != null) {
			return widget;
		}

		return AnimatedDefaultTextStyle(
			style: textStyle,
			duration: kThemeChangeDuration,
			child: widget ?? const SizedBox(),
		);
	}

	cancelDialog(BuildContext context) {
		Navigator.of(context).pop();
	}

	confirmDialog(BuildContext context, T currentValue) {
		if (currentValue != null) {
			Navigator.of(context).pop(currentValue);
		}
	}

	@override
  	State<StatefulWidget> createState() => _OptionsDialogState<R, T>();
}

class _OptionsDialogState<R, T> extends State<OptionsDialog<R, T>> {
	T currentValue;

	@override
	Widget build(BuildContext context) {

		return AlertDialog(
			title: widget.title,
			content: SingleChildScrollView(child: Column(
				mainAxisSize: MainAxisSize.min,
				children: widget.buildChildren(widget.content, widget.buildOptions(context, currentValue, setValue)))
			),
		);

		// return SimpleDialog(
		// 	title: widget.title,
		// 	children: widget.buildChildren(widget.content, widget.buildChoices(context, currentValue, setValue))
		// );

	}

	setValue (T newValue) {
		setState(() {
		  currentValue = newValue;
		});
	}
}