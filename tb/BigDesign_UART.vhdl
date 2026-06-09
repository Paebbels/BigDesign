-- =============================================================================
-- Authors:
--   Adrian Weiland
--
-- License:
-- =============================================================================
-- Copyright 2025-2026 The BigDesign Authors
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--    http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- =============================================================================

library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;

library PoC;
context PoC.common;

library lib_BigDesign;
use     lib_BigDesign.PS_settings_pkg.all;

library lib_test;
use     lib_test.BigDesign_tb_pkg.all;


architecture UART of BigDesign_TestController is
	subtype UARTDataType is std_logic_vector(7 downto 0);

	constant TestData        : UARTDataType := x"45";
	signal   ReadByteTrigger : bit          := '0';
begin
	ControlProc: process
		constant ProcID  : AlertLogIDType := NewID("ControlProc", TCID);
		constant TIMEOUT : time := 1 ms;
	begin
		SetTestName("BigDesign_UART");

		SetLogEnable(PASSED, TRUE);
		SetLogEnable(INFO,   TRUE);
		SetLogEnable(DEBUG,  TRUE);
		wait for 0 ns; wait for 0 ns;

		TranscriptOpen;
		SetTranscriptMirror(TRUE);

		-- wait for design reset
		-- wait until Reset = '0';
		ClearAlerts;
		wait for 100 us;

		WaitForBarrier(TestDone, TIMEOUT);
		EndOfTestReports(ReportAll => TRUE, Timeout => now >= TIMEOUT);
		std.env.finish;
		wait;
	end process;

	------------------------------------------------
	-------------- Manager instances ---------------
	------------------------------------------------
	HPM0_FPD_Proc : process
		constant ProcID : AlertLogIDType := NewID("HPM0_FPD_Proc", TCID);
		variable Data   : std_logic_vector(HPM0_FPD_AXI_DATA_WIDTH - 1 downto 0);
	begin
		WaitForClock(HPM0_FPD_Rec, 2);

		-- Currently not doing anything

		WaitForBarrier(TestDone);
		wait;
	end process;

	HPM1_FPD_Proc : process
		constant ProcID : AlertLogIDType := NewID("HPM1_FPD_Proc", TCID);
		variable Data   : std_logic_vector(HPM1_FPD_AXI_DATA_WIDTH - 1 downto 0);
	begin
		WaitForClock(HPM1_FPD_Rec, 2);

		-- Currently not doing anything

		WaitForBarrier(TestDone);
		wait;
	end process;

	HPM0_LPD_Proc : process
		constant ProcID : AlertLogIDType := NewID("HPM0_LPD_Proc", TCID);
		variable Data   : std_logic_vector(HPM0_LPD_AXI_DATA_WIDTH - 1 downto 0);
	begin
		WaitForClock(HPM0_LPD_Rec, 2);

		WaitForToggle(ReadByteTrigger);
		log("Reading received data byte from UART register ...");
		-- todo: add line delay
		ReadCheck(HPM0_LPD_Rec, REG_UART_RX, TestData);
		WaitForClock(HPM0_LPD_Rec, 2);
		WaitForBarrier(TestDone);
		wait;
	end process;

	UART_1_TX_Proc : process
		constant ProcID : AlertLogIDType := NewID("UART_1_TX_Proc", TCID);
	begin
		wait for 1 us;
		-- todo: add line delay
		Send(UART_TX_Rec, TestData);
		Toggle(ReadByteTrigger);

		WaitForBarrier(TestDone);
		wait;
	end process;

	UART_1_RX_Proc : process
		constant ProcID : AlertLogIDType := NewID("UART_1_RX_Proc", TCID);
	begin
		WaitForBarrier(TestDone);
		wait;
	end process;

	------------------------------------------
	-------------- AXI Manager ---------------
	------------------------------------------
	-- Generate transaction for data generator managers
	ManagerProc_0 : process
	begin
		WaitForClock(DataGen_Managers(0), 2);

		-- Currently not doing anything

		WaitForClock(DataGen_Managers(0), 2);
		WaitForBarrier(TestDone);
		wait;
	end process;

	ManagerProc_1 : process
	begin
		WaitForClock(DataGen_Managers(1), 2);

		-- Currently not doing anything

		WaitForClock(DataGen_Managers(1), 2);
		WaitForBarrier(TestDone);
		wait;
	end process;

	ManagerProc_2 : process
	begin
		WaitForClock(DataGen_Managers(2), 2);

		-- Currently not doing anything

		WaitForClock(DataGen_Managers(2), 2);
		WaitForBarrier(TestDone);
		wait;
	end process;

	ManagerProc_3 : process
	begin
		WaitForClock(DataGen_Managers(3), 2);

		-- Currently not doing anything

		WaitForClock(DataGen_Managers(3), 2);
		WaitForBarrier(TestDone);
		wait;
	end process;

	-----------------------------------------------
	-------------- Memory instances ---------------
	-----------------------------------------------
	BackdoorProc : process
		constant ProcID   : AlertLogIDType := NewID("Memory", TCID);
		variable ReadData : std_logic_vector(7 downto 0);
		variable Reg_i    : AXIAddressType;
		variable Data_i   : AXIDataType := 32x"11";
		variable DataRV   : RandomPType;
	begin
		-- Currently not doing anything

		WaitForBarrier(TestDone);
		wait;
	end process;

	-----------------------------------------------
	---------------- Subordinates -----------------
	-----------------------------------------------
	--HP0_FPD_Proc : process
	--	constant ProcID : AlertLogIDType := NewID("HP0_FPD_Proc", TCID);
	--	variable Data   : std_logic_vector(HP0_FPD_AXI_DATA_WIDTH - 1 downto 0);
	--begin
	--	WaitForClock(HP0_FPD_Rec, 2);
--
	--	WaitForToggle(WriteDone);
	--	ReadCheck(HP0_FPD_Rec, REG_TEST, resize(DATA_TEST, DATA_BITS));
--
	--	WaitForClock(HP0_FPD_Rec, 2);
	--	WaitForBarrier(TestDone);
	--	wait;
	--end process;

	-- HP1_FPD_Proc : process
		-- constant ProcID : AlertLogIDType := NewID("HP1_FPD_Proc", TCID);
		-- variable Data   : std_logic_vector(HP1_FPD_AXI_DATA_WIDTH - 1 downto 0);
	-- begin
		-- WaitForClock(HP1_FPD_Rec, 2);

		-- WaitForToggle(WriteDone);
		-- ReadCheck(HP1_FPD_Rec, REG_TEST, resize(DATA_TEST, DATA_BITS));

		-- WaitForClock(HP1_FPD_Rec, 2);
		-- WaitForBarrier(TestDone);
		-- wait;
	-- end process;

	-- HP2_FPD_Proc : process
		-- constant ProcID : AlertLogIDType := NewID("HP2_FPD_Proc", TCID);
		-- variable Data   : std_logic_vector(HP1_FPD_AXI_DATA_WIDTH - 1 downto 0);
	-- begin
		-- WaitForClock(HP2_FPD_Rec, 2);

		-- WaitForClock(HP2_FPD_Rec, 2);
		-- WaitForBarrier(TestDone);
		-- wait;
	-- end process;

	-- HP3_FPD_Proc : process
		-- constant ProcID : AlertLogIDType := NewID("HP3_FPD_Proc", TCID);
		-- variable Data   : std_logic_vector(HP3_FPD_AXI_DATA_WIDTH - 1 downto 0);
	-- begin
		-- WaitForClock(HP3_FPD_Rec, 2);

		-- WaitForClock(HP3_FPD_Rec, 2);
		-- WaitForBarrier(TestDone);
		-- wait;
	-- end process;

end architecture;

configuration BigDesign_UART of BigDesign_TestHarness is
	for TestHarness
		for TestCtrl: BigDesign_TestController
			use entity work.BigDesign_TestController(UART);
		end for;
	end for;
end configuration;
