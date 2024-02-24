::应用xdelta补丁
::使用方法：xdelta3 -v -d -s [原始rom文件] [补丁文件] [新rom文件] 
::此处命令为将release内的xdelta补丁根据rev0和rev1分别进行打补丁，并将新rom置于release文件夹内
if exist ".\release\Gyakuten_Saiban_Jiten_Chs.xdelta" (
".\tools\xdelta3\xdelta3-3.1.0-i686.exe" -v -d -f -s ".\baserom_jp.nds" ".\release\Gyakuten_Saiban_Jiten_Chs.xdelta" ".\release\Gyakuten_Saiban_Jiten_Chs.nds"
)

::tools文件夹内还放置了一个图形化gui界面的补丁工具deltapatcher，可供手动鼠标点击应用补丁
::
::3秒后自动关闭本窗口
@echo off
ping 127.0.0.1 -n 3 >nul