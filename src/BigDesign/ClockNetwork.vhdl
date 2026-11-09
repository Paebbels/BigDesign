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
use     IEEE.STD_LOGIC_1164.all;
use     IEEE.NUMERIC_STD.all;

library UNISIM;
use     UNISIM.VCOMPONENTS.all;

library PoC;
use     PoC.utils.all;
use     PoC.physical.all;
use     PoC.components.all;


entity ClockNetwork is
	generic (
		CLOCK_IN_FREQ      : FREQ := 100 MHz
	);
	port (
		ClockIn            : in  std_logic;

		ClockNetwork_Reset : in  std_logic;

		Control_Clock_100  : out std_logic;

		Clock_100          : out std_logic;
		Clock_125          : out std_logic;
		Clock_200          : out std_logic;
		Clock_250          : out std_logic;
		Clock_500          : out std_logic;

		Reset_100          : out std_logic;
		Reset_125          : out std_logic;
		Reset_200          : out std_logic;
		Reset_250          : out std_logic;
		Reset_500          : out std_logic
	);
end entity;


architecture rtl of ClockNetwork is

	signal ClockNetwork_Reset_sync : std_logic;
	signal MMCM_Reset              : std_logic := '0';
	signal MMCM_ResetClear         : std_logic;

	signal MMCM_Locked_async       : std_logic;
	signal MMCM_Locked             : std_logic;

	signal Control_Clock           : std_logic;
	signal Control_Clock_BUFG      : std_logic;

	signal MMCM_Clock_100          : std_logic;
	signal MMCM_Clock_125          : std_logic;
	signal MMCM_Clock_200          : std_logic;
	signal MMCM_Clock_250          : std_logic;
	signal MMCM_Clock_500          : std_logic;

	signal MMCM_CLKFBOUT           : std_logic;
	signal MMCM_CLKFBOUT_BUFG      : std_logic;

begin

	-- ==================================================================
	-- ResetControl
	-- ==================================================================

	syncControlClock: entity PoC.sync_Bits_Xilinx
	generic map (
		BITS      => 2
	)
	port map (
		Clock     => Control_Clock,
		Input(0)  => ClockNetwork_Reset,
		Input(1)  => MMCM_Locked_async,
		Output(0) => ClockNetwork_Reset_sync,
		Output(1) => MMCM_Locked
	);

	MMCM_ResetClear <= ClockNetwork_Reset_sync nor MMCM_Locked;
	MMCM_Reset      <= ffrs(q => MMCM_Reset, rst => MMCM_ResetClear, set => ClockNetwork_Reset_sync) when rising_edge(Control_Clock);


	-- ==================================================================
	-- Clock Buffers
	-- ==================================================================

	BUFG_Control_Clock : BUFG
	port map (
		I => ClockIn,
		O => Control_Clock_BUFG
	);

	Control_Clock <= Control_Clock_BUFG;


	-- MMCM Feedback Buffer
	BUFG_MMCM_FB : BUFG
	port map (
		I => MMCM_CLKFBOUT,
		O => MMCM_CLKFBOUT_BUFG
	);


	-- ==================================================================
	-- MMCM
	--
	-- CLKIN = 100 MHz
	-- FVCO  = 100 MHz * 10 = 1000 MHz
	--
	-- CLKOUT0 = 1000 / 10 = 100 MHz
	-- CLKOUT1 = 1000 /  8 = 125 MHz
	-- CLKOUT2 = 1000 /  5 = 200 MHz
	-- CLKOUT3 = 1000 /  4 = 250 MHz
	-- CLKOUT4 = 1000 /  2 = 500 MHz
	-- ==================================================================

	System_MMCM : MMCME4_ADV
	generic map (
		BANDWIDTH               => "LOW",

		CLKFBOUT_MULT_F         => 1000.0e6 / real(CLOCK_IN_FREQ / Hz),
		CLKFBOUT_PHASE          => 0.0,
		CLKFBOUT_USE_FINE_PS    => "FALSE",

		CLKIN1_PERIOD           => 1.0e9 / (CLOCK_IN_FREQ / Hz),
		CLKIN2_PERIOD           => 1.0e9 / (CLOCK_IN_FREQ / Hz),

		DIVCLK_DIVIDE           => 1,

		
		-- 100 MHz
		CLKOUT0_DIVIDE_F        => 10.0,
		CLKOUT0_DUTY_CYCLE      => 0.500,
		CLKOUT0_PHASE           => 0.0,
		CLKOUT0_USE_FINE_PS     => "FALSE",

		-- 125 MHz
		CLKOUT1_DIVIDE          => 8,
		CLKOUT1_DUTY_CYCLE      => 0.500,
		CLKOUT1_PHASE           => 0.0,
		CLKOUT1_USE_FINE_PS     => "FALSE",

		-- 200 MHz
		CLKOUT2_DIVIDE          => 5,
		CLKOUT2_DUTY_CYCLE      => 0.500,
		CLKOUT2_PHASE           => 0.0,
		CLKOUT2_USE_FINE_PS     => "FALSE",

		-- 250 MHz
		CLKOUT3_DIVIDE          => 4,
		CLKOUT3_DUTY_CYCLE      => 0.500,
		CLKOUT3_PHASE           => 0.0,
		CLKOUT3_USE_FINE_PS     => "FALSE",

		-- 500 MHz
		CLKOUT4_CASCADE         => "FALSE",
		CLKOUT4_DIVIDE          => 2,
		CLKOUT4_DUTY_CYCLE      => 0.500,
		CLKOUT4_PHASE           => 0.0,
		CLKOUT4_USE_FINE_PS     => "FALSE",

		COMPENSATION            => "AUTO",

		REF_JITTER1             => 0.00048,
		REF_JITTER2             => 0.00048,

		STARTUP_WAIT            => "FALSE"
	)
	port map (
		RST             => MMCM_Reset,

		CDDCDONE        => open,

		CLKFBOUT        => MMCM_CLKFBOUT,
		CLKFBOUTB       => open,

		CLKFBSTOPPED    => open,
		CLKINSTOPPED    => open,

		CLKOUT0         => MMCM_Clock_100,
		CLKOUT0B        => open,

		CLKOUT1         => MMCM_Clock_125,
		CLKOUT1B        => open,

		CLKOUT2         => MMCM_Clock_200,
		CLKOUT2B        => open,

		CLKOUT3         => MMCM_Clock_250,
		CLKOUT3B        => open,

		CLKOUT4         => MMCM_Clock_500,

		CLKOUT5         => open,
		CLKOUT6         => open,

		DO              => open,
		DRDY            => open,

		LOCKED          => MMCM_Locked_async,
		PSDONE          => open,

		CDDCREQ         => '0',

		CLKFBIN         => MMCM_CLKFBOUT_BUFG,

		CLKIN1          => ClockIn,
		CLKIN2          => ClockIn,
		CLKINSEL        => '1',

		DADDR           => "0000000",
		DCLK            => '0',
		DEN             => '0',
		DI              => x"0000",
		DWE             => '0',

		PSCLK           => '0',
		PSEN            => '0',
		PSINCDEC        => '0',

		PWRDWN          => '0'
	);


	-- ==================================================================
	-- Outputs
	-- ==================================================================

	Control_Clock_100 <= Control_Clock_BUFG;

	Clock_100         <= MMCM_Clock_100;
	Clock_125         <= MMCM_Clock_125;
	Clock_200         <= MMCM_Clock_200;
	Clock_250         <= MMCM_Clock_250;
	Clock_500         <= MMCM_Clock_500;


	-- ==================================================================
	-- Synchronize LOCKED into clock domains
	-- ==================================================================
	--sync_Resets : entity PoC.sync_Resets
	--generic map (
	--	NUM_CLOCKS       => 5,
	--	REGISTER_OUTPUT  => TRUE
	--)
	--port map (
	--	Clocks(0)        => MMCM_Clock_100,
	--	Clocks(1)        => MMCM_Clock_125,
	--	Clocks(2)        => MMCM_Clock_200,
	--	Clocks(3)        => MMCM_Clock_250,
	--	Clocks(4)        => MMCM_Clock_500,
	--	Input_Reset      => ClockNetwork_Reset or not MMCM_Locked,
	--	Output_Resets(0) => Reset_100,
	--	Output_Resets(1) => Reset_125,
	--	Output_Resets(2) => Reset_200,
	--	Output_Resets(3) => Reset_250,
	--	Output_Resets(4) => Reset_500
	--);

	sync_Reset_100 : entity PoC.sync_Reset
	port map (
		Clock  => MMCM_Clock_100,
		Input  => ClockNetwork_Reset or not MMCM_Locked,
		Output => Reset_100
	);

	sync_Reset_125 : entity PoC.sync_Reset
	port map (
		Clock  => MMCM_Clock_125,
		Input  => ClockNetwork_Reset or not MMCM_Locked,
		Output => Reset_125
	);

	sync_Reset_200 : entity PoC.sync_Reset
	port map (
		Clock  => MMCM_Clock_200,
		Input  => ClockNetwork_Reset or not MMCM_Locked,
		Output => Reset_200
	);

	sync_Reset_250 : entity PoC.sync_Reset
	port map (
		Clock  => MMCM_Clock_250,
		Input  => ClockNetwork_Reset or not MMCM_Locked,
		Output => Reset_250
	);

	sync_Reset_500 : entity PoC.sync_Reset
	port map (
		Clock  => MMCM_Clock_500,
		Input  => ClockNetwork_Reset or not MMCM_Locked,
		Output => Reset_500
	);
end architecture;
