import 'package:flutter/material.dart';

class AwaitDialog<T> extends StatefulWidget {
  final Widget message;
  final Future<T> Function(BuildContext context) function;

  AwaitDialog(this.message, this.function);

  @override
  State<StatefulWidget> createState() => _AwaitDialogState<T>();
}

class _AwaitDialogState<T> extends State<AwaitDialog<T>> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {

      widget.function(context)
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
                  widget.message,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}