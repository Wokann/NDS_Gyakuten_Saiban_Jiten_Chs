call 9-clean.bat
echo ===========================================
echo Clean Done!
echo ===========================================

if exist .\Gyakuten_Saiban_Jiten_Chs.nds ( del .\Gyakuten_Saiban_Jiten_Chs.nds)
::======================================================================================
::生成rev0的汉化rom
::======================================================================================
call 1-UnpackRom.bat
echo ===========================================
echo UnPackRom Done!
echo ===========================================


call 2-DoChinese.bat
echo ===========================================
echo DoChinese Done!
echo ===========================================


call 3-RepackRom.bat
call 9-clean.bat
setlocal enabledelayedexpansion
::设定另存汉化rom
set newndsfilename=.\Gyakuten_Saiban_Jiten_Chs.nds
echo ===========================================
echo Traslation Done! %newndsfilename%
echo ===========================================
endlocal


call 4-PatchMake.bat
echo ===========================================
echo ChinesePatches were Made!
echo ===========================================
::
::3秒后自动关闭本窗口
@echo off
ping 127.0.0.1 -n 3 >nul