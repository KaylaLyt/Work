@echo off
setlocal
rem python安装地址
set PYTHON="C:\Python38\python.exe"
set REPOS=%1
set TXN=%2
rem SVN服务器仓库
set SVNBIN="D:\VisualSVN\Location\bin"
rem python文件位置
set PY_CHECK="E:\pre.py"

%PYTHON% %PY_CHECK% %SVNBIN% %REPOS% %TXN%
if errorlevel 1 goto error
echo meta和prefab文件匹配成功 1>&2

:message
rem message格式
svnlook log "%REPOS%" -t "%TXN%" | findstr /R /C:"refs[ ]#[0-9][0-9][0-9][0-9][0-9][0-9][ ].*" >nul
if %errorlevel% gtr 0 goto logErr
exit 0

:error
echo "请同时提交 .prefab.meta 和 .prefab 文件 ">&2

:logErr
echo Message提示:refs+空格+#+六位数单号+空格+内容 1>&2
echo Message示例:refs #120114 上传SVN示例 1>&2
exit 1
