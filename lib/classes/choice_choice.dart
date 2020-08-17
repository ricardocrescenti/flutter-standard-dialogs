import 'package:flutter/material.dart';

class DialogChoice<T> {
	final Widget icon;
	final Widget title;
	final Widget subtitle;
	final T Function(BuildContext context) value;

	DialogChoice({
		this.icon,
		@required this.title,
		this.subtitle,
		@required this.value
	});
}