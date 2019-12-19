::关闭回显
@ECHO OFF

::设置软件路径
::SET vsim=D:\modeltech_10.1a\win32\vsim.exe

::Modelsim Command

vsim -do run.do
::删除ModelSim 生成的相关文件
RD work /s /q
::DEL transcript vsim.wlf /q
DEL vsim.wlf /q

::退出命令
EXIT
