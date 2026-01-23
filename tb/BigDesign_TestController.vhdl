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
		Clock       : in  std_logic;
		Reset       : in  std_logic;
		AXI_Manager : inout AddressBusRecArrayType
	);

	-- Connect transaction interfaces using external names
	-- Managers
	alias HPM0_FPD_Rec is <<signal ^.DUT.BD.BD.BlockDesign_i.PS.blk_HPM0_FPD.Manager.TransRec : AddressBusRecType>>;
	alias HPM1_FPD_Rec is <<signal ^.DUT.BD.BD.BlockDesign_i.PS.blk_HPM1_FPD.Manager.TransRec : AddressBusRecType>>;
	alias HPM0_LPD_Rec is <<signal ^.DUT.BD.BD.BlockDesign_i.PS.blk_HPM0_LPD.Manager.TransRec : AddressBusRecType>>;

	-- Subordinates
	-- alias HP0_FPD_Rec  is <<signal ^.DUT.BD.BD.BlockDesign_i.PS.blk_HP0_FPD.Memory.TransRec : AddressBusRecType>>;
	-- alias HP1_FPD_Rec  is <<signal ^.DUT.BD.BD.BlockDesign_i.PS.blk_HP1_FPD.Memory.TransRec : AddressBusRecType>>;
	-- alias HP2_FPD_Rec  is <<signal ^.DUT.BD.BD.BlockDesign_i.PS.blk_HP2_FPD.Memory.TransRec : AddressBusRecType>>;
	-- alias HP3_FPD_Rec  is <<signal ^.DUT.BD.BD.BlockDesign_i.PS.blk_HP3_FPD.Memory.TransRec : AddressBusRecType>>;

	-- alias SubordinateRec is <<signal ^.Subordinate_1.TransRec : AddressBusRecType>> ;

	-- Derive AXI interface properties from the HPM0_LPD_Rec
	constant HPM0_FPD_AXI_ADDR_WIDTH      : integer := HPM0_FPD_Rec.Address'length ; 
	constant HPM0_FPD_AXI_DATA_WIDTH      : integer := HPM0_FPD_Rec.DataToModel'length ;  
	constant HPM0_FPD_AXI_DATA_BYTE_WIDTH : integer := HPM0_FPD_AXI_DATA_WIDTH / 8 ;
	constant HPM0_FPD_AXI_BYTE_ADDR_WIDTH : integer := log2ceil(HPM0_FPD_AXI_DATA_BYTE_WIDTH);

	constant HPM1_FPD_AXI_ADDR_WIDTH      : integer := HPM1_FPD_Rec.Address'length ; 
	constant HPM1_FPD_AXI_DATA_WIDTH      : integer := HPM1_FPD_Rec.DataToModel'length ;  
	constant HPM1_FPD_AXI_DATA_BYTE_WIDTH : integer := HPM1_FPD_AXI_DATA_WIDTH / 8 ;
	constant HPM1_FPD_AXI_BYTE_ADDR_WIDTH : integer := log2ceil(HPM1_FPD_AXI_DATA_BYTE_WIDTH);

	constant HPM0_LPD_AXI_ADDR_WIDTH      : integer := HPM0_LPD_Rec.Address'length ; 
	constant HPM0_LPD_AXI_DATA_WIDTH      : integer := HPM0_LPD_Rec.DataToModel'length ;  
	constant HPM0_LPD_AXI_DATA_BYTE_WIDTH : integer := HPM0_LPD_AXI_DATA_WIDTH / 8 ;
	constant HPM0_LPD_AXI_BYTE_ADDR_WIDTH : integer := log2ceil(HPM0_LPD_AXI_DATA_BYTE_WIDTH);

	-- constant HP0_FPD_AXI_ADDR_WIDTH       : integer := HP0_FPD_Rec.Address'length ; 
	-- constant HP0_FPD_AXI_DATA_WIDTH       : integer := HP0_FPD_Rec.DataToModel'length ;  
	-- constant HP0_FPD_AXI_DATA_BYTE_WIDTH  : integer := HP0_FPD_AXI_DATA_WIDTH / 8 ;
	-- constant HP0_FPD_AXI_BYTE_ADDR_WIDTH  : integer := log2ceil(HP0_FPD_AXI_DATA_BYTE_WIDTH);

	-- constant HP1_FPD_AXI_ADDR_WIDTH       : integer := HP1_FPD_Rec.Address'length ; 
	-- constant HP1_FPD_AXI_DATA_WIDTH       : integer := HP1_FPD_Rec.DataToModel'length ;  
	-- constant HP1_FPD_AXI_DATA_BYTE_WIDTH  : integer := HP1_FPD_AXI_DATA_WIDTH / 8 ;
	-- constant HP1_FPD_AXI_BYTE_ADDR_WIDTH  : integer := log2ceil(HP1_FPD_AXI_DATA_BYTE_WIDTH);

	-- constant HP2_FPD_AXI_ADDR_WIDTH       : integer := HP2_FPD_Rec.Address'length ; 
	-- constant HP2_FPD_AXI_DATA_WIDTH       : integer := HP2_FPD_Rec.DataToModel'length ;  
	-- constant HP2_FPD_AXI_DATA_BYTE_WIDTH  : integer := HP2_FPD_AXI_DATA_WIDTH / 8 ;
	-- constant HP2_FPD_AXI_BYTE_ADDR_WIDTH  : integer := log2ceil(HP2_FPD_AXI_DATA_BYTE_WIDTH);

	-- constant HP3_FPD_AXI_ADDR_WIDTH       : integer := HP3_FPD_Rec.Address'length ; 
	-- constant HP3_FPD_AXI_DATA_WIDTH       : integer := HP3_FPD_Rec.DataToModel'length ;  
	-- constant HP3_FPD_AXI_DATA_BYTE_WIDTH  : integer := HP3_FPD_AXI_DATA_WIDTH / 8 ;
	-- constant HP3_FPD_AXI_BYTE_ADDR_WIDTH  : integer := log2ceil(HP3_FPD_AXI_DATA_BYTE_WIDTH);

	-- Simplifying access to Burst FIFOs using aliases
	alias HPM0_FPD_WriteBurstFifo : ScoreboardIdType is HPM0_FPD_Rec.WriteBurstFifo ;
	alias HPM0_FPD_ReadBurstFifo  : ScoreboardIdType is HPM0_FPD_Rec.ReadBurstFifo ;
	alias HPM1_FPD_WriteBurstFifo : ScoreboardIdType is HPM1_FPD_Rec.WriteBurstFifo ;
	alias HPM1_FPD_ReadBurstFifo  : ScoreboardIdType is HPM1_FPD_Rec.ReadBurstFifo ;
	alias HPM0_LPD_WriteBurstFifo : ScoreboardIdType is HPM0_LPD_Rec.WriteBurstFifo ;
	alias HPM0_LPD_ReadBurstFifo  : ScoreboardIdType is HPM0_LPD_Rec.ReadBurstFifo ;

	-- alias HP0_FPD_WriteBurstFifo  : ScoreboardIdType is HP0_FPD_Rec.WriteBurstFifo ;
	-- alias HP0_FPD_ReadBurstFifo   : ScoreboardIdType is HP0_FPD_Rec.ReadBurstFifo ;
	-- alias HP1_FPD_WriteBurstFifo  : ScoreboardIdType is HP1_FPD_Rec.WriteBurstFifo ;
	-- alias HP1_FPD_ReadBurstFifo   : ScoreboardIdType is HP1_FPD_Rec.ReadBurstFifo ;
	-- alias HP2_FPD_WriteBurstFifo  : ScoreboardIdType is HP2_FPD_Rec.WriteBurstFifo ;
	-- alias HP2_FPD_ReadBurstFifo   : ScoreboardIdType is HP2_FPD_Rec.ReadBurstFifo ;
	-- alias HP3_FPD_WriteBurstFifo  : ScoreboardIdType is HP3_FPD_Rec.WriteBurstFifo ;
	-- alias HP3_FPD_ReadBurstFifo   : ScoreboardIdType is HP3_FPD_Rec.ReadBurstFifo ;

	signal MemoryID : MemoryIDType := NewID (
		Name      => "PSDDR4",
		AddrWidth => 49,
		DataWidth => 128
	);
end entity;
