@echo off

setlocal
set BIN_HOME="%~dp0"

set CLASSPAT=bootstrap.jar
REM �޸Ļ�������֮ǰ���õ� LIB ֵ��������ܻ��ܵ�����֮ǰ���ڵ�Ӱ�졣

if not exist %BIN_HOME%\extlib\*.jar goto finishedLib
set EXTLIB=
for /r %BIN_HOME%\extlib   %%f  in (*.jar) do (
    echo %%~f	
    call set EXTLIB=%%EXTLIB%%;%%~f

    REM call echo %%EXTLIB%%
    REM ��� echo ����� echo is off ������ʹ���� call����call����������Ҫ˫��%%�ԣ���%XXX%ʱ��Ӧ��ʹ��%%XXX%%
 
)
:finishedLib

set CLASSPAT=%CLASSPAT%%EXTLIB%
echo ----------EXTLIB--------------------------
echo %EXTLIB%
echo ----------CLASSPATH--------------------
echo %CLASSPAT%

endlocal