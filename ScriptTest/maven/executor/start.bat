@echo off
setlocal

set "JAVA_EXE=%JAVA_HOME%\bin\java.exe"
set "BIN_HOME=%~dp0%"

set CLASSPATH=
set "CLASSPATH=%CLASSPATH%" 

"%JAVA_EXE%" -Djava.util.logging.config.file="C:\apache-tomcat-8.5.32\conf\logging.properties" -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager  "-Djdk.tls.ephemeralDHKeySize=2048" -Djava.protocol.handler.pkgs=org.apache.catalina.webresources  -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=28003 -Dignore.endorsed.dirs="" -classpath "C:\apache-tomcat-8.5.32\bin\bootstrap.jar;C:\apache-tomcat-8.5.32\bin\tomcat-juli.jar" -Dcatalina.base="C:\apache-tomcat-8.5.32" -Dcatalina.home="C:\apache-tomcat-8.5.32" -Djava.io.tmpdir="C:\apache-tomcat-8.5.32\temp" org.apache.catalina.startup.Bootstrap  start

REM ��ʹ�� start ����൱��ִ����һ��dos�������ִ�� echo XXX һ��
REM ����ڡ���cmdʵ�����У���ͬһ������ִ�� java ���������ס��CMD��ִ��
REM �� JAVA���� ��������������Զ���ʹ�� CMDʵ�� �������������
REM ��ʱ���CMD������������ôJAVAҲ�������������Ϊ���������Բ��������������
REM ��� CMD���� ����ֹͣ���� JAVA���� ��Ϊ�¶����̣���������ȥ��CMD���̵�IO��

REM ʹ�� start ��������ڡ���cmdʵ����������һ���µ�CMDʵ���������µĽ�������ִ�� java �����������ס��CMD��ִ�С���ʽ start "Title" command
REM �µ��ӽ��̵���������������Լ��Ķ����ģ���ʹ�ø����̵ġ�
REM ͬʱ���������������������ô�ӽ�����Ȼ�ᱣ�����У���Ϊһ���¶����̡�

REM ����ʹ�� ProcessExplorer �鿴 ����һ��CMDʵ��ʱ����һ��ɱ���Ĺ������̡�
REM ͬʱ�����windows�Ͻ��̵ĸ��ӹ�ϵ��֯��Щ��֣�������ĵ�����̶�Ӧ�Ĳ����ʣ�Ϊʲô�أ�
REM ����ʹ�� pause ���۲��� start ����ʱ����������̻��ţ��µ��ӽ���������

endlocal
if %ERRORLEVEL% == "1" goto error
echo cmd exitCode 0 print by start.bat
exit /b 0

:error
echo 1
exit  /b 1