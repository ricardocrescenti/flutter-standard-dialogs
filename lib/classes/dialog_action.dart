import 'package:flutter/material.dart';
import 'package:standard_dialogs/standard_dialogs.dart';

/// Class to represent an action (button) of dialogs.
/// 
/// The actions are used in the following dialogs:
/// 
/// - [showBasicDialog]
/// 
/// Below is an example of a dialog with actions.
/// 
/// ```dart
/// const result = showBasicDialog<bool>(context,
///     title: Text('Do you want to activate your location?'),
///     actions: [
///         DialogAction(title: Text('NO'), value: (context) => false),
///         DialogAction(title: Text('YES'), value: (context) => true)
///     ]
/// );
/// ```
class DialogAction<T> {

	/// Icon to be listed in the button action.
	final Widget title;
	
	/// Function that must be executed when the button is clicked, the function
	/// should return the value expected by the dialog.
	final T Function(BuildContext context) value;

	/// Standard constructor of the [DialogAction] class
	DialogAction({
		@required this.title,
		@required this.value
	});

	/// Execute the action of the button click.
	/// 
	/// First, the action function will be executed to obtain the return value, 
	/// and after the dialog will be closed, returning the obtained value.
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