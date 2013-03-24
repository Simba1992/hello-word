CC = cc  #C语言编译指令
NASM = nasm  #汇编指令
LINK = golink  #链接指令
LATEX = pdflatex  #CTEX
PDF = E:\soft\SumatraPDF\SumatraPDF  #路径

run : Makefile a.exe hello.exe hello.pdf  #程序名 ：Makefile + 程序执行所依赖的文件
	a.exe								  #程序内容
	hello.exe
	$(PDF) hello.pdf					

#cc default output a.exe
c : Makefile hello.c
	$(CC) hello.c						  #编译hello.c生成.exe文件，也可以通过指令先生成
	a.exe								  #.obj文件，再link成.exe文件，参照asm
	
#nasm command
#-f : output format
asm : Makefile hello.asm
	$(NASM) -f win32 hello.asm			  #nasm汇编指令，生成.obj文件
	$(LINK) /entry _main hello.obj user32.dll kernel32.dll  #..obj文件通过link生成.exe文件
	hello.exe
	
#make a pdf file 
#path must contains ./
tex : Makefile hello.tex				  #排版
	$(LATEX) ./hello.tex				  # ./不能省略
	$(PDF) hello.pdf

clean : Makefile
	del a.exe
	del hello.exe
	del hello.obj
	del hello.aux
	del hello.log
	del hello.pdf