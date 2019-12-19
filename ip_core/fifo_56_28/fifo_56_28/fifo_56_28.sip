set_global_assignment -entity "fifo_56_28" -library "lib_fifo_56_28" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "fifo_56_28" -library "lib_fifo_56_28" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "fifo_56_28" -library "lib_fifo_56_28" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_fifo_56_28" -name SPD_FILE [file join $::quartus(sip_path) "fifo_56_28.spd"]
set_global_assignment -library "lib_fifo_56_28" -name MISC_FILE [file join $::quartus(sip_path) "../fifo_56_28.qsys"]

set_global_assignment -library "lib_fifo_56_28" -name MISC_FILE [file join $::quartus(sip_path) "sim/fifo_56_28.v"]
set_global_assignment -library "lib_fifo_56_28" -name MISC_FILE [file join $::quartus(sip_path) "fifo_161/sim/fifo_56_28_fifo_161_jjnbjqy.v"]
set_global_assignment -library "lib_fifo_56_28" -name MISC_FILE [file join $::quartus(sip_path) "fifo_161/sim/fifo_56_28_fifo_161_jjnbjqy.sdc"]
