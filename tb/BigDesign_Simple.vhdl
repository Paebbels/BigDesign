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


architecture Simple of BigDesign_TestController is

	signal WriteDone : std_logic := '0';

begin
	ControlProc: process
		constant ProcID  : AlertLogIDType := NewID("ControlProc", TCID);
		constant TIMEOUT : time := 1 ms;
	begin
		SetTestName("BigDesign_Simple");

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
		Write(HPM0_LPD_Rec, Reg_LED, 32x"01");  -- turn on LED
		WaitForClock(HPM0_LPD_Rec);
		ReadCheck(HPM0_LPD_Rec, X"8000_0004", 32x"01");

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

		Write(DataGen_Managers(0), Reg_Test_1, resize(Data_Test_1, DATA_BITS));
		Toggle(WriteDone);
		-- Wait for outputs to propagate and signal TestDone
		WaitForClock(DataGen_Managers(0), 2);
		WaitForBarrier(TestDone);
		wait;
	end process;

	ManagerProc_1 : process
	begin
		WaitForClock(DataGen_Managers(1), 2);
		WaitForToggle(WriteDone);
		ReadCheck(DataGen_Managers(1), Reg_Test_1, resize(Data_Test_1, DATA_BITS));

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
		constant ProcID  : AlertLogIDType := NewID("Memory", TCID);
		variable ReadData : std_logic_vector(7 downto 0);
		variable Reg_i  : AXIAddressType := 32x"00";
		variable Data_i : AXIAddressType := 32x"11";
		variable DataRV                  : RandomPType;
	begin
		WaitForToggle(WriteDone);
		Read(MemoryID, Reg_Test_1, ReadData);  -- alias for MemRead
		AffirmIfEqual(ProcID, ReadData, resize(Data_Test_1, 8), "Reading memory through backdoor.");
		wait for 100 ns;

		if PATTERN = "RepeatedSequentialBlockWrite" then
			-- 1st pattern (sequentially fill memory)
			-- 	1. sequential data write 64 kB using 128 words (i.e. inc by 1)
			-- 	2. measure time from start to finish
			-- 	-> loop n times so that n equals 1 min
			for i in 0 to SCALING_FACTOR * NUM_ITERATIONS loop  -- ~1 min
				for j in 0 to NUM_BYTES_PER_BLOCK - 1 loop
					Write(MemoryID, std_logic_vector(to_unsigned(j, AXI_ADDR_WIDTH)), Data_i(7 downto 0));
				end loop;
			end loop;
		
		elsif PATTERN = "RandomSequentialWrite_4MB_Range" then
			-- 2nd pattern (randomly fill memory with same data amount -> worst case)
			-- 	1. 4096 * 128b write operations with random addressing in range 22 bit (0 to 4 MB) 
			--  -> 4b Byte address + 18b word address
			for i in 0 to SCALING_FACTOR * NUM_ITERATIONS * NUM_BYTES_PER_BLOCK loop  -- ~1:30 min
				Write(MemoryID, Reg_i, Data_i(7 downto 0));
				Reg_i := 10x"00" & DataRV.RandSlv(22);
			end loop;

		elsif PATTERN = "RandomSequentialWrite_1TB_Range" then
			-- 3nd pattern (randomly fill memory with same data amount -> worstworst case)
			-- 	1. 4096 * 128b write operations with random addressing in range 30 bit (0 to 1 TB)
			--  -> 4b Byte address + 26b word address
			for i in 0 to SCALING_FACTOR * NUM_ITERATIONS * NUM_BYTES_PER_BLOCK loop  -- ~4:10 min
				Write(MemoryID, Reg_i, Data_i(7 downto 0));
				Reg_i := 2x"00" & DataRV.RandSlv(30);
			end loop;
		else
			assert False report "Invalid test pattern " & PATTERN & "!" severity failure;
		end if;

		WaitForBarrier(TestDone);
		wait;
	end process;

	-----------------------------------------------
	---------------- Subordinates -----------------
	-----------------------------------------------
	HP0_FPD_Proc : process
		constant ProcID : AlertLogIDType := NewID("HP0_FPD_Proc", TCID);
		variable Data   : std_logic_vector(HP0_FPD_AXI_DATA_WIDTH - 1 downto 0);
	begin
		WaitForClock(HP0_FPD_Rec, 2);

		WaitForToggle(WriteDone);
		ReadCheck(HP0_FPD_Rec, Reg_Test_1, resize(Data_Test_1, DATA_BITS));

		WaitForClock(HP0_FPD_Rec, 2);
		WaitForBarrier(TestDone);
		wait;
	end process;

	-- HP1_FPD_Proc : process
		-- constant ProcID : AlertLogIDType := NewID("HP1_FPD_Proc", TCID);
		-- variable Data   : std_logic_vector(HP1_FPD_AXI_DATA_WIDTH - 1 downto 0);
	-- begin
		-- WaitForClock(HP1_FPD_Rec, 2);

		-- WaitForToggle(WriteDone);
		-- ReadCheck(HP1_FPD_Rec, Reg_Test_1, resize(Data_Test_1, DATA_BITS));

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

configuration BigDesign_Simple of BigDesign_TestHarness is
	for TestHarness
		for TestCtrl: BigDesign_TestController
			use entity work.BigDesign_TestController(Simple);
		end for;
	end for;
end configuration;
