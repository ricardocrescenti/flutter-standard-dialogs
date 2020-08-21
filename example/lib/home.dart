import 'package:flutter/material.dart';
import 'package:standard_dialogs/standard_dialogs.dart';

class HomePage extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
			title: Text('Standard Dialogs Example'),
			centerTitle: true,
			),
			body: Center(
				child: SingleChildScrollView(
					padding: EdgeInsets.all(50),
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						crossAxisAlignment: CrossAxisAlignment.stretch,
						children: <Widget>[
							
							Padding(
								padding: EdgeInsets.symmetric(vertical: 10),
								child: Text('ALERT DIALOGS', style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center)),

							RaisedButton(
								onPressed: () => _showBasicDialogOnlyTitle(context), 
								child: Text('BASIC DIALOG (ONLY TITLE)')),
							RaisedButton(
								onPressed: () => _showBasicDialogTitleWithContent(context), 
								child: Text('BASIC DIALOG (WITH CONTENT)')),
							RaisedButton(
								onPressed: () => _showBasicDialogWithYesNoAction(context), 
								child: Text('BASIC DIALOG (YES/NO ACTIONS)')),
							RaisedButton(
								onPressed: () => _showBasicDialogWithCustomAction(context), 
								child: Text('BASIC DIALOG (CUSTOM ACTIONS)')),
							
							Padding(
								padding: EdgeInsets.symmetric(vertical: 10),
								child: Text('CHOICES DIALOGS', style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center)),
							
							RaisedButton(
								onPressed: () => _showChoicesDialogButton(context), 
								child: Text('CHOICES DIALOG (BUTTON)')),
							RaisedButton(
								onPressed: () => _showChoicesDialogCheckBox(context), 
								child: Text('CHOICES DIALOG (CHECKBOX)')),
							RaisedButton(
								onPressed: () => _showChoicesDialogRadioButton(context), 
								child: Text('CHOICES DIALOG (RADIO)')),
							
							Padding(
								padding: EdgeInsets.symmetric(vertical: 10),
								child: Text('AWAIT DIALOG', style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center)),
							
							RaisedButton(
								onPressed: () => _showAwaitDialog(context), 
								child: Text('WAIT 5 SECONDS')),
							
							Padding(
								padding: EdgeInsets.symmetric(vertical: 10),
								child: Text('RESULT DIALOGS', style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center)),
							
							RaisedButton(
								onPressed: () => _showSucessDialog(context), 
								child: Text('SUCESS')),
							RaisedButton(
								onPressed: () => _showWarningDialog(context), 
								child: Text('WARNING')),
							RaisedButton(
								onPressed: () => _showErrorDialog(context), 
								child: Text('ERROR')),

						],
					)
				),
			), // This trailing comma makes auto-formatting nicer for build methods.
		);
	}

  	_showBasicDialogOnlyTitle(BuildContext context) {

		showBasicDialog(context,
			title: Text('Basic dialog example'));

  	}

  	_showBasicDialogTitleWithContent(BuildContext context) {

		showBasicDialog<bool>(context,
			title: Text('Basic dialog example'),
			content: Text('Content of the dialogue, here you can explain in detail the reason for the dialogue'));

  	}

  	_showBasicDialogWithYesNoAction(BuildContext context) {

		showBasicDialog<bool>(context,
			title: Text('Do you want to activate your location?'),
			actions: [
				DialogAction(title: Text('NO'), value: (context) => false),
				DialogAction(title: Text('YES'), value: (context) => true)
			]);
      
  	}

  	_showBasicDialogWithCustomAction(BuildContext context) {

		showBasicDialog<int>(context,
			title: Text('How long do you want to share your location?'),
			actions: [
				DialogAction(title: Text('CANCEL'), value: (context) => 0),
				DialogAction(title: Text('10 MINUTES'), value: (context) => 10),
				DialogAction(title: Text('ALWAYS'), value: (context) => -1)
			]);
      
  	}

	_showChoicesDialogButton(BuildContext context) async {

		String result = await showChoicesButtonDialog<String>(context,
			title: Text('Select user'),
			//content: Text('Select the user you want to use for the operation.'),
			choices: [
				DialogChoice(
					icon: Icon(Icons.person),
					title: Text('Ricardo Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: 'ricardo.crescenti'),
				DialogChoice(
					icon: Icon(Icons.person),
					title: Text('Ana Luiza Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: 'analuiza.crescenti'),
				DialogChoice(
					icon: Icon(Icons.person),
					title: Text('Luis Otávio Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: 'luisotavio.crescenti'),
				DialogChoice(
					icon: Icon(Icons.add),
					title: Text('Add new account'),
					value: 'ricardo.crescenti'),
			]);

		if (result != null) {
			showBasicDialog(context, title: Text('Selected user'), content: Text(result));
		}

	}

	_showChoicesDialogCheckBox(BuildContext context) async {

		List<String> result = await showChoicesCheckBoxDialog<String>(context, 
			title: Text('Select users'),
			choices: [
				DialogChoice(
					icon: Icon(Icons.person),
					title: Text('Ricardo Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: 'ricardo.crescenti'),
				DialogChoice(
					icon: Icon(Icons.person),
					title: Text('Ana Luiza Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: 'analuiza.crescenti'),
				DialogChoice(
					icon: Icon(Icons.person),
					title: Text('Luis Otávio Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: 'luisotavio.crescenti'),
			]);

		if (result != null) {
			showBasicDialog(context, title: Text('Selected users'), content: Text(result.reduce((value, element) => (value == null ? '' : value + ', ') + element)));
		}

	}

	_showChoicesDialogRadioButton(BuildContext context) async {

		String result = await showChoicesRadioDialog<String>(context, 
			title: Text('Select user'),
			choices: [
				DialogChoice(
					icon: Icon(Icons.person),
					title: Text('Ricardo Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: 'ricardo.crescenti'),
				DialogChoice(
					icon: Icon(Icons.person),
					title: Text('Ana Luiza Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: 'analuiza.crescenti'),
				DialogChoice(
					icon: Icon(Icons.person),
					title: Text('Luis Otavio Crescenti'),
					subtitle: Text('luisotavio.crescenti@gmail.com'),
					value: 'luisotavio.crescenti'),
			]);

		if (result != null) {
			showBasicDialog(context, title: Text('Selected user'), content: Text(result));
		}

	}

	_showAwaitDialog(BuildContext context) async {

		await showAwaitDialog<bool>(context, 
			message: Text('Creating user'),
			function: (context, updateMessage) async {
				
				await Future.delayed(Duration(seconds: 2));
				updateMessage(Text('Creating permissions'));
				await Future.delayed(Duration(seconds: 2));

				return true;
			});

	}

	_showSucessDialog(BuildContext context) async {

		await showSucessDialog(context, 
			title: Text('User created'),
			content: Text('User created successfully!'),
			action: DialogAction(
				title: Text('Get Started'),
				value: null)
			);

	}

	_showWarningDialog(BuildContext context) async {

		await showWarningDialog(context, 
			title: Text('User with pending issues'));

	}

	_showErrorDialog(BuildContext context) async {

		await showErrorDialog(context, 
			title: Text('Error creating user'));

	}
}
