#define PackageName      "Age Only Succession"
#define PackageNameLong  "Age Only Succession"
#define Version          "4.1"
#define ReleaseType      "official"
#define ReleaseNumber    "4"

#define CoreVersion      "6.0"
#define CoreReleaseAbbr  ""

#include "package (Setup section) v6.0.iss"
#define ExtDir "C:\Program Files\LANDIS-II\v6\bin\extensions"
#define AppDir "C:\Program Files\LANDIS-II\v6"

[Files]
; Install Files and Necessary Libraries
Source: ..\src\lib\Landis.Library.Succession.dll; DestDir: {#ExtDir}; Flags: uninsneveruninstall replacesameversion
Source: ..\src\lib\Landis.Library.Cohorts.dll; DestDir: {#ExtDir}; Flags: uninsneveruninstall replacesameversion
Source: ..\src\lib\Landis.Library.AgeOnlyCohorts.dll; DestDir: {#ExtDir}; Flags: uninsneveruninstall replacesameversion
Source: ..\src\bin\debug\Landis.Extension.Succession.AgeOnly.dll; DestDir: {#ExtDir}; Flags: replacesameversion


Source: docs\LANDIS-II Age-Only Succession v4.1 User Guide.pdf; DestDir: {#AppDir}\docs
Source: examples\ecoregions.gis; DestDir: {#AppDir}\examples\age-only-succession
Source: examples\initial-communities.gis; DestDir: {#AppDir}\examples\age-only-succession
Source: examples\*.txt; DestDir: {#AppDir}\examples\age-only-succession
Source: examples\*.bat; DestDir: {#AppDir}\examples\age-only-succession

#define ExtInfoFile "Age-only Succession 4.1.1.txt"
Source: {#ExtInfoFile}; DestDir: {#LandisPlugInDir}

[Run]
#define PlugInAdminTool  CoreBinDir + "\Landis.PlugIns.Admin.exe"
Filename: {#PlugInAdminTool}; Parameters: "remove ""Age Only Succession"" "; WorkingDir: {#LandisPlugInDir}
Filename: {#PlugInAdminTool}; Parameters: "add ""{#ExtInfoFile}"" "; WorkingDir: {#LandisPlugInDir}

[UninstallRun]
;Filename: {#ExtAdminTool}; Parameters: "remove ""{#ExtensionName}"" "; WorkingDir: {#LandisExtInfoDir}

[Code]
#include "package (Code section) v3.iss"

//-----------------------------------------------------------------------------

function CurrentVersion_PostUninstall(currentVersion: TInstalledVersion): Integer;
begin
    Result := 0;
end;

//-----------------------------------------------------------------------------

function InitializeSetup_FirstPhase(): Boolean;
begin
  CurrVers_PostUninstall := @CurrentVersion_PostUninstall
  Result := True
end;
