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


architecture Memory of BigDesign_TestController is

	signal WriteDone : std_logic := '0';

begin
	ControlProc: process
		constant ProcID  : AlertLogIDType := NewID("ControlProc", TCID);
		constant TIMEOUT : time := 1 ms;
	begin
		SetTestName("BigDesign_Memory");

		SetLogEnable(PASSED, TRUE);
		SetLogEnable(INFO,   TRUE);
		SetLogEnable(DEBUG,  TRUE);
		wait for 0 ns; wait for 0 ns;

		TranscriptOpen;
		SetTranscriptMirror(TRUE);

		ClearAlerts;

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
		constant ProcID : AlertLogIDType := NewID("ManagerProc_0", TCID);
	begin
		WaitForClock(DataGen_Managers(0), 2);

		Write(DataGen_Managers(0), MEMORY_TEST_WORD_1, MEMORY_TEST_DATA_1);
		Write(DataGen_Managers(0), MEMORY_TEST_WORD_2, MEMORY_TEST_DATA_2);
		Toggle(WriteDone);

		WaitForClock(DataGen_Managers(0), 2);
		WaitForBarrier(TestDone);
		wait;
	end process;

	ManagerProc_1 : process
		constant ProcID : AlertLogIDType := NewID("ManagerProc_1", TCID);
	begin
		WaitForClock(DataGen_Managers(1), 2);
		WaitForToggle(WriteDone);

		ReadCheck(DataGen_Managers(1), MEMORY_TEST_WORD_1, MEMORY_TEST_DATA_1);
		ReadCheck(DataGen_Managers(1), MEMORY_TEST_WORD_2, MEMORY_TEST_DATA_2);

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
		constant ProcID    : AlertLogIDType := NewID("MemoryBackdoor", TCID);
		constant WriteData : std_logic_vector(MEMORY_MODEL_DATA_BITS - 1 downto 0) := 128x"00FFEEDD_CCBBAA99_88776655_44332211";
		variable ReadData  : std_logic_vector(MEMORY_MODEL_DATA_BITS - 1 downto 0);
		variable DataRV    : RandomPType;

		function toWordAddress (byteAddress : Config_AddressType) return BackdoorAddressType is
			constant result : Config_AddressType := byteAddress srl (Config_AddressType'length - BackdoorAddressType'length);
		begin
			return result(BackdoorAddressType'range);
		end function;

		function toWordAddress (wordAddress : natural) return BackdoorAddressType is
		begin
			return std_logic_vector(to_unsigned(wordAddress, BackdoorAddressType'length));
		end function;
	begin
		WaitForToggle(WriteDone);
		Read(PSDDR4_MemoryID, toWordAddress(byteAddress => MEMORY_TEST_WORD_1), ReadData);  -- alias for MemRead
		AffirmIfEqual(ProcID, ReadData, MEMORY_TEST_DATA_1, "Reading memory through backdoor (1).");

		Read(PSDDR4_MemoryID, toWordAddress(byteAddress => MEMORY_TEST_WORD_2), ReadData);  -- alias for MemRead
		AffirmIfEqual(ProcID, ReadData, MEMORY_TEST_DATA_2, "Reading memory through backdoor (2).");

		wait for 100 ns;
		if MEMORY_PATTERN = "RepeatedSequentialBlockWrite" then
			-- 1st pattern (sequentially fill memory)
			-- 	1. sequential data write 64 kB using 128 words
			-- 	2. measure time from start to finish
			-- 	-> loop n times so that n equals 1 min
			for i in 0 to MEMORY_SCALING_FACTOR * NUM_ITERATIONS loop  -- ~1 min
				for j in 0 to NUM_WORDS_PER_BLOCK - 1 loop
					block
						constant writeAddress : natural := j + i * NUM_WORDS_PER_BLOCK;
					begin
						Write(PSDDR4_MemoryID, toWordAddress(wordAddress => writeAddress), WriteData);
					end block;
				end loop;
			end loop;

		elsif MEMORY_PATTERN = "RandomSequentialWrite_4MiB_Range" then
			-- 2nd pattern (randomly fill memory with same data amount -> worst case)
			-- 	1. 4096 * 128b write operations with random addressing in range 18 bit (0 to 4 MiB)
			--  -> 4b Byte address + 18b word address
			for i in 0 to MEMORY_SCALING_FACTOR * NUM_ITERATIONS * NUM_WORDS_PER_BLOCK loop  -- ~1:10 min
				Write(PSDDR4_MemoryID, toWordAddress(DataRV.RandInt(0, 2**18 - 1)), WriteData);
			end loop;

		elsif MEMORY_PATTERN = "RandomSequentialWrite_1GiB_Range" then
			-- 3nd pattern (randomly fill memory with same data amount -> worstworst case)
			-- 	1. 4096 * 128b write operations with random addressing in range 26 bit (0 to 1 GiB)
			--  -> 4b Byte address + 26b word address
			for i in 0 to MEMORY_SCALING_FACTOR * NUM_ITERATIONS * NUM_WORDS_PER_BLOCK loop  -- ~1:35 min
				Write(PSDDR4_MemoryID, toWordAddress(DataRV.RandInt(0, 2**26 - 1)), WriteData);
			end loop;
		else
			assert False report "Invalid memory test pattern " & MEMORY_PATTERN & "!" severity failure;
		end if;

		WaitForBarrier(TestDone);
		wait;
	end process;

end architecture;

configuration BigDesign_Memory of BigDesign_TestHarness is
	for TestHarness
		for TestCtrl: BigDesign_TestController
			use entity work.BigDesign_TestController(Memory);
		end for;
	end for;
end configuration;
