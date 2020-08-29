import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:simple_localization/simple_localization.dart';
import 'package:standard_dialogs/classes/dialog_result.dart';
import 'package:standard_dialogs/localizations/localizations_enum.dart';

class StandardDialogsLocalizations extends SimpleLocalizations {
	static StandardDialogsLocalizations of(BuildContext context) {
		return SimpleLocalizations.of<StandardDialogsLocalizations>(context, (locale) => StandardDialogsLocalizations(locale));
	}

	StandardDialogsLocalizations(Locale locale) : super(locale);

	@override
	Locale get defaultLocale => Locale('en');

	@override
	Iterable<Locale> get suportedLocales => [
		Locale('en'),
		Locale('es'),
		Locale('pt')
	];

	@override
	Map<String, Map<dynamic, String>> get localizedValues => {
		'en': {
			DialogResult.abort: 'Abort',
			DialogResult.cancel: 'Cancel',
			DialogResult.ignore: 'Ignore',
			DialogResult.no: 'No',
			DialogResult.ok: 'OK',
			DialogResult.retry: 'Retry',
			DialogResult.yes: 'Yes',

			ResultDialogLocalizationsEnum.error: 'Error',
			ResultDialogLocalizationsEnum.success: 'Success',
			ResultDialogLocalizationsEnum.warning: 'Warning',
		},
		'es': {
			DialogResult.abort: 'Abortar',
			DialogResult.cancel: 'Cancelar',
			DialogResult.ignore: 'Ignorar',
			DialogResult.no: 'No',
			DialogResult.ok: 'OK',
			DialogResult.retry: 'Tentar Rever',
			DialogResult.yes: 'Si',

			ResultDialogLocalizationsEnum.error: 'Error',
			ResultDialogLocalizationsEnum.success: 'Éxito',
			ResultDialogLocalizationsEnum.warning: 'Advertencia',
		},
		'pt': {
			DialogResult.abort: 'Abortar',
			DialogResult.cancel: 'Cancelar',
			DialogResult.ignore: 'Ignorar',
			DialogResult.no: 'Não',
			DialogResult.ok: 'OK',
			DialogResult.retry: 'Tentar novamente',
			DialogResult.yes: 'Sim',

			ResultDialogLocalizationsEnum.error: 'Erro',
			ResultDialogLocalizationsEnum.success: 'Sucesso',
			ResultDialogLocalizationsEnum.warning: 'Aviso',
		}
	};

}

class StandardDialogsLocalizationsDelegate extends SimpleLocalizationsDelegate<StandardDialogsLocalizations> {
  StandardDialogsLocalizationsDelegate(StandardDialogsLocalizations Function(Locale locale) customLocalization) : super(customLocalization);
}
