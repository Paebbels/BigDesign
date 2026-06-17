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
use     PoC.AXI4_Full.all;
use     PoC.axi4stream.all;

library lib_BigDesign;
use     lib_BigDesign.PS_settings_pkg.all;


entity Toplevel is
	port (
		signal Clock_100MHz : in std_logic;

		signal GPIO_Button  : in  std_logic_vector(1 downto 0);
		signal GPIO_LED     : out std_logic_vector(1 downto 0)
	);
end entity;

architecture top of Toplevel is

	signal Subordinate_m2s   : AXI4_A49_D128_I6.Sized_M2S_Vector(0 to NUM_SUBORDINATES - 2);
	signal Subordinate_s2m   : AXI4_A49_D128_I6.Sized_S2M_Vector(0 to NUM_SUBORDINATES - 2);
	signal DMA_StreamIn_m2s  : AXI4S_D32.Sized_M2S := Initialize_axi4stream_M2S(32, Value => '0');
	signal DMA_StreamOut_s2m : AXI4S_D32.Sized_S2M := Initialize_axi4stream_S2M(Value => '0');

begin
	InnerTop : entity work.Design
		port map (
			Clock             => Clock_100MHz,

			Button            => GPIO_Button,
			LED               => GPIO_LED,

			Config_Clk        => open,

			Manager_Clks      => open,

			Subordinate_m2s   => Subordinate_m2s,
			Subordinate_s2m   => Subordinate_s2m,
			Subordinate_Clks  => open,

			DMA_StreamIn_m2s  => DMA_StreamIn_m2s,
			DMA_StreamIn_s2m  => open,
			DMA_StreamOut_m2s => open,
			DMA_StreamOut_s2m => DMA_StreamOut_s2m
		);

end architecture;
