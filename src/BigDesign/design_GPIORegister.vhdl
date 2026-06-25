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
use     PoC.AXI4Lite.all;

entity design_GPIORegister is
	port (
		Clock        : in std_logic;
		Reset        : in std_logic;
		AXI4Lite_M2S : in  T_AXI4LITE_BUS_M2S;
		AXI4Lite_S2M : out T_AXI4LITE_BUS_S2M;

		Button       : in std_logic_vector(1 downto 0);
		LED          : out std_logic_vector(1 downto 0)
	);
end entity;

architecture rtl of design_GPIORegister is
	constant CONFIG : T_AXI4_Register_Vector := (
		to_AXI4_Register(Name => "Buttons", Address => 32x"00", RegisterMode => ReadOnly_NotRegistered),
		to_AXI4_Register(Name => "LEDs",    Address => 32x"04", RegisterMode => ReadWrite)
	);

	signal ReadPort  : T_SLVV(0 to CONFIG'length - 1)(31 downto 0);
	signal WritePort : T_SLVV(0 to CONFIG'length - 1)(31 downto 0);
begin
	Reg: entity PoC.AXI4Lite_Register
		generic map (
			CONFIG => CONFIG
		)
		port map (
			Clock                         => Clock,
			Reset                         => Reset,

			AXI4Lite_m2s                  => AXI4Lite_m2s,
			AXI4Lite_s2m                  => AXI4Lite_s2m,
			AXI4Lite_IRQ                  => open,

			RegisterFile_ReadPort         => ReadPort,
			RegisterFile_ReadPort_hit     => open,
			RegisterFile_WritePort        => WritePort,
			RegisterFile_WritePort_hit    => open,
			RegisterFile_WritePort_strobe => open
		);

	WritePort(get_Index("Buttons", CONFIG)) <= 30x"0" & Button;

	LED <= ReadPort(get_Index("LEDs", CONFIG))(1 downto 0);
end architecture;
