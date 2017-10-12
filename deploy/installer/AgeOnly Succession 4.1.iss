#define PackageName      "Age Only Succession"
#define PackageNameLong  "Age Only Succession"
#define Version          "4.1.3"
#define ReleaseType      "official"
#define ReleaseNumber    "4"
#define CoreVersion      "6.0"
#define CoreReleaseAbbr  ""

#define ExtDir "C:\Program Files\LANDIS-II\v6\bin\extensions"
#define AppDir "C:\Program Files\LANDIS-II\v6\"
#define LandisPlugInDir "C:\Program Files\LANDIS-II\plug-ins"

#include "package (Setup section) v6.0.iss"

[Files]
; This .dll IS the extension (ie, the extension's assembly)
; NB: Do not put an additional version number in the file name of this .dll
; (The name of this .dll is defined in the extension's \src\*.csproj file)
Source: ..\..\src\bin\debug\Landis.Extension.Succession.AgeOnly.dll; DestDir: {#ExtDir}; Flags: replacesameversion

; Requisite auxiliary libraries
; NB. These libraries are used by other extensions and thus are never uninstalled.
Source: ..\..\src\bin\debug\Landis.Library.Succession-v5.dll; DestDir: {#ExtDir}; Flags: uninsneveruninstall replacesameversion
Source: ..\..\src\bin\debug\Landis.Library.Cohorts.dll; DestDir: {#ExtDir}; Flags: uninsneveruninstall replacesameversion
Source: ..\..\src\bin\debug\Landis.Library.AgeOnlyCohorts.dll; DestDir: {#ExtDir}; Flags: uninsneveruninstall replacesameversion





; Complete example for testing the extension
Source: ..\examples\*.txt; DestDir: {#AppDir}\examples\AgeOnly Succesion; Flags: replacesameversion
Source: ..\examples\*.gis; DestDir: {#AppDir}\examples\AgeOnly Succesion; Flags: replacesameversion
Source: ..\examples\*.bat; DestDir: {#AppDir}\examples\AgeOnly Succesion; Flags: replacesameversion


; LANDIS-II identifies the extension with the info in this .txt file
; NB. New releases must modify the name of this file and the info in it
#define InfoTxt "AgeOnly Succession 4.1.txt"
Source: {#InfoTxt}; DestDir: {#LandisPlugInDir}


[Run]
;; Run plug-in admin tool to add the entry for the plug-in
#define PlugInAdminTool  CoreBinDir + "\Landis.PlugIns.Admin.exe"


Filename: {#PlugInAdminTool}; Parameters: "remove ""AgeOnly Succession"" "; WorkingDir: {#LandisPlugInDir}
Filename: {#PlugInAdminTool}; Parameters: "add ""{#InfoTxt}"" "; WorkingDir: {#LandisPlugInDir}


[Code]
{ Check for other prerequisites during the setup initialization }
#include "package (Code section) v3.iss"

//-----------------------------------------------------------------------------

function InitializeSetup_FirstPhase(): Boolean;
begin
  Result := True
end;
