-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- =============================================================================
-- Authors:				 	Stefan Unrein
--
-- Entity:.
--
-- Description:
-- -------------------------------------
--
-- License:
-- =============================================================================
-- Copyright 2025-2025 The PoC-Library Authors
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--        http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS of ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- =============================================================================

library IEEE;
use			IEEE.std_logic_1164.all;
use			IEEE.numeric_std.all;

library Interfaces;
use     Interfaces.Axi4Common.all;
use     Interfaces.Axi4.all;
use     Interfaces.Axi4Lite.all;

use			work.utils.all;
use			work.vectors.all;
use			work.components.all;
use			work.axi4_Full.all;
use			work.axi4Lite.all;


entity AXI4_to_AXI4Lite is
	generic (
		RESPONSE_FIFO_DEPTH : positive := 16 --Using SRL16E, depth is maximum 16
	);
	port (
		Clock             : in  std_logic;
		Reset             : in  std_logic;
		-- IN Port
		Input             : view Axi4_SubordinateView;
		Output            : view Axi4Lite_ManagerView
	);
end entity;


architecture rtl of AXI4_to_AXI4Lite is
	signal Response_B_fifo_ful  : std_logic;
	signal Response_R_fifo_ful  : std_logic;

begin
	Output.WriteAddress.Valid     <= Input.WriteAddress.Valid and not Response_B_fifo_ful;
	Output.WriteAddress.Address      <= resize(Input.WriteAddress.Address, Output.WriteAddress.Address'length) ;
	Output.WriteAddress.Cache     <= Input.WriteAddress.Cache;
	Output.WriteAddress.Protect      <= Input.WriteAddress.Protect ;
	Output.WriteData.Valid      <= Input.WriteData.Valid ;
	Output.WriteData.Data       <= Input.WriteData.Data;
	Output.WriteData.Strobe       <= Input.WriteData.Strobe;
	Output.WriteResponse.Ready      <= Input.WriteResponse.Ready ;
	Output.ReadAddress.Valid     <= Input.ReadAddress.Valid and not Response_R_fifo_ful;
	Output.ReadAddress.Address      <= resize(Input.ReadAddress.Address, Output.ReadAddress.Address'length) ;
	Output.ReadAddress.Cache     <= Input.ReadAddress.Cache;
	Output.ReadAddress.Protect      <= Input.ReadAddress.Protect ;
	Output.ReadData.Ready      <= Input.ReadData.Ready ;


	Input.WriteAddress.Ready     <= Output.WriteAddress.Ready and not Response_B_fifo_ful;
	Input.WriteData.Ready      <= Output.WriteData.Ready ;
	Input.WriteResponse.Valid      <= Output.WriteResponse.Valid ;
	Input.WriteResponse.Response       <= Output.WriteResponse.Response  ;
	Input.ReadAddress.Ready     <= Output.ReadAddress.Ready and not Response_R_fifo_ful;
	Input.ReadData.Valid      <= Output.ReadData.Valid ;
	Input.ReadData.Data       <= Output.ReadData.Data;
	Input.ReadData.Response       <= Output.ReadData.Response  ;
	Input.ReadData.Last       <= '1';
	-- WORKAROUND:
	--  Tool: NVC 1.15.x
	--  NVC doesn't support inference of others through unconstrained port of type record.
	Input.WriteResponse.User(Input.WriteResponse.User'range) <= (others => '0');
	Input.ReadData.User(Input.ReadData.User'range) <= (others => '0');

	Response_R_fifo : entity work.fifo_shift
		generic map(
			D_BITS    => Input.WriteAddress.ID'length,
			MIN_DEPTH => RESPONSE_FIFO_DEPTH
		)
		port map(
			-- Global Control
			clk => Clock,
			rst => Reset,

			-- Writing Interface
			put => Input.ReadAddress.Valid and Output.ReadAddress.Ready and not Response_R_fifo_ful,
			din => std_logic_vector(Input.ReadAddress.ID),
			ful => Response_R_fifo_ful,

			-- Reading Interface
			got  => Output.ReadData.Valid and Input.ReadData.Ready,
			ID_Type(dout) => Input.ReadData.ID,
			vld  => open
		);

	Response_B_fifo : entity work.fifo_shift
		generic map(
			D_BITS    => Input.WriteAddress.ID'length,
			MIN_DEPTH => RESPONSE_FIFO_DEPTH
		)
		port map(
			-- Global Control
			clk => Clock,
			rst => Reset,

			-- Writing Interface
			put => Input.WriteAddress.Valid and Output.WriteAddress.Ready and not Response_B_fifo_ful,
			din => std_logic_vector(Input.WriteAddress.ID),
			ful => Response_B_fifo_ful,

			-- Reading Interface
			got  => Output.WriteResponse.Valid and Input.WriteResponse.Ready,
			ID_Type(dout) => Input.WriteResponse.ID,
			vld  => open
		);
end architecture;
