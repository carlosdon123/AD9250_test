# (C) 2001-2017 Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License Subscription 
# Agreement, Intel MegaCore Function License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Intel and sold by 
# Intel or its authorized distributors.  Please refer to the applicable 
# agreement for further details.


#Users are recommended to modify this sdc file if these settings do not reflects the correct design's usage .
#For example, users must comment out set_clock_groups -asynch -group {jesd204_*x_link_clk} - group {jesd204_*x_avs_clk} if the jesd204_*x_link_clk is synchronous to jesd204_*x_avs_clk

set jesd204_sdc_debug 0

# Check if port exists
proc jesd204_port_existence {port_name} {
   set port_collection [get_ports -nowarn $port_name]
   if { [get_collection_size $port_collection] > 0 } {
      return 1
   } else {
      return 0
   }
}

# Return existing clock target list
proc jesd204_get_clock_target_list {} {
   upvar 1 jesd204_sdc_debug jesd204_sdc_debug

   set result [list]
   set clocks_collection [get_clocks -nowarn]
   foreach_in_collection clock $clocks_collection { 
      set clock_name       [get_clock_info -name $clock] 
      set clock_target_col [get_clock_info -targets $clock]
      lappend result       [query_collection -report -all $clock_target_col]
      if {$jesd204_sdc_debug} { post_message -type info "clock_name : $clock_name" }
   }
   if {$jesd204_sdc_debug} { post_message -type info "JESD204 clock_target list: $result" }

   return $result
}

set jesd204_clock_target_list [jesd204_get_clock_target_list]

      set jesd204_pll_ref_clk_ext  [jesd204_port_existence pll_ref_clk]
      set jesd204_pll_ref_clk_lsrc [lsearch -exact $jesd204_clock_target_list pll_ref_clk]
      set jesd204_rxlink_clk_ext   [jesd204_port_existence rxlink_clk]
      set jesd204_rxlink_clk_lsrc  [lsearch -exact $jesd204_clock_target_list rxlink_clk]
      set jesd204_rx_avs_clk_ext   [jesd204_port_existence jesd204_rx_avs_clk]
      set jesd204_rx_avs_clk_lsrc  [lsearch -exact $jesd204_clock_target_list jesd204_rx_avs_clk]

      if {$jesd204_pll_ref_clk_ext && $jesd204_pll_ref_clk_lsrc == -1} {
         create_clock -name "pll_ref_clk" -period 5.000ns [get_ports pll_ref_clk] 
      }
      derive_pll_clocks -create_base_clocks
      derive_clock_uncertainty

      if {$jesd204_rxlink_clk_ext && $jesd204_rxlink_clk_lsrc == -1} {
         create_clock -name "rxlink_clk" -period 10.000ns [get_ports rxlink_clk]
      }
      if {$jesd204_rx_avs_clk_ext && $jesd204_rx_avs_clk_lsrc == -1} {
         #Temporary set rx_avs_clk to 125MHz. Users are responsible to constraint the rx_avs_clk at desired value
         create_clock -name "rx_avs_clk" -period 8.000ns [get_ports jesd204_rx_avs_clk] 
      }
      if {$jesd204_rxlink_clk_ext && $jesd204_pll_ref_clk_ext && $jesd204_rx_avs_clk_ext} {
         set_clock_groups -asynchronous -group {rxlink_clk} -group {pll_ref_clk} -group {rx_avs_clk} 
      }


# set false path for rx_enh_fifo_full. Refer to case:203192 for details. 
set a10_async_10g_rx_oflw_err [get_pins -nowarn -compatibility_mode *twentynm_xcvr_native_inst*inst_twentynm_pcs*inst_twentynm_hssi_rx_pld_pcs_interface*pld_10g_rx_oflw_err ]
if { [get_collection_size $a10_async_10g_rx_oflw_err] > 0 } {
    set_false_path -through $a10_async_10g_rx_oflw_err -to [get_keepers {*altera_jesd204_rx_base*altera_jesd204_rx_csr_inst|*fifo*full*}]
}

set_multicycle_path -end -setup -from [get_cells -compatibility_mode *|inst_rx|altera_jesd204_rx_ctl_inst|csr_f_latch[*]] -to [get_cells -compatibility_mode *|inst_rx|altera_jesd204_rx_ctl_inst|sync_n_valid] 2
set_multicycle_path -end -hold -from [get_cells -compatibility_mode *|inst_rx|altera_jesd204_rx_ctl_inst|csr_f_latch[*]] -to [get_cells -compatibility_mode *|inst_rx|altera_jesd204_rx_ctl_inst|sync_n_valid] 1
set_multicycle_path -end -setup -from [get_cells -compatibility_mode *|inst_rx|altera_jesd204_rx_ctl_inst|csr_f_latch[*]] -to [get_cells -compatibility_mode *|inst_rx|altera_jesd204_rx_ctl_inst|sync_n_min] 2
set_multicycle_path -end -hold -from [get_cells -compatibility_mode *|inst_rx|altera_jesd204_rx_ctl_inst|csr_f_latch[*]] -to [get_cells -compatibility_mode *|inst_rx|altera_jesd204_rx_ctl_inst|sync_n_min] 1


   





