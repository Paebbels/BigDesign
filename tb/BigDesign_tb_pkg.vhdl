library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;

package BigDesign_tb_pkg is

  constant AXI_ADDR_WIDTH : integer := 32;
  constant AXI_DATA_WIDTH : integer := 32;
  constant AXI_STRB_WIDTH : integer := AXI_DATA_WIDTH / 8;

  subtype AXIAddressType is std_logic_vector(AXI_ADDR_WIDTH - 1 downto 0);
  subtype AXIDataType    is std_logic_vector(AXI_DATA_WIDTH - 1 downto 0);

  -- Register addresses
  constant Reg_LED    : AXIAddressType := 32x"04";
  constant Reg_Test_1 : AXIAddressType := 32x"10";

  constant Data_Test_1 : AXIDataType   := 32x"01";

  -- todo: add the following constants
  -- 	BLOCK_SIZE
  -- 	NUM_OF_64k_BLOCK_WRITES
end package;
