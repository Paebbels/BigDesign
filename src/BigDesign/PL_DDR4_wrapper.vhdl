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

library PoC;
use     PoC.AXI4.all;

library lib_BigDesign;
use     lib_BigDesign.PS_settings_pkg.all;


entity PL_DDR4_wrapper is
	port (
		Clock    : in std_logic;
		Reset    : in std_logic;

		Data_m2s : in  AXI4_A40_D128.Sized_M2S;
		Data_s2m : out AXI4_A40_D128.Sized_S2M
	);
end entity;

architecture rtl of PL_DDR4_wrapper is
begin
	Sink : entity PoC.axi4_Sink
		port map(
			Clock    => Clock,
			Reset    => Reset,
			AXI4_M2S => Data_m2s,
			AXI4_S2M => Data_s2m
		);
end architecture;
