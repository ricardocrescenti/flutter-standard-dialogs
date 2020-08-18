import 'package:flutter/material.dart';
import 'package:standard_dialogs/widgets/await_dialog.dart';

Future<T> showAwaitDialog<T>(BuildContext context, {
	@required Widget message, 
	Future<T> Function(BuildContext context) function,
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