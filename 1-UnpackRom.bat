@echo on
::
::Gyakuten_Saiban_Jiten (Japan)
::
setlocal enabledelayedexpansion
set ndsfilename=.\baserom_jp.nds
::设定临时文件夹、工具位置
set tempfoldername=.\.temp
set toolfilename=.\tools\ndstool\ndstool.exe
::清理旧临时文件夹
if exist %tempfoldername% (
    rd /s /q %tempfoldername%)
::创建新临时文件夹
md %tempfoldername%\root\ftc
::ndstool解包nds文件至临时文件夹
%toolfilename% -x %ndsfilename% ^
-9  %tempfoldername%\root\ftc\arm9.bin ^
-7  %tempfoldername%\root\ftc\arm7.bin ^
-y9 %tempfoldername%\root\ftc\y9.bin ^
-y7 %tempfoldername%\root\ftc\y7.bin ^
-d  %tempfoldername%\root\data ^
-y  %tempfoldername%\root\overlay ^
-t  %tempfoldername%\root\ftc\banner.bin ^
-h  %tempfoldername%\root\ftc\header.bin

::读取解包arm9大小
for %%A in ("%tempfoldername%\root\ftc\arm9.bin") do set "arm9Size=%%~zA"
::计算arm压缩大小
set /a arm9CompressSize=arm9Size - 0xC
::裁切另存压缩的arm9
copy "%tempfoldername%\root\ftc\arm9.bin" "%tempfoldername%\root\ftc\arm9de.bin" /Y
fsutil file setEOF "%tempfoldername%\root\ftc\arm9de.bin" %arm9CompressSize%
::解压压缩的另存arm9 【本游戏未压缩arm9】
::.\tools\cue\blz.exe -d %tempfoldername%\root\ftc\arm9de.bin
::另存arm9合并进原arm9
move /Y %tempfoldername%\root\ftc\arm9de.bin %tempfoldername%\root\ftc\arm9.bin

endlocal
::
::3秒后自动关闭本窗口
@echo off
ping 127.0.0.1 -n 3 >nul