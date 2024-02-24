chcp 65001
::制作xdelta补丁
::使用方法：xdelta3 -v -e -s [原始rom文件] [新rom文件] [补丁文件]
::此处指令将rev0和rev1对应的汉化文件分别生成对应的xdelta补丁，放置于release文件夹内
".\tools\xdelta3\xdelta3-3.1.0-i686.exe" -v -e -f -s ".\baserom_jp.nds" ".\Gyakuten_Saiban_Jiten_Chs.nds" ".\release\Gyakuten_Saiban_Jiten_Chs.xdelta"

::生成hash值
if not exist ".\release\baserom_jp.nds_hash.txt" ( ".\tools\HashCal\HashCal.exe" ".\baserom_jp.nds" ".\release")
".\tools\HashCal\HashCal.exe" ".\Gyakuten_Saiban_Jiten_Chs.nds" ".\release"

::tools文件夹内还放置了一个图形化gui界面的补丁工具deltapatcher，可供手动鼠标点击制作补丁
::
::3秒后自动关闭本窗口
@echo off
ping 127.0.0.1 -n 3 >nul

