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
	/BigDesign_TestHarness/DUT/Manager_s2m \
	/BigDesign_TestHarness/DUT/Config_GPIO_m2s \
	/BigDesign_TestHarness/DUT/Config_GPIO_s2m
add wave -vrecord DeMuX_blk \
	/BigDesign_TestHarness/DUT/Demux_blk/DeMux_Out_m2s \
	/BigDesign_TestHarness/DUT/Demux_blk/DeMux_Out_s2m \
	/BigDesign_TestHarness/DUT/Demux_blk/UART_TX \
	/BigDesign_TestHarness/DUT/Demux_blk/UART_RX
wv.cursors.add -time 350ns+0 -name {Default cursor}
wv.cursors.setactive -name {Default cursor}
wv.zoom.range -from 17500ps -to 367500ps
wv.time.unit.auto.set
transcript $curr_transcript
