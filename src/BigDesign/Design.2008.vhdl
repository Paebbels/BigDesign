-- =============================================================================
-- Authors:
--   Adrian Weiland
--   Patrick Lehmann
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

library PoC;
use     PoC.vectors.all;
use     PoC.AXI4_Full.all;
use     PoC.AXI4Lite.all;

library lib_BigDesign;
use     lib_BigDesign.PS_settings_pkg.all;


entity Design is
	port (
		signal Clock  : in  std_logic;

		signal Button : in  std_logic_vector(1 downto 0);
		signal LED    : out std_logic_vector(1 downto 0);

		signal Config_Clk : out std_logic;

		signal Manager_Clks  : out std_logic_vector(0 to NUM_MANAGERS - 1);

		signal Subordinate_m2s  : in  T_AXI4_Bus_M2S_Vector;
		signal Subordinate_s2m  : out T_AXI4_Bus_S2M_Vector;
		signal Subordinate_Clks : out std_logic_vector(0 to NUM_SUBORDINATES - 1)
	);
end entity;


architecture rtl of Design is
	-- Clocks
	signal PS_Clock  : std_logic;
	signal PL_Reset  : std_logic;

	signal Clock_50  : std_logic;
	signal Clock_100 : std_logic;
	signal Clock_200 : std_logic;
	signal Clock_300 : std_logic;

	-- Control signals
	signal Config_m2s     : AXI4Lite_A40_D32.Sized_M2S;
	signal Config_s2m     : AXI4Lite_A40_D32.Sized_S2M;

	signal Manager_m2s    : AXI4_A40_D128.Sized_M2S_Vector(0 to NUM_MANAGERS - 1);
	signal Manager_s2m    : AXI4_A40_D128.Sized_S2M_Vector(0 to NUM_MANAGERS - 1);

	-- signal Config_m2s_Stream : ;
	-- signal Config_s2m_Stream : ;
	
	-- signal Config_m2s_vec : T_AXI4STREAM_M2S_VECTOR;
	-- signal Config_s2m_vec : T_AXI4STREAM_M2S_VECTOR;
	-- signal DeMuxControl   : std_logic_vector(0 downto 0) := (others => '0');  -- currently only GPIO (Version Reg, Sampling Reg will be added)

begin

	-- Create clocks (later replaced by MMCM)
	Clock_50  <= PS_Clock;
	Clock_100 <= PS_Clock;
	Clock_200 <= PS_Clock;
	Clock_300 <= PS_Clock;

	Config_Clk       <= Clock_100;
	Manager_Clks     <= (others => Clock_300);
	Subordinate_Clks <= (others => Clock_300);

	BD: entity work.BlockDesign_top
		port map (
			Clock            => PS_Clock,

			Config_m2s       => Config_m2s,
			Config_s2m       => Config_s2m,
			Config_Clk       => Config_Clk,

			Manager_m2s      => Manager_m2s,
			Manager_s2m      => Manager_s2m,
			Manager_Clks     => Manager_Clks,

			Subordinate_m2s  => Subordinate_m2s,
			Subordinate_s2m  => Subordinate_s2m,
			Subordinate_clks => Subordinate_clks
		);

	-- Conv_AXI4L_AXI4S: convert AXI4 Lite to AXI4 Stream

	-- AXI4_DeMux: entity PoC.AXI4Lite_DeMux
		-- port map (
			-- Clock        => PS_Clock,
			-- Reset        => PL_Reset,

			-- DeMuxControl => DeMuxControl,
			-- In_M2S       => Config_m2s,
			-- In_S2M       => Config_s2m,
			-- Out_M2S      => Config_m2s_vec,
			-- Out_S2M      => Config_s2m_vec
		-- );

	blkGPIO : block
		constant CONFIG : T_AXI4_Register_Vector := (
			to_AXI4_Register(Name => "Buttons", Address => 32x"00", RegisterMode => ReadOnly_NotRegistered),
			to_AXI4_Register(Name => "LEDs",    Address => 32x"04", RegisterMode => ReadWrite)
		);

		signal ReadPort  : T_SLVV(0 to 1)(31 downto 0);
		signal WritePort : T_SLVV(0 to 1)(31 downto 0);
	begin
		GPIO: entity PoC.AXI4Lite_Register
			generic map (
				CONFIG => CONFIG
			)
			port map (
				Clock                         => PS_Clock,
				Reset                         => PL_Reset,

				AXI4Lite_m2s                  => Config_m2s,
				AXI4Lite_s2m                  => Config_s2m,
				AXI4Lite_IRQ                  => open,

				RegisterFile_ReadPort         => ReadPort,
				RegisterFile_ReadPort_hit     => open,
				RegisterFile_WritePort        => WritePort,
				RegisterFile_WritePort_hit    => open,
				RegisterFile_WritePort_strobe => open
			);

		WritePort(get_Index("Buttons", CONFIG)) <= 30x"0" & Button;

		LED <= ReadPort(get_Index("LEDs", CONFIG))(1 downto 0);
	end block;
end architecture;
