@echo off
set a=1
echo start startchild.bat
start "startchild.bat" "%~dp0%\startchild.bat"
echo end start
echo %b%
pause>nul

REM start����Ὣ��һ����˫���ŵĲ������Ϊ��cmd�ı��⣬start /? ����� START ["title"]  [command/program] [parameters]��
REM ע���һ����ѡ�Ĳ�����call ����û��������⡣
REM so��ֱ�� start "%~dp0%\startchild.bat" �൱�뿪��һ�� ����Ϊ %~dp0%\startchild.bat ���´��ڣ����������� %~dp0%\startchild.bat �ű�

REM ͬʱ��ҲҪע�ⴰ�ڵ����ֲ����� ��������չ+��ĸ�������  �磺%~dp0%abc�����ԣ��������ֿ��ԣ��磺%~dp0%123,
REM �������ѡ�����ĸ���ֺ��ԣ�ͬʱ�Ͳ�ִ����չ����һ��ѡ����������һ����Ϊ���⣬Ϊʲô��
REM ���磬"%~dp0%abc" "%~dp0%\startchild123.bat"������Ϊ F:\JetBrains\IntelliJ IDEA\BEStest\bat\-dp0\startchild123bat
REM ����%��ߵĵ�һ�����ֻᱻ�̵���Ϊʲô��

REM ������Ϊ�ж��Ƿ���� ָ���ű��ķ�ʽ�ǣ����ű�����Ϊ����ģ������ʱȷʵ���ýű�����ᱨ�� windows cannot find XXX�ű� �Ĵ���
REM ����Ϊ�˱���Ŀǰ��Щδ֪���鷳������Ҫ���ڱ�����ʹ�� ����չ������ ��