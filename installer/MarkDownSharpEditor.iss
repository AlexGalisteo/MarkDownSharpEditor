#define MyAppVer GetFileVersion("bin\MarkDownSharpEditor.exe")
#define MyAppVerNum StringChange(MyAppVer, ".", "")

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "jp"; MessagesFile: "compiler:Languages\Japanese.isl"

[Setup]
AppName=MarkDown#Editor
AppVersion={#MyAppVer}
AppVerName=MarkDown#Editor ver.{#MyAppVer}
DefaultGroupName=MarkDown#Editor
OutputBaseFilename=mked{#MyAppVerNum}
DefaultDirName={pf}\MarkDownSharpEditor
UsePreviousAppDir=yes
AppendDefaultDirName=yes 
OutputDir=.\
TouchTime=00:00
ShowLanguageDialog=yes

;-----------------------------------
;�C���X�g�[���v���O����
;-----------------------------------
VersionInfoVersion={#MyAppVer}
VersionInfoDescription={cm:SetUpProgramDescription}
AppCopyright=Copyright(C) 2012-2013 M.Hibara, All rights reserved.
;SetupIconFile=icon\main_icon.ico
;�E�B�U�[�h�y�[�W�ɕ\�������O���t�B�b�N�i*.bmp: 164 x 314�j
;Graphic in wizard page.
WizardImageFile=bmp\installer_pic_01.bmp
;�E�B�U�[�h�y�[�W�ɕ\�������O���t�B�b�N���g�傳��Ȃ�
;Graphic in wizard page that is not expanded.
WizardImageStretch=no
;���̌��ԐF
;Background color.
WizardImageBackColor=$ffffff 
;�E�B�U�[�h�y�[�W�̉E�㕔���̃O���t�B�b�N�i*.bmp: 55 x 58�j
;Graphic in top-right window of wizard page.
WizardSmallImageFile=bmp\installer_pic_02.bmp
;�i���\��
;Progress.
ShowTasksTreeLines=yes

;------------------------------------------
;�u�v���O�����̒ǉ��ƍ폜�v�_�C�A���O���
;------------------------------------------
;�z�z��
AppPublisher=Hibara, Mitsuhiro
;�A�v���P�[�V�����z�z�� Web�T�C�g�� URL
AppPublisherURL=http://hibara.org/
;�A����
AppContact=m@hibara.org
;�T�|�[�g�T�C�gURL
AppSupportURL=http://hibara.org/software/
;ReadMe�t�@�C���p�X
AppReadmeFile="{app}\MarkDownSharpEditor\readme.txt"
;���i�X�V���URL
AppUpdatesURL=http://hibara.org/software/markdownsharpeditor/
;�A�v���P�[�V�����̐���
AppComments=Markdown�L�@�ɑΉ������y�ʂȃe�L�X�g�G�f�B�^�[

[CustomMessages]
en.SetUpProgramDescription=Set up program for 'MarkDown#Editor'
jp.SetUpProgramDescription=�uMarkDown#Editor�v���Z�b�g�A�b�v����v���O���� 
en.UnintallName=Uninstall
jp.UnintallName=�A���C���X�g�[��
en.MsgFailedToInstallDotNetFramework=Failed to install .NET Framework 4.0.%nPlease install the .NET Framework 4.0 such as from Windows update.%nAnd then please start this setup program again.
jp.MsgFailedToInstallDotNetFramework=.NET Framework 4.0 �̃C���X�g�[���Ɏ��s�����悤�ł��B%nWindows�A�b�v�f�[�g�Ȃǂ��� .NET Framework���C���X�g�[�����āA%n�Z�b�g�A�b�v�v���O�������ēx�N�����Ă��������B
en.mdSampleFile=help.md
jp.mdSampleFile=help-ja.md
en.LaunchProgram=Start MarkDown#Editor after finishing installation.
jp.LaunchProgram=�C���X�g�[��������ɁAMarkDown#Editor ���N�����܂��B

[Dirs]
Name: "{userappdata}\MarkDownSharpEditor\css"; Flags: uninsalwaysuninstall

[Files]
Source: "bin\MarkDownSharpEditor.exe"; DestDir: "{app}"; Flags: ignoreversion touch
Source: "bin\MrkSetup.exe"; DestDir: "{app}"; Flags: ignoreversion touch
Source: "bin\ja-JP\MarkDownSharpEditor.resources.dll"; DestDir: "{app}\\ja-JP"; Flags: ignoreversion touch
Source: "bin\readme.txt"; DestDir: "{userappdata}\MarkDownSharpEditor"; Flags: ignoreversion touch
;�T���v��.MD�t�@�C��
Source: "bin\help-ja.md"; DestDir: "{userappdata}\MarkDownSharpEditor"; Flags: ignoreversion touch
Source: "bin\help.md"; DestDir: "{userappdata}\MarkDownSharpEditor"; Flags: ignoreversion touch
Source: "bin\sample.md"; DestDir: "{userappdata}\MarkDownSharpEditor"; Flags: ignoreversion touch
Source: "bin\main_icon_48x48.png"; DestDir: "{userappdata}\MarkDownSharpEditor"; Flags: ignoreversion touch
;�r���g�C��CSS�t�@�C��
Source: "bin\hibara.org.css"; DestDir: "{userappdata}\MarkDownSharpEditor\css"; Flags: ignoreversion touch
Source: "bin\github.css"; DestDir: "{userappdata}\MarkDownSharpEditor\css"; Flags: ignoreversion touch
Source: "bin\markdown.css"; DestDir: "{userappdata}\MarkDownSharpEditor\css"; Flags: ignoreversion touch

[Icons]
Name: "{group}\MarkDown#Editor"; Filename: "{app}\MarkDownSharpEditor.exe"; WorkingDir: "{app}"
Name: "{group}\{cm:UnintallName}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\MarkDown# Editor"; Filename: "{app}\MarkDownSharpEditor.exe"; WorkingDir: "{app}"; Tasks: desktopicon

[Tasks]
;"�f�X�N�g�b�v��ɃA�C�R�����쐬����(&D)"
;Create a &desktop icon
Name: desktopicon; Description: {cm:CreateDesktopIcon};
;�t�@�C���g���q %2 �� %1 ���֘A�t���܂��B
;&Associate %1 with the %2 file extension
Name: association; Description: {cm:AssocFileExtension,*.md,MarkDown#Editor};

[Run]
Filename: "{app}\MrkSetup.exe"; Parameters:"-a"; Tasks: association; Flags: nowait skipifsilent runascurrentuser
Filename: "{app}\MarkDownSharpEditor.exe"; Parameters:"{userappdata}\MarkDownSharpEditor\{cm:mdSampleFile}"; Description: {cm:LaunchProgram}; Flags: nowait postinstall skipifsilent

[UninstallDelete]
;�ݒ�t�@�C����r���g�C��CSS�t�H���_�̍폜
;Type: filesandordirs; Name: "{commonappdata}\MarkDownSharp"

[Registry]
;�i�A���C���X�g�[�����Ɂj�֘A�t���ݒ���폜
; Delete association *.md file extension with this application to uninstall.
Root: HKCR; Subkey: "MarkDownSharpEditor.DataFile"; Flags: uninsdeletekey
Root: HKCR; Subkey: ".md"; Flags: uninsdeletekey

[Code]
function IsDotNetDetected(version: string; service: cardinal): boolean;
// Indicates whether the specified version and service pack of the .NET Framework is installed.
//
// version -- Specify one of these strings for the required .NET Framework version:
//    'v1.1.4322'     .NET Framework 1.1
//    'v2.0.50727'    .NET Framework 2.0
//    'v3.0'          .NET Framework 3.0
//    'v3.5'          .NET Framework 3.5
//    'v4\Client'     .NET Framework 4.0 Client Profile
//    'v4\Full'       .NET Framework 4.0 Full Installation
//
// service -- Specify any non-negative integer for the required service pack level:
//    0               No service packs required
//    1, 2, etc.      Service pack 1, 2, etc. required
var
  key: string;
  install, serviceCount: cardinal;
  success: boolean;
begin
  key := 'SOFTWARE\Microsoft\NET Framework Setup\NDP\' + version;
  // .NET 3.0 uses value InstallSuccess in subkey Setup
  if Pos('v3.0', version) = 1 then begin
    success := RegQueryDWordValue(HKLM, key + '\Setup', 'InstallSuccess', install);
  end else begin
    success := RegQueryDWordValue(HKLM, key, 'Install', install);
  end;
  // .NET 4.0 uses value Servicing instead of SP
  if Pos('v4', version) = 1 then begin
    success := success and RegQueryDWordValue(HKLM, key, 'Servicing', serviceCount);
  end else begin
    success := success and RegQueryDWordValue(HKLM, key, 'SP', serviceCount);
  end;
  result := success and (install = 1) and (serviceCount >= service);
end;

function InitializeSetup(): Boolean;
begin
  if not IsDotNetDetected('v4\Full', 0) then begin
    MsgBox('{cm:MsgFailedToInstallDotNetFramework}', mbInformation, MB_OK);
    result := false;
  end else
    result := true;
end;

