-- =============================================================================
-- Authors:         Patrick Lehmann
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

entity Toplevel is
	port (
		signal Clock_100MHz : in std_logic;
		
		signal GPIO_Button  : in  std_logic_vector(1 downto 0);
		signal GPIO_LED     : out std_logic_vector(1 downto 0)
	);
end entity;

architecture top of Toplevel is

begin
	InnerTop : entity work.Design
		port map (
			Clock  => Clock_100MHz,
			
			Button => GPIO_Button,
			LED    => GPIO_LED
		);

end architecture;
