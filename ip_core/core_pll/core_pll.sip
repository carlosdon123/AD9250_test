set_global_assignment -entity "core_pll" -library "lib_core_pll" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "core_pll" -library "lib_core_pll" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "core_pll" -library "lib_core_pll" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_core_pll" -name SPD_FILE [file join $::quartus(sip_path) "core_pll.spd"]
set_global_assignment -library "lib_core_pll" -name MISC_FILE [file join $::quartus(sip_path) "../core_pll.qsys"]

set_global_assignment -library "lib_core_pll" -name MISC_FILE [file join $::quartus(sip_path) "sim/core_pll.v"]
set_global_assignment -library "lib_core_pll" -name MISC_FILE [file join $::quartus(sip_path) "altera_iopll_161/sim/core_pll_altera_iopll_161_ep46qai.vo"]
