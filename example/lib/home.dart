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
				child: Padding(
						padding: EdgeInsets.all(50),
						child: Column(
							mainAxisAlignment: MainAxisAlignment.center,
							crossAxisAlignment: CrossAxisAlignment.stretch,
							children: <Widget>[
								
								RaisedButton(
									onPressed: () => _showBasicDialogOnlyTitle(context), 
									child: Text('Basic Dialog (Only Title)')),
								RaisedButton(
									onPressed: () => _showBasicDialogTitleWithContent(context), 
									child: Text('Basic Dialog (With Content)')),
								RaisedButton(
									onPressed: () => _showBasicDialogWithYesNoAction(context), 
									child: Text('Basic Dialog (With Yes/No actions')),
								
								Divider(),
								
								RaisedButton(
									onPressed: () => _showChoiceDialogButton(context), 
									child: Text('Choice Dialog (Button)')),
								RaisedButton(
									onPressed: () => _showChoiceDialogCheckBox(context), 
									child: Text('Choice Dialog (CheckBox)')),
								RaisedButton(
									onPressed: () => _showChoiceDialogRadioButton(context), 
									child: Text('Choice Dialog (Radio)')),
								
								
								// FlatButton(
								//   onPressed: () => _showBasicDialog(context), 
								//   child: Text('Basic Dialog')),
								// FlatButton(
								//   onPressed: () => _showBasicDialog(context), 
								//   child: Text('Basic Dialog')),
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

	_showChoiceDialogButton(BuildContext context) {

		showOptionsDialog(context,
			title: Text('Select user'),
			//content: Text('Select the user you want to use for the operation.'),
			choiceType: DialogChoiceType.button, 
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

	}

	_showChoiceDialogCheckBox(BuildContext context) {

		showOptionsDialog(context, 
			title: Text('Select users'),
			choiceType: DialogChoiceType.checkBok, 
			options: [
				DialogOption(
					//icon: Icon(Icons.person),
					title: Text('Ricardo Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'ricardo.crescenti'),
				DialogOption(
					//icon: Icon(Icons.person),
					title: Text('Ana Luiza Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'analuiza.crescenti'),
				DialogOption(
					//icon: Icon(Icons.person),
					title: Text('Luis Otávio Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'luisotavio.crescenti'),
			]);

	}

	_showChoiceDialogRadioButton(BuildContext context) {

		showOptionsDialog(context, 
			title: Text('Select user'),
			choiceType: DialogChoiceType.radio, 
			options: [
				DialogOption(
					//icon: Icon(Icons.person),
					title: Text('Ricardo Crescenti - Ricardo Crescenti - Ricardo Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'ricardo.crescenti'),
				DialogOption(
					//icon: Icon(Icons.person),
					title: Text('Ana Luiza Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'analuiza.crescenti'),
				DialogOption(
					//icon: Icon(Icons.person),
					title: Text('Ricardo Crescenti - Ricardo Crescenti - Ricardo Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'ricardo.crescenti'),
				DialogOption(
					//icon: Icon(Icons.person),
					title: Text('Ana Luiza Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'analuiza.crescenti'),
				DialogOption(
					//icon: Icon(Icons.person),
					title: Text('Ricardo Crescenti - Ricardo Crescenti - Ricardo Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'ricardo.crescenti'),
				DialogOption(
					//icon: Icon(Icons.person),
					title: Text('Ana Luiza Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'analuiza.crescenti'),
				DialogOption(
					//icon: Icon(Icons.person),
					title: Text('Ricardo Crescenti - Ricardo Crescenti - Ricardo Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'ricardo.crescenti'),
				DialogOption(
					//icon: Icon(Icons.person),
					title: Text('Ana Luiza Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'analuiza.crescenti'),
				DialogOption(
					//icon: Icon(Icons.person),
					title: Text('Ricardo Crescenti - Ricardo Crescenti - Ricardo Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'ricardo.crescenti'),
				DialogOption(
					//icon: Icon(Icons.person),
					title: Text('Ana Luiza Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'analuiza.crescenti'),
				DialogOption(
					//icon: Icon(Icons.person),
					title: Text('Ricardo Crescenti - Ricardo Crescenti - Ricardo Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'ricardo.crescenti'),
				DialogOption(
					//icon: Icon(Icons.person),
					title: Text('Ana Luiza Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'analuiza.crescenti'),
				DialogOption(
					//icon: Icon(Icons.person),
					title: Text('Ricardo Crescenti - Ricardo Crescenti - Ricardo Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'ricardo.crescenti'),
				DialogOption(
					//icon: Icon(Icons.person),
					title: Text('Ana Luiza Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'analuiza.crescenti'),
				DialogOption(
					//icon: Icon(Icons.person),
					title: Text('Ricardo Crescenti - Ricardo Crescenti - Ricardo Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'ricardo.crescenti'),
				DialogOption(
					//icon: Icon(Icons.person),
					title: Text('Ana Luiza Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'analuiza.crescenti'),
				DialogOption(
					//icon: Icon(Icons.person),
					title: Text('Ricardo Crescenti - Ricardo Crescenti - Ricardo Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'ricardo.crescenti'),
				DialogOption(
					//icon: Icon(Icons.person),
					title: Text('Ana Luiza Crescenti'),
					subtitle: Text('ricardo.crescenti@gmail.com'),
					value: (context) => 'analuiza.crescenti'),
			]);

	}
}
