# Standard Dialogs

Package with standardized dialogues ready to use.

- **[Introduction](#introduction)**
- **[How to Install](#how-to-install)**
- **[Basic Dialogs](##basic-dialogs)**
- **[Choices Dialogs](#choices-dialogs)**
- **[Result Dialogs](#result-dialogs)**
- **[Await Dialog](#await-dialog)**

## Introduction

This package has several types of dialogs, which facilitate the display of data for the user, the types of dialogues available will be explained below.

## How to install

Add the dependency on `pubspec.yaml`. 

*Informing `^` at the beginning of the version, you will receive all updates that are made from version `2.0.0` up to the version before `3.0.0`.*

```yaml
dependencies:
  standard_dialogs: ^1.0.0
```

Import the package in the source code.

```dart
import 'package:standard_dialogs/standard_dialogs.dart';
```

## Basic Dialogs

The basic dialogues display information in a simple way, with title, content, and customizable action buttons as needed.

Example of using basic dialogues.

```dart
final result = await showBasicDialog<bool>(context,
   title: Text('Basic dialog example'),
   content: Text('Content of the dialogue, here you can explain in detail the reason for the dialogue'),
   actions: DialogAction.yesNo(context));
```

Example of using basic dialogs with custom buttons.

```dart
final result = await showBasicDialog<bool>(context,
   title: Text('Share location'),
   content: Text('How long do you want to share your location?'),
   actions: [
      DialogAction(title: Text('Always'), action: (context) => -1),
      DialogAction(title: Text('10 minutes'), action: (context) => 10),
      DialogAction(title: Text('Cancel'), action: (context) => 0),
   ]);
```

Screenshots of dialog examples

<img src="https://github.com/ricardocrescenti/flutter-standard-dialogs/blob/master/example/assets/images/basic_dialog_title.jpg" height = "400">

<img src="https://github.com/ricardocrescenti/flutter-standard-dialogs/blob/master/example/assets/images/basic_dialog_content.jpg" height = "400">

<img src="https://github.com/ricardocrescenti/flutter-standard-dialogs/blob/master/example/assets/images/basic_dialog_yes_no.jpg" height = "400">

<img src="https://github.com/ricardocrescenti/flutter-standard-dialogs/blob/master/example/assets/images/basic_dialog_custom_actions.jpg" height = "400">

## Choices Dialogs

The choice dialogues are interesting for cases where it is necessary for the user to select one or more options

There are three types of choice dialogs, which are the button or radio button dialog that allows you to select only one option, or the dialogs with check boxes, which allow you to select several options.

Button dialog example:

```dart
String result = await showChoicesButtonDialog<String>(context,
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
         subtitle: Text('analuiza.crescenti@gmail.com'),
         value: 'analuiza.crescenti'),
      DialogChoice(
         icon: Icon(Icons.person),
         title: Text('Luis Otávio Crescenti'),
         subtitle: Text('luisotavio.crescenti@gmail.com'),
         value: 'luisotavio.crescenti'),
      DialogChoice(
         icon: Icon(Icons.add),
         title: Text('Add new account'),
         value: ''),
   ]);
```

Screenshot

<img src="https://github.com/ricardocrescenti/flutter-standard-dialogs/blob/master/example/assets/images/choice_dialog_button.jpg" height = "400">

Dialog example with radio button:

```dart
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
         subtitle: Text('analuiza.crescenti@gmail.com'),
         value: 'analuiza.crescenti'),
      DialogChoice(
         icon: Icon(Icons.person),
         title: Text('Luis Otavio Crescenti'),
         subtitle: Text('luisotavio.crescenti@gmail.com'),
         value: 'luisotavio.crescenti'),
   ]);
```

Screenshot

<img src="https://github.com/ricardocrescenti/flutter-standard-dialogs/blob/master/example/assets/images/choice_dialog_radio.jpg" height = "400">

Example of dialog with checkbox:

```dart
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
         subtitle: Text('analuiza.crescenti@gmail.com'),
         value: 'analuiza.crescenti'),
      DialogChoice(
         icon: Icon(Icons.person),
         title: Text('Luis Otávio Crescenti'),
         subtitle: Text('luisotavio.crescenti@gmail.com'),
         value: 'luisotavio.crescenti'),
   ]);
```

Screenshot

<img src="https://github.com/ricardocrescenti/flutter-standard-dialogs/blob/master/example/assets/images/choice_dialog_checkbox.jpg" height = "400">

## Result Dialogs

This type of dialogue is interesting to show the result of an action.

There are three types of predefined result dialogs, which are the results of success, warning and error.

Example of successful dialog:

```dart
await showSucsessDialog(context, 
   title: Text('User created'),
   content: Text('User created successfully'),
   action: DialogAction(
      title: Text('Get Started'),
      value: null));
```

Screenshot

<img src="https://github.com/ricardocrescenti/flutter-standard-dialogs/blob/master/example/assets/images/result_dialog_success.jpg" height = "400">

Example of warning dialog:

```dart
await showWarningDialog(context, 
   title: Text('User with pending issues'));
```

Screenshot

<img src="https://github.com/ricardocrescenti/flutter-standard-dialogs/blob/master/example/assets/images/result_dialog_warning.jpg" height = "400">

Error dialog example:

```dart
await showErrorDialog(context, 
   title: Text('Error creating user'));
```

Screenshot

<img src="https://github.com/ricardocrescenti/flutter-standard-dialogs/blob/master/example/assets/images/result_dialog_error.jpg" height = "400">

If you need to create your own result dialog, you can use the `showResultDialog` method.

## Await Dialogs

This type of dialogue is used for cases where you want to inform the user that something is being processed, when the process is finished the dialogue will be automatically closed.

It is also possible to update the message displayed to the user as needed with information on the execution of the process, for this use the `updateMessage` method passed by parameter, informing the new `Widget` to be displayed in the dialog.

Example of dialog:

```dart
await showAwaitDialog<bool>(context, 
   message: Text('Creating user'),
   function: (context, updateMessage) async {
      
      await Future.delayed(Duration(seconds: 2));
      updateMessage(Text('Creating permissions'));
      await Future.delayed(Duration(seconds: 2));

      return true;
   });
```

Screenshot

<img src="https://github.com/ricardocrescenti/flutter-standard-dialogs/blob/master/example/assets/images/await_dialog.gif" height = "400">