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
	constant REG_TEST  : AXIAddressType := 32x"10";
	constant DATA_TEST : AXIDataType    := 32x"01";

	constant REG_VERSION_PROJECT_0 : AXIAddressType := BASE_ADDRESS_VERSION or 32x"0C";
	constant REG_VERSION_PROJECT_1 : AXIAddressType := BASE_ADDRESS_VERSION or 32x"10";
	constant REG_VERSION_PROJECT_2 : AXIAddressType := BASE_ADDRESS_VERSION or 32x"14";
	constant REG_VERSION_PROJECT_3 : AXIAddressType := BASE_ADDRESS_VERSION or 32x"18";
	constant REG_VERSION_PROJECT_4 : AXIAddressType := BASE_ADDRESS_VERSION or 32x"1C";

	constant REG_SETTINGS_BAUDRATE : AXIAddressType := BASE_ADDRESS_SETTING or 32x"00";

	constant REG_GPIO_BUTTONS      : AXIAddressType := BASE_ADDRESS_GPIO or 32x"00";
	constant REG_GPIO_LED          : AXIAddressType := BASE_ADDRESS_GPIO or 32x"04";

	constant REG_HRC_NANOSECONDS_L         : AXIAddressType := BASE_ADDRESS_HRC or 32x"08";
	constant REG_HRC_NANOSECONDS_H         : AXIAddressType := BASE_ADDRESS_HRC or 32x"0C";
	constant REG_HRC_TIME_HMS              : AXIAddressType := BASE_ADDRESS_HRC or 32x"10";
	constant REG_HRC_DATE_YMD              : AXIAddressType := BASE_ADDRESS_HRC or 32x"14";
	constant REG_HRC_NANOSECONDS_TO_LOAD_L : AXIAddressType := BASE_ADDRESS_HRC or 32x"20";
	constant REG_HRC_NANOSECONDS_TO_LOAD_H : AXIAddressType := BASE_ADDRESS_HRC or 32x"24";
	constant REG_HRC_DATETME_TO_LOAD_HMS   : AXIAddressType := BASE_ADDRESS_HRC or 32x"28";
	constant REG_HRC_DATETME_TO_LOAD_YMD   : AXIAddressType := BASE_ADDRESS_HRC or 32x"2C";

	constant REG_UART_RX      : AXIAddressType := BASE_ADDRESS_UART or 32x"00";
	constant REG_UART_TX      : AXIAddressType := BASE_ADDRESS_UART or 32x"04";  -- not used
	constant REG_UART_STATUS  : AXIAddressType := BASE_ADDRESS_UART or 32x"08";  -- not used
	constant REG_UART_CONTROL : AXIAddressType := BASE_ADDRESS_UART or 32x"0C";  -- not used

	constant BLOCK_SIZE : unsigned(AXI_ADDR_WIDTH - 1 downto 0) := to_unsigned(16, AXI_ADDR_WIDTH);
	constant NUM_BYTES_PER_BLOCK : positive := 64 * 1024;  -- 64 kB
	constant NUM_ITERATIONS      : positive := 60;  -- default SCALING_FACTOR is 100 which results in 60000 iterations

	subtype StreamRecType_constr is StreamRecType (
					DataToModel   (CONFIG_DATA_BITS - 1  downto 0),
					DataFromModel (CONFIG_DATA_BITS - 1  downto 0),
					ParamToModel  (1 downto 0),  -- todo: derive from generic
					ParamFromModel(1 downto 0)   -- todo: derive from generic
	);

end package;
