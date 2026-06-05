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

library lib_BigDesign;
use     lib_BigDesign.PS_settings_pkg.all;


package BigDesign_tb_pkg is

	------------------------
  -- Register addresses --
	------------------------
  constant REG_TEST         : AXIAddressType := 32x"10";
  constant REG_GPIO_BUTTONS : AXIAddressType := BASE_ADDRESS_GPIO;
  constant REG_GPIO_LED     : AXIAddressType := BASE_ADDRESS_GPIO or 32x"0004";

  constant DATA_TEST : AXIDataType   := 32x"01";

  constant BLOCK_SIZE : unsigned(AXI_ADDR_WIDTH - 1 downto 0) := to_unsigned(16, AXI_ADDR_WIDTH);
  constant NUM_BYTES_PER_BLOCK : positive := 64 * 1024;  -- 64 kB
  constant NUM_ITERATIONS      : positive := 60;  -- default SCALING_FACTOR is 100 which results in 60000 iterations

end package;
