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
use     PoC.utils.all;
use     PoC.vectors.all;
use     PoC.physical.all;
use     PoC.AXI4_Full.all;


package PS_settings_pkg is
	----------------------
	------- General ------
	----------------------
	constant NUM_MPSOC_MANAGERS     : positive := 2;
	constant NUM_MPSOC_SUBORDINATES : positive := 4;  -- 1 out of 4 available Subordinates is used for DMA input
	constant NUM_SUBORDINATES       : positive := 3;

	constant UART_BAUDRATE   : BAUD         := 921.600 kBd;  -- set in Design and PS_Stub
	constant UART_WIRE_DELAY : delay_length := 9 ns;

	----------------------
	----- Bit widths -----
	----------------------
	constant MANAGER_ADDRESS_BITS      : positive := 40;
	constant MANAGER_ID_BITS           : positive := 16;

	constant SUBORDINATE_ADDRESS_BITS  : positive := 49;  -- do not change
	constant SUBORDINATE_ID_BITS       : positive := 6;

	constant MEMORY_MODEL_ADDRESS_BITS : positive := 32 + 4;  -- fails for i.e. 40 ("bad pointer ...")

	constant CONFIG_ADDRESS_BITS       : positive := 32;
	constant CONFIG_DATA_BITS          : positive := 32;
	constant DATA_BITS                 : positive := 128;
	constant USER_BITS                 : positive := 16;

	constant AXI_ADDR_WIDTH : positive := 32;
	constant AXI_DATA_WIDTH : positive := 32;
	constant AXI_STRB_WIDTH : positive := AXI_DATA_WIDTH / 8;

	constant DMA_AXI_ADDR_WIDTH : positive := 40;

	constant AXI_STREAM_DATA_WIDTH : positive := 32;
	----------------------
	------- Types --------
	----------------------
	subtype AXIAddressType     is std_logic_vector(AXI_ADDR_WIDTH - 1 downto 0);
	subtype AXIDataType        is std_logic_vector(AXI_DATA_WIDTH - 1 downto 0);

	subtype DMA_AXIAddressType is std_logic_vector(DMA_AXI_ADDR_WIDTH - 1 downto 0);

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

	package AXI4S_D32 is new PoC.AXI4Stream_Sized
		generic map (
			DATA_BITS     => AXI_STREAM_DATA_WIDTH,
			USER_BITS     => 1,
			DEST_BITS     => 1,
			ID_BITS       => 1,
			KEEP_BITS     => 4,  -- AXI_STREAM_DATA_WIDTH / 8 (failing for NVC)
			REV_USER_BITS => 1
		);

	------------------------
	-- Register addresses --
	------------------------
	constant DEVICE_VERSION_IDX : natural := 0;
	constant DEVICE_SETTING_IDX : natural := 1;
	constant DEVICE_HRC_IDX     : natural := 2;
	constant DEVICE_GPIO_IDX    : natural := 3;
	constant DEVICE_UART_IDX    : natural := 4;
	constant DEVICE_AXI_DMA_IDX : natural := 5;
	-- constant DEVICE_I2C_IDX     : natural := 6;
	-- constant DEVICE_SPI_IDX     : natural := 7;

	constant BASE_ADDRESS_VERSION : AXIAddressType := 32x"8000_0000";
	constant BASE_ADDRESS_SETTING : AXIAddressType := 32x"8001_0000";
	constant BASE_ADDRESS_HRC     : AXIAddressType := 32x"8002_0000";
	constant BASE_ADDRESS_GPIO    : AXIAddressType := 32x"8008_0000";
	constant BASE_ADDRESS_UART    : AXIAddressType := 32x"8009_0000";
	-- constant BASE_ADDRESS_I2C     : AXIAddressType := 32x"800A_0000";
	-- constant BASE_ADDRESS_SPI     : AXIAddressType := 32x"800B_0000";
	constant BASE_ADDRESS_AXI_DMA : AXIAddressType := 32x"8100_0000";

	constant BASE_ADDRESSES : T_SLUV := (
		DEVICE_VERSION_IDX => unsigned(BASE_ADDRESS_VERSION),
		DEVICE_SETTING_IDX => unsigned(BASE_ADDRESS_SETTING),
		DEVICE_HRC_IDX     => unsigned(BASE_ADDRESS_HRC),
		DEVICE_GPIO_IDX    => unsigned(BASE_ADDRESS_GPIO),
		DEVICE_UART_IDX    => unsigned(BASE_ADDRESS_UART),
		DEVICE_AXI_DMA_IDX => unsigned(BASE_ADDRESS_AXI_DMA)
	);
	constant BASE_ADDRESSES_MASK : BASE_ADDRESSES'subtype := (BASE_ADDRESSES'range => 32x"8FFF_0000");

	-- DMA Demux
	constant DEVICE_DMA_PS8_IDX     : natural := 0;
	constant DEVICE_DMA_PL_DDR4_IDX : natural := 1;

	constant BASE_ADDRESS_PS8     : DMA_AXIAddressType := 40x"0000_0000";
	constant BASE_ADDRESS_PL_DDR4 : DMA_AXIAddressType := 40x"A000_0000";
	constant BASE_ADDRESSES_DMA   : T_SLUV := (
		DEVICE_DMA_PS8_IDX     => unsigned(BASE_ADDRESS_PS8),
		DEVICE_DMA_PL_DDR4_IDX => unsigned(BASE_ADDRESS_PL_DDR4)
	);
	constant BASE_ADDRESSES_DMA_MASK : T_SLUV := (
		DEVICE_DMA_PS8_IDX     => 40x"00_7FFF_FFFF",  -- 2G
		DEVICE_DMA_PL_DDR4_IDX => 40x"00_0FFF_FFFF"   -- 256M
	);

	function resize(input : T_AXI4_Bus_M2S) return target of T_AXI4_Bus_M2S;
	function resize(input : T_AXI4_Bus_S2M) return target of T_AXI4_Bus_S2M;
end package;

package body PS_settings_pkg is
	function resize(input : T_AXI4_Bus_M2S) return target of T_AXI4_Bus_M2S is
		variable res : target;
	begin
		res.AWID     := resize(input.AWID,   res.AWID'length);
		res.AWAddr   := resize(input.AWAddr, res.AWAddr'length);
		res.AWLen    := input.AWLen   ;
		res.AWSize   := input.AWSize  ;
		res.AWBurst  := input.AWBurst ;
		res.AWLock   := input.AWLock  ;
		res.AWQOS    := input.AWQOS   ;
		res.AWRegion := input.AWRegion;
		res.AWUser   := input.AWUser  ;
		res.AWValid  := input.AWValid ;
		res.AWCache  := input.AWCache ;
		res.AWProt   := input.AWProt  ;
		res.WValid   := input.WValid  ;
		res.WLast    := input.WLast   ;
		res.WUser    := input.WUser   ;
		res.WData    := resize(input.WData,  res.WData'length);
		res.WStrb    := resize(input.WStrb,  res.WStrb'length);
		res.BReady   := input.BReady  ;
		res.ARValid  := input.ARValid ;
		res.ARAddr   := resize(input.ARAddr, res.ARAddr'length);
		res.ARCache  := input.ARCache ;
		res.ARProt   := input.ARProt  ;
		res.ARID     := resize(input.ARID,  res.ARID'length);
		res.ARLen    := input.ARLen   ;
		res.ARSize   := input.ARSize  ;
		res.ARBurst  := input.ARBurst ;
		res.ARLock   := input.ARLock  ;
		res.ARQOS    := input.ARQOS   ;
		res.ARRegion := input.ARRegion;
		res.ARUser   := input.ARUser  ;
		res.RReady   := input.RReady  ;
		return res;
	end function;

	function resize(input : T_AXI4_Bus_S2M) return target of T_AXI4_Bus_S2M is
		variable res : target;
	begin
		res.AWReady := input.AWReady;
		res.WReady  := input.WReady ;
		res.BValid  := input.BValid ;
		res.BResp   := input.BResp  ;
		res.BID     := resize(input.BID,  res.BID'length);
		res.BUser   := input.BUser  ;
		res.ARReady := input.ARReady;
		res.RValid  := input.RValid ;
		res.RData   := resize(input.RData, res.RData'length);
		res.RResp   := input.RResp  ;
		res.RID     := resize(input.RID, res.RID'length);
		res.RLast   := input.RLast  ;
		res.RUser   := input.RUser  ;
		return res;
	end function;
end package body;
