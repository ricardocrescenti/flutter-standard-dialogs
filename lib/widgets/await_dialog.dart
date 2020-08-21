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

  AwaitDialog(this.message, this.function);

  @override
  State<StatefulWidget> createState() => _AwaitDialogState<T>();
}

class _AwaitDialogState<T> extends State<AwaitDialog<T>> {
  Widget message;

  @override
  void initState() {
    super.initState();
    this.message = widget.message;

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
              padding: EdgeInsets.only(left: 50, top: 25, right: 50, bottom: 25),
              child: Column(
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(padding: EdgeInsets.all(10),),
                  this.message,
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
}