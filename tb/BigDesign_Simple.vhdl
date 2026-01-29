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

	signal WriteDone : std_logic       := '0';

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
		variable ReadData : std_logic_vector(7 downto 0);
	begin
		-- report "Mem initialized: " & to_string(IsInitialized(MemoryID));
		WaitForToggle(WriteDone);
		Read(MemoryID, Reg_Test_1, ReadData);  -- alias for MemRead
		AffirmIfEqual(ReadData, resize(Data_Test_1, 8), "Reading memory through backdoor.");

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
