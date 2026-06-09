onerror { resume }
set curr_transcript [transcript]
transcript off

add wave -vrecord DUT \
	/BigDesign_TestHarness/DUT/Clock \
	/BigDesign_TestHarness/DUT/Button \
	/BigDesign_TestHarness/DUT/LED \
	/BigDesign_TestHarness/DUT/Config_Clk \
	/BigDesign_TestHarness/DUT/Manager_Clks \
	/BigDesign_TestHarness/DUT/Subordinate_m2s \
	/BigDesign_TestHarness/DUT/Subordinate_s2m \
	/BigDesign_TestHarness/DUT/Subordinate_Clks \
	/BigDesign_TestHarness/DUT/PS_Clock \
	/BigDesign_TestHarness/DUT/PL_Reset \
	/BigDesign_TestHarness/DUT/Clock_50 \
	/BigDesign_TestHarness/DUT/Clock_100 \
	/BigDesign_TestHarness/DUT/Clock_200 \
	/BigDesign_TestHarness/DUT/Clock_300 \
	/BigDesign_TestHarness/DUT/Config_m2s \
	/BigDesign_TestHarness/DUT/Config_s2m \
	/BigDesign_TestHarness/DUT/Manager_m2s \
	/BigDesign_TestHarness/DUT/Manager_s2m
add wave -color 30,144,255 -color_waveform -divider DeMuX
add wave -vrecord Demux_blk \
	/BigDesign_TestHarness/DUT/Demux_blk/DeMux_Out_m2s \
	/BigDesign_TestHarness/DUT/Demux_blk/DeMux_Out_s2m \
	/BigDesign_TestHarness/DUT/Demux_blk/UART_TX \
	/BigDesign_TestHarness/DUT/Demux_blk/UART_RX
add wave -vrecord AXI4L_DeMux \
	/BigDesign_TestHarness/DUT/Demux_blk/AXI4L_DeMux/Clock \
	/BigDesign_TestHarness/DUT/Demux_blk/AXI4L_DeMux/Reset \
	/BigDesign_TestHarness/DUT/Demux_blk/AXI4L_DeMux/In_M2S \
	/BigDesign_TestHarness/DUT/Demux_blk/AXI4L_DeMux/In_S2M \
	/BigDesign_TestHarness/DUT/Demux_blk/AXI4L_DeMux/Out_M2S \
	/BigDesign_TestHarness/DUT/Demux_blk/AXI4L_DeMux/Out_S2M \
	/BigDesign_TestHarness/DUT/Demux_blk/AXI4L_DeMux/In_M2S_full \
	/BigDesign_TestHarness/DUT/Demux_blk/AXI4L_DeMux/In_S2M_full \
	/BigDesign_TestHarness/DUT/Demux_blk/AXI4L_DeMux/Out_M2S_full \
	/BigDesign_TestHarness/DUT/Demux_blk/AXI4L_DeMux/Out_S2M_full
add wave -vrecord Version \
	/BigDesign_TestHarness/DUT/Demux_blk/Version/Clock \
	/BigDesign_TestHarness/DUT/Demux_blk/Version/Reset \
	/BigDesign_TestHarness/DUT/Demux_blk/Version/AXI4Lite_m2s \
	/BigDesign_TestHarness/DUT/Demux_blk/Version/AXI4Lite_s2m \
	/BigDesign_TestHarness/DUT/Demux_blk/Version/Version \
	/BigDesign_TestHarness/DUT/Demux_blk/Version/RegisterFile_ReadPort \
	/BigDesign_TestHarness/DUT/Demux_blk/Version/RegisterFile_WritePort \
	/BigDesign_TestHarness/DUT/Demux_blk/Version/UID_vec
add wave -vrecord Settings \
	/BigDesign_TestHarness/DUT/Demux_blk/Settings/Clock \
	/BigDesign_TestHarness/DUT/Demux_blk/Settings/Reset \
	/BigDesign_TestHarness/DUT/Demux_blk/Settings/AXI4Lite_M2S \
	/BigDesign_TestHarness/DUT/Demux_blk/Settings/AXI4Lite_S2M \
	/BigDesign_TestHarness/DUT/Demux_blk/Settings/ReadPort \
	/BigDesign_TestHarness/DUT/Demux_blk/Settings/WritePort
add wave -vrecord HRC \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/Clock \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/Reset \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/AXI4Lite_Clock \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/AXI4Lite_Reset \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/AXI4Lite_m2s \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/AXI4Lite_s2m \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/Nanoseconds \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/Datetime \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/Reg_WritePort \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/Reg_ReadPort \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/Reg_ReadPort_hit \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/AXI4Lite_m2s_b \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/AXI4Lite_s2m_b \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/Nanoseconds_registers \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/Nanoseconds_i \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/Load_nanoseconds \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/Load_datetime \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/Nanoseconds_to_load \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/Datetime_to_load_slv \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/Datetime_to_load \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/Config_reg \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/Ns_inc \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/Ns_dec \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/en \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/inc \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/disable \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/correction \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/correction_counter \
	/BigDesign_TestHarness/DUT/Demux_blk/HRC/correction_threshold
add wave -vrecord UART \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/Clock \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/Reset \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/AXI4Lite_m2s \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/AXI4Lite_s2m \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/AXI4Lite_irq \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/UART_TX \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/UART_RX \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/UART_RTS \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/UART_CTS \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/Reg_ReadPort \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/Reg_WritePort \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/Reg_ReadPort_hit \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/Reg_WritePort_hit \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/RX_Data \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/TX_Data \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/Status \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/Control \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/Status_RX_Valid \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/Status_RX_Valid_d \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/RX_Got \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/Control_RX_Reset \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/Status_InterruptEnable \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/Status_RX_Overrun \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/RX_OverFlow \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/Status_RX_Full \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/RX_StatusReg_hit \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/status_Parity_error \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/parity_error \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/TX_Put \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/TXFIFO_Empty \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/TXFIFO_Empty_d \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/Status_TX_Full \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/Control_TX_Reset \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/Control_InterruptEnable \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/Status_TX_EmptyState \
	/BigDesign_TestHarness/DUT/Demux_blk/UART/Status_RX_FullState
add wave -vrecord GPIO \
	/BigDesign_TestHarness/DUT/Demux_blk/GPIO/Clock \
	/BigDesign_TestHarness/DUT/Demux_blk/GPIO/Reset \
	/BigDesign_TestHarness/DUT/Demux_blk/GPIO/AXI4Lite_M2S \
	/BigDesign_TestHarness/DUT/Demux_blk/GPIO/AXI4Lite_S2M \
	/BigDesign_TestHarness/DUT/Demux_blk/GPIO/Button \
	/BigDesign_TestHarness/DUT/Demux_blk/GPIO/LED \
	/BigDesign_TestHarness/DUT/Demux_blk/GPIO/ReadPort \
	/BigDesign_TestHarness/DUT/Demux_blk/GPIO/WritePort
wv.cursors.add -time 100us+2 -name {Default cursor}
wv.cursors.setactive -name {Default cursor}
wv.zoom.range -from 99667500ps -to 100017500ps
wv.time.unit.auto.set
transcript $curr_transcript
