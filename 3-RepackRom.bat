@echo on
::打包汉化nds文件
setlocal enabledelayedexpansion
set newndsfilename=.\Gyakuten_Saiban_Jiten_Chs.nds
::设定临时文件夹,工具位置
set tempfoldername=.\.temp
set toolfilename=.\tools\ndstool\ndstool.exe
::ndstool打包汉化rom
%toolfilename% -c %newndsfilename% ^
-9  %tempfoldername%\root\ftc\arm9.bin ^
-7  %tempfoldername%\root\ftc\arm7.bin ^
-y9 %tempfoldername%\root\ftc\y9.bin ^
-y7 %tempfoldername%\root\ftc\y7.bin ^
-d  %tempfoldername%\root\data ^
-y  %tempfoldername%\root\overlay ^
-t  %tempfoldername%\root\ftc\banner.bin ^
-h  %tempfoldername%\root\ftc\header.bin
::还原0x60的数值
.\tools\armips\armips.exe .\tools\headerfix.asm
::还原arm9尾部nitrocode的数值
.\tools\armips\armips.exe .\tools\nitrocodefix.asm
::更新修改后的校验值
.\tools\headerChecksum\headerChecksum.exe %newndsfilename%
::填充字节
.\tools\armips\armips.exe .\tools\Fill.asm
::重打包
::rd /s /q %tempfoldername%
::@echo =========Now Repacking %newndsfilename%=========
::.\tools\tinke\Tinke_autorepack.exe %newndsfilename%
endlocal
::
::3秒后自动关闭本窗口
@echo off
ping 127.0.0.1 -n 3 >nul