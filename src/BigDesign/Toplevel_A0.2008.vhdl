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


entity Toplevel is
	port (
		signal Clock_100MHz : in std_logic;

		signal GPIO_Button  : in  std_logic_vector(1 downto 0);
		signal GPIO_LED     : out std_logic_vector(1 downto 0)
	);
end entity;

architecture top of Toplevel is
	package AXI4_A49_D128_I6 is new PoC.AXI4Full_Sized
		generic map (
			ADDRESS_BITS => 49,
			DATA_BITS    => 128,
			USER_BITS    => 16,
			ID_BITS      => 6
		);

	signal Subordinate_m2s : AXI4_A49_D128_I6.Sized_M2S_Vector(0 to 3);
	signal Subordinate_s2m : AXI4_A49_D128_I6.Sized_S2M_Vector(0 to 3);

begin
	InnerTop : entity work.Design
		port map (
			Clock  => Clock_100MHz,

			Button => GPIO_Button,
			LED    => GPIO_LED,

			Subordinate_m2s => Subordinate_m2s,
			Subordinate_s2m => Subordinate_s2m
		);

end architecture;
