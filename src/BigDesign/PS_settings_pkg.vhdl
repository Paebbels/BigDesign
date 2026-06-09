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

library PoC;
use     PoC.vectors.all;
use     PoC.physical.all;
use     PoC.AXI4_Full.all;


package PS_settings_pkg is
	----------------------
	------- General ------
	----------------------
	constant NUM_MANAGERS         : positive := 2;
	constant NUM_SUBORDINATES     : positive := 4;

	constant UART_BAUDRATE : BAUD := 921.600 kBd;  -- set in Design and PS_Stub

	----------------------
	----- Bit widths -----
	----------------------
	constant MANAGER_ADDRESS_BITS      : positive := 40;
	constant MANAGER_ID_BITS           : positive := 16;

	constant SUBORDINATE_ADDRESS_BITS  : positive := 49;  -- do not change
	constant SUBORDINATE_ID_BITS       : positive := 6;

	constant MEMORY_MODEL_ADDRESS_BITS : positive := 32;  -- fails for i.e. 40 ("bad pointer ...")

	constant CONFIG_ADDRESS_BITS       : positive := 32;
	constant CONFIG_DATA_BITS          : positive := 32;
	constant DATA_BITS                 : positive := 128;
	constant USER_BITS                 : positive := 16;

	constant AXI_ADDR_WIDTH : integer := 32;
	constant AXI_DATA_WIDTH : integer := 32;
	constant AXI_STRB_WIDTH : integer := AXI_DATA_WIDTH / 8;

	----------------------
	------- Types --------
	----------------------
	subtype AXIAddressType is std_logic_vector(AXI_ADDR_WIDTH - 1 downto 0);
	subtype AXIDataType    is std_logic_vector(AXI_DATA_WIDTH - 1 downto 0);

	----------------------
	------ Packages ------
	----------------------
	package AXI4_A40_D32 is new PoC.AXI4Full_Sized
		generic map (
			ADDRESS_BITS => MANAGER_ADDRESS_BITS,
			DATA_BITS    => CONFIG_DATA_BITS,
			USER_BITS    => USER_BITS,
			ID_BITS      => MANAGER_ID_BITS
		);

	package AXI4Lite_A40_D32 is new PoC.AXI4Lite_Sized
		generic map (
			ADDRESS_BITS => MANAGER_ADDRESS_BITS,
			DATA_BITS    => CONFIG_DATA_BITS
		);

	package AXI4Lite_A32_D32 is new PoC.AXI4Lite_Sized
		generic map (
			ADDRESS_BITS => CONFIG_ADDRESS_BITS,
			DATA_BITS    => CONFIG_DATA_BITS
		);

	package AXI4_A40_D128 is new PoC.AXI4Full_Sized
		generic map (
			ADDRESS_BITS => MANAGER_ADDRESS_BITS,
			DATA_BITS    => DATA_BITS,
			USER_BITS    => USER_BITS,
			ID_BITS      => MANAGER_ID_BITS
		);

	package AXI4_A49_D128_I6 is new PoC.AXI4Full_Sized
		generic map (
			ADDRESS_BITS => SUBORDINATE_ADDRESS_BITS,
			DATA_BITS    => DATA_BITS,
			USER_BITS    => USER_BITS,
			ID_BITS      => SUBORDINATE_ID_BITS
		);

	------------------------
  -- Register addresses --
	------------------------
	constant DEVICE_VERSION_IDX : natural := 0;
	constant DEVICE_SETTING_IDX : natural := 1;
	constant DEVICE_HRC_IDX     : natural := 2;
	constant DEVICE_GPIO_IDX    : natural := 3;
	constant DEVICE_UART_IDX    : natural := 4;
	-- constant DEVICE_I2C_IDX     : natural := 5;
	-- constant DEVICE_SPI_IDX     : natural := 6;
	-- constant DEVICE_AXI_DMA_IDX : natural := 7;

	constant BASE_ADDRESS_VERSION : AXIAddressType := 32x"8000_0000";
	constant BASE_ADDRESS_SETTING : AXIAddressType := 32x"8001_0000";
	constant BASE_ADDRESS_HRC     : AXIAddressType := 32x"8002_0000";
	constant BASE_ADDRESS_GPIO    : AXIAddressType := 32x"8008_0000";
	constant BASE_ADDRESS_UART    : AXIAddressType := 32x"8009_0000";
	-- constant BASE_ADDRESS_I2C     : AXIAddressType := 40x"800A_0000";
	-- constant BASE_ADDRESS_SPI     : AXIAddressType := 40x"800B_0000";
	-- constant BASE_ADDRESS_AXI_DMA : AXIAddressType := 40x"8100_0000";

	constant BASE_ADDRESSES : T_SLUV := (
		DEVICE_VERSION_IDX => unsigned(BASE_ADDRESS_VERSION),
		DEVICE_SETTING_IDX => unsigned(BASE_ADDRESS_SETTING),
		DEVICE_HRC_IDX     => unsigned(BASE_ADDRESS_HRC),
		DEVICE_GPIO_IDX    => unsigned(BASE_ADDRESS_GPIO),
		DEVICE_UART_IDX    => unsigned(BASE_ADDRESS_UART)
	);
	constant BASE_ADDRESSES_MASK : BASE_ADDRESSES'subtype := (BASE_ADDRESSES'range => 32x"8FFF_0000");
end package;
