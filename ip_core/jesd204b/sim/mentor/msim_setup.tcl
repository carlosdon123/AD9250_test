
# (C) 2001-2018 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ----------------------------------------
# Auto-generated simulation script msim_setup.tcl
# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     jesd204b
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level script that compiles Altera simulation libraries and
# the Quartus-generated IP in your project, along with your design and
# testbench files, copy the text from the TOP-LEVEL TEMPLATE section below
# into a new file, e.g. named "mentor.do", and modify the text as directed.
# 
# ----------------------------------------
# # TOP-LEVEL TEMPLATE - BEGIN
# #
# # QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# # construct paths to the files required to simulate the IP in your Quartus
# # project. By default, the IP script assumes that you are launching the
# # simulator from the IP script location. If launching from another
# # location, set QSYS_SIMDIR to the output directory you specified when you
# # generated the IP script, relative to the directory from which you launch
# # the simulator.
# #
# set QSYS_SIMDIR <script generation output directory>
# #
# # Source the generated IP simulation script.
# source $QSYS_SIMDIR/mentor/msim_setup.tcl
# #
# # Set any compilation options you require (this is unusual).
# set USER_DEFINED_COMPILE_OPTIONS <compilation options>
# #
# # Call command to compile the Quartus EDA simulation library.
# dev_com
# #
# # Call command to compile the Quartus-generated IP simulation files.
# com
# #
# # Add commands to compile all design files and testbench files, including
# # the top level. (These are all the files required for simulation other
# # than the files compiled by the Quartus-generated IP simulation script)
# #
# vlog <compilation options> <design and testbench files>
# #
# # Set the top-level simulation or testbench module/entity name, which is
# # used by the elab command to elaborate the top level.
# #
# set TOP_LEVEL_NAME <simulation top>
# #
# # Set any elaboration options you require.
# set USER_DEFINED_ELAB_OPTIONS <elaboration options>
# #
# # Call command to elaborate your design and testbench.
# elab
# #
# # Run the simulation.
# run -a
# #
# # Report success to the shell.
# exit -code 0
# #
# # TOP-LEVEL TEMPLATE - END
# ----------------------------------------
# 
# IP SIMULATION SCRIPT
# ----------------------------------------
# If jesd204b is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation --quartus-project=<quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------
# ACDS 16.1 203 win32 2018.04.02.15:58:51

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "jesd204b"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "D:/intelfpga/16.1/quartus/"
}

if ![info exists USER_DEFINED_COMPILE_OPTIONS] { 
  set USER_DEFINED_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_ELAB_OPTIONS] { 
  set USER_DEFINED_ELAB_OPTIONS ""
}

# ----------------------------------------
# Initialize simulation properties - DO NOT MODIFY!
set ELAB_OPTIONS ""
set SIM_OPTIONS ""
if ![ string match "*-64 vsim*" [ vsim -version ] ] {
} else {
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib          ./libraries/     
ensure_lib          ./libraries/work/
vmap       work     ./libraries/work/
vmap       work_lib ./libraries/work/
if ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
  ensure_lib                   ./libraries/altera_ver/       
  vmap       altera_ver        ./libraries/altera_ver/       
  ensure_lib                   ./libraries/lpm_ver/          
  vmap       lpm_ver           ./libraries/lpm_ver/          
  ensure_lib                   ./libraries/sgate_ver/        
  vmap       sgate_ver         ./libraries/sgate_ver/        
  ensure_lib                   ./libraries/altera_mf_ver/    
  vmap       altera_mf_ver     ./libraries/altera_mf_ver/    
  ensure_lib                   ./libraries/altera_lnsim_ver/ 
  vmap       altera_lnsim_ver  ./libraries/altera_lnsim_ver/ 
  ensure_lib                   ./libraries/twentynm_ver/     
  vmap       twentynm_ver      ./libraries/twentynm_ver/     
  ensure_lib                   ./libraries/twentynm_hssi_ver/
  vmap       twentynm_hssi_ver ./libraries/twentynm_hssi_ver/
  ensure_lib                   ./libraries/twentynm_hip_ver/ 
  vmap       twentynm_hip_ver  ./libraries/twentynm_hip_ver/ 
}
ensure_lib                                            ./libraries/altera_common_sv_packages/                 
vmap       altera_common_sv_packages                  ./libraries/altera_common_sv_packages/                 
ensure_lib                                            ./libraries/jesd204b_altera_xcvr_native_a10_161/       
vmap       jesd204b_altera_xcvr_native_a10_161        ./libraries/jesd204b_altera_xcvr_native_a10_161/       
ensure_lib                                            ./libraries/jesd204b_altera_jesd204_phy_adapter_xs_161/
vmap       jesd204b_altera_jesd204_phy_adapter_xs_161 ./libraries/jesd204b_altera_jesd204_phy_adapter_xs_161/
ensure_lib                                            ./libraries/jesd204b_altera_jesd204_rx_mlpcs_161/      
vmap       jesd204b_altera_jesd204_rx_mlpcs_161       ./libraries/jesd204b_altera_jesd204_rx_mlpcs_161/      
ensure_lib                                            ./libraries/jesd204b_altera_jesd204_phy_161/           
vmap       jesd204b_altera_jesd204_phy_161            ./libraries/jesd204b_altera_jesd204_phy_161/           
ensure_lib                                            ./libraries/jesd204b_altera_jesd204_rx_161/            
vmap       jesd204b_altera_jesd204_rx_161             ./libraries/jesd204b_altera_jesd204_rx_161/            
ensure_lib                                            ./libraries/jesd204b_altera_jesd204_161/               
vmap       jesd204b_altera_jesd204_161                ./libraries/jesd204b_altera_jesd204_161/               

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  if ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                 -work altera_ver       
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                          -work lpm_ver          
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                             -work sgate_ver        
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                         -work altera_mf_ver    
    eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                     -work altera_lnsim_ver 
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_atoms.v"                    -work twentynm_ver     
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/twentynm_atoms_ncrypt.v"      -work twentynm_ver     
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/twentynm_hssi_atoms_ncrypt.v" -work twentynm_hssi_ver
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_hssi_atoms.v"               -work twentynm_hssi_ver
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/twentynm_hip_atoms_ncrypt.v"  -work twentynm_hip_ver 
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_hip_atoms.v"                -work twentynm_hip_ver 
  }
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/altera_xcvr_native_a10_functions_h.sv"                                       -work altera_common_sv_packages                 
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/alt_xcvr_resync.sv"                             -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/alt_xcvr_arbiter.sv"                            -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/mentor/alt_xcvr_resync.sv"                      -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/mentor/alt_xcvr_arbiter.sv"                     -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/twentynm_pcs.sv"                                -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/twentynm_pma.sv"                                -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/twentynm_xcvr_avmm.sv"                          -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/twentynm_xcvr_native.sv"                        -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/mentor/twentynm_pcs.sv"                         -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/mentor/twentynm_pma.sv"                         -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/mentor/twentynm_xcvr_avmm.sv"                   -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/mentor/twentynm_xcvr_native.sv"                 -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/a10_avmm_h.sv"                                  -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/alt_xcvr_native_pipe_retry.sv"                  -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/alt_xcvr_native_avmm_csr.sv"                    -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/alt_xcvr_native_prbs_accum.sv"                  -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/alt_xcvr_native_odi_accel.sv"                   -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/alt_xcvr_native_rcfg_arb.sv"                    -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/altera_xcvr_native_pcie_dfe_params_h.sv"        -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/pcie_mgmt_commands_h.sv"                        -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/pcie_mgmt_functions_h.sv"                       -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/pcie_mgmt_program.sv"                           -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/pcie_mgmt_cpu.sv"                               -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/pcie_mgmt_master.sv"                            -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/altera_xcvr_native_pcie_dfe_ip.sv"              -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/jesd204b_altera_xcvr_native_a10_161_ou2lroi.sv" -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_xcvr_native_a10_161/sim/alt_xcvr_native_rcfg_opt_logic_ou2lroi.sv"      -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161       
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_phy_adapter_xs_161/sim/mentor/altera_jesd204_phy_adapter_xs.v"                               -work jesd204b_altera_jesd204_phy_adapter_xs_161
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_mlpcs_161/sim/mentor/altera_jesd204_rx_mlpcs.v"                                           -work jesd204b_altera_jesd204_rx_mlpcs_161      
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_mlpcs_161/sim/mentor/altera_jesd204_8b10b_dec.v"                                          -work jesd204b_altera_jesd204_rx_mlpcs_161      
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_mlpcs_161/sim/mentor/altera_jesd204_rx_pcs.v"                                             -work jesd204b_altera_jesd204_rx_mlpcs_161      
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_mlpcs_161/sim/mentor/altera_jesd204_wa.v"                                                 -work jesd204b_altera_jesd204_rx_mlpcs_161      
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_mlpcs_161/sim/mentor/altera_jesd204_wys_lut.v"                                            -work jesd204b_altera_jesd204_rx_mlpcs_161      
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_mlpcs_161/sim/mentor/altera_jesd204_xn_8b10b_dec.v"                                       -work jesd204b_altera_jesd204_rx_mlpcs_161      
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_mlpcs_161/sim/mentor/altera_jesd204_pcfifo.v"                                             -work jesd204b_altera_jesd204_rx_mlpcs_161      
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_mlpcs_161/sim/mentor/altera_jesd204_mixed_width_dcfifo.v"                                 -work jesd204b_altera_jesd204_rx_mlpcs_161      
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_phy_161/sim/jesd204b_altera_jesd204_phy_161_yorkvea.v"                                       -work jesd204b_altera_jesd204_phy_161           
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_base.v"                                                  -work jesd204b_altera_jesd204_rx_161            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_csr.v"                                                   -work jesd204b_altera_jesd204_rx_161            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_ctl.v"                                                   -work jesd204b_altera_jesd204_rx_161            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_descrambler.v"                                           -work jesd204b_altera_jesd204_rx_161            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_dll.v"                                                   -work jesd204b_altera_jesd204_rx_161            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_dll_char_val.v"                                          -work jesd204b_altera_jesd204_rx_161            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_dll_cs.v"                                                -work jesd204b_altera_jesd204_rx_161            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_dll_fs_char_replace.v"                                   -work jesd204b_altera_jesd204_rx_161            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_dll_frame_align.v"                                       -work jesd204b_altera_jesd204_rx_161            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_dll_lane_align.v"                                        -work jesd204b_altera_jesd204_rx_161            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_dll_data_store.v"                                        -work jesd204b_altera_jesd204_rx_161            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_dll_ecc_enc.v"                                           -work jesd204b_altera_jesd204_rx_161            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_dll_ecc_dec.v"                                           -work jesd204b_altera_jesd204_rx_161            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_dll_ecc_fifo.v"                                          -work jesd204b_altera_jesd204_rx_161            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_dll_wo_ecc_fifo.v"                                       -work jesd204b_altera_jesd204_rx_161            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_regmap.v"                                                -work jesd204b_altera_jesd204_rx_161            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../altera_jesd204_161/sim/jesd204b_altera_jesd204_161_zta4dmq.v"                                               -work jesd204b_altera_jesd204_161               
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/jesd204b.v"                                                                                                                                                    
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS -L work -L work_lib -L altera_common_sv_packages -L jesd204b_altera_xcvr_native_a10_161 -L jesd204b_altera_jesd204_phy_adapter_xs_161 -L jesd204b_altera_jesd204_rx_mlpcs_161 -L jesd204b_altera_jesd204_phy_161 -L jesd204b_altera_jesd204_rx_161 -L jesd204b_altera_jesd204_161 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L twentynm_ver -L twentynm_hssi_ver -L twentynm_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with novopt option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -novopt -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS -L work -L work_lib -L altera_common_sv_packages -L jesd204b_altera_xcvr_native_a10_161 -L jesd204b_altera_jesd204_phy_adapter_xs_161 -L jesd204b_altera_jesd204_rx_mlpcs_161 -L jesd204b_altera_jesd204_phy_161 -L jesd204b_altera_jesd204_rx_161 -L jesd204b_altera_jesd204_161 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L twentynm_ver -L twentynm_hssi_ver -L twentynm_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -novopt
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                     -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                       -- Compile device library files"
  echo
  echo "com                           -- Compile the design files in correct order"
  echo
  echo "elab                          -- Elaborate top level design"
  echo
  echo "elab_debug                    -- Elaborate the top level design with novopt option"
  echo
  echo "ld                            -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                      -- Compile all the design files and elaborate the top level design with -novopt"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                -- Top level module name."
  echo "                                 For most designs, this should be overridden"
  echo "                                 to enable the elab/elab_debug aliases."
  echo
  echo "SYSTEM_INSTANCE_NAME          -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                   -- Qsys base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR           -- Quartus installation directory."
  echo
  echo "USER_DEFINED_COMPILE_OPTIONS  -- User-defined compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_ELAB_OPTIONS     -- User-defined elaboration options, added to elab/elab_debug aliases."
}
file_copy
h
