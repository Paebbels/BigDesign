library IEEE;
use     IEEE.std_logic_1164.all;

library PoC;
use     PoC.utils.all;

library OSVVM;
context OSVVM.OsvvmContext;
use     OSVVM.ScoreboardPkg_slv.all ; 

library OSVVM_AXI4 ;
context OSVVM_AXI4.Axi4Context ; 


entity BigDesign_TestController is
	port (
		Clock : in  std_logic;
		Reset : in  std_logic
	);
	
	-- Connect transaction interfaces using external names
	alias HPM0_LPD_Rec     is <<signal ^.DUT.BD.BD.BlockDesign_i.PS.HPM0_LPD.TransRec : AddressBusRecType>> ;
	-- alias SubordinateRec is <<signal ^.Subordinate_1.TransRec : AddressBusRecType>> ;

	-- Derive AXI interface properties from the HPM0_LPD_Rec
	constant AXI_ADDR_WIDTH      : integer := HPM0_LPD_Rec.Address'length ; 
	constant AXI_DATA_WIDTH      : integer := HPM0_LPD_Rec.DataToModel'length ;  
	constant AXI_DATA_BYTE_WIDTH : integer := AXI_DATA_WIDTH / 8 ;
	constant AXI_BYTE_ADDR_WIDTH : integer := log2ceil(AXI_DATA_BYTE_WIDTH);

	-- Simplifying access to Burst FIFOs using aliases
	alias WriteBurstFifo : ScoreboardIdType is HPM0_LPD_Rec.WriteBurstFifo ;
	alias ReadBurstFifo  : ScoreboardIdType is HPM0_LPD_Rec.ReadBurstFifo ;
end entity;
