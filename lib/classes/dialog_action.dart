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
	final T Function(BuildContext context)? action;

	/// Standard constructor of the [DialogAction] class
	DialogAction({
		required this.title,
		this.action
	});

	/// Execute the action of the button click.
	/// 
	/// First, the action function will be executed to obtain the return value, 
	/// and after the dialog will be closed, returning the obtained value.
	performClick(BuildContext context) async {

		if (action == null) {
			Navigator.of(context).pop();	
		}

		T? result = (action != null ? action!(context) : null);
		if (result != null) {
			Navigator.of(context).pop(result);
		}

	}

	/// Returns a list of [DialogAction] with returns of type [DialogResult.ok]
	/// and [DialogResult.cancel] to be used in the [showBasicDialog] method.
	static List<DialogAction<DialogResult>> ok(BuildContext context) {
		return [
			DialogAction(title: Text(StandardDialogsLocalizations.of(context)[DialogResult.ok]), action: (context) => DialogResult.ok),
		];
	}

	/// Returns a list of [DialogAction] with returns of type [DialogResult.ok]
	/// and [DialogResult.cancel] to be used in the [showBasicDialog] method.
	static List<DialogAction<DialogResult>> okCancel(BuildContext context) {
		return [
			DialogAction(title: Text(StandardDialogsLocalizations.of(context)[DialogResult.ok]), action: (context) => DialogResult.ok),
			DialogAction(title: Text(StandardDialogsLocalizations.of(context)[DialogResult.cancel]), action: (context) => DialogResult.cancel),
		];
	}

	/// Returns a list of [DialogAction] with returns of type [DialogResult.abort],
	/// [DialogResult.retry], and [DialogResult.ignore] to be used in the 
	/// [showBasicDialog] method.
	static List<DialogAction<DialogResult>> abortRetryIgnore(BuildContext context) {
		return [
			DialogAction(title: Text(StandardDialogsLocalizations.of(context)[DialogResult.abort]), action: (context) => DialogResult.abort),
			DialogAction(title: Text(StandardDialogsLocalizations.of(context)[DialogResult.retry]), action: (context) => DialogResult.retry),
			DialogAction(title: Text(StandardDialogsLocalizations.of(context)[DialogResult.ignore]), action: (context) => DialogResult.ignore),
		];
	}

	/// Returns a list of [DialogAction] with returns of type [DialogResult.yes],
	/// [DialogResult.no] and [DialogResult.cancel] to be used in the [showBasicDialog] 
	/// method.
	static List<DialogAction<DialogResult>> yesNoCancel(BuildContext context) {
		return [
			DialogAction(title: Text(StandardDialogsLocalizations.of(context)[DialogResult.yes]), action: (context) => DialogResult.yes),
			DialogAction(title: Text(StandardDialogsLocalizations.of(context)[DialogResult.no]), action: (context) => DialogResult.no),
			DialogAction(title: Text(StandardDialogsLocalizations.of(context)[DialogResult.cancel]), action: (context) => DialogResult.cancel),
		];
	}

	/// Returns a list of [DialogAction] with returns of type [DialogResult.yes]
	/// and [DialogResult.no] to be used in the [showBasicDialog] method.
	static List<DialogAction<DialogResult>> yesNo(BuildContext context) {
		return [
			DialogAction(title: Text(StandardDialogsLocalizations.of(context)[DialogResult.yes]), action: (context) => DialogResult.yes),
			DialogAction(title: Text(StandardDialogsLocalizations.of(context)[DialogResult.no]), action: (context) => DialogResult.no)
		];
	}

	/// Returns a list of [DialogAction] with returns of type [DialogResult.retry]
	/// and [DialogResult.cancel] to be used in the [showBasicDialog] method.
	static List<DialogAction<DialogResult>> retryCancel(BuildContext context) {
		return [
			DialogAction(title: Text(StandardDialogsLocalizations.of(context)[DialogResult.retry]), action: (context) => DialogResult.retry),
			DialogAction(title: Text(StandardDialogsLocalizations.of(context)[DialogResult.cancel]), action: (context) => DialogResult.cancel)
		];
	}

}