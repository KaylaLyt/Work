@rem echo "---" > hook.log
@rem type %1 >> hook.log
@rem type %2 >> hook.log

rem 本钩子是在客户端限制meta和prefab文件同时上传/删除，如果上传文件不匹配则失败
rem 修改python安装地址和脚本地址后，在客户端选择加入pre-commit钩子，即可实现
rem python在本机的安装地址 运行的python脚本地址
C:\Python38\python.exe E:\pre_commit.py %1 %2 %3 %4
if %ERRORLEVEL% NEQ 0 GOTO :error
GOTO :end
:error
echo "请同时提交 .prefab.meta 和 .prefab 文件 ">&2
exit /b -1
:end



