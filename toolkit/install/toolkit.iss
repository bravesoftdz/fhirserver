; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{9FD61024-BC9A-4226-ADA5-E72254250B6C}
AppName=FHIR Toolkit
AppVersion=0.1
AppVerName=FHIR ToolKit v0.0.50 (FHIR Version 3.0.1.12956)
AppPublisher=Health Intersections
AppPublisherURL=http://www.healthintersections.com.au/FhirServer
AppSupportURL=http://www.healthintersections.com.au/FhirServer
AppUpdatesURL=http://www.healthintersections.com.au/FhirServer
DefaultDirName={pf}\FHIRToolkit
DefaultGroupName=FHIR Applications
AllowNoIcons=yes
LicenseFile=C:\work\fhirserver\toolkit\install\licence.txt
OutputDir=C:\work\fhirserver\toolkit\install
OutputBaseFilename=fhir-toolkit-install-0.0.50
SetupIconFile=C:\work\fhirserver\toolkit\AppEndorser_Icon.ico
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64
ArchitecturesAllowed=x64

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "C:\work\fhirserver\install\installer.dll";               Flags: dontcopy;
Source: "C:\work\fhirserver\toolkit\install\FHIRToolkitR4.exe";                                 DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\fhirserver\toolkit\install\FHIRToolkitR3.exe";                                 DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\fhirserver\toolkit\install\FHIRTransformer.exe";                               DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\fhirserver\Exec\32\cde-scintilla.dll";                                         DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\fhirserver\Exec\32\chakracore.dll";                                            DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\fhirserver\toolkit\install\osx\FHIRToolkit.app\Contents\MacOS\toolkit.png";    DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\fhirserver\toolkit\install\osx\FHIRToolkit.app\Contents\MacOS\*.xml";          DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\fhirserver\Exec\64\ssleay32.dll";                                              DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\fhirserver\Exec\64\libeay32.dll";                                              DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\Toolkit (R4)"; Filename: "{app}\FHIRToolkitR4.exe"
Name: "{group}\Toolkit (R3)"; Filename: "{app}\FHIRToolkitR3.exe"
Name: "{group}\Transformer"; Filename: "{app}\FHIRTransformer.exe"
Name: "{group}\{cm:ProgramOnTheWeb,FHIR Toolkit}"; Filename: "http://www.healthintersections.com.au/FhirServer"

[Run]
Filename: "{app}\FHIRToolkitR3.exe"; Description: "{cm:LaunchProgram,FHIR Toolkit (R3)}"; Flags: nowait postinstall skipifsilent

[Code]
var
  LoadInstallPage : TOutputProgressWizardPage;

type
  TMyCallback = procedure(IntParam: Integer; StrParam: WideString);

Function MyDllDownloadPackages(mode : PAnsiChar; urls : PAnsiChar; callback: TMyCallback) : PAnsiChar; external 'MyDllDownloadPackages@files:installer.dll stdcall setuponly';

procedure InitCallback(IntParam: Integer; StrParam: WideString);
begin
  LoadInstallPage.SetProgress(intparam, 100);
  LoadInstallPage.SetText(StrParam, '');
end;

procedure InstallPackages;
var
  done : boolean;
  s : String;
  msg : String;
begin
  LoadInstallPage.SetText('Installing R3/R4/CDA Packages...', '');
  LoadInstallPage.SetProgress(0, 100);
  LoadInstallPage.Show;
  try
    s := ',hl7.fhir.core#3.0.1,hl7.fhir.core#4.0.0,hl7.fhir.cda#0.0.1';
    repeat
      done := true;
      msg := MyDllDownloadPackages('user', s, @InitCallback);
      if msg <> '' then
        done := MsgBox('Downloading the packages failed : '+msg+#13#10+'Try again? (can be done later through installed applications)', mbError, MB_YESNO) = mrNo;
    until done;
  finally
    LoadInstallPage.Hide;
  end;

end;

Procedure CreatePostInstallPage;
Begin
  LoadInstallPage := CreateOutputProgressPage('Perform Installation tasks', '');
End;

procedure InitializeWizard();
Begin
  CreatePostInstallPage;
End;


procedure CurStepChanged(CurStep: TSetupStep);
Begin
  if (CurStep = ssPostInstall)  Then
    InstallPackages;
End;
