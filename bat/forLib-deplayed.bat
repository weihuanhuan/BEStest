@echo off

setlocal
set BIN_HOME="%~dp0"

set CLASSPAT=bootstrap.jar
REM �޸Ļ�������֮ǰ���õ� LIB ֵ��������ܻ��ܵ�����֮ǰ���ڵ�Ӱ�졣

if not exist %BIN_HOME%\extlib\*.jar goto finishedLib
set EXTLIB=
setlocal enabledelayedexpansion
for /r %BIN_HOME%\extlib   %%f  in (*.jar) do (
    echo %%~f	
    set EXTLIB=!EXTLIB!;%%~f

    REM echo !EXTLIB!
    REM ��� echo ����� echo is off ������ʹ���� �ӳٱ�����չ������������õı�������%XXX%ʱ��Ӧ��ʹ��!XXX!
    REM ����ʹ�� %XXX%����Ϊ��Ԥ����׶λᱻ�滻���������֮ǰ�������ֵ����֮ǰֵΪ�գ�������ʾ echo is off
 
)
:finishedLib

set CLASSPAT=%CLASSPAT%%EXTLIB%
echo ----------EXTLIB--------------------------
echo %EXTLIB%
echo ----------CLASSPATH--------------------
echo %CLASSPAT%

endlocal