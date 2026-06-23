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


architecture GPIO of BigDesign_TestController is
begin
	ControlProc: process
		constant ProcID  : AlertLogIDType := NewID("ControlProc", TCID);
		constant TIMEOUT : time := 1 ms;
	begin
		SetTestName("BigDesign_GPIO");

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
		WaitForClock(HPM0_LPD_Rec, 6);
		ReadCheck(HPM0_LPD_Rec, REG_GPIO_BUTTONS, 32x"0");  -- initial GPIO value
		WaitForClock(HPM0_LPD_Rec);
		GPIO_Button <= "10";
		WaitForClock(HPM0_LPD_Rec);
		ReadCheck(HPM0_LPD_Rec, REG_GPIO_BUTTONS, 32x"2");
		Write(HPM0_LPD_Rec, REG_GPIO_LED, 32x"01");  -- turn on LED
		WaitForClock(HPM0_LPD_Rec);
		ReadCheck(HPM0_LPD_Rec, REG_GPIO_LED, 32x"01");

		WaitForClock(HPM0_LPD_Rec, 2);
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
	-- HP0_FPD_Proc : process
	-- 	constant ProcID : AlertLogIDType := NewID("HP0_FPD_Proc", TCID);
	-- 	variable Data   : std_logic_vector(HP0_FPD_AXI_DATA_WIDTH - 1 downto 0);
	-- begin
	-- 	WaitForClock(HP0_FPD_Rec, 2);

	-- 	ReadCheck(HP0_FPD_Rec, REG_TEST, resize(DATA_TEST, DATA_BITS));

	-- 	WaitForClock(HP0_FPD_Rec, 2);
	-- 	WaitForBarrier(TestDone);
	-- 	wait;
	-- end process;

	-- HP1_FPD_Proc : process
	-- 	constant ProcID : AlertLogIDType := NewID("HP1_FPD_Proc", TCID);
	-- 	variable Data   : std_logic_vector(HP1_FPD_AXI_DATA_WIDTH - 1 downto 0);
	-- begin
	-- 	WaitForClock(HP1_FPD_Rec, 2);

	-- 	WaitForToggle(WriteDone);
	-- 	ReadCheck(HP1_FPD_Rec, REG_TEST, resize(DATA_TEST, DATA_BITS));

	-- 	WaitForClock(HP1_FPD_Rec, 2);
	-- 	WaitForBarrier(TestDone);
	-- 	wait;
	-- end process;

	-- HP2_FPD_Proc : process
	-- 	constant ProcID : AlertLogIDType := NewID("HP2_FPD_Proc", TCID);
	-- 	variable Data   : std_logic_vector(HP1_FPD_AXI_DATA_WIDTH - 1 downto 0);
	-- begin
	-- 	WaitForClock(HP2_FPD_Rec, 2);

	-- 	WaitForClock(HP2_FPD_Rec, 2);
	-- 	WaitForBarrier(TestDone);
	-- 	wait;
	-- end process;

	-- HP3_FPD_Proc : process
	-- 	constant ProcID : AlertLogIDType := NewID("HP3_FPD_Proc", TCID);
	-- 	variable Data   : std_logic_vector(HP3_FPD_AXI_DATA_WIDTH - 1 downto 0);
	-- begin
	-- 	WaitForClock(HP3_FPD_Rec, 2);

	-- 	WaitForClock(HP3_FPD_Rec, 2);
	-- 	WaitForBarrier(TestDone);
	-- 	wait;
	-- end process;

end architecture;

configuration BigDesign_GPIO of BigDesign_TestHarness is
	for TestHarness
		for TestCtrl: BigDesign_TestController
			use entity work.BigDesign_TestController(GPIO);
		end for;
	end for;
end configuration;
