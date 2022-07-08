import 'package:flutter/material.dart';
import 'package:standard_dialogs/standard_dialogs.dart';

/// Standard widget used by the methods [showSuccessDialog], [showWarningDialog], 
/// [showErrorDialog] and [showResultDialog].
class ResultDialog extends StatelessWidget {
	final Color backgroundColor;
	final Color textColor;
	final Widget icon;
	final Widget? title;
	final Widget? content;
	final DialogAction action;
	final Radius borderRadius = const Radius.circular(5);

	ResultDialog({
		Key? key,
		required this.backgroundColor,
		required this.textColor,
		required this.icon,
		this.title,
		this.content,
		required this.action
	}) : super(key: key) {
		assert(title != null || content != null);
	}

	@override
	Widget build(BuildContext context) {
		
		return AlertDialog(
			title: buildTitle(context),
			titlePadding: EdgeInsets.zero,
			contentPadding: EdgeInsets.zero,
			content: Container(
				decoration: BoxDecoration(
					color: Theme.of(context).scaffoldBackgroundColor,
					borderRadius: BorderRadius.only(
							bottomLeft: borderRadius,
							bottomRight: borderRadius
					)
				),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.stretch,
					mainAxisSize: MainAxisSize.min,
					children: [
						buildContend(context),
						buildActions(context)
					]
				)
			),
			backgroundColor: Colors.transparent,
		);

	}

	buildTitle(BuildContext context) {

		return Container(
			decoration: BoxDecoration(
				color: backgroundColor,
				borderRadius: BorderRadius.only(
						topLeft: borderRadius,
						topRight: borderRadius
				)
			),
			//color: color,
			padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
			child: Column(
				children: [
					Padding(
						padding: const EdgeInsets.only(bottom: 10),	
						child: (icon is Icon 
							? IconTheme.merge(
								data: IconThemeData(size: 70, color: textColor), 
								child: icon)
							: icon
						)
					),
					(title != null 
						? (title is Text 
							? AnimatedDefaultTextStyle(
								style: (title as Text).style ?? Theme.of(context).textTheme.headline6!.copyWith(color: textColor),
								textAlign: (title as Text).textAlign ?? TextAlign.center,
								duration: kThemeChangeDuration,
								child: title!)
							: title) 
						: Container()
					)!
				],
			),
		);

	}

	buildContend(BuildContext context) {
		if (content == null) {
			return Container();
		}

		return Container(
			padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
			child: (content is Text 
				? AnimatedDefaultTextStyle(
					style: (content as Text).style ?? Theme.of(context).textTheme.subtitle1!,
					duration: kThemeChangeDuration,
					textAlign: (content as Text).textAlign ?? TextAlign.center,
					child: content!)
				: content
			),
		);
	}

	buildActions(BuildContext context) {
		return Container(
			padding: const EdgeInsets.symmetric(vertical: 15),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					ElevatedButton(
						style: ElevatedButton.styleFrom(
							primary: backgroundColor,
							onPrimary: textColor,
							shape: RoundedRectangleBorder(
								borderRadius: BorderRadius.circular(30.0)
							)
						),
						child: Padding(
							padding: const EdgeInsets.symmetric(horizontal: 25),
							child: action.title
						),
						onPressed: () => action.performClick(context)
					)
				],
			),
		);
	}
}
