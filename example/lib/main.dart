import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'home.dart';

class MainApp extends StatefulWidget {

	const MainApp({Key? key}) : super(key: key);

	@override
	State<StatefulWidget> createState() => _MainAppState();

}

class _MainAppState extends State<MainApp> {

	Locale _locale = window.locale;
	Locale get locale => _locale;

	@override
	Widget build(BuildContext context) {

		return MaterialApp(
			locale: _locale,
			title: 'Flutter Standard Dialogs',
			localizationsDelegates: const [
				// ExampleLocalizationsDelegate(),
				GlobalMaterialLocalizations.delegate,
				GlobalCupertinoLocalizations.delegate,
				GlobalWidgetsLocalizations.delegate,
			],
			supportedLocales: const [
				Locale('en', ''),
				Locale('es', ''),
				Locale('pt', ''),
			],
			theme: ThemeData(
				primarySwatch: Colors.blue,
				visualDensity: VisualDensity.adaptivePlatformDensity,
			),
			home: HomePage(changeLocale: changeLocale),
		);

	}

	void changeLocale(Locale newLocale) {
		setState(() {
			_locale = newLocale;
		});
	}

}

void main() => runApp(const MainApp());