@echo off
set a=1
echo call callchild.bat
call "%~dp0%\callchild.bat"
echo end call
echo %b%
pause>nul

REM ע�⣺callִ�к�᷵��ԭ�����������ļ���
REM ���ֱ�ӵ����������ļ�������call�Ļ����������Ȩ��ת�����µ�������ű��У�
REM �µĽű�ִ����ͽ����ˣ����᷵�ص������ߵĽű���ִ��ʣ������

REM ����ʾ��
echo start not call��will echo end not call when finsih. 
"%~dp0%\callchild.bat"
echo end not call