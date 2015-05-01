* Set the path to find the various components.

set path to ThemedControls, ThemedControls\VCX, ThemedControls\Images

* Create a Themes folder under the temp directory.

lcTempFolder = addbs(sys(2023)) + 'Themes'
if not directory(lcTempFolder)
	try
		md (lcTempFolder)
	catch
		lcTempFolder = ''
	endtry
endif not directory(lcTempFolder)

* Create the ThemesManager if necessary, telling to additionally use the
* ThemesSplitters file and our temp folder.

if type('_screen.ThemesManager') <> 'O'
	_screen.NewObject('ThemesManager', 'ThemesManager', ;
		'ThemedControls.vcx', '', .T.)
	with _screen.ThemesManager
		.AdditionalThemesXMLFiles = 'ThemesSplitters.xml'
		.TempFolder = lcTempFolder
		.Initialize()
	endwith
endif type('_screen.ThemesManager') <> 'O'
