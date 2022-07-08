enum ButtonsLocalizationsEnums { 
	en, 
	es, 
	pt,
}

enum TypesOfDialogues {
	language,
	basic,
	choice,
	result,
	awaitDialog
}

enum BasicDialogues {
	onlyTitle,
	withContent,
	yesNoActions,
	customActions,
}

enum BasicDialoguesOnlyTitle {
	title
}

enum BasicDialoguesWithContent {
	title,
	content,
}

enum BasicDialoguesYesNoActions {
	title,
}

enum BasicDialoguesCustomActions {
	title,
	content,
	alwaysButton,
	tenMinutesButton,
	cancelButton,
}

enum DialoguesOfChoices {
	button,
	checkbox,
	radio,
}

enum DialoguesOfChoicesResult {
	title1,
	title2,
}

enum DialoguesOfChoicesExemple {
	title1,
	title2,
}

enum ResultDialogs {
	success,
	warning,
	error,
}

enum SuccessDialogExample {
	title,
	content,
	button,
}

enum WarningDialogExample {
	title,
}

enum ErrorDialogExample {
	title,
}

enum AwaitDialog {
	wait5Seconds
}

enum AwaitDialogExample {
	message1,
	message2,
}