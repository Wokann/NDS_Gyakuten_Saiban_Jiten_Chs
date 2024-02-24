@echo on
if exist .\.temp ( rd /s /q .\.temp)
if exist .\.tempChs ( rd /s /q .\.tempChs)
::if exist .\Gyakuten_Saiban_Jiten_Chs.nds ( del .\Gyakuten_Saiban_Jiten_Chs.nds)

::
::3秒后自动关闭本窗口
@echo off
ping 127.0.0.1 -n 3 >nul