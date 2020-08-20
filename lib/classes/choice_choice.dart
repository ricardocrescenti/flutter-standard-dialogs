import 'package:flutter/material.dart';

class DialogChoice<T> {
	final Widget icon;
	final Widget title;
	final Widget subtitle;
	final T value;

	DialogChoice({
		this.icon,
		@required this.title,
		this.subtitle,
		@required this.value
	});
}