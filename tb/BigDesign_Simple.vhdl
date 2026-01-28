library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;

library PoC;
context PoC.common;

architecture Simple of BigDesign_TestController is
	signal TestDone  : integer_barrier := 1;
	signal WriteDone : std_logic       := '0';

	constant TCID : AlertLogIDType :=  NewID("TestCtrl");

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

		-- Wait for outputs to propagate and signal TestDone
		WaitForClock(HPM0_FPD_Rec, 2);
		WaitForBarrier(TestDone);
		wait;
	end process;

	HPM1_FPD_Proc : process
		constant ProcID : AlertLogIDType := NewID("HPM1_FPD_Proc", TCID);
		variable Data   : std_logic_vector(HPM1_FPD_AXI_DATA_WIDTH - 1 downto 0);
	begin
		WaitForClock(HPM1_FPD_Rec, 2); 
		-- Write(HPM1_FPD_Rec, X"8000_0004", X"0000_0001" );

		-- Wait for outputs to propagate and signal TestDone
		WaitForClock(HPM1_FPD_Rec, 2);
		WaitForBarrier(TestDone);
		wait;
	end process;
	
	HPM0_LPD_Proc : process
		constant ProcID : AlertLogIDType := NewID("HPM0_LPD_Proc", TCID);
		variable Data   : std_logic_vector(HPM0_LPD_AXI_DATA_WIDTH - 1 downto 0);
	begin
		WaitForClock(HPM0_LPD_Rec, 2);
		Write(HPM0_LPD_Rec, X"8000_0004", X"0000_0001");  -- turn on LED
		WaitForClock(HPM0_LPD_Rec);
		ReadCheck(HPM0_LPD_Rec, X"8000_0004", X"0000_0001");

		-- Wait for outputs to propagate and signal TestDone
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

		Write(DataGen_Managers(0), X"0000_0010", X"0000_0001");
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
		ReadCheck(DataGen_Managers(1), X"0000_0010", X"0000_0001");

		-- Wait for outputs to propagate and signal TestDone
		WaitForClock(DataGen_Managers(1), 2);
		WaitForBarrier(TestDone);
		wait;
	end process;

	ManagerProc_2 : process
	begin
		WaitForClock(DataGen_Managers(2), 2);

		-- Write(DataGen_Managers(0), X"8000_0010", X"0000_0001");

		-- Wait for outputs to propagate and signal TestDone
		WaitForClock(DataGen_Managers(2), 2);
		WaitForBarrier(TestDone);
		wait;
	end process;

	ManagerProc_3 : process
	begin
		WaitForClock(DataGen_Managers(3), 2);

		-- Write(DataGen_Managers(0), X"8000_0010", X"0000_0001");

		-- Wait for outputs to propagate and signal TestDone
		WaitForClock(DataGen_Managers(3), 2);
		WaitForBarrier(TestDone);
		wait;
	end process;

	-----------------------------------------------
	-------------- Memory instances ---------------
	-----------------------------------------------
	-- HP0_FPD_Proc : process
		-- constant ProcID : AlertLogIDType := NewID("HP0_FPD_Proc", TCID);
		-- variable Data   : std_logic_vector(HP0_FPD_AXI_DATA_WIDTH - 1 downto 0);
	-- begin
		-- WaitForClock(HP0_FPD_Rec, 2);

		-- Wait for outputs to propagate and signal TestDone
		-- WaitForClock(HP0_FPD_Rec, 2);
		-- WaitForBarrier(TestDone);
		-- wait;
	-- end process;

	-- HP1_FPD_Proc : process
		-- constant ProcID : AlertLogIDType := NewID("HP1_FPD_Proc", TCID);
		-- variable Data   : std_logic_vector(HP1_FPD_AXI_DATA_WIDTH - 1 downto 0);
	-- begin
		-- WaitForClock(HP1_FPD_Rec, 2);

		-- Wait for outputs to propagate and signal TestDone
		-- WaitForClock(HP1_FPD_Rec, 2);
		-- WaitForBarrier(TestDone);
		-- wait;
	-- end process;

	-- HP2_FPD_Proc : process
		-- constant ProcID : AlertLogIDType := NewID("HP2_FPD_Proc", TCID);
		-- variable Data   : std_logic_vector(HP1_FPD_AXI_DATA_WIDTH - 1 downto 0);
	-- begin
		-- WaitForClock(HP2_FPD_Rec, 2);

		-- Wait for outputs to propagate and signal TestDone
		-- WaitForClock(HP2_FPD_Rec, 2);
		-- WaitForBarrier(TestDone);
		-- wait;
	-- end process;

	-- HP3_FPD_Proc : process
		-- constant ProcID : AlertLogIDType := NewID("HP3_FPD_Proc", TCID);
		-- variable Data   : std_logic_vector(HP3_FPD_AXI_DATA_WIDTH - 1 downto 0);
	-- begin
		-- WaitForClock(HP3_FPD_Rec, 2);

		-- Wait for outputs to propagate and signal TestDone
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
