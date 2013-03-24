%include "../program/nasmx/inc/nasmx.inc"
%include "../program/nasmx/inc/win32/user32.inc"
%include "../program/nasmx/inc/win32/kernel32.inc"
%include "../program/nasmx/inc/win32/windows.inc"
;//test
;//test1
;//test2
entry WinMain  ;//程序入口，指示程序从哪里开始执行
[section .data]  ;//数据段
	szText db "Hello, World!", 0  ;//szText——变量名，db——Define Byte,就是定义一个字节的意思，
								  ;//每个字符以一个字节存储，字符串以0结束。
	szTitle db "Nasm", 0
[section .text]  ;//代码段
	proc WinMain  ;//过程
		locals none
		
		invoke MessageBoxA, NULL, szText, szTitle, MB_OK  ;//援引user32.inc中函数，创建一个窗口
														  ;//MB _OK按钮
		invoke ExitProcess, NULL  ;//结束进程
	endproc       ;//过程结束
