@echo off

set JAVA_EXEC="%JAVA_HOME%\bin\java.exe"

set JDK_VERSION=
for /f "usebackq tokens=3" %%v in ( `%%JAVA_EXEC%% -version 2^>^&1 ^| findstr "version"`  ) do set JDK_VERSION=%%v
REM Java�����version�������ʹ��stderr����Ҫ�����ض���stdout���ܽ�ȡ�����  
REM  | �� % ��Ҫת�壬��cmdʹ�� ^��ת����󲿷��ַ����� % ��Ҫʹ����������ת�壬�� %%��

echo %JDK_VERSION%
echo %JDK_VERSION:~1,-1% | findstr /r  "^1\.[78]" > nul && echo Maybe 7 or 8 || echo Neither 7 or 8
REM ʹ������ȷ���汾�ķ�Χ�������ö�·�����Ԫ���㡣

