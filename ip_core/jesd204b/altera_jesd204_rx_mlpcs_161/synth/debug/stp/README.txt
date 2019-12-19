------------------------------------------
Hierarchy Matching SignalTap Debug Script
------------------------------------------

When you bring up your design in hardware, you can generate a SignalTap file containing probe points for hardware debug.  To speed up the debug process, these SignalTap probe points match the hierarchy of your design.  

When generating the HDL files for this IP core, a set of files is generated in the <debug stp directory>.
You can use these files with your Quartus Prime project to generate a SignalTap file with probe points match your design hierarchy.  These files are build_stp.tcl and <ip_core_name>.xml.


Creating STP file matching your design hierarchy
1) In your Quartus Prime project, run Analysis and Synthesis
2) Open the TCL Console 
   View -> Utility Windows -> Tcl Console
3) Source script
   tcl> source <debug stp directory>/build_stp.tcl
4) Enter the following command to generate the STP file
   tcl> main -stp_file <output stp file name>.stp -xml_file <input xml file name>.xml -mode build
5) Include this STP file in your Quartus Prime design and compile your project
6) Program the FPGA with the SRAM Object File (.sof) file.
7) Start the SignalTap II Logic Analyzer (Quartus Prime -> Tools -> SignalTap II Logic Analyzer) and click the Run Analysis button to observe the state of your IP core.


Note:

- This feature is not applicable to Quartus Prime Pro edition.

- For Arria 10 FPGA variants, the <debug stp directory> is defined based on JESD204B Wrapper and Data Path options below:

  +--------------------+--------------+-----------------------------------------------------------------------------+
  ; JESD204B Wrapper   ; Data Path    ; Debug stp directory                                                         ;
  +--------------------+--------------+-----------------------------------------------------------------------------+
  ; Both Base and Phy/ ; Transmitter/ ; <ip_variant_name>/altera_jesd204_tx_mlpcs_<Quartus_version>/synth/debug/stp ;
  ; Phy only           ; Duplex       ;                                                                             ;
  +--------------------+--------------+-----------------------------------------------------------------------------+
  ; Both Base and Phy/ ; Receiver     ; <ip_variant_name>/altera_jesd204_rx_mlpcs_<Quartus_version>/synth/debug/stp ;
  ; Phy only           ;              ;                                                                             ;
  +--------------------+--------------+-----------------------------------------------------------------------------+
  ; Base only          ; Transmitter  ; <ip_variant_name>/altera_jesd204_tx_<Quartus_version>/synth/debug/stp       ;
  +--------------------+--------------+-----------------------------------------------------------------------------+
  ; Base only          ; Receiver     ; <ip_variant_name>/altera_jesd204_rx_<Quartus_version>/synth/debug/stp       ;
  +--------------------+--------------+-----------------------------------------------------------------------------+

- The acquisition clock on the generated STP file is not assigned, so the Quartus Prime software automatically creates a clock pin called auto_stp_external_clk for each instance.

- To assign an acquisition clock for the generated STP file, we recommend you to follow the following steps.

  JESD204B Duplex & Simplex (Both Base & PHY) or (PHY only) IP:
    a) For rx_link instance, assign the rxlink_clk
    b) For tx_link instance, assign the txlink_clk
    c) For rx_phy instance, assign the rxphy_clk[0]
    d) For tx_phy instance, assign the txphy_clk[0]

  JESD204B Simplex (Base only) IP:
    a) For rx_link instance, assign the rxlink_clk
    b) For tx_link instance, assign the txlink_clk

- The GUI will pop up to allow you to choose the appropriate instance for each IP core name if your design contains more than one JESD204B IP instances. For simplex, you may need to choose the RX instance followed by TX instance in order to generate the proper STP file.

- Caveat: You may see some signals that are red in font, indicating they are not available in your design. In most cases, you can safely ignore these signals and instances. They are present because software generates wider buses and some instances that your design does not include.
