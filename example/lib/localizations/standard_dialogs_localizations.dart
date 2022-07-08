import 'package:flutter/material.dart';
import 'package:simple_localization/classes/simple_localization.dart';
import 'package:standard_dialogs_example/localizations/localizations_enum.dart';

class ExampleLocalizations extends SimpleLocalizations {

	static ExampleLocalizations of(BuildContext context) {
		return SimpleLocalizations.of<ExampleLocalizations>(context, (locale) => ExampleLocalizations(locale));
	}

	ExampleLocalizations(Locale locale) : super(locale);

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

			TypesOfDialogues.language: 'LANGUAGE',
			ButtonsLocalizationsEnums.en: 'ENGLISH',
			ButtonsLocalizationsEnums.es: 'SPANISH',
			ButtonsLocalizationsEnums.pt: 'PORTUGUESE',

			TypesOfDialogues.basic: 'BASIC DIALOGUES',
			BasicDialogues.onlyTitle: 'ONLY TITLE',
			BasicDialogues.withContent: 'WITH CONTENT',
			BasicDialogues.yesNoActions: 'YES/NO ACTIONS',
			BasicDialogues.customActions: 'CUSTOM ACTIONS',

			BasicDialoguesOnlyTitle.title: 'Basic dialog example',
			BasicDialoguesWithContent.title: 'Basic dialog example',
			BasicDialoguesWithContent.content: 'Content of the dialogue, here you can explain in detail the reason for the dialogue',
			BasicDialoguesYesNoActions.title: 'Do you want to activate your location?',
			BasicDialoguesCustomActions.title: 'Share location',
			BasicDialoguesCustomActions.content: 'How long do you want to share your location?',
			BasicDialoguesCustomActions.alwaysButton: 'Always',
			BasicDialoguesCustomActions.tenMinutesButton: '10 minutes',
			BasicDialoguesCustomActions.cancelButton: 'Cancel',

			TypesOfDialogues.choice: 'DIALOGUES OF CHOICES',
			DialoguesOfChoices.button: 'BUTTON',
			DialoguesOfChoices.checkbox: 'CHECKBOX',
			DialoguesOfChoices.radio: 'RADIO',

			DialoguesOfChoicesResult.title1: 'Select user',
			DialoguesOfChoicesResult.title2: 'Select users',

			DialoguesOfChoicesExemple.title1: 'Selected user',
			DialoguesOfChoicesExemple.title2: 'Selected users',

			TypesOfDialogues.result: 'RESULT DIALOGS',
			ResultDialogs.success: 'SUCCESS',
			ResultDialogs.warning: 'WARNING',
			ResultDialogs.error: 'ERROR',

			SuccessDialogExample.title: 'User created',
			SuccessDialogExample.content: 'User created successfully!',
			SuccessDialogExample.button: 'Get Started',

			WarningDialogExample.title: 'User with pending issues',

			ErrorDialogExample.title: 'Error creating user',

			TypesOfDialogues.awaitDialog: 'AWAIT DIALOG',
			AwaitDialog.wait5Seconds: 'WAIT 5 SECONDS',

			AwaitDialogExample.message1: 'Creating user',
			AwaitDialogExample.message2: 'Creating permissions',
			
		},
		'es': {

			TypesOfDialogues.language: 'IDIOMA',
			ButtonsLocalizationsEnums.en: 'INGLES',
			ButtonsLocalizationsEnums.es: 'ESPAÑOL',
			ButtonsLocalizationsEnums.pt: 'PORTUGUÉS',

			TypesOfDialogues.basic: 'DIÁLOGOS BÁSICOS',
			BasicDialogues.onlyTitle: 'SOLO TITULO',
			BasicDialogues.withContent: 'CON CONTENIDO',
			BasicDialogues.yesNoActions: 'SI/NO ACCIONES',
			BasicDialogues.customActions: 'ACCIONES PERSONALIZADAS',

			BasicDialoguesOnlyTitle.title: 'Ejemplo de diálogo básico',
			BasicDialoguesWithContent.title: 'Ejemplo de diálogo básico',
			BasicDialoguesWithContent.content: 'Contenido del diálogo, aquí puedes explicar detalladamente el motivo del diálogo',
			BasicDialoguesYesNoActions.title: '¿Quieres activar tu ubicación?',
			BasicDialoguesCustomActions.title: 'Comparte ubicacion',
			BasicDialoguesCustomActions.content: '¿Cuánto tiempo quieres compartir tu ubicación?',
			BasicDialoguesCustomActions.alwaysButton: 'Siempre',
			BasicDialoguesCustomActions.tenMinutesButton: '10 minutos',
			BasicDialoguesCustomActions.cancelButton: 'Cancelar',
			
			TypesOfDialogues.choice: 'DIÁLOGOS DE OPCIONES',
			DialoguesOfChoices.button: 'BOTÓN',
			DialoguesOfChoices.checkbox: 'MARCAR LA CAJA',
			DialoguesOfChoices.radio: 'RADIO',	

			DialoguesOfChoicesResult.title1: 'Selecionar usuário',
			DialoguesOfChoicesResult.title2: 'Selecionar usuários',

			DialoguesOfChoicesExemple.title1: 'Usuario seleccionado',	
			DialoguesOfChoicesExemple.title2: 'Usuarios seleccionado',	
			
			TypesOfDialogues.result: 'DIÁLOGOS DE RESULTADOS',
			ResultDialogs.success: 'ÉXITO',
			ResultDialogs.warning: 'ADVERTENCIA',
			ResultDialogs.error: 'ERROR',

			SuccessDialogExample.title: 'Usuario creado',
			SuccessDialogExample.content: '¡Usuario creado con éxito!',
			SuccessDialogExample.button: 'Empezar',

			WarningDialogExample.title: 'Usuario con pendiente',

			ErrorDialogExample.title: 'Error al crear usuario',

			TypesOfDialogues.awaitDialog: 'DIÁLOGO DE PROCESAMIENTO',
			AwaitDialog.wait5Seconds: 'ESPERA 5 SEGUNDOS',	

			AwaitDialogExample.message1: 'Creando usuario',
			AwaitDialogExample.message2: 'Creando permisos',
		
		},
		'pt': {

			TypesOfDialogues.language: 'IDIOMA',
			ButtonsLocalizationsEnums.en: 'INGLES',
			ButtonsLocalizationsEnums.es: 'ESPANHOL',
			ButtonsLocalizationsEnums.pt: 'PORTUGUES',

			TypesOfDialogues.basic: 'DIÁLOGOS BÁSICOS',
			BasicDialogues.onlyTitle: 'APENAS TÍTULO',
			BasicDialogues.withContent: 'COM CONTEÚDO',
			BasicDialogues.yesNoActions: 'AÇÕES SIM/NÃO',
			BasicDialogues.customActions: 'AÇÕES PERSONALIZADAS',

			BasicDialoguesOnlyTitle.title: 'Exemplo de diálogo básico',
			BasicDialoguesWithContent.title: 'Exemplo de diálogo básico',
			BasicDialoguesWithContent.content: 'Conteúdo do diálogo, aqui você pode explicar em detalhes o motivo do diálogo',
			BasicDialoguesYesNoActions.title: 'Deseja ativar sua localização?',
			BasicDialoguesCustomActions.title: 'Compartilhar localização',
			BasicDialoguesCustomActions.content: 'Por quanto tempo você deseja compartilhar sua localização?',
			BasicDialoguesCustomActions.alwaysButton: 'Sempre',
			BasicDialoguesCustomActions.tenMinutesButton: '10 minutos',
			BasicDialoguesCustomActions.cancelButton: 'Cancelar',

			TypesOfDialogues.choice: 'DIÁLOGOS DE ESCOLHAS',
			DialoguesOfChoices.button: 'BOTÃO',
			DialoguesOfChoices.checkbox: 'CAIXA DE MARCAÇÃO',
			DialoguesOfChoices.radio: 'RADIO',

			DialoguesOfChoicesResult.title1: 'Selecionar usuário',
			DialoguesOfChoicesResult.title2: 'Selecionar usuários',

			DialoguesOfChoicesExemple.title1: 'Usuário selecionado',
			DialoguesOfChoicesExemple.title2: 'Usuários selecionados',

			TypesOfDialogues.result: 'DIÁLOGOS DE RESULTADOS',
			ResultDialogs.success: 'SUCESSO',
			ResultDialogs.warning: 'ATENÇÃO',
			ResultDialogs.error: 'ERRO',

			SuccessDialogExample.title: 'Usuário criado',
			SuccessDialogExample.content: 'Usuário criado com sucesso!',
			SuccessDialogExample.button: 'Iniciar',

			WarningDialogExample.title: 'Usuário com pendencias',

			ErrorDialogExample.title: 'Erro ao criar usuário',

			TypesOfDialogues.awaitDialog: 'DIÁLOGO DE PROCESSAMENTO',
			AwaitDialog.wait5Seconds: 'AGUARDE 5 SEGUNDOS',

			AwaitDialogExample.message1: 'Criando usuário',
			AwaitDialogExample.message2: 'Criando permissões',

		},
	};

}