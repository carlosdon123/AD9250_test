transcript on
if ![file isdirectory ad9250_top_iputf_libs] {
	file mkdir ad9250_top_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
vlib ad9250_top_iputf_libs/tb_tx_phyrst_ctl_altera_xcvr_reset_control_161
vmap tb_tx_phyrst_ctl_altera_xcvr_reset_control_161 ./ad9250_top_iputf_libs/tb_tx_phyrst_ctl_altera_xcvr_reset_control_161
vlib ad9250_top_iputf_libs/fifo_56_28_fifo_161
vmap fifo_56_28_fifo_161 ./ad9250_top_iputf_libs/fifo_56_28_fifo_161
vlib ad9250_top_iputf_libs/altera_common_sv_packages
vmap altera_common_sv_packages ./ad9250_top_iputf_libs/altera_common_sv_packages
vlib ad9250_top_iputf_libs/tx_jesd204b_altera_xcvr_native_a10_161
vmap tx_jesd204b_altera_xcvr_native_a10_161 ./ad9250_top_iputf_libs/tx_jesd204b_altera_xcvr_native_a10_161
vlib ad9250_top_iputf_libs/tx_jesd204b_altera_jesd204_phy_adapter_xs_161
vmap tx_jesd204b_altera_jesd204_phy_adapter_xs_161 ./ad9250_top_iputf_libs/tx_jesd204b_altera_jesd204_phy_adapter_xs_161
vlib ad9250_top_iputf_libs/tx_jesd204b_altera_jesd204_tx_mlpcs_161
vmap tx_jesd204b_altera_jesd204_tx_mlpcs_161 ./ad9250_top_iputf_libs/tx_jesd204b_altera_jesd204_tx_mlpcs_161
vlib ad9250_top_iputf_libs/tx_jesd204b_altera_jesd204_phy_161
vmap tx_jesd204b_altera_jesd204_phy_161 ./ad9250_top_iputf_libs/tx_jesd204b_altera_jesd204_phy_161
vlib ad9250_top_iputf_libs/tx_jesd204b_altera_jesd204_tx_161
vmap tx_jesd204b_altera_jesd204_tx_161 ./ad9250_top_iputf_libs/tx_jesd204b_altera_jesd204_tx_161
vlib ad9250_top_iputf_libs/tx_jesd204b_altera_jesd204_161
vmap tx_jesd204b_altera_jesd204_161 ./ad9250_top_iputf_libs/tx_jesd204b_altera_jesd204_161
vlib ad9250_top_iputf_libs/rom_port_rom_1port_161
vmap rom_port_rom_1port_161 ./ad9250_top_iputf_libs/rom_port_rom_1port_161
vlib ad9250_top_iputf_libs/phyrst_controller_altera_xcvr_reset_control_161
vmap phyrst_controller_altera_xcvr_reset_control_161 ./ad9250_top_iputf_libs/phyrst_controller_altera_xcvr_reset_control_161
vlib ad9250_top_iputf_libs/jesd204b_altera_xcvr_native_a10_161
vmap jesd204b_altera_xcvr_native_a10_161 ./ad9250_top_iputf_libs/jesd204b_altera_xcvr_native_a10_161
vlib ad9250_top_iputf_libs/jesd204b_altera_jesd204_phy_adapter_xs_161
vmap jesd204b_altera_jesd204_phy_adapter_xs_161 ./ad9250_top_iputf_libs/jesd204b_altera_jesd204_phy_adapter_xs_161
vlib ad9250_top_iputf_libs/jesd204b_altera_jesd204_rx_mlpcs_161
vmap jesd204b_altera_jesd204_rx_mlpcs_161 ./ad9250_top_iputf_libs/jesd204b_altera_jesd204_rx_mlpcs_161
vlib ad9250_top_iputf_libs/jesd204b_altera_jesd204_phy_161
vmap jesd204b_altera_jesd204_phy_161 ./ad9250_top_iputf_libs/jesd204b_altera_jesd204_phy_161
vlib ad9250_top_iputf_libs/jesd204b_altera_jesd204_rx_161
vmap jesd204b_altera_jesd204_rx_161 ./ad9250_top_iputf_libs/jesd204b_altera_jesd204_rx_161
vlib ad9250_top_iputf_libs/jesd204b_altera_jesd204_161
vmap jesd204b_altera_jesd204_161 ./ad9250_top_iputf_libs/jesd204b_altera_jesd204_161
vlib ad9250_top_iputf_libs/core_pll_altera_iopll_161
vmap core_pll_altera_iopll_161 ./ad9250_top_iputf_libs/core_pll_altera_iopll_161
vlib ad9250_top_iputf_libs/atx_pll_altera_xcvr_atx_pll_a10_161
vmap atx_pll_altera_xcvr_atx_pll_a10_161 ./ad9250_top_iputf_libs/atx_pll_altera_xcvr_atx_pll_a10_161
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 


vlog -sv -incr "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tb_tx_phyrst_ctl/altera_xcvr_reset_control_161/sim/altera_xcvr_functions.sv"                                               -work tb_tx_phyrst_ctl_altera_xcvr_reset_control_161 
vlog -sv  -incr "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tb_tx_phyrst_ctl/altera_xcvr_reset_control_161/sim/mentor/altera_xcvr_functions.sv"                                 -work tb_tx_phyrst_ctl_altera_xcvr_reset_control_161 
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tb_tx_phyrst_ctl/altera_xcvr_reset_control_161/sim/alt_xcvr_resync.sv"                                                     -work tb_tx_phyrst_ctl_altera_xcvr_reset_control_161 
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tb_tx_phyrst_ctl/altera_xcvr_reset_control_161/sim/mentor/alt_xcvr_resync.sv"                                              -work tb_tx_phyrst_ctl_altera_xcvr_reset_control_161 
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tb_tx_phyrst_ctl/altera_xcvr_reset_control_161/sim/altera_xcvr_reset_control.sv"                                           -work tb_tx_phyrst_ctl_altera_xcvr_reset_control_161 
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tb_tx_phyrst_ctl/altera_xcvr_reset_control_161/sim/alt_xcvr_reset_counter.sv"                                              -work tb_tx_phyrst_ctl_altera_xcvr_reset_control_161 
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tb_tx_phyrst_ctl/altera_xcvr_reset_control_161/sim/mentor/altera_xcvr_reset_control.sv"                                    -work tb_tx_phyrst_ctl_altera_xcvr_reset_control_161 
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tb_tx_phyrst_ctl/altera_xcvr_reset_control_161/sim/mentor/alt_xcvr_reset_counter.sv"                                       -work tb_tx_phyrst_ctl_altera_xcvr_reset_control_161 
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tb_tx_phyrst_ctl/sim/tb_tx_phyrst_ctl.v"                                                                                                                                        
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/fifo_56_28/fifo_56_28/fifo_161/sim/fifo_56_28_fifo_161_jjnbjqy.v"                                                          -work fifo_56_28_fifo_161                            
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/fifo_56_28/fifo_56_28/sim/fifo_56_28.v"                                                                                                                                         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/altera_xcvr_native_a10_functions_h.sv"                                          -work altera_common_sv_packages                      
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/alt_xcvr_resync.sv"                                -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/alt_xcvr_arbiter.sv"                               -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/mentor/alt_xcvr_resync.sv"                         -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/mentor/alt_xcvr_arbiter.sv"                        -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/twentynm_pcs.sv"                                   -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/twentynm_pma.sv"                                   -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/twentynm_xcvr_avmm.sv"                             -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/twentynm_xcvr_native.sv"                           -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/mentor/twentynm_pcs.sv"                            -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/mentor/twentynm_pma.sv"                            -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/mentor/twentynm_xcvr_avmm.sv"                      -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/mentor/twentynm_xcvr_native.sv"                    -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/a10_avmm_h.sv"                                     -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/alt_xcvr_native_pipe_retry.sv"                     -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/alt_xcvr_native_avmm_csr.sv"                       -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/alt_xcvr_native_prbs_accum.sv"                     -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/alt_xcvr_native_odi_accel.sv"                      -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/alt_xcvr_native_rcfg_arb.sv"                       -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/altera_xcvr_native_pcie_dfe_params_h.sv"           -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/pcie_mgmt_commands_h.sv"                           -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/pcie_mgmt_functions_h.sv"                          -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/pcie_mgmt_program.sv"                              -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/pcie_mgmt_cpu.sv"                                  -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/pcie_mgmt_master.sv"                               -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/altera_xcvr_native_pcie_dfe_ip.sv"                 -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/tx_jesd204b_altera_xcvr_native_a10_161_6d2kjaq.sv" -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_xcvr_native_a10_161/sim/alt_xcvr_native_rcfg_opt_logic_6d2kjaq.sv"         -L altera_common_sv_packages -work tx_jesd204b_altera_xcvr_native_a10_161         
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_jesd204_phy_adapter_xs_161/sim/mentor/altera_jesd204_phy_adapter_xs.v"                                  -work tx_jesd204b_altera_jesd204_phy_adapter_xs_161  
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_jesd204_tx_mlpcs_161/sim/mentor/altera_jesd204_tx_mlpcs.v"                                              -work tx_jesd204b_altera_jesd204_tx_mlpcs_161        
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_jesd204_tx_mlpcs_161/sim/mentor/altera_jesd204_8b10b_enc.v"                                             -work tx_jesd204b_altera_jesd204_tx_mlpcs_161        
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_jesd204_tx_mlpcs_161/sim/mentor/altera_jesd204_tx_pcs.v"                                                -work tx_jesd204b_altera_jesd204_tx_mlpcs_161        
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_jesd204_tx_mlpcs_161/sim/mentor/altera_jesd204_wys_lut.v"                                               -work tx_jesd204b_altera_jesd204_tx_mlpcs_161        
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_jesd204_tx_mlpcs_161/sim/mentor/altera_jesd204_xn_8b10b_enc.v"                                          -work tx_jesd204b_altera_jesd204_tx_mlpcs_161        
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_jesd204_tx_mlpcs_161/sim/mentor/altera_jesd204_pcfifo.v"                                                -work tx_jesd204b_altera_jesd204_tx_mlpcs_161        
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_jesd204_tx_mlpcs_161/sim/mentor/altera_jesd204_mixed_width_dcfifo.v"                                    -work tx_jesd204b_altera_jesd204_tx_mlpcs_161        
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_jesd204_phy_161/sim/tx_jesd204b_altera_jesd204_phy_161_bhvxniy.v"                                       -work tx_jesd204b_altera_jesd204_phy_161             
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_jesd204_tx_161/sim/mentor/altera_jesd204_tx_base.v"                                                     -work tx_jesd204b_altera_jesd204_tx_161              
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_jesd204_tx_161/sim/mentor/altera_jesd204_tx_csr.v"                                                      -work tx_jesd204b_altera_jesd204_tx_161              
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_jesd204_tx_161/sim/mentor/altera_jesd204_tx_ctl.v"                                                      -work tx_jesd204b_altera_jesd204_tx_161              
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_jesd204_tx_161/sim/mentor/altera_jesd204_tx_dll.v"                                                      -work tx_jesd204b_altera_jesd204_tx_161              
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_jesd204_tx_161/sim/mentor/altera_jesd204_tx_regmap.v"                                                   -work tx_jesd204b_altera_jesd204_tx_161              
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_jesd204_tx_161/sim/mentor/altera_jesd204_tx_regmap_opt.v"                                               -work tx_jesd204b_altera_jesd204_tx_161              
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_jesd204_tx_161/sim/mentor/altera_jesd204_tx_scrambler.v"                                                -work tx_jesd204b_altera_jesd204_tx_161              
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/altera_jesd204_161/sim/tx_jesd204b_altera_jesd204_161_py6ow4q.v"                                               -work tx_jesd204b_altera_jesd204_161                 
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/tx_jesd204b/sim/tx_jesd204b.v"                                                                                                                                                  
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/rom_port/rom_1port_161/sim/rom_port_rom_1port_161_iitz24a.v"                                                               -work rom_port_rom_1port_161                         
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/rom_port/sim/rom_port.v"                                                                                                                                                        
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/phyrst_controller/altera_xcvr_reset_control_161/sim/altera_xcvr_functions.sv"                                              -work phyrst_controller_altera_xcvr_reset_control_161
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/phyrst_controller/altera_xcvr_reset_control_161/sim/mentor/altera_xcvr_functions.sv"                                       -work phyrst_controller_altera_xcvr_reset_control_161
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/phyrst_controller/altera_xcvr_reset_control_161/sim/alt_xcvr_resync.sv"                                                    -work phyrst_controller_altera_xcvr_reset_control_161
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/phyrst_controller/altera_xcvr_reset_control_161/sim/mentor/alt_xcvr_resync.sv"                                             -work phyrst_controller_altera_xcvr_reset_control_161
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/phyrst_controller/altera_xcvr_reset_control_161/sim/altera_xcvr_reset_control.sv"                                          -work phyrst_controller_altera_xcvr_reset_control_161
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/phyrst_controller/altera_xcvr_reset_control_161/sim/alt_xcvr_reset_counter.sv"                                             -work phyrst_controller_altera_xcvr_reset_control_161
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/phyrst_controller/altera_xcvr_reset_control_161/sim/mentor/altera_xcvr_reset_control.sv"                                   -work phyrst_controller_altera_xcvr_reset_control_161
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/phyrst_controller/altera_xcvr_reset_control_161/sim/mentor/alt_xcvr_reset_counter.sv"                                      -work phyrst_controller_altera_xcvr_reset_control_161
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/phyrst_controller/sim/phyrst_controller.v"                                                                                                                                      
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/alt_xcvr_resync.sv"                                   -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/alt_xcvr_arbiter.sv"                                  -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/mentor/alt_xcvr_resync.sv"                            -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/mentor/alt_xcvr_arbiter.sv"                           -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/twentynm_pcs.sv"                                      -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/twentynm_pma.sv"                                      -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/twentynm_xcvr_avmm.sv"                                -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/twentynm_xcvr_native.sv"                              -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/mentor/twentynm_pcs.sv"                               -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/mentor/twentynm_pma.sv"                               -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/mentor/twentynm_xcvr_avmm.sv"                         -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/mentor/twentynm_xcvr_native.sv"                       -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/a10_avmm_h.sv"                                        -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/alt_xcvr_native_pipe_retry.sv"                        -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/alt_xcvr_native_avmm_csr.sv"                          -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/alt_xcvr_native_prbs_accum.sv"                        -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/alt_xcvr_native_odi_accel.sv"                         -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/alt_xcvr_native_rcfg_arb.sv"                          -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/altera_xcvr_native_pcie_dfe_params_h.sv"              -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/pcie_mgmt_commands_h.sv"                              -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/pcie_mgmt_functions_h.sv"                             -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/pcie_mgmt_program.sv"                                 -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/pcie_mgmt_cpu.sv"                                     -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/pcie_mgmt_master.sv"                                  -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/altera_xcvr_native_pcie_dfe_ip.sv"                    -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/jesd204b_altera_xcvr_native_a10_161_ou2lroi.sv"       -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_xcvr_native_a10_161/sim/alt_xcvr_native_rcfg_opt_logic_ou2lroi.sv"            -L altera_common_sv_packages -work jesd204b_altera_xcvr_native_a10_161            
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_phy_adapter_xs_161/sim/mentor/altera_jesd204_phy_adapter_xs.v"                                     -work jesd204b_altera_jesd204_phy_adapter_xs_161     
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_mlpcs_161/sim/mentor/altera_jesd204_rx_mlpcs.v"                                                 -work jesd204b_altera_jesd204_rx_mlpcs_161           
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_mlpcs_161/sim/mentor/altera_jesd204_8b10b_dec.v"                                                -work jesd204b_altera_jesd204_rx_mlpcs_161           
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_mlpcs_161/sim/mentor/altera_jesd204_rx_pcs.v"                                                   -work jesd204b_altera_jesd204_rx_mlpcs_161           
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_mlpcs_161/sim/mentor/altera_jesd204_wa.v"                                                       -work jesd204b_altera_jesd204_rx_mlpcs_161           
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_mlpcs_161/sim/mentor/altera_jesd204_wys_lut.v"                                                  -work jesd204b_altera_jesd204_rx_mlpcs_161           
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_mlpcs_161/sim/mentor/altera_jesd204_xn_8b10b_dec.v"                                             -work jesd204b_altera_jesd204_rx_mlpcs_161           
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_mlpcs_161/sim/mentor/altera_jesd204_pcfifo.v"                                                   -work jesd204b_altera_jesd204_rx_mlpcs_161           
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_mlpcs_161/sim/mentor/altera_jesd204_mixed_width_dcfifo.v"                                       -work jesd204b_altera_jesd204_rx_mlpcs_161           
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_phy_161/sim/jesd204b_altera_jesd204_phy_161_yorkvea.v"                                             -work jesd204b_altera_jesd204_phy_161                
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_base.v"                                                        -work jesd204b_altera_jesd204_rx_161                 
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_csr.v"                                                         -work jesd204b_altera_jesd204_rx_161                 
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_ctl.v"                                                         -work jesd204b_altera_jesd204_rx_161                 
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_descrambler.v"                                                 -work jesd204b_altera_jesd204_rx_161                 
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_dll.v"                                                         -work jesd204b_altera_jesd204_rx_161                 
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_dll_char_val.v"                                                -work jesd204b_altera_jesd204_rx_161                 
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_dll_cs.v"                                                      -work jesd204b_altera_jesd204_rx_161                 
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_dll_fs_char_replace.v"                                         -work jesd204b_altera_jesd204_rx_161                 
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_dll_frame_align.v"                                             -work jesd204b_altera_jesd204_rx_161                 
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_dll_lane_align.v"                                              -work jesd204b_altera_jesd204_rx_161                 
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_dll_data_store.v"                                              -work jesd204b_altera_jesd204_rx_161                 
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_dll_ecc_enc.v"                                                 -work jesd204b_altera_jesd204_rx_161                 
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_dll_ecc_dec.v"                                                 -work jesd204b_altera_jesd204_rx_161                 
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_dll_ecc_fifo.v"                                                -work jesd204b_altera_jesd204_rx_161                 
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_dll_wo_ecc_fifo.v"                                             -work jesd204b_altera_jesd204_rx_161                 
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_rx_161/sim/mentor/altera_jesd204_rx_regmap.v"                                                      -work jesd204b_altera_jesd204_rx_161                 
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/altera_jesd204_161/sim/jesd204b_altera_jesd204_161_zta4dmq.v"                                                     -work jesd204b_altera_jesd204_161                    
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/jesd204b/sim/jesd204b.v"                                                                                                                                                        
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/core_pll/altera_iopll_161/sim/core_pll_altera_iopll_161_ep46qai.vo"                                                        -work core_pll_altera_iopll_161                      
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/core_pll/sim/core_pll.v"                                                                                                                                                        
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/atx_pll/altera_xcvr_atx_pll_a10_161/sim/twentynm_xcvr_avmm.sv"                                -L altera_common_sv_packages -work atx_pll_altera_xcvr_atx_pll_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/atx_pll/altera_xcvr_atx_pll_a10_161/sim/mentor/twentynm_xcvr_avmm.sv"                         -L altera_common_sv_packages -work atx_pll_altera_xcvr_atx_pll_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/atx_pll/altera_xcvr_atx_pll_a10_161/sim/alt_xcvr_resync.sv"                                   -L altera_common_sv_packages -work atx_pll_altera_xcvr_atx_pll_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/atx_pll/altera_xcvr_atx_pll_a10_161/sim/alt_xcvr_arbiter.sv"                                  -L altera_common_sv_packages -work atx_pll_altera_xcvr_atx_pll_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/atx_pll/altera_xcvr_atx_pll_a10_161/sim/mentor/alt_xcvr_resync.sv"                            -L altera_common_sv_packages -work atx_pll_altera_xcvr_atx_pll_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/atx_pll/altera_xcvr_atx_pll_a10_161/sim/mentor/alt_xcvr_arbiter.sv"                           -L altera_common_sv_packages -work atx_pll_altera_xcvr_atx_pll_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/atx_pll/altera_xcvr_atx_pll_a10_161/sim/a10_avmm_h.sv"                                        -L altera_common_sv_packages -work atx_pll_altera_xcvr_atx_pll_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/atx_pll/altera_xcvr_atx_pll_a10_161/sim/alt_xcvr_atx_pll_rcfg_arb.sv"                         -L altera_common_sv_packages -work atx_pll_altera_xcvr_atx_pll_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/atx_pll/altera_xcvr_atx_pll_a10_161/sim/a10_xcvr_atx_pll.sv"                                  -L altera_common_sv_packages -work atx_pll_altera_xcvr_atx_pll_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/atx_pll/altera_xcvr_atx_pll_a10_161/sim/alt_xcvr_pll_embedded_debug.sv"                       -L altera_common_sv_packages -work atx_pll_altera_xcvr_atx_pll_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/atx_pll/altera_xcvr_atx_pll_a10_161/sim/alt_xcvr_pll_avmm_csr.sv"                             -L altera_common_sv_packages -work atx_pll_altera_xcvr_atx_pll_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/atx_pll/altera_xcvr_atx_pll_a10_161/sim/mentor/alt_xcvr_atx_pll_rcfg_arb.sv"                  -L altera_common_sv_packages -work atx_pll_altera_xcvr_atx_pll_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/atx_pll/altera_xcvr_atx_pll_a10_161/sim/mentor/a10_xcvr_atx_pll.sv"                           -L altera_common_sv_packages -work atx_pll_altera_xcvr_atx_pll_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/atx_pll/altera_xcvr_atx_pll_a10_161/sim/mentor/alt_xcvr_pll_embedded_debug.sv"                -L altera_common_sv_packages -work atx_pll_altera_xcvr_atx_pll_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/atx_pll/altera_xcvr_atx_pll_a10_161/sim/mentor/alt_xcvr_pll_avmm_csr.sv"                      -L altera_common_sv_packages -work atx_pll_altera_xcvr_atx_pll_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/atx_pll/altera_xcvr_atx_pll_a10_161/sim/atx_pll_altera_xcvr_atx_pll_a10_161_25ew5mi.sv"       -L altera_common_sv_packages -work atx_pll_altera_xcvr_atx_pll_a10_161            
vlog -sv "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/atx_pll/altera_xcvr_atx_pll_a10_161/sim/alt_xcvr_atx_pll_rcfg_opt_logic_25ew5mi.sv"           -L altera_common_sv_packages -work atx_pll_altera_xcvr_atx_pll_a10_161            
vlog     "F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/ip_core/atx_pll/sim/atx_pll.v"                                                                                                                                                          

vlog -vlog01compat -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src/spi_master.v}
vlog -vlog01compat -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src/gen_multi_sysref.v}
vlog -vlog01compat -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src/control_unit.v}
vlog -vlog01compat -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src/altera_reset_synchronizer.v}
vlog -vlog01compat -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src/altera_reset_controller.v}
vlog -vlog01compat -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src/ad9250_top.v}
vlog -sv -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src/ramp_checker.sv}
vlog -sv -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src/prbs_checker.sv}
vlog -sv -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src/pattern_checker_top.sv}
vlog -sv -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src/alternate_checker.sv}
vlog -sv -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src/altera_jesd204_transport_rx_top.sv}
vlog -sv -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/src/altera_jesd204_deassembler.sv}

vlog -vlog01compat -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/tb_ad9250_top.v}
vlog -sv -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/pattern {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/pattern/alternate_checker.sv}
vlog -sv -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/pattern {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/pattern/alternate_generator.sv}
vlog -sv -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/pattern {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/pattern/pattern_checker_top.sv}
vlog -sv -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/pattern {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/pattern/pattern_generator_top.sv}
vlog -sv -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/pattern {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/pattern/prbs_checker.sv}
vlog -sv -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/pattern {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/pattern/prbs_generator.sv}
vlog -sv -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/pattern {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/pattern/ramp_checker.sv}
vlog -sv -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/pattern {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/pattern/ramp_generator.sv}
vlog -sv -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/transport_layer {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/transport_layer/altera_jesd204_assembler.sv}
vlog -sv -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/transport_layer {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/transport_layer/altera_jesd204_deassembler.sv}
vlog -sv -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/transport_layer {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/transport_layer/altera_jesd204_transport_rx_top.sv}
vlog -sv -work work +incdir+F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/transport_layer {F:/Project_Fiels/TXY/MS/cpy/program/FPGA/AD9250_test/simulation/modelsim/transport_layer/altera_jesd204_transport_tx_top.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L twentynm_ver -L twentynm_hssi_ver -L twentynm_hip_ver -L rtl_work -L work -L tb_tx_phyrst_ctl_altera_xcvr_reset_control_161 -L fifo_56_28_fifo_161 -L altera_common_sv_packages -L tx_jesd204b_altera_xcvr_native_a10_161 -L tx_jesd204b_altera_jesd204_phy_adapter_xs_161 -L tx_jesd204b_altera_jesd204_tx_mlpcs_161 -L tx_jesd204b_altera_jesd204_phy_161 -L tx_jesd204b_altera_jesd204_tx_161 -L tx_jesd204b_altera_jesd204_161 -L rom_port_rom_1port_161 -L phyrst_controller_altera_xcvr_reset_control_161 -L jesd204b_altera_xcvr_native_a10_161 -L jesd204b_altera_jesd204_phy_adapter_xs_161 -L jesd204b_altera_jesd204_rx_mlpcs_161 -L jesd204b_altera_jesd204_phy_161 -L jesd204b_altera_jesd204_rx_161 -L jesd204b_altera_jesd204_161 -L core_pll_altera_iopll_161 -L atx_pll_altera_xcvr_atx_pll_a10_161 -voptargs="+acc"  ad9250_top_vlg_tst

do wave.do
view structure
view signals
add log -r /*
run -all
