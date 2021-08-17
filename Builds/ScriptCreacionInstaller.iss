; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppVersion "Alpha1.0"
#define MyAppName "PlatformMadness" + MyAppVersion
#define MyAppNameSinVersion "PlatformMadness"
#define MyAppPublisher "Nachiten"
#define MyAppURL "https://www.youtube.com/channel/UCIaYoKyvFB6ubQSYFQ6EISg"
#define MyAppExeName "Platform Madness Launcher.exe"
#define MyAppAssocName MyAppName
#define MyAppAssocExt ".myp"
#define MyAppAssocKey StringChange(MyAppAssocName, " ", "") + MyAppAssocExt
; PATH EN PC ESCRITORIO
#define PathProyecto "D:\Proyectos Unity\PlatformMadness" 
; PATH EN NOTEBOOK
; #define PathProyecto "C:\Programas Unity\Puzzle-Madness" 


[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)

; AppId | Platform Game
AppId={{C9885BBB-7899-4492-83DC-32C90D1EFE89}} 

AppName={#MyAppNameSinVersion}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppNameSinVersion}
ChangesAssociations=yes
DisableProgramGroupPage=yes
; Remove the following line to run in administrative install mode (install for all users.)
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=commandline
OutputDir={#PathProyecto}\Builds\Installers
OutputBaseFilename="PuzzleMadness{#MyAppVersion}Installer"
SetupIconFile={#PathProyecto}\Assets\Icon\Icon.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern


[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "{#PathProyecto}\Builds\Windows\{#MyAppNameSinVersion}{#MyAppVersion}\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#PathProyecto}\Builds\Windows\{#MyAppNameSinVersion}{#MyAppVersion}\MonoBleedingEdge\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#PathProyecto}\Builds\Windows\{#MyAppNameSinVersion}{#MyAppVersion}\Platform Madness Launcher_Data\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#PathProyecto}\Builds\Windows\{#MyAppNameSinVersion}{#MyAppVersion}\UnityCrashHandler64.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#PathProyecto}\Builds\Windows\{#MyAppNameSinVersion}{#MyAppVersion}\UnityPlayer.dll"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Registry]
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt}\OpenWithProgids"; ValueType: string; ValueName: "{#MyAppAssocKey}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}"; ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocName}"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""
Root: HKA; Subkey: "Software\Classes\Applications\{#MyAppExeName}\SupportedTypes"; ValueType: string; ValueName: ".myp"; ValueData: ""

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent