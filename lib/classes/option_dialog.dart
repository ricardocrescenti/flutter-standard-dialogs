import 'package:flutter/material.dart';

class DialogOption<T> {
	final Widget icon;
	final Widget title;
	final Widget subtitle;
	final T Function(BuildContext context) value;

	DialogOption({
		this.icon,
		@required this.title,
		this.subtitle,
		@required this.value
	});
}