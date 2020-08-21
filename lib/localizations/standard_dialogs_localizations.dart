import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:simple_localization/simple_localization.dart';
import 'package:standard_dialogs/localizations/localizations_enum.dart';

class StandardDialogsLocalizations extends SimpleLocalizations {
  static StandardDialogsLocalizations of(BuildContext context) {
    return SimpleLocalizations.of<StandardDialogsLocalizations>(context, (locale) => StandardDialogsLocalizations(locale));
  }

  StandardDialogsLocalizations(Locale locale) : super(locale);

  @override
  Locale get defaultLocale => Locale('en');

  @override
  Map<String, Map<dynamic, String>> get localizedValues => {
	  'en': {
		  DialogActionLocalizationsEnum.cancel: 'Cancel',
		  DialogActionLocalizationsEnum.ok: 'OK',

		  ResultDialogLocalizationsEnum.error: 'Error',
		  ResultDialogLocalizationsEnum.success: 'Success',
		  ResultDialogLocalizationsEnum.warning: 'Warning',
	  },
	  'es': {
		  DialogActionLocalizationsEnum.cancel: 'Cancelar',
		  DialogActionLocalizationsEnum.ok: 'OK',

		  ResultDialogLocalizationsEnum.error: 'Error',
		  ResultDialogLocalizationsEnum.success: 'Éxito',
		  ResultDialogLocalizationsEnum.warning: 'Advertencia',
	  },
	  'pt': {
		  DialogActionLocalizationsEnum.cancel: 'Cancelar',
		  DialogActionLocalizationsEnum.ok: 'OK',

		  ResultDialogLocalizationsEnum.error: 'Erro',
		  ResultDialogLocalizationsEnum.success: 'Sucesso',
		  ResultDialogLocalizationsEnum.warning: 'Aviso',
	  }
  };

  @override
  // TODO: implement suportedLocales
  Iterable<Locale> get suportedLocales => [
	  Locale('en'),
	  Locale('es'),
	  Locale('pt')
  ];
}