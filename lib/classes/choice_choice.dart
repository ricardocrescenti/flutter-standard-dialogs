import 'package:flutter/material.dart';
import 'package:standard_dialogs/standard_dialogs.dart';

/// Class to represent a choice in the dialogues that list a choice list.
/// 
/// The choices are used in the following dialogs:
/// 
/// - [showChoicesButtonDialog]
/// - [showChoicesRadioDialog]
/// - [showChoicesCheckBoxDialog]
/// 
/// Below is an example of use in no [showChoicesRadioDialog].
/// 
/// ```dart
/// String result = await showChoicesRadioDialog<String>(context, 
///     title: Text('Select user'),
///     choices: [
///         DialogChoice(
///             icon: Icon(Icons.person),
///             title: Text('Ricardo Crescenti'),
///             subtitle: Text('ricardo.crescenti@gmail.com'),
///             value: 'ricardo.crescenti'),
///         DialogChoice(
///             icon: Icon(Icons.person),
///             title: Text('Ana Luiza Crescenti'),
///             subtitle: Text('analuiza.crescenti@gmail.com'),
///             value: 'analuiza.crescenti'),
///         DialogChoice(
///             icon: Icon(Icons.person),
///             title: Text('Luis Otavio Crescenti'),
///             subtitle: Text('luisotavio.crescenti@gmail.com'),
///             value: 'luisotavio.crescenti'),
///     ]
/// );
/// ```
class DialogChoice<T> {

	/// Icon to be listed in the choice list.
	final Widget? icon;
	
	/// Title of choice.
	final Widget title;
	
	/// Subtitle of choice (or additional information).
	final Widget? subtitle;
	
	/// Value to be returned when the choice is selected.
	final T value;

	/// Standard constructor of the [DialogChoice] class
	DialogChoice({
		this.icon,
		required this.title,
		this.subtitle,
		required this.value
	});
}