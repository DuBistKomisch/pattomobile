!include "MUI.nsh"
!include "LogicLib.nsh"
!include "nsDialogs.nsh"

!define VERSION "1.3"
!define FULLVERSION "${VERSION}.0.0"
!define NAME "Pattomobile"
!define TITLE "${NAME} v${VERSION}"
!define COMP "DBK Software"
!define DBKDIR ".."

SetCompressor /SOLID lzma
Name "${TITLE} Installation"
OutFile "Install ${TITLE}.exe"
Caption "${TITLE} Installation"
UninstallCaption "${TITLE} Uninstallation"
Icon "${NAME}.ico"
UninstallIcon "Uninstall.ico"
!define MUI_ICON "${NAME}.ico"
!define MUI_UNICON "Uninstall.ico"
!define MUI_ABORTWARNING
!define MUI_COMPONENTSPAGE_SMALLDESC
InstallDir "$PROGRAMFILES\${TITLE}"
XPStyle on
BrandingText "${TITLE} ~ © ${COMP} 2008 ~ Nullsoft Scriptable Install System v2.33"
LoadLanguageFile "${NSISDIR}\Contrib\Language files\English.nlf"

VIProductVersion "${FULLVERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "${NAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductVersion" "${FULLVERSION}"
;VIAddVersionKey /LANG=${LANG_ENGLISH} "Comments" ""
VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "${COMP}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalTrademarks" "${NAME} is a trademark of ${COMP}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "© ${COMP} 2008"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "${TITLE} Installation"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "${FULLVERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "InternalName" "${NAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "OriginalFilename" "Install ${TITLE}"

InstType "Full Install"
InstType "Minimum"

Function .onInit
	InitPluginsDir
	File /oname=$PLUGINSDIR\DBKSoft.bmp "DBKSoft.bmp"
	File /oname=$PLUGINSDIR\DBKSoft.wav "DBKSoft.wav"
	
	advsplash::show 660 1000 1500 -1 $PLUGINSDIR\DBKSoft
	Pop $0
	Delete $PLUGINSDIR\DBKSoft.bmp
	Delete $PLUGINSDIR\DBKSoft.wav
	
	MessageBox MB_YESNO|MB_USERICON|MB_TOPMOST|MB_SETFOREGROUND|MB_DEFBUTTON1 \
	"Welcome to ${TITLE} Installation$\n$\nDo you want to install ${TITLE}?" \
	IDYES _continue
		Abort
	_continue:
FunctionEnd

Function un.onInit
	InitPluginsDir
	
	MessageBox MB_YESNO|MB_USERICON|MB_TOPMOST|MB_SETFOREGROUND|MB_DEFBUTTON1 \
	"Welcome to ${TITLE} Uninstallation$\n$\nDo you want to uninstall ${TITLE}?" \
	IDYES _continue
		Abort
	_continue:
FunctionEnd

Function .onUserAbort
	MessageBox MB_YESNO "Are you sure you want to abort ${TITLE} installation?" IDYES Continue
		Abort
	Continue:
FunctionEnd

Function un.onUserAbort
	MessageBox MB_YESNO "Are you sure you want to abort ${TITLE} uninstallation?" IDYES Continue
		Abort
	Continue:
FunctionEnd

!define MUI_PAGE_HEADER_TEXT "License Agreement"
!define MUI_PAGE_HEADER_SUBTEXT "${NAME} End User License Agreement"
!define MUI_LICENSEPAGE_BGCOLOR /grey
!define MUI_LICENSEPAGE_TEXT_TOP "Please read the following End User License Agreement carefully before installing ${NAME}:"
!define MUI_LICENSEPAGE_TEXT_BOTTOM "You must agree with all of the above terms to continue the installation."
!define MUI_LICENSEPAGE_CHECKBOX
!define MUI_LICENSEPAGE_CHECKBOX_TEXT "I accept all terms of the above EULA"
!insertmacro MUI_PAGE_LICENSE "${NAME} EULA.txt"

!define MUI_PAGE_HEADER_TEXT "Components"
!define MUI_PAGE_HEADER_SUBTEXT "${NAME} Component Selection"
!define MUI_COMPONENTSPAGE_TEXT_TOP "Select whichever components of ${NAME} you wish to install and uncheck any components that you do not wish to install. Otherwise click 'Next' to continue when ready."
!define MUI_COMPONENTSPAGE_TEXT_INSTTYPE "Select installation type:"
!define MUI_COMPONENTSPAGE_TEXT_DESCRIPTION_INFO "Select a component to view a description"
!insertmacro MUI_PAGE_COMPONENTS

!define MUI_PAGE_HEADER_TEXT "Installation Directory"
!define MUI_PAGE_HEADER_SUBTEXT "${NAME} Installation Directory Selection"
!define MUI_DIRECTORYPAGE_TEXT_TOP "${NAME} will be installed into the directory displayed below. To select a different location, click 'Browse...'. Otherwise click 'Next' to continue when ready."
!insertmacro MUI_PAGE_DIRECTORY

!define MUI_PAGE_HEADER_TEXT "Start Menu Folder"
!define MUI_PAGE_HEADER_SUBTEXT "${NAME} Start Menu Shortcut Folder Selection"
!define MUI_STARTMENUPAGE_TEXT_TOP "Select a Start Menu Folder for ${NAME}'s shortcuts to be created in:"
!define MUI_STARTMENUPAGE_TEXT_CHECKBOX "Don't create Start Menu shortcuts"
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "${TITLE}"
Var StartMenuFolder
!insertmacro MUI_PAGE_STARTMENU "Application" $StartMenuFolder

!define MUI_PAGE_HEADER_TEXT "Installation"
!define MUI_PAGE_HEADER_SUBTEXT "${NAME} Installation"
!define MUI_INSTFILESPAGE_FINISHHEADER_TEXT "Installation Complete"
!define MUI_INSTFILESPAGE_FINISHHEADER_SUBTEXT "Installation of ${NAME} Completed Successfully!"
!define MUI_INSTFILESPAGE_ABORTHEADER_TEXT "Installation Aborted"
!define MUI_INSTFILESPAGE_ABORTHEADER_SUBTEXT "Installation of ${NAME} was Aborted"
!insertmacro MUI_PAGE_INSTFILES

Page custom finishPage leaveFinishPage

!define MUI_PAGE_HEADER_TEXT "Uninstallation"
!define MUI_PAGE_HEADER_SUBTEXT "${NAME} Uninstallation"
!define MUI_INSTFILESPAGE_FINISHHEADER_TEXT "Uninstallation Complete"
!define MUI_INSTFILESPAGE_FINISHHEADER_SUBTEXT "Uninstallation of ${NAME} Completed Successfully!"
!insertmacro MUI_UNPAGE_INSTFILES

Function finishPage
	nsDialogs::Create /NOUNLOAD 1018
	Var /GLOBAL Dialog
	Pop $Dialog
	
	${If} $Dialog == error
		Abort
	${EndIf}
	
	${NSD_CreateLabel} 0 0 100% 72u "${TITLE} has been installed successfully!$\n$\nRefer to the in-game information for instructions on how to use ${NAME}.$\n$\nIt is strongly recommended that you read the ${NAME} EULA because, by installing ${NAME}, you have legally agreed to all terms.$\n$\nAfter you have selected wether or not to launch ${TITLE}, click 'Close' to complete the installation."
	Var /GLOBAL Text
	Pop $Text
	
	${NSD_CreateGroupBox} 150u 84u 50% 36u "System Requirements"
	Var /GLOBAL Group
	Pop $Group
	${NSD_CreateLabel} 162u 96u 126u 24u "Processor: 2 GHz (1 GHz minimum)$\nFree RAM: 64 MB (32 MB minimum)"
	Var /GLOBAL SysReq
	Pop $SysReq
	
	${NSD_CreateCheckBox} 0 96u 50% 12u "Launch ${TITLE}"
	Var /GLOBAL Check
	Pop $Check
	${NSD_OnClick} $Check clickCheck
	Var /GLOBAL Launch
	StrCpy $Launch "false"
	
	IfFileExists "$INSTDIR\${NAME} EULA.txt" 0 noeula
	${NSD_CreateCheckBox} 0 108u 50% 12u "Read ${TITLE} EULA"
	Var /GLOBAL CheckEULA
	Pop $CheckEULA
	${NSD_OnClick} $CheckEULA clickCheckEULA
	Var /GLOBAL LaunchEULA
	StrCpy $LaunchEULA "false"
	noeula:
	
	nsDialogs::Show
FunctionEnd

Function leaveFinishPage
	${if} $LaunchEULA == "true"
		ExecShell "open" "$INSTDIR\${NAME} EULA.txt"
	${EndIf}
	${if} $Launch == "true"
		Exec '"$INSTDIR\${NAME}.exe"'
	${EndIf}
FunctionEnd

Function clickCheck
	${if} $Launch == "true"
		StrCpy $Launch "false"
	${Else}
		StrCpy $Launch "true"
	${EndIf}
FunctionEnd

Function clickCheckEULA
	${if} $LaunchEULA == "true"
		StrCpy $LaunchEULA "false"
	${Else}
		StrCpy $LaunchEULA "true"
	${EndIf}
FunctionEnd

Section "${NAME} (required)" Section_1
	SectionIn 1 2 RO
	SetOutPath $INSTDIR
	File "${DBKDIR}\${NAME}.exe"
	File "${NAME}.ico"
	File "Uninstall.ico"
SectionEnd

Section "Level Data (required)" Section_2
	SectionIn 1 2 RO
	SetOutPath "$INSTDIR\levels"
	File "${DBKDIR}\levels\_bonus*.xml"
	File "${DBKDIR}\levels\_level*.xml"
	SetOutPath $INSTDIR
SectionEnd

Section "Installation" Section_3
	SectionIn 1
	System::Call 'kernel32::GetModuleFileNameA(i 0, t .R0, i 1024) i r1'
	CopyFiles /SILENT "$R0" "$DESKTOP" 1400
SectionEnd

SectionGroup /e "Text Documents" Section_4

Section "EULA" Section_4_1
	SectionIn 1
	File "${NAME} EULA.txt"
SectionEnd

Section "Version History" Section_4_2
	SectionIn 1
	File "version.txt"
SectionEnd

Section "To Do List" Section_4_3
	SectionIn 1
	File "todo.txt"
SectionEnd

SectionGroupEnd

Section "Desktop Shortcut" Section_5
	SectionIn 1
	CreateShortCut "$DESKTOP\${TITLE}.lnk" "$INSTDIR\${NAME}.exe" \
		"" "$INSTDIR\${NAME}.ico" "" SW_SHOWNORMAL "" "Play ${TITLE} ~ © ${COMP} 2007"
SectionEnd

Section "Uninstall"
	ReadRegStr $1 HKLM "SOFTWARE\${NAME}" "StartMenuFolder"
	ReadRegStr $0 HKLM "SOFTWARE\${NAME}" "InstallFolder"
	DeleteRegKey HKLM "SOFTWARE\${NAME}"
	
	RMDir /r "$0\levels"
	Delete "$0\${NAME}.exe"
	Delete "$0\${NAME}.ico"
	Delete "$0\Uninstall.ico"
	Delete "$0\${NAME} EULA.txt"
	Delete "$0\version.txt"
	Delete "$0\todo.txt"
	RMDir "$0"
	
	StrCmp $1 "" nosmp 0
	Delete "$SMPROGRAMS\$1\${TITLE}.lnk"
	Delete "$SMPROGRAMS\$1\Uninstall ${TITLE}.lnk"
	Delete "$SMPROGRAMS\$1\${NAME} EULA.lnk"
	Delete "$SMPROGRAMS\$1\${NAME} Version History.lnk"
	Delete "$SMPROGRAMS\$1\${NAME} To Do List.lnk"
	RMDir "$SMPROGRAMS\$1"
	nosmp:
SectionEnd

Section
	WriteUninstaller "$INSTDIR\Uninstall ${TITLE}.exe"
	
	WriteRegStr HKLM "SOFTWARE\${NAME}" "StartMenuFolder" ""
	!insertmacro MUI_STARTMENU_WRITE_BEGIN "Application"
		CreateDirectory "$SMPROGRAMS\$StartMenuFolder"
		CreateShortCut "$SMPROGRAMS\$StartMenuFolder\${TITLE}.lnk" "$INSTDIR\${NAME}.exe" \
		"" "$INSTDIR\${NAME}.ico" "" SW_SHOWNORMAL "" "${TITLE}"
		CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Uninstall ${TITLE}.lnk" "$INSTDIR\Uninstall ${TITLE}.exe" \
		"" "$INSTDIR\Uninstall.ico" "" SW_SHOWNORMAL "" "Uninstalls ${TITLE}"
		CreateShortCut "$SMPROGRAMS\$StartMenuFolder\${NAME} EULA.lnk" "$INSTDIR\${NAME} EULA.txt" \
		"" "" "" SW_SHOWNORMAL "" "View the End User License Agreement for ${TITLE}"
		CreateShortCut "$SMPROGRAMS\$StartMenuFolder\${NAME} Version History.lnk" "$INSTDIR\version.txt" \
		"" "" "" SW_SHOWNORMAL "" "View details of changes made to each version of ${TITLE}"
		CreateShortCut "$SMPROGRAMS\$StartMenuFolder\${NAME} To Do List.lnk" "$INSTDIR\todo.txt" \
		"" "" "" SW_SHOWNORMAL "" "View a list of planned features for future versions of ${TITLE}"
		WriteRegStr HKLM "SOFTWARE\${NAME}" "StartMenuFolder" "$StartMenuFolder"
	!insertmacro MUI_STARTMENU_WRITE_END
	WriteRegStr HKLM "SOFTWARE\${NAME}" "InstallFolder" "$INSTDIR"
SectionEnd

LangString DESC_Section_1 ${LANG_ENGLISH} "The actual Application"
LangString DESC_Section_2 ${LANG_ENGLISH} "The Level Data"
LangString DESC_Section_3 ${LANG_ENGLISH} "Creates a copy of the installer on your desktop so that you can give it to everyone you know! ;)"
LangString DESC_Section_4 ${LANG_ENGLISH} "Plain Text Documents related to ${NAME}"
LangString DESC_Section_4_1 ${LANG_ENGLISH} "A copy of the ${NAME} End User License Agreement"
LangString DESC_Section_4_2 ${LANG_ENGLISH} "The version history of ${NAME}, showing all changes made to each version"
LangString DESC_Section_4_3 ${LANG_ENGLISH} "A list of planned features for future versions of ${NAME}"
LangString DESC_Section_5 ${LANG_ENGLISH} "Specify wether or not to create a shortcut for ${NAME} on the Desktop"

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
	!insertmacro MUI_DESCRIPTION_TEXT ${Section_1} $(DESC_Section_1)
	!insertmacro MUI_DESCRIPTION_TEXT ${Section_2} $(DESC_Section_2)
	!insertmacro MUI_DESCRIPTION_TEXT ${Section_3} $(DESC_Section_3)
	!insertmacro MUI_DESCRIPTION_TEXT ${Section_4} $(DESC_Section_4)
	!insertmacro MUI_DESCRIPTION_TEXT ${Section_4_1} $(DESC_Section_4_1)
	!insertmacro MUI_DESCRIPTION_TEXT ${Section_4_2} $(DESC_Section_4_2)
	!insertmacro MUI_DESCRIPTION_TEXT ${Section_4_3} $(DESC_Section_4_3)
	!insertmacro MUI_DESCRIPTION_TEXT ${Section_5} $(DESC_Section_5)
!insertmacro MUI_FUNCTION_DESCRIPTION_END