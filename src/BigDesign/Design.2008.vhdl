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
use     PoC.physical.all;
use     PoC.AXI4_Full.all;
use     PoC.AXI4Lite.all;

library lib_BigDesign;
use     lib_BigDesign.PS_settings_pkg.all;


entity Design is
	port (
		signal Clock  : in  std_logic;

		signal Button  : in  std_logic_vector(1 downto 0);
		signal LED     : out std_logic_vector(1 downto 0);

		signal Config_Clk : out std_logic;

		signal Manager_Clks  : out std_logic_vector(0 to NUM_MPSOC_MANAGERS - 1);

		signal Subordinate_m2s  : in  T_AXI4_Bus_M2S_Vector;
		signal Subordinate_s2m  : out T_AXI4_Bus_S2M_Vector;
		signal Subordinate_Clks : out std_logic_vector(0 to NUM_SUBORDINATES - 1);

		signal DMA_StreamIn_m2s  : in  AXI4S_D32.Sized_M2S;
		signal DMA_StreamIn_s2m  : out AXI4S_D32.Sized_S2M;
		signal DMA_StreamOut_m2s : out AXI4S_D32.Sized_M2S;
		signal DMA_StreamOut_s2m : in  AXI4S_D32.Sized_S2M
	);
end entity;


architecture rtl of Design is
	constant LED_COUNT     : positive := 2;
	constant BUTTON_COUNT  : positive := 2;
	constant AXI_FREQUENCY : FREQ     := 50 MHz;

	-- Clocks
	signal PS_Clock  : std_logic;
	signal PL_Reset  : std_logic := '0';

	signal Clock_50  : std_logic;
	signal Clock_100 : std_logic;
	signal Clock_200 : std_logic;
	signal Clock_300 : std_logic;

	-- Control signals
	signal Config_m2s  : AXI4Lite_A32_D32.Sized_M2S;
	signal Config_s2m  : AXI4Lite_A32_D32.Sized_S2M;

	signal MPSoC_Manager_m2s : AXI4_A40_D128.Sized_M2S_Vector(0 to NUM_MPSOC_MANAGERS - 1);
	signal MPSoC_Manager_s2m : AXI4_A40_D128.Sized_S2M_Vector(0 to NUM_MPSOC_MANAGERS - 1);

	signal MPSoC_subordinate_m2s  : AXI4_A49_D128_I6.Sized_M2S_Vector(0 to NUM_MPSOC_SUBORDINATES - 1);
	signal MPSoC_subordinate_s2m  : AXI4_A49_D128_I6.Sized_S2M_Vector(0 to NUM_MPSOC_SUBORDINATES - 1);
	signal MPSoC_Subordinate_clks : std_logic_vector(0 to NUM_MPSOC_SUBORDINATES - 1);

	signal BD_UART_TX   : std_logic;
	signal BD_UART_TX_d : std_logic := '1';
	signal UART_TX      : std_logic;
	signal UART_TX_d    : std_logic := '1';

	-- DMA
	signal DMA_Config_m2s    : AXI4Lite_A32_D32.Sized_M2S;
	signal DMA_Config_s2m    : AXI4Lite_A32_D32.Sized_S2M;
	signal DMA_DeMux_Out_m2s : AXI4_A40_D128.Sized_M2S_Vector(BASE_ADDRESSES_DMA'range);
	signal DMA_DeMux_Out_s2m : AXI4_A40_D128.Sized_S2M_Vector(BASE_ADDRESSES_DMA'range);

	-- PL-DDR4
	signal PL_DDR4_In_m2s : AXI4_A49_D128_I6.Sized_M2S_Vector(0 to 1);
	signal PL_DDR4_In_s2m : AXI4_A49_D128_I6.Sized_S2M_Vector(0 to 1);

begin

	-- Create clocks (later replaced by MMCM)
	Clock_50  <= PS_Clock;
	Clock_100 <= PS_Clock;
	Clock_200 <= PS_Clock;
	Clock_300 <= PS_Clock;

	Config_Clk             <= Clock_100;
	Manager_Clks           <= (others => Clock_300);
	Subordinate_Clks       <= (others => Clock_300);
	MPSoC_Subordinate_clks <= (others => Clock_300);

	PL_DDR4_In_m2s(0)    <= resize(MPSoC_Manager_m2s(0));
	MPSoC_Manager_s2m(0) <= resize(PL_DDR4_In_s2m(0));

	MPSoC_Subordinate_m2s(0 to NUM_SUBORDINATES - 1)  <= Subordinate_m2s;
	Subordinate_s2m                                   <= MPSoC_Subordinate_s2m(0 to NUM_SUBORDINATES - 1);
	MPSoC_Subordinate_m2s(NUM_MPSOC_SUBORDINATES - 1) <= resize(DMA_DeMux_Out_m2s(DEVICE_DMA_PS8_IDX));
	DMA_DeMux_Out_s2m(DEVICE_DMA_PS8_IDX)             <= resize(MPSoC_Subordinate_s2m(NUM_MPSOC_SUBORDINATES - 1));

--	UART_TX_d <= UART_TX'delayed(UART_WIRE_DELAY);  -- unsynthesizable
	UART_TX_d <= transport UART_TX after UART_WIRE_DELAY;
	BD: entity work.BlockDesign_top
		port map (
			Clock            => PS_Clock,

			Config_m2s       => Config_m2s,
			Config_s2m       => Config_s2m,
			Config_Clk       => Config_Clk,

			Manager_m2s      => MPSoC_Manager_m2s,
			Manager_s2m      => MPSoC_Manager_s2m,
			Manager_Clks     => Manager_Clks,

			Subordinate_m2s  => MPSoC_Subordinate_m2s,
			Subordinate_s2m  => MPSoC_Subordinate_s2m,
			Subordinate_clks => MPSoC_Subordinate_clks,

			UART_TX          => BD_UART_TX,
			UART_RX          => UART_TX
		);

	Demux_blk : block
		signal DeMux_Out_m2s : AXI4Lite_A32_D32.Sized_M2S_vector(BASE_ADDRESSES'range);
		signal DeMux_Out_s2m : AXI4Lite_A32_D32.Sized_S2M_vector(BASE_ADDRESSES'range);
	begin
		AXI4L_DeMux: entity PoC.AXI4Lite_DeMux
			generic map (
				BASE_ADDRESS      => BASE_ADDRESSES,
				BASE_ADDRESS_MASK => BASE_ADDRESSES_MASK,
				PIPELINE_IN       => 0,
				PIPELINE_OUT      => (BASE_ADDRESSES'range => 0)
			)
			port map (
				Clock        => Clock_100,
				Reset        => PL_Reset,

				In_M2S       => Config_m2s,
				In_S2M       => Config_s2m,

				Out_M2S      => DeMux_Out_m2s,
				Out_S2M      => DeMux_Out_s2m
			);

		-------------
		-- Devices --
		-------------
		Version: entity PoC.AXI4Lite_GitVersionRegister
			generic map (
				VERSION_FILE_NAME => "./temp/GitVersion.mem",
				WRITE_FILE_NAME   => "",  --"./gen/Version_Register.csv",
				INCLUDE_XIL_DNA   => FALSE,  -- disabled because of NVC / GHDL
				USER_ID           => (others => '0')
			)
			port map (
				Clock        => Clock_100,
				Reset        => PL_Reset,
				AXI4Lite_m2s => DeMux_Out_m2s(DEVICE_VERSION_IDX),
				AXI4Lite_s2m => DeMux_Out_s2m(DEVICE_VERSION_IDX),
				Version      => open
			);

		Settings : entity work.design_SettingsRegister
			generic map (
				UART_BAUDRATE => UART_BAUDRATE
			)
			port map (
				Clock        => Clock_100,
				Reset        => PL_Reset,
				AXI4Lite_M2S => DeMux_Out_m2s(DEVICE_SETTING_IDX),
				AXI4Lite_S2M => DeMux_Out_s2m(DEVICE_SETTING_IDX)
			);

		HRC: entity PoC.AXI4Lite_HighResolutionClock
			generic map (
				CLOCK_FREQUENCY => AXI_FREQUENCY,
				USE_CDC         => FALSE
			)
			port map (
				Clock           => Clock_100,
				Reset           => PL_Reset,
				AXI4Lite_Clock  => Clock_100,
				AXI4Lite_Reset  => PL_Reset,

				AXI4Lite_m2s    => DeMux_Out_m2s(DEVICE_HRC_IDX),
				AXI4Lite_s2m    => DeMux_Out_s2m(DEVICE_HRC_IDX),

				Nanoseconds     => open,
				Datetime        => open
			);

		GPIO : entity work.design_GPIORegister
			port map (
				Clock        => Clock_100,
				Reset        => PL_Reset,
				AXI4Lite_M2S => DeMux_Out_m2s(DEVICE_GPIO_IDX),
				AXI4Lite_S2M => DeMux_Out_s2m(DEVICE_GPIO_IDX),

				Button       => Button,
				LED          => LED
			);

--		BD_UART_TX_d <= BD_UART_TX'delayed(UART_WIRE_DELAY);  -- unsynthesizable
		BD_UART_TX_d <= transport BD_UART_TX after UART_WIRE_DELAY;
		UART: entity PoC.AXI4Lite_UART
			generic map (
				CLOCK_FREQ    => AXI_FREQUENCY,
				BAUDRATE      => UART_BAUDRATE
			)
			port map (
				Clock         => Clock_100,
				Reset         => PL_Reset,

				AXI4Lite_m2s  => DeMux_Out_m2s(DEVICE_UART_IDX),
				AXI4Lite_s2m  => DeMux_Out_s2m(DEVICE_UART_IDX),
				AXI4Lite_irq  => open,

				UART_TX       => UART_TX,
				UART_RX       => BD_UART_TX,
				UART_RTS      => open,
				UART_CTS      => 'U'
			);

		DMA_Config_m2s                    <= DeMux_Out_m2s(DEVICE_AXI_DMA_IDX);
		DeMux_Out_s2m(DEVICE_AXI_DMA_IDX) <= DMA_Config_s2m;
	end block;

	Mux_blk : block
		signal DMA_SG_m2s : AXI4_A40_D32.Sized_M2S;
		signal DMA_SG_s2m : AXI4_A40_D32.Sized_S2M;

		signal Mux_In_m2s : AXI4_A40_D128.Sized_M2S_vector(0 to 1);
		signal Mux_In_s2m : AXI4_A40_D128.Sized_S2M_vector(0 to 1);

		signal Mux_Out_m2s : AXI4_A40_D128.Sized_M2S;
		signal Mux_Out_s2m : AXI4_A40_D128.Sized_S2M;
	begin
		-- DMA
		DMA_wrapper: entity work.DMA_wrapper
			port map (
				Clock             => Clock_100,
				Reset             => PL_Reset,

				-- Config
				AXI4Lite_m2s      => DMA_Config_m2s,
				AXI4Lite_s2m      => DMA_Config_s2m,
				AXI4Lite_tx_irq   => open,
				AXI4Lite_rx_irq   => open,

				-- (S2MM, MM2S), SG
				Data_m2s          => Mux_In_m2s(0),
				Data_s2m          => Mux_In_s2m(0),
				ScatterGather_m2s => DMA_SG_m2s,
				ScatterGather_s2m => DMA_SG_s2m,

				-- Transmitter / Receiver
				StreamIn_m2s      => DMA_StreamIn_m2s,
				StreamIn_s2m      => DMA_StreamIn_s2m,
				StreamOut_m2s     => DMA_StreamOut_m2s,
				StreamOut_s2m     => DMA_StreamOut_s2m
			);

		Mux_In_m2s(1) <= resize(DMA_SG_m2s);
		DMA_SG_s2m    <= resize(Mux_In_s2m(1));

		AXI4_Mux: entity PoC.AXI4_Mux
			generic map (
				PIPELINE_IN            => (Mux_In_m2s'range => 1),
				PIPELINE_OUT           => 1,
				NUM_OUTSTANDING_READS  => 16, -- if zero, use full ID width (2**ID)
				NUM_OUTSTANDING_WRITES => 16  -- if zero, use full ID width (2**ID)
			)
			port map (
				Clock        => Clock_100,
				Reset        => PL_Reset,

				In_M2S       => Mux_In_m2s,
				In_S2M       => Mux_In_s2m,

				Out_M2S      => Mux_Out_m2s,
				Out_S2M      => Mux_Out_s2m
			);

		AXI4_DeMux: entity PoC.AXI4_DeMux
			generic map (
				BASE_ADDRESS           => BASE_ADDRESSES_DMA,
				BASE_ADDRESS_MASK      => BASE_ADDRESSES_DMA_MASK,
				PIPELINE_IN            =>  1,
				PIPELINE_OUT           => (BASE_ADDRESSES_DMA'range => 1),
				NUM_OUTSTANDING_READS  => 16, -- if zero, use full ID width (2**ID)
				NUM_OUTSTANDING_WRITES => 16  -- if zero, use full ID width (2**ID)
			)
			port map (
				Clock        => Clock_100,
				Reset        => PL_Reset,

				In_M2S       => Mux_Out_m2s,
				In_S2M       => Mux_Out_s2m,

				Out_M2S      => DMA_DeMux_Out_m2s,
				Out_S2M      => DMA_DeMux_Out_s2m
			);

		-- output goes to
		--   (1) Mux connected to PL-DDR
		PL_DDR4_In_m2s(1)                         <= resize(DMA_DeMux_Out_m2s(DEVICE_DMA_PL_DDR4_IDX));
		DMA_DeMux_Out_s2m(DEVICE_DMA_PL_DDR4_IDX) <= resize(PL_DDR4_In_s2m(1));
		--   (2) PS8 block
	end block;

	PL_DDR4_blk : block
		signal Mux_Out_m2s : AXI4_A49_D128_I6.Sized_M2S;
		signal Mux_Out_s2m : AXI4_A49_D128_I6.Sized_S2M;

		signal Data_m2s    : AXI4_A40_D128.Sized_M2S;
		signal Data_s2m    : AXI4_A40_D128.Sized_S2M;
	begin
		AXI4_Mux: entity PoC.AXI4_Mux
			generic map (
				PIPELINE_IN  => (PL_DDR4_In_m2s'range => 0),
				PIPELINE_OUT => 0
			)
			port map (
				Clock        => Clock_100,
				Reset        => PL_Reset,

				In_M2S       => PL_DDR4_In_m2s,
				In_S2M       => PL_DDR4_In_s2m,

				Out_M2S      => Mux_Out_m2s,
				Out_S2M      => Mux_Out_s2m
			);

		Data_m2s    <= resize(Mux_Out_m2s);
		Mux_Out_s2m <= resize(Data_s2m);

		PL_DDR4: entity work.PL_DDR4_wrapper
			port map (
				Clock        => Clock_100,
				Reset        => PL_Reset,

				Data_m2s     => Data_m2s,
				Data_s2m     => Data_s2m
			);
	end block;

end architecture;
