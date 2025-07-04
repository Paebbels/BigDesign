library IEEE;
use     IEEE.std_logic_1164.all;

library Interfaces;
use     Interfaces.Axi4Common.all;
use     Interfaces.Axi4.all;
use     Interfaces.Axi4Lite.all;

use     work.AXI4Lite.all;


package Axi4Views is
	procedure Axi4LiteManagerView(
		signal m2s : in   T_Axi4Lite_Bus_m2s;
		signal s2m : out  T_Axi4Lite_Bus_s2m;
		signal rec : view Axi4Lite_ManagerView
	);
	
	procedure Axi4LiteSubordinateView(
		signal rec : view Axi4Lite_SubordinateView;
		signal m2s : out  T_Axi4Lite_Bus_m2s;
		signal s2m : in   T_Axi4Lite_Bus_s2m
	);
end package;

package body Axi4Views is
	procedure Axi4LiteManagerView(
		signal m2s : in   T_Axi4Lite_Bus_m2s;
		signal s2m : out  T_Axi4Lite_Bus_s2m;
		signal rec : view Axi4Lite_ManagerView
	) is
	begin
		-- Manager to subordinate
		rec.WriteAddress.Valid   <= m2s.AWValid;
		rec.WriteAddress.Address <= Address_Type(m2s.AWAddr);
		rec.WriteAddress.Cache   <= Cache_Type(m2s.AWCache);
		rec.WriteAddress.Protect <= Protect_Type(m2s.AWProt);
		rec.WriteData.Valid      <= m2s.WValid;
		rec.WriteData.Data       <= Data_Type(m2s.WData);
		rec.WriteData.Strobe     <= Strobe_Type(m2s.WStrb);
		rec.WriteResponse.Ready  <= m2s.BReady;
		rec.ReadAddress.Valid    <= m2s.ARValid;
		rec.ReadAddress.Address  <= Address_Type(m2s.ARAddr);
		rec.ReadAddress.Cache    <= Cache_Type(m2s.ARCache);
		rec.ReadAddress.Protect  <= Protect_Type(m2s.ARProt);
		rec.ReadData.Ready       <= m2s.RReady;
		
		-- Subordinate to manager
		s2m.WReady    <= rec.WriteData.Ready;
		s2m.BValid    <= rec.WriteResponse.Valid;
		s2m.BResp     <= std_logic_vector(rec.WriteResponse.Response);
		s2m.ARReady   <= rec.ReadAddress.Ready;
		s2m.AWReady   <= rec.ReadAddress.Ready;
		s2m.RValid    <= rec.ReadData.Valid;
		s2m.RData     <= std_logic_vector(rec.ReadData.Data);
		s2m.RResp     <= std_logic_vector(rec.ReadData.Response);
	end procedure;

	procedure Axi4LiteSubordinateView(
		signal rec : view Axi4Lite_SubordinateView;
		signal m2s : out  T_Axi4Lite_Bus_m2s;
		signal s2m : in   T_Axi4Lite_Bus_s2m
	) is
	begin
		-- Manager to subordinate
		m2s.AWValid <= rec.WriteAddress.Valid;
		m2s.AWAddr  <= std_logic_vector(rec.WriteAddress.Address);
		m2s.AWCache <= std_logic_vector(rec.WriteAddress.Cache);
		m2s.AWProt  <= std_logic_vector(rec.WriteAddress.Protect);
		m2s.WValid  <= rec.WriteData.Valid;
		m2s.WData   <= std_logic_vector(rec.WriteData.Data);
		m2s.WStrb   <= std_logic_vector(rec.WriteData.Strobe);
		m2s.BReady  <= rec.WriteResponse.Ready;
		m2s.ARValid <= rec.ReadAddress.Valid;
		m2s.ARAddr  <= std_logic_vector(rec.ReadAddress.Address);
		m2s.ARCache <= std_logic_vector(rec.ReadAddress.Cache);
		m2s.ARProt  <= std_logic_vector(rec.ReadAddress.Protect);
		m2s.RReady  <= rec.ReadData.Ready;
		
		-- Subordinate to manager
		rec.WriteData.Ready        <= s2m.WReady;
		rec.WriteResponse.Valid    <= s2m.BValid;
		rec.WriteResponse.Response <= std_logic_vector(s2m.BResp);
		rec.ReadAddress.Ready      <= s2m.ARReady;
		rec.ReadAddress.Ready      <= s2m.AWReady;
		rec.ReadData.Valid         <= s2m.RValid;
		rec.ReadData.Data          <= std_logic_vector(s2m.RData);
		rec.ReadData.Response      <= std_logic_vector(s2m.RResp);
	end procedure;
end package body;
