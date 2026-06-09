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
use     PoC.clock.all;

library lib_BigDesign;
use     lib_BigDesign.PS_settings_pkg.all;

library lib_test;
use     lib_test.BigDesign_tb_pkg.all;


architecture HRC of BigDesign_TestController is
begin
	ControlProc: process
		constant ProcID  : AlertLogIDType := NewID("ControlProc", TCID);
		constant TIMEOUT : time := 1 ms;
	begin
		SetTestName("BigDesign_HRC");

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
		constant ProcID  : AlertLogIDType := NewID("HPM0_LPD_Proc", TCID);

		-- imported procedure from PoC testbench for HRC
		procedure LoadNanoseconds (
			signal   manager             : inout AddressBusRecType;
			constant Nanoseconds_to_load : natural;
			constant waitTime            : time
		) is
			variable ReadData : AXIDataType;
			variable ns_value_slv : std_logic_vector(63 downto 0) := to_slv(Nanoseconds_to_load, 64);
			variable time_now_a     : time;
			variable time_now_b     : time;
			variable time_now_delta : time;
			variable time_total     : natural;
			variable time_ns_a_l    : natural;
			variable time_ns_b_l    : natural;
			variable time_ns_delta  : natural;
			variable delta_expected : natural;
		begin
			log("");
			log("Writing Nanoseconds to register");
			Write(manager, REG_HRC_NANOSECONDS_TO_LOAD_L, ns_value_slv(31 downto 0));
			time_now_a  := now;
			time_ns_a_l := to_integer(unsigned(ReadData));
			Write(manager, REG_HRC_NANOSECONDS_TO_LOAD_H, ns_value_slv(63 downto 32));

			wait for waitTime;

			Read(manager, REG_HRC_NANOSECONDS_TO_LOAD_L, ReadData);
			time_now_b  := now;
			time_ns_b_l := to_integer(unsigned(ReadData));
			time_now_delta := time_now_b - time_now_a;
			time_total     := Nanoseconds_to_load + time_now_delta / 1000 ps;

			time_ns_b_l    := to_integer(unsigned(ReadData));
			time_ns_delta  := time_ns_b_l - time_ns_a_l;
			AffirmIfEqual(time_ns_delta, time_ns_b_l);
			ReadCheck(manager, REG_HRC_NANOSECONDS_TO_LOAD_H, std_logic_vector(ns_value_slv(63 downto 32)));   -- value should not have changed
		end procedure;

		procedure LoadDatetime (
			signal manager    : inout AddressBusRecType;
			constant s        : natural;  -- second
			constant m        : natural;  -- minute
			constant h        : natural;  -- hour
			constant d        : natural;  -- day
			constant mo       : natural;  -- month
			constant y        : natural;  -- year
			constant waitTime : time
		) is
			variable ReadData : AXIDataType;
			variable Datetime_to_load : T_CLOCK_DATETIME := (
														secondsResolution => to_unsigned(0, 32),  -- gets written to different register
														seconds           => to_unsigned(s, 6),
														minutes           => to_unsigned(m, 6),
														hours             => to_unsigned(h, 5),
														day               => to_unsigned(d, 5),
														month             => to_unsigned(mo, 4),
														year              => to_unsigned(y, 13)
													);
			variable Datetime_to_load_slv : std_logic_vector(63 downto 0) := datetime_to_slv(Datetime_to_load);
			variable time_now_a : time;
		begin
			log("");
			log("Writing Datetime to register");
			Write(manager, REG_HRC_DATETME_TO_LOAD_HMS, Datetime_to_load_slv(31 downto 0));
			Write(manager, REG_HRC_DATETME_TO_LOAD_YMD, Datetime_to_load_slv(63 downto 32));

			wait for waitTime;

			ReadCheck(manager, REG_HRC_TIME_HMS, std_logic_vector(Datetime_to_load_slv(31 downto 0)));   -- value should not have changed
			ReadCheck(manager, REG_HRC_DATE_YMD, std_logic_vector(Datetime_to_load_slv(63 downto 32)));  -- value should not have changed

		end procedure;
	begin
		WaitForClock(HPM0_LPD_Rec, 8);
		log("Writing load values to register");
		LoadNanoseconds(HPM0_LPD_Rec, 1000, 400 ns);
		LoadDatetime(HPM0_LPD_Rec, 42, 7, 16, 13, 1, 2025, 500 ns);
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

configuration BigDesign_HRC of BigDesign_TestHarness is
	for TestHarness
		for TestCtrl: BigDesign_TestController
			use entity work.BigDesign_TestController(HRC);
		end for;
	end for;
end configuration;
