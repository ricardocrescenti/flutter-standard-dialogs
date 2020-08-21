import 'package:flutter/material.dart';
import 'package:standard_dialogs/widgets/await_dialog.dart';

/// Displays a dialog with a [CircularProgressIndicator] while a process is
/// running.
/// 
/// To inform the process that will be executed, use the parameter [function], 
/// this parameter must receive a function, which can return a value with the
/// result function.
/// 
/// To inform the user what is being executed, you can use the parameter [message], 
/// it can be updated as necessary during the execution of the function method that
/// is passed as a parameter in the execution of the function.
/// 
/// Below is an example of how to show a dialog and wait for the process to be 
/// completed.
/// 
/// ```dart
/// final result = await showAwaitDialog<bool>(context, 
///     message: Text('Creating user'),
///     function: (context, updateMessage) async {
/// 
///     await Future.delayed(Duration(seconds: 2));
///     updateMessage(Text('Creating permissions'));
///     await Future.delayed(Duration(seconds: 2));
/// 
///     return true;
/// });
/// ```
Future<T> showAwaitDialog<T>(BuildContext context, {
	@required Widget message, 
	Future<T> Function(BuildContext context, Function(Widget message) updateMessage) function,
	Color barrierColor,
	bool useSafeArea = true,
	bool useRootNavigator = true,
	RouteSettings routeSettings}) {
	
	return showDialog<T>(
		context: context, 
		builder: (context) {

			return WillPopScope(
				onWillPop: () => Future.value(false),
				child: AwaitDialog<T>(message, function)
			);

		},
		barrierDismissible: false,
		barrierColor: barrierColor,
		useSafeArea: useSafeArea,
		useRootNavigator: useRootNavigator,
		routeSettings: routeSettings
	);
	
}