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


architecture Version of BigDesign_TestController is
begin
	ControlProc: process
		constant ProcID  : AlertLogIDType := NewID("ControlProc", TCID);
		constant TIMEOUT : time := 1 ms;
	begin
		SetTestName("BigDesign_Version");

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
	begin
		WaitForClock(HPM0_FPD_Rec, 2);

		-- Currently not doing anything

		WaitForBarrier(TestDone);
		wait;
	end process;

	HPM1_FPD_Proc : process
		constant ProcID : AlertLogIDType := NewID("HPM1_FPD_Proc", TCID);
	begin
		WaitForClock(HPM1_FPD_Rec, 2);

		-- Currently not doing anything

		WaitForBarrier(TestDone);
		wait;
	end process;

	HPM0_LPD_Proc : process
		constant ProcID : AlertLogIDType := NewID("HPM0_LPD_Proc", TCID);
	begin
		WaitForClock(HPM0_LPD_Rec, 2);
		-- All register are read-only and dynamic / change over time.
		-- But it can be checked for the project name
		-- TODO: Read and check data from mem-file
		ReadCheck(HPM0_LPD_Rec, REG_VERSION_PROJECT_0, 32x"6A6F7250");
		ReadCheck(HPM0_LPD_Rec, REG_VERSION_PROJECT_1, 32x"00746365");
		ReadCheck(HPM0_LPD_Rec, REG_VERSION_PROJECT_2, 32x"0");
		ReadCheck(HPM0_LPD_Rec, REG_VERSION_PROJECT_3, 32x"0");
		ReadCheck(HPM0_LPD_Rec, REG_VERSION_PROJECT_4, 32x"0");

		WaitForClock(HPM0_LPD_Rec, 2);
		WaitForBarrier(TestDone);
		wait;
	end process;

	------------------------------------------
	-------------- AXI Manager ---------------
	------------------------------------------
	-- Generate transaction for data generator managers
	ManagerProc_0 : process
		constant ProcID : AlertLogIDType := NewID("ManagerProc_0", TCID);
	begin
		WaitForClock(DataGen_Managers(0), 2);

		-- Currently not doing anything

		WaitForClock(DataGen_Managers(0), 2);
		WaitForBarrier(TestDone);
		wait;
	end process;

	ManagerProc_1 : process
		constant ProcID : AlertLogIDType := NewID("ManagerProc_1", TCID);
	begin
		WaitForClock(DataGen_Managers(1), 2);

		-- Currently not doing anything

		WaitForClock(DataGen_Managers(1), 2);
		WaitForBarrier(TestDone);
		wait;
	end process;

	ManagerProc_2 : process
		constant ProcID : AlertLogIDType := NewID("ManagerProc_2", TCID);
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
	begin
		-- Currently not doing anything

		WaitForBarrier(TestDone);
		wait;
	end process;

end architecture;

configuration BigDesign_Version of BigDesign_TestHarness is
	for TestHarness
		for TestCtrl: BigDesign_TestController
			use entity work.BigDesign_TestController(Version);
		end for;
	end for;
end configuration;
