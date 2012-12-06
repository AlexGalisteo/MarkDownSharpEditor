#define MyAppVer GetFileVersion("bin\MarkDownSharpEditor.exe")
#define MyAppVerNum StringChange(MyAppVer, ".", "")

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
InfoBeforeFile=change_log.txt

;-----------------------------------
;�C���X�g�[���v���O����
;-----------------------------------
VersionInfoVersion={#MyAppVer}
VersionInfoDescription=�uMarkDown#Editor�v���Z�b�g�A�b�v����v���O����
AppCopyright=Copyright(C) 2012 M.Hibara, All rights reserved.
;SetupIconFile=icon\main_icon.ico
;�E�B�U�[�h�y�[�W�ɕ\�������O���t�B�b�N�i*.bmp: 164 x 314�j
WizardImageFile=bmp\installer_pic_01.bmp
;�E�B�U�[�h�y�[�W�ɕ\�������O���t�B�b�N���g�傳��Ȃ�
WizardImageStretch=no
;���̌��ԐF
WizardImageBackColor=$ffffff 
;�E�B�U�[�h�y�[�W�̉E�㕔���̃O���t�B�b�N�i*.bmp: 55 x 58�j
WizardSmallImageFile=bmp\installer_pic_02.bmp
;�i���\���H
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


[Dirs]
Name: "{userappdata}\MarkDownSharpEditor\css"; Flags: uninsalwaysuninstall

[Files]
Source: "bin\MarkDownSharpEditor.exe"; DestDir: "{app}"; Flags: ignoreversion touch
Source: "bin\MrkSetup.exe"; DestDir: "{app}"; Flags: ignoreversion touch
;Source: "bin\readme.txt"; DestDir: "{userappdata}\MarkDownSharpEditor"; Flags: isreadme ignoreversion
;�T���v��.MD�t�@�C��
Source: "bin\help.md"; DestDir: "{userappdata}\MarkDownSharpEditor"; Flags: isreadme ignoreversion touch
Source: "bin\sample.md"; DestDir: "{userappdata}\MarkDownSharpEditor"; Flags: ignoreversion touch
Source: "bin\main_icon_48x48.png"; DestDir: "{userappdata}\MarkDownSharpEditor"; Flags: ignoreversion touch

;�r���g�C��CSS�t�@�C��
Source: "bin\hibara.org.css"; DestDir: "{userappdata}\MarkDownSharpEditor\css"; Flags: ignoreversion touch
Source: "bin\github.css"; DestDir: "{userappdata}\MarkDownSharpEditor\css"; Flags: ignoreversion touch
Source: "bin\markdown.css"; DestDir: "{userappdata}\MarkDownSharpEditor\css"; Flags: ignoreversion touch
    
[Languages]
Name: japanese; MessagesFile: compiler:Languages\Japanese.isl

[Icons]
Name: "{group}\MarkDown#Editor"; Filename: "{app}\MarkDownSharpEditor.exe"; WorkingDir: "{app}"
Name: "{group}\�A���C���X�g�[��"; Filename: "{uninstallexe}"
Name: "{commondesktop}\MarkDown# Editor"; Filename: "{app}\MarkDownSharpEditor.exe"; WorkingDir: "{app}"; Tasks: desktopicon

[Tasks]
Name: desktopicon; Description: "�f�X�N�g�b�v�ɃV���[�g�J�b�g�A�C�R�����쐬����"
Name: association; Description: "*.MD�t�@�C����MarkDown#Editor�Ɋ֘A�t������";

[Run]
Filename: "{app}\MrkSetup.exe"; Parameters: "-a"; Tasks: association; Flags: nowait skipifsilent runascurrentuser

[UninstallDelete]
;�ݒ�t�@�C����r���g�C��CSS�t�H���_�̍폜
;Type: filesandordirs; Name: "{commonappdata}\MarkDownSharp"

[Registry]
;�i�A���C���X�g�[�����Ɂj�֘A�t���ݒ���폜
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
        MsgBox('.NET Framework 4.0 �̃C���X�g�[���Ɏ��s�����悤�ł��B'#13#13
            'Windows�A�b�v�f�[�g�Ȃǂ��� .NET Framework���C���X�g�[�����āA'#13
            '�Z�b�g�A�b�v�v���O�������ēx�N�����Ă��������B', mbInformation, MB_OK);
        result := false;
    end else
        result := true;
end;

