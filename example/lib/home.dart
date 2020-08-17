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
								child: Text('OPTIONS DIALOGS', style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center)),
							
							RaisedButton(
								onPressed: () => _showOptionDialogButton(context), 
								child: Text('OPTIONS DIALOG (BUTTON)')),
							RaisedButton(
								onPressed: () => _showOptionsDialogCheckBox(context), 
								child: Text('OPTIONS DIALOG (CHECKBOX)')),
							RaisedButton(
								onPressed: () => _showOptionsDialogRadioButton(context), 
								child: Text('OPTIONS DIALOG (RADIO)')),

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

	_showOptionDialogButton(BuildContext context) async {

		String result = await showButtonDialog<String>(context,
			title: Text('Select user'),
			//content: Text('Select the user you want to use for the operation.'),
			options: [
				DialogOption(
					icon: Icon(Icons.person),
					title: Text('Ricardo Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'ricardo.crescenti'),
				DialogOption(
					icon: Icon(Icons.person),
					title: Text('Ana Luiza Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'analuiza.crescenti'),
				DialogOption(
					icon: Icon(Icons.person),
					title: Text('Luis Otávio Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'luisotavio.crescenti'),
				DialogOption(
					icon: Icon(Icons.add),
					title: Text('Add new account'),
					value: (context) => 'ricardo.crescenti'),
			]);

		if (result != null) {
			showBasicDialog(context, title: Text('Selected user'), content: Text(result));
		}

	}

	_showOptionsDialogCheckBox(BuildContext context) async {

		List<String> result = await showCheckBoxDialog<String>(context, 
			title: Text('Select users'),
			options: [
				DialogOption(
					icon: Icon(Icons.person),
					title: Text('Ricardo Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'ricardo.crescenti'),
				DialogOption(
					icon: Icon(Icons.person),
					title: Text('Ana Luiza Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'analuiza.crescenti'),
				DialogOption(
					icon: Icon(Icons.person),
					title: Text('Luis Otávio Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'luisotavio.crescenti'),
			]);

		if (result != null) {
			showBasicDialog(context, title: Text('Selected users'), content: Text(result.reduce((value, element) => (value == null ? '' : value + ', ') + element)));
		}

	}

	_showOptionsDialogRadioButton(BuildContext context) async {

		String result = await showRadioDialog<String>(context, 
			title: Text('Select user'),
			options: [
				DialogOption(
					icon: Icon(Icons.person),
					title: Text('Ricardo Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'ricardo.crescenti'),
				DialogOption(
					icon: Icon(Icons.person),
					title: Text('Ana Luiza Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'analuiza.crescenti'),
				DialogOption(
					icon: Icon(Icons.person),
					title: Text('Luis Otavio Crescenti'),
					subtitle: Text('luisotavio.crescenti@gmail.com'),
					value: (context) => 'luisotavio.crescenti'),
			]);

		if (result != null) {
			showBasicDialog(context, title: Text('Selected user'), content: Text(result));
		}

	}
}
