@rem echo "---" > hook.log
@rem type %1 >> hook.log
@rem type %2 >> hook.log

rem ���������ڿͻ�������meta��prefab�ļ�ͬʱ�ϴ�/ɾ��������ϴ��ļ���ƥ����ʧ��
rem �޸�python��װ��ַ�ͽű���ַ���ڿͻ���ѡ�����pre-commit���ӣ�����ʵ��
rem python�ڱ����İ�װ��ַ ���е�python�ű���ַ
C:\Python38\python.exe E:\pre_commit.py %1 %2 %3 %4
if %ERRORLEVEL% NEQ 0 GOTO :error
GOTO :end
:error
echo "��ͬʱ�ύ .prefab.meta �� .prefab �ļ� ">&2
exit /b -1
:end



