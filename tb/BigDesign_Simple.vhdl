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
	
	HPM0_LPD_Proc : process
		constant ProcID : AlertLogIDType := NewID("HPM0_LPD_Proc", TCID);
		variable Data   : std_logic_vector(AXI_DATA_WIDTH - 1 downto 0) ;
	begin
		-- wait until nReset = '1' ;  
		WaitForClock(HPM0_LPD_Rec, 2) ; 
		-- log("Write and Read with ByteAddr = 0, 4 Bytes") ;
		Write(HPM0_LPD_Rec, X"8000_0000", X"0000_0001" ) ;
		-- Read(HPM0_LPD_Rec,  X"1111_1110", Data) ;
		-- AffirmIfEqual(Data, X"2222_2222", "Manager Read Data: ") ;
		
		-- Wait for outputs to propagate and signal TestDone
		WaitForClock(HPM0_LPD_Rec, 2) ;
		WaitForBarrier(TestDone) ;
		wait ;
	end process;
	
end architecture;

configuration BigDesign_Simple of BigDesign_TestHarness is
	for TestHarness
		for TestCtrl: BigDesign_TestController
			use entity work.BigDesign_TestController(Simple);
		end for;
	end for;
end configuration;
