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
	constant MEMORY_TEST_WORD_1 : Config_AddressType := 32x"10";  -- random address for memory test
	constant MEMORY_TEST_WORD_2 : Config_AddressType := 32x"20";  -- random address for memory test
	constant MEMORY_TEST_DATA_1 : std_logic_vector(MEMORY_MODEL_DATA_BITS - 1 downto 0) := 128x"01";
	constant MEMORY_TEST_DATA_2 : std_logic_vector(MEMORY_MODEL_DATA_BITS - 1 downto 0) := 128x"0C";

	constant REG_VERSION_PROJECT_0 : Config_AddressType := BASE_ADDRESS_VERSION or 32x"0C";
	constant REG_VERSION_PROJECT_1 : Config_AddressType := BASE_ADDRESS_VERSION or 32x"10";
	constant REG_VERSION_PROJECT_2 : Config_AddressType := BASE_ADDRESS_VERSION or 32x"14";
	constant REG_VERSION_PROJECT_3 : Config_AddressType := BASE_ADDRESS_VERSION or 32x"18";
	constant REG_VERSION_PROJECT_4 : Config_AddressType := BASE_ADDRESS_VERSION or 32x"1C";

	constant REG_SETTINGS_BAUDRATE : Config_AddressType := BASE_ADDRESS_SETTING or 32x"00";

	constant REG_GPIO_BUTTONS      : Config_AddressType := BASE_ADDRESS_GPIO or 32x"00";
	constant REG_GPIO_LED          : Config_AddressType := BASE_ADDRESS_GPIO or 32x"04";

	constant REG_HRC_NANOSECONDS_L         : Config_AddressType := BASE_ADDRESS_HRC or 32x"08";
	constant REG_HRC_NANOSECONDS_H         : Config_AddressType := BASE_ADDRESS_HRC or 32x"0C";
	constant REG_HRC_TIME_HMS              : Config_AddressType := BASE_ADDRESS_HRC or 32x"10";
	constant REG_HRC_DATE_YMD              : Config_AddressType := BASE_ADDRESS_HRC or 32x"14";
	constant REG_HRC_NANOSECONDS_TO_LOAD_L : Config_AddressType := BASE_ADDRESS_HRC or 32x"20";
	constant REG_HRC_NANOSECONDS_TO_LOAD_H : Config_AddressType := BASE_ADDRESS_HRC or 32x"24";
	constant REG_HRC_DATETME_TO_LOAD_HMS   : Config_AddressType := BASE_ADDRESS_HRC or 32x"28";
	constant REG_HRC_DATETME_TO_LOAD_YMD   : Config_AddressType := BASE_ADDRESS_HRC or 32x"2C";

	constant REG_UART_RX      : Config_AddressType := BASE_ADDRESS_UART or 32x"00";
	constant REG_UART_TX      : Config_AddressType := BASE_ADDRESS_UART or 32x"04";  -- not used
	constant REG_UART_STATUS  : Config_AddressType := BASE_ADDRESS_UART or 32x"08";  -- not used
	constant REG_UART_CONTROL : Config_AddressType := BASE_ADDRESS_UART or 32x"0C";  -- not used

	constant BLOCK_SIZE : unsigned(MEMORY_MODEL_ADDRESS_BITS - 1 downto 0) := to_unsigned(16, MEMORY_MODEL_ADDRESS_BITS);
	constant NUM_BYTES_PER_BLOCK : positive := 64 * 1024;  -- 64 kB
	constant NUM_ITERATIONS      : positive := 60;  -- default SCALING_FACTOR is 100 which results in 60000 iterations

end package;
