@echo off
setlocal
rem python��װ��ַ
set PYTHON="C:\Python38\python.exe"
set REPOS=%1
set TXN=%2
rem SVN�������ֿ�
set SVNBIN="D:\VisualSVN\Location\bin"
rem python�ļ�λ��
set PY_CHECK="E:\pre.py"

%PYTHON% %PY_CHECK% %SVNBIN% %REPOS% %TXN%
if errorlevel 1 goto error
echo meta��prefab�ļ�ƥ��ɹ� 1>&2

:message
rem message��ʽ
svnlook log "%REPOS%" -t "%TXN%" | findstr /R /C:"refs[ ]#[0-9][0-9][0-9][0-9][0-9][0-9][ ].*" >nul
if %errorlevel% gtr 0 goto logErr
exit 0

:error
echo "��ͬʱ�ύ .prefab.meta �� .prefab �ļ� ">&2

:logErr
echo Message��ʾ:refs+�ո�+#+��λ������+�ո�+���� 1>&2
echo Messageʾ��:refs #120114 �ϴ�SVNʾ�� 1>&2
exit 1
