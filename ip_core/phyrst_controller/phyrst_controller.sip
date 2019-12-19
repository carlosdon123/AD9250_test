set_global_assignment -entity "phyrst_controller" -library "lib_phyrst_controller" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "phyrst_controller" -library "lib_phyrst_controller" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "phyrst_controller" -library "lib_phyrst_controller" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_phyrst_controller" -name SPD_FILE [file join $::quartus(sip_path) "phyrst_controller.spd"]
set_global_assignment -library "lib_phyrst_controller" -name MISC_FILE [file join $::quartus(sip_path) "../phyrst_controller.qsys"]

set_global_assignment -library "lib_phyrst_controller" -name MISC_FILE [file join $::quartus(sip_path) "sim/phyrst_controller.v"]
set_global_assignment -library "lib_phyrst_controller" -name MISC_FILE [file join $::quartus(sip_path) "altera_xcvr_reset_control_161/sim/altera_xcvr_functions.sv"]
set_global_assignment -library "lib_phyrst_controller" -name MISC_FILE [file join $::quartus(sip_path) "altera_xcvr_reset_control_161/sim/mentor/altera_xcvr_functions.sv"]
set_global_assignment -library "lib_phyrst_controller" -name MISC_FILE [file join $::quartus(sip_path) "altera_xcvr_reset_control_161/sim/alt_xcvr_resync.sv"]
set_global_assignment -library "lib_phyrst_controller" -name MISC_FILE [file join $::quartus(sip_path) "altera_xcvr_reset_control_161/sim/mentor/alt_xcvr_resync.sv"]
set_global_assignment -library "lib_phyrst_controller" -name MISC_FILE [file join $::quartus(sip_path) "altera_xcvr_reset_control_161/sim/altera_xcvr_reset_control.sv"]
set_global_assignment -library "lib_phyrst_controller" -name MISC_FILE [file join $::quartus(sip_path) "altera_xcvr_reset_control_161/sim/alt_xcvr_reset_counter.sv"]
set_global_assignment -library "lib_phyrst_controller" -name MISC_FILE [file join $::quartus(sip_path) "altera_xcvr_reset_control_161/sim/mentor/altera_xcvr_reset_control.sv"]
set_global_assignment -library "lib_phyrst_controller" -name MISC_FILE [file join $::quartus(sip_path) "altera_xcvr_reset_control_161/sim/mentor/alt_xcvr_reset_counter.sv"]
set_global_assignment -library "lib_phyrst_controller" -name MISC_FILE [file join $::quartus(sip_path) "altera_xcvr_reset_control_161/sim/plain_files.txt"]
set_global_assignment -library "lib_phyrst_controller" -name MISC_FILE [file join $::quartus(sip_path) "altera_xcvr_reset_control_161/sim/mentor_files.txt"]
set_global_assignment -library "lib_phyrst_controller" -name MISC_FILE [file join $::quartus(sip_path) "altera_xcvr_reset_control_161/sim/cadence_files.txt"]
set_global_assignment -library "lib_phyrst_controller" -name MISC_FILE [file join $::quartus(sip_path) "altera_xcvr_reset_control_161/sim/synopsys_files.txt"]
set_global_assignment -library "lib_phyrst_controller" -name MISC_FILE [file join $::quartus(sip_path) "altera_xcvr_reset_control_161/sim/aldec_files.txt"]
