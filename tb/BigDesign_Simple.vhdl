library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;

library PoC;
context PoC.common;

architecture Simple of BigDesign_TestController is
	signal TestDone : integer_barrier := 1;

	constant TCID : AlertLogIDType :=  NewID("TestCtrl");

begin
	ControlProc: process
		constant ProcID  : AlertLogIDType := NewID("ControlProc", TCID);
		constant TIMEOUT : time := 1 ms;
	begin
		SetTestName("BigDesign_Simple");

		SetLogEnable(PASSED, FALSE);
		SetLogEnable(INFO,   FALSE);
		SetLogEnable(DEBUG,  FALSE);
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
		Write(HPM0_LPD_Rec, X"8000_0004", X"0000_0001");
		WaitForClock(HPM0_LPD_Rec);
		ReadCheck(HPM0_LPD_Rec, X"8000_0004", X"0000_0001");

		-- Wait for outputs to propagate and signal TestDone
		WaitForClock(HPM0_LPD_Rec, 2);
		WaitForBarrier(TestDone);
		wait;
	end process;

	-----------------------------------------------
	-------------- Memory instances ---------------
	-----------------------------------------------
	HP0_FPD_Proc : process
		constant ProcID : AlertLogIDType := NewID("HP0_FPD_Proc", TCID);
		variable Data   : std_logic_vector(HP0_FPD_AXI_DATA_WIDTH - 1 downto 0);
	begin
		WaitForClock(HP0_FPD_Rec, 2);

		-- Wait for outputs to propagate and signal TestDone
		WaitForClock(HP0_FPD_Rec, 2);
		WaitForBarrier(TestDone);
		wait;
	end process;

	HP1_FPD_Proc : process
		constant ProcID : AlertLogIDType := NewID("HP1_FPD_Proc", TCID);
		variable Data   : std_logic_vector(HP1_FPD_AXI_DATA_WIDTH - 1 downto 0);
	begin
		WaitForClock(HP1_FPD_Rec, 2);

		-- Wait for outputs to propagate and signal TestDone
		WaitForClock(HP1_FPD_Rec, 2);
		WaitForBarrier(TestDone);
		wait;
	end process;

	HP3_FPD_Proc : process
		constant ProcID : AlertLogIDType := NewID("HP3_FPD_Proc", TCID);
		variable Data   : std_logic_vector(HP3_FPD_AXI_DATA_WIDTH - 1 downto 0);
	begin
		WaitForClock(HP3_FPD_Rec, 2);

		-- Wait for outputs to propagate and signal TestDone
		WaitForClock(HP3_FPD_Rec, 2);
		WaitForBarrier(TestDone);
		wait;
	end process;

end architecture;

configuration BigDesign_Simple of BigDesign_TestHarness is
	for TestHarness
		for TestCtrl: BigDesign_TestController
			use entity work.BigDesign_TestController(Simple);
		end for;
	end for;
end configuration;
