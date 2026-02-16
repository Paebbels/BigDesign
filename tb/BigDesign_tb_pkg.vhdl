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

  constant BLOCK_SIZE : unsigned(AXI_ADDR_WIDTH - 1 downto 0) := to_unsigned(16, AXI_ADDR_WIDTH);
  constant NUM_BYTES_PER_BLOCK : positive := 64 * 1024;  -- 64 kB
  constant NUM_ITERATIONS      : positive := 60;  -- default SCALING_FACTOR is 100 which results in 60000 iterations

end package;
