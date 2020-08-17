import 'package:flutter/material.dart';

class DialogAction<T> {
	final Widget title;
	final T Function(BuildContext context) value;

	DialogAction({
		@required this.title,
		@required this.value
	});

	performClick(BuildContext context) async {

		if (this.value == null) {
			Navigator.of(context).pop();	
		}

		T result = (this.value != null ? await this.value(context) : null);
		if (result != null) {
			Navigator.of(context).pop(result);
		}

	}
}