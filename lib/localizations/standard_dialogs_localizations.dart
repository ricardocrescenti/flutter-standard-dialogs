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
	Locale get defaultLocale => const Locale('en');

	@override
	Iterable<Locale> get suportedLocales => const [
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
			ResultDialogLocalizationsEnum.warning: 'Aviso',
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
			ResultDialogLocalizationsEnum.warning: 'Atenção',
		}
	};

}

class StandardDialogsLocalizationsDelegate extends SimpleLocalizationsDelegate<StandardDialogsLocalizations> {
	
	const StandardDialogsLocalizationsDelegate() : super();

	@override
	StandardDialogsLocalizations initializeLocalization(Locale currentLocale) {
		return StandardDialogsLocalizations(currentLocale);
	}

}
