::�رջ���
@ECHO OFF

::�������·��
::SET vsim=D:\modeltech_10.1a\win32\vsim.exe

::Modelsim Command

vsim -do run.do
::ɾ��ModelSim ���ɵ�����ļ�
RD work /s /q
::DEL transcript vsim.wlf /q
DEL vsim.wlf /q

::�˳�����
EXIT
