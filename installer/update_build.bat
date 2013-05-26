@echo. ======================================================================
@echo. ���̃o�b�`�t�@�C���ł́A�K�v�ȃt�@�C�����e������R�s�[���Ă��āA
@echo. �ŏI�I�Ȑ��i�Ƃ��� �uMarkDown#Editor�v���p�b�N���A�C���X�g�[���[��
@echo. �쐬����Ƃ���܂ōs���܂��B���̏����ɂ́A���炩���߃C���X�g�[������
@echo. �����ׂ��c�[��������������܂��B
@echo. 
@echo. �ȉ��̃c�[��������̏ꏊ�ɃC���X�g�[������Ă��邱�Ƃ��m�F���Ă���
@echo. ���s���Ă��������B
@echo. 
@echo. ��Inno Setup�i�C���X�g�[���[�쐬�\�t�g�j
@echo. 
@echo. ======================================================================

@echo 
@echo -----------------------------------
@echo �K�v�t�@�C���̃R�s�[
@echo -----------------------------------

mkdir bin

@rem  �K�v�t�@�C����installer�փR�s�[
copy ..\MarkDownSharpEditor\bin\Release\MarkDownSharpEditor.exe bin\MarkDownSharpEditor.exe
copy ..\MarkDownSharpEditor\bin\Release\MarkdownDeep.dll bin\MarkdownDeep.dll
copy ..\MrkSetup\bin\Release\MrkSetup.exe bin\MrkSetup.exe
mkdir bin\ja-JP
copy ..\MarkDownSharpEditor\bin\Release\ja-JP\MarkDownSharpEditor.resources.dll bin\ja-JP\MarkDownSharpEditor.resources.dll
copy ..\MrkSetup\bin\Release\MrkSetup.exe bin\MrkSetup.exe
copy ..\readme.md bin\readme.txt
copy ..\css\*.css bin\
copy ..\*.md bin\
copy ..\images\main_icon\main_icon_48x48.png bin\

@echo 
@echo -----------------------------------
@echo ���������[���N���A
@echo -----------------------------------

..\tools\setTimeZero\setTimeZero\bin\Release\setTimeZero.exe bin\github.css
..\tools\setTimeZero\setTimeZero\bin\Release\setTimeZero.exe bin\hibara.org.css
..\tools\setTimeZero\setTimeZero\bin\Release\setTimeZero.exe bin\markdown.css
..\tools\setTimeZero\setTimeZero\bin\Release\setTimeZero.exe bin\main_icon_48x48.png
..\tools\setTimeZero\setTimeZero\bin\Release\setTimeZero.exe bin\help.md
..\tools\setTimeZero\setTimeZero\bin\Release\setTimeZero.exe bin\help-ja.md
..\tools\setTimeZero\setTimeZero\bin\Release\setTimeZero.exe bin\sample.md
..\tools\setTimeZero\setTimeZero\bin\Release\setTimeZero.exe bin\readme.txt
..\tools\setTimeZero\setTimeZero\bin\Release\setTimeZero.exe bin\MarkDownSharpEditor.exe
..\tools\setTimeZero\setTimeZero\bin\Release\setTimeZero.exe bin\ja-JP\MarkDownSharpEditor.resources.dll
..\tools\setTimeZero\setTimeZero\bin\Release\setTimeZero.exe bin\MrkSetup.exe

@echo. 
@echo. -----------------------------------
@echo. �C���X�g�[���p�b�P�[�W�̐���
@echo. -----------------------------------

if "%PROCESSOR_ARCHITECTURE%" == "AMD64" (
"%ProgramFiles(x86)%\Inno Setup 5\ISCC.exe" MarkDownSharpEditor.iss
) else (
"%ProgramFiles%\Inno Setup 5\ISCC.exe" MarkDownSharpEditor.iss
)

echo %ERRORLEVEL%

@echo. 
@echo. -----------------------------------
@echo. �n�b�V���l���e�L�X�g�t�@�C���ۑ�
@echo. -----------------------------------

..\tools\gethash\gethash.exe *.exe


@echo. 
@echo. -----------------------------------
@echo. ���������[���N���A
@echo. -----------------------------------


..\tools\setTimeZero\setTimeZero\bin\Release\setTimeZero.exe /w *.exe
..\tools\setTimeZero\setTimeZero\bin\Release\setTimeZero.exe /w *.md5
..\tools\setTimeZero\setTimeZero\bin\Release\setTimeZero.exe /w *.sha1


@echo. 
@echo. -----------------------------------
@echo. �ꎞbin�f�B���N�g���̍폜
@echo. -----------------------------------

@rem rd /s /q "bin"

:END

@echo 
@echo **********************************************************************
@echo �������������܂����B
@echo **********************************************************************
@echo 


pause

