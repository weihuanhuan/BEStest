@echo off

set JPS_EXEC="%JAVA_HOME%\bin\jps.exe"

set PID=
for /f "usebackq tokens=1" %%v in ( `%%JPS_EXEC%% ^| findstr "Bootstrap"` ) do set PID=%%v
REM ע�� for����ѡ���Ҫ����˫�����У���ʹ�ÿո�ָ�ÿ��ѡ�������ʹ�ö���;��Ϊÿ��ѡ��Ĳ���ʹ�ö��ŷָ���
REM  | �� % ��Ҫת�壬��cmdʹ�� ^��ת����󲿷��ַ����� % ��Ҫʹ����������ת�壬�� %%��

echo %PID%
taskkill /f /pid %PID% > nul 2>&1 && echo Killtask Tomcat successfully || echo Tomcat isn't running.
