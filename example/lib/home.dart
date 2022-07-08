import 'package:flutter/material.dart';
import 'package:standard_dialogs/standard_dialogs.dart';

import 'localizations/localizations_enum.dart';
import 'localizations/standard_dialogs_localizations.dart';

class HomePage extends StatelessWidget {

	final void Function(Locale locale) changeLocale;

	const HomePage({ 
		Key? key, 
		required this.changeLocale 
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
			title: const Text('Standard Dialogs Example'),
			centerTitle: true,
			),
			body: Center(
				child: SingleChildScrollView(
					padding: const EdgeInsets.all(50),
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						crossAxisAlignment: CrossAxisAlignment.stretch,
						children: <Widget>[

							Padding(
								padding: const EdgeInsets.symmetric(vertical: 10),
								child: Text(ExampleLocalizations.of(context)[TypesOfDialogues.language], style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center)),

							Flex(
								direction: Axis.horizontal,
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
								children: [

									Flexible(
										fit: FlexFit.tight,
										child: Padding(
											padding: const EdgeInsets.only(right: 3),
											child: ElevatedButton(
												style: const ButtonStyle(
													tapTargetSize: MaterialTapTargetSize.padded,
												),
												child: Text(ExampleLocalizations.of(context)[ButtonsLocalizationsEnums.en]),
												onPressed: () => changeLocale(const Locale('en')),
											)
										)
									),
									Flexible(
										fit: FlexFit.tight,
										child: Padding(
											padding: const EdgeInsets.symmetric(horizontal: 3),
											child: ElevatedButton(
												style: const ButtonStyle(
													tapTargetSize: MaterialTapTargetSize.padded
												),
												child: Text(ExampleLocalizations.of(context)[ButtonsLocalizationsEnums.es]),
												onPressed: () => changeLocale(const Locale('es')),
											),
										)
									),
									Flexible(
										fit: FlexFit.tight,
										child: Padding(
											padding: const EdgeInsets.only(left: 3),
											child: ElevatedButton(
												style: const ButtonStyle(
													tapTargetSize: MaterialTapTargetSize.padded
												),
												child: Text(ExampleLocalizations.of(context)[ButtonsLocalizationsEnums.pt]),
												onPressed: () => changeLocale(const Locale('pt')),
											),
										)
									),
								
								],
							),
							
							// BASIC DIALOGS
							Padding(
								padding: const EdgeInsets.symmetric(vertical: 10),
								child: Text(ExampleLocalizations.of(context)[TypesOfDialogues.basic], style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center)),

							ElevatedButton(
								onPressed: () => _showBasicDialogOnlyTitle(context), 
								child: Text(ExampleLocalizations.of(context)[BasicDialogues.onlyTitle])),
							ElevatedButton(
								onPressed: () => _showBasicDialogTitleWithContent(context), 
								child: Text(ExampleLocalizations.of(context)[BasicDialogues.withContent])),
							ElevatedButton(
								onPressed: () => _showBasicDialogWithYesNoAction(context), 
								child: Text(ExampleLocalizations.of(context)[BasicDialogues.yesNoActions])),
							ElevatedButton(
								onPressed: () => _showBasicDialogWithCustomAction(context), 
								child: Text(ExampleLocalizations.of(context)[BasicDialogues.customActions])),
							
							// CHOICES DIALOGS
							Padding(
								padding: const EdgeInsets.symmetric(vertical: 10),
								child: Text(ExampleLocalizations.of(context)[TypesOfDialogues.choice], style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center)),
							
							ElevatedButton(
								onPressed: () => _showChoicesDialogButton(context), 
								child: Text(ExampleLocalizations.of(context)[DialoguesOfChoices.button])),
							ElevatedButton(
								onPressed: () => _showChoicesDialogCheckBox(context), 
								child: Text(ExampleLocalizations.of(context)[DialoguesOfChoices.checkbox])),
							ElevatedButton(
								onPressed: () => _showChoicesDialogRadioButton(context), 
								child: Text(ExampleLocalizations.of(context)[DialoguesOfChoices.radio])),
							
							// RESULT DIALOGS
							Padding(
								padding: const EdgeInsets.symmetric(vertical: 10),
								child: Text(ExampleLocalizations.of(context)[TypesOfDialogues.result], style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center)),
							
							ElevatedButton(
								onPressed: () => _showSuccessDialog(context), 
								child: Text(ExampleLocalizations.of(context)[ResultDialogs.success])),
							ElevatedButton(
								onPressed: () => _showWarningDialog(context), 
								child: Text(ExampleLocalizations.of(context)[ResultDialogs.warning])),
							ElevatedButton(
								onPressed: () => _showErrorDialog(context), 
								child: Text(ExampleLocalizations.of(context)[ResultDialogs.error])),
							
							// AWAIT DIALOGS
							Padding(
								padding: const EdgeInsets.symmetric(vertical: 10),
								child: Text(ExampleLocalizations.of(context)[TypesOfDialogues.awaitDialog], style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center)),
							
							ElevatedButton(
								onPressed: () => _showAwaitDialog(context), 
								child: Text(ExampleLocalizations.of(context)[AwaitDialog.wait5Seconds])),

						],
					)
				),
			), // This trailing comma makes auto-formatting nicer for build methods.
		);
	}

  	_showBasicDialogOnlyTitle(BuildContext context) {

		showBasicDialog(context,
			title: Text(ExampleLocalizations.of(context)[BasicDialoguesOnlyTitle.title]));

  	}

  	_showBasicDialogTitleWithContent(BuildContext context) {

		showBasicDialog<bool>(context,
			title: Text(ExampleLocalizations.of(context)[BasicDialoguesWithContent.title]),
			content: Text(ExampleLocalizations.of(context)[BasicDialoguesWithContent.content]));

  	}

  	_showBasicDialogWithYesNoAction(BuildContext context) {

		showBasicDialog<DialogResult>(context,
			title: Text(ExampleLocalizations.of(context)[BasicDialoguesYesNoActions.title]),
			actions: DialogAction.yesNo(context));
      
  	}

  	_showBasicDialogWithCustomAction(BuildContext context) {

		showBasicDialog<int>(context,
			title: Text(ExampleLocalizations.of(context)[BasicDialoguesCustomActions.title]),
			content: Text(ExampleLocalizations.of(context)[BasicDialoguesCustomActions.content]),
			actions: [
				DialogAction(title: Text(ExampleLocalizations.of(context)[BasicDialoguesCustomActions.alwaysButton]), action: (context) => -1),
				DialogAction(title: Text(ExampleLocalizations.of(context)[BasicDialoguesCustomActions.tenMinutesButton]), action: (context) => 10),
				DialogAction(title: Text(ExampleLocalizations.of(context)[BasicDialoguesCustomActions.cancelButton]), action: (context) => 0),
			]);
      
  	}

	_showChoicesDialogButton(BuildContext context) async {

		String? result = await showChoicesButtonDialog<String>(context,
			title: Text(ExampleLocalizations.of(context)[DialoguesOfChoicesResult.title1]),
			choices: [
				DialogChoice(
					icon: const Icon(Icons.person),
					title: const Text('Ricardo Crescenti'),
					subtitle: const Text('ricardo.crescenti@gmail.com'),
					value: 'ricardo.crescenti'),
				DialogChoice(
					icon: const Icon(Icons.person),
					title: const Text('Ana Luiza Crescenti'),
					subtitle: const Text('analuiza.crescenti@gmail.com'),
					value: 'analuiza.crescenti'),
				DialogChoice(
					icon: const Icon(Icons.person),
					title: const Text('Luis Otávio Crescenti'),
					subtitle: const Text('luisotavio.crescenti@gmail.com'),
					value: 'luisotavio.crescenti'),
				DialogChoice(
					icon: const Icon(Icons.add),
					title: const Text('Add new account'),
					value: ''),
			]);

		if (result != null) {
			
			// ignore: use_build_context_synchronously
			showBasicDialog(context, 
				// ignore: use_build_context_synchronously
				title: Text(ExampleLocalizations.of(context)[DialoguesOfChoicesExemple.title1]), 
				content: Text(result)
			);

		}

	}

	_showChoicesDialogCheckBox(BuildContext context) async {

		List<String>? result = await showChoicesCheckBoxDialog<String>(context, 
			title: Text(ExampleLocalizations.of(context)[DialoguesOfChoicesResult.title2]),
			choices: [
				DialogChoice(
					icon: const Icon(Icons.person),
					title: const Text('Ricardo Crescenti'),
					subtitle: const Text('ricardo.crescenti@gmail.com'),
					value: 'ricardo.crescenti'),
				DialogChoice(
					icon: const Icon(Icons.person),
					title: const Text('Ana Luiza Crescenti'),
					subtitle: const Text('analuiza.crescenti@gmail.com'),
					value: 'analuiza.crescenti'),
				DialogChoice(
					icon: const Icon(Icons.person),
					title: const Text('Luis Otávio Crescenti'),
					subtitle: const Text('luisotavio.crescenti@gmail.com'),
					value: 'luisotavio.crescenti'),
			]);

		if (result != null) {

			// ignore: use_build_context_synchronously
			showBasicDialog(context, 
				// ignore: use_build_context_synchronously
				title: Text(ExampleLocalizations.of(context)[DialoguesOfChoicesExemple.title2]), 
				content: Text(result.join(', '))
			);

		}

	}

	_showChoicesDialogRadioButton(BuildContext context) async {

		String? result = await showChoicesRadioDialog<String>(context, 
			title: Text(ExampleLocalizations.of(context)[DialoguesOfChoicesResult.title1]),
			choices: [
				DialogChoice(
					icon: const Icon(Icons.person),
					title: const Text('Ricardo Crescenti'),
					subtitle: const Text('ricardo.crescenti@gmail.com'),
					value: 'ricardo.crescenti'),
				DialogChoice(
					icon: const Icon(Icons.person),
					title: const Text('Ana Luiza Crescenti'),
					subtitle: const Text('analuiza.crescenti@gmail.com'),
					value: 'analuiza.crescenti'),
				DialogChoice(
					icon: const Icon(Icons.person),
					title: const Text('Luis Otavio Crescenti'),
					subtitle: const Text('luisotavio.crescenti@gmail.com'),
					value: 'luisotavio.crescenti'),
			]);

		if (result != null) {
			
			// ignore: use_build_context_synchronously
			showBasicDialog(context, 
				// ignore: use_build_context_synchronously
				title: Text(ExampleLocalizations.of(context)[DialoguesOfChoicesExemple.title1]), 
				content: Text(result)
			);

		}

	}

	_showSuccessDialog(BuildContext context) {

		showSuccessDialog(context, 
			title: Text(ExampleLocalizations.of(context)[SuccessDialogExample.title]),
			content: Text(ExampleLocalizations.of(context)[SuccessDialogExample.content]),
			action: DialogAction(
				title: Text(ExampleLocalizations.of(context)[SuccessDialogExample.button])
			)
		);

	}

	_showWarningDialog(BuildContext context) {

		showWarningDialog(context, 
			title: Text(ExampleLocalizations.of(context)[WarningDialogExample.title]));

	}

	_showErrorDialog(BuildContext context) {

		showErrorDialog(context, 
			title: Text(ExampleLocalizations.of(context)[ErrorDialogExample.title]));

	}

	_showAwaitDialog(BuildContext context) {

		showAwaitDialog<bool>(context, 
			message: Text(ExampleLocalizations.of(context)[AwaitDialogExample.message1]),
			function: (context, updateMessage) async {
				
				await Future.delayed(const Duration(seconds: 2));
				// ignore: use_build_context_synchronously
				updateMessage(Text(ExampleLocalizations.of(context)[AwaitDialogExample.message2]));
				await Future.delayed(const Duration(seconds: 2));

				return true;
			});

	}
}
