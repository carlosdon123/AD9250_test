set_global_assignment -entity "rom_port" -library "lib_rom_port" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "rom_port" -library "lib_rom_port" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "rom_port" -library "lib_rom_port" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_rom_port" -name SPD_FILE [file join $::quartus(sip_path) "rom_port.spd"]
set_global_assignment -library "lib_rom_port" -name MISC_FILE [file join $::quartus(sip_path) "../rom_port.qsys"]

set_global_assignment -library "lib_rom_port" -name MISC_FILE [file join $::quartus(sip_path) "sim/rom_port.v"]
set_global_assignment -library "lib_rom_port" -name MISC_FILE [file join $::quartus(sip_path) "rom_1port_161/sim/rom_port_rom_1port_161_m5cej6i.v"]
