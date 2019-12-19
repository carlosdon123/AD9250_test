onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ad9250_top_vlg_tst/i1/rx_sync_n
add wave -noupdate /ad9250_top_vlg_tst/i1/sysref_out
add wave -noupdate /ad9250_top_vlg_tst/i1/global_rst_n
add wave -noupdate /ad9250_top_vlg_tst/i1/jesd204_rx_link_ready
add wave -noupdate /ad9250_top_vlg_tst/i1/rxlink_rst_n
add wave -noupdate /ad9250_top_vlg_tst/i1/rx_frame_rst_n
add wave -noupdate /ad9250_top_vlg_tst/i1/rx_avs_rst_n
add wave -noupdate /ad9250_top_vlg_tst/i1/xcvr_rst_n
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1320799761 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 398
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {16203382784 ps}