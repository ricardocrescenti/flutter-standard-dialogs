import 'package:flutter/material.dart';
import 'package:standard_dialogs/standard_dialogs.dart';

/// Standard widget used by the [showAwaitDialog] method.
class AwaitDialog<T> extends StatefulWidget {

	/// Standard widget used by the [showAwaitDialog] method.
	/// 
	/// Initial message to be displayed in the dialog, it can be changed as needed
	/// using the `updateMessage` method passed by parameter in the function being
	/// executed.
	final Widget message;
	/// Function to be executed, the dialog will be visible until it finishes the
	/// execution.
	final Future<T> Function(BuildContext context, Function(Widget message) updateMessage) function;

	const AwaitDialog({ 
		Key? key, 
		required this.message, 
		required this.function
	}) : super(key: key);

	@override
	State<StatefulWidget> createState() => _AwaitDialogState<T>();

}

class _AwaitDialogState<T> extends State<AwaitDialog<T>> {
	
	late Widget message;

	@override
	void initState() {

		super.initState();
		message = widget.message;

		WidgetsBinding.instance.addPostFrameCallback((_) {

			widget.function(context, updateMessage)
					.then((onValue) => Navigator.of(context).pop(onValue))
					.catchError((onError) => Navigator.of(context).pop());

		});

	}

	@override
	Widget build(BuildContext context) {

		return Dialog(
			elevation: 0,
			backgroundColor: Colors.transparent,
			child: Column(
				mainAxisSize: MainAxisSize.min,
				children: <Widget>[
					Card(
						child: Padding(
							padding: const EdgeInsets.only(left: 50, top: 25, right: 50, bottom: 25),
							child: Column(
								children: <Widget>[
									const CircularProgressIndicator(),
									const Padding(padding: EdgeInsets.all(10),),
									standardizeMessage(message),
								],
							),
						),
					)
				],
			),
		);
	}

	/// Updates the message displayed on the screen
	updateMessage(Widget message) {

		setState(() {
			this.message = message;
		});

	}

	/// Applying the display patterns of the message listed in the dialog, this is
	/// only done if the message is a 'Text'.
	Widget standardizeMessage(Widget widget) {

		if (widget is Text) {
			widget = AnimatedDefaultTextStyle(
				style: (widget.style ?? Theme.of(context).textTheme.bodyMedium)!,
				duration: kThemeChangeDuration,
				textAlign: TextAlign.center,
				softWrap: widget.softWrap ?? true,
				overflow: TextOverflow.fade,
				child: widget,
			);
		}

		return widget;

	}

}