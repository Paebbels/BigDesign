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
use     PoC.AXI4_Full.all;
use     PoC.AXI4_OSVVM.all;
use     PoC.UART.all;
use     PoC.physical.all;

library OSVVM_Common ;
context OSVVM_Common.OsvvmCommonContext ;

library OSVVM_AXI4;
use     OSVVM_AXI4.Axi4InterfacePkg.all ;

library OSVVM_UART;
context OSVVM_UART.UartContext;

library lib_BigDesign;
use     lib_BigDesign.PS_settings_pkg.all;


entity BigDesign_TestHarness is
	generic (
		PATTERN        : string := "1";
		SCALING_FACTOR : string := "100"
	);
end entity;

architecture TestHarness of BigDesign_TestHarness is
	constant CLOCK_FREQ   : FREQ := 100 MHz;
	constant CLOCK_PERIOD : time := to_time(CLOCK_FREQ);

	signal Clock_100MHz : std_logic := '1';
	signal GPIO_Button  : std_logic_vector(1 downto 0);
	signal GPIO_LED     : std_logic_vector(1 downto 0);

	signal Config_Clk   : std_logic;
	signal Manager_Clks : std_logic_vector(0 to NUM_MPSOC_MANAGERS - 1);

	signal Subordinate_m2s  : AXI4_A49_D128_I6.Sized_M2S_Vector(0 to NUM_SUBORDINATES - 1);
	signal Subordinate_s2m  : AXI4_A49_D128_I6.Sized_S2M_Vector(0 to NUM_SUBORDINATES - 1);
	signal Subordinate_Clks : std_logic_vector(0 to NUM_SUBORDINATES - 1);

	signal DataGen_Managers : AddressBusRecArrayType(0 to NUM_SUBORDINATES - 1)(
		Address(MPSOC_SUBORDINATE_ADDRESS_BITS - 1 downto 0),
		DataToModel(MPSOC_SUBORDINATE_DATA_BITS - 1 downto 0),
		DataFromModel(MPSOC_SUBORDINATE_DATA_BITS - 1 downto 0)
	);

	-- DMA
	signal DMA_StreamIn_m2s  : AXI4S_D32.Sized_M2S;
	signal DMA_StreamIn_s2m  : AXI4S_D32.Sized_S2M;
	signal DMA_StreamOut_m2s : AXI4S_D32.Sized_M2S;
	signal DMA_StreamOut_s2m : AXI4S_D32.Sized_S2M;

	-- TX / RX
	constant STREAM_BITS : natural  := AXI_STREAM_DATA_BITS + AXI_STREAM_DATA_BITS / 8;
	signal AXIStreamReceiver : StreamRecType(
		DataToModel   (STREAM_BITS - 1  downto 0),
		ParamToModel  (4 - 1 downto 0),
		DataFromModel (STREAM_BITS - 1  downto 0),
		ParamFromModel(4 - 1 downto 0)
	);
	signal AXIStreamTransmitter : StreamRecType(
		DataToModel   (STREAM_BITS - 1  downto 0),
		ParamToModel  (4 - 1 downto 0),
		DataFromModel (STREAM_BITS - 1  downto 0),
		ParamFromModel(4 - 1 downto 0)
	);

	component BigDesign_TestController is
		generic (
			PATTERN        : string;
			SCALING_FACTOR : natural
		);
		port (
			Clock                : in  std_logic;
			Reset                : in  std_logic;
			DataGen_Managers     : inout AddressBusRecArrayType;
			AXIStreamTransmitter : inout StreamRecType;
			AXIStreamReceiver    : inout StreamRecType;
			GPIO_Button          : out std_logic_vector(1 downto 0) := (others => '0')
		);
	end component;
begin
	Clock_100MHz <= not Clock_100MHz after CLOCK_PERIOD / 2;

	DUT : entity lib_BigDesign.Design
		port map (
			Clock            => Clock_100MHz,

			Button           => GPIO_Button,
			LED              => GPIO_LED,

			Config_Clk       => Config_Clk,

			Manager_Clks     => Manager_Clks,

			Subordinate_m2s  => Subordinate_m2s,
			Subordinate_s2m  => Subordinate_s2m,
			Subordinate_Clks => Subordinate_Clks,

			DMA_StreamIn_m2s  => DMA_StreamIn_m2s,
			DMA_StreamIn_s2m  => DMA_StreamIn_s2m,
			DMA_StreamOut_m2s => DMA_StreamOut_m2s,
			DMA_StreamOut_s2m => DMA_StreamOut_s2m
		);

	gen_M: for i in Subordinate_m2s'range generate
		subtype T_Axi4Rec is Axi4RecType(
			WriteAddress (
				Addr(MPSOC_SUBORDINATE_ADDRESS_BITS - 1 downto 0),
				ID(MPSOC_SUBORDINATE_ID_BITS - 1 downto 0),
				User(MPSOC_SUBORDINATE_USER_BITS - 1 downto 0)
			),
			WriteData (
				Data(MPSOC_SUBORDINATE_DATA_BITS - 1 downto 0),
				Strb(MPSOC_SUBORDINATE_DATA_BITS / 8 - 1 downto 0),
				User(MPSOC_SUBORDINATE_USER_BITS - 1 downto 0),
				ID(MPSOC_SUBORDINATE_ID_BITS - 1 downto 0)
			),
			WriteResponse (
				ID(MPSOC_SUBORDINATE_ID_BITS - 1 downto 0),
				User(MPSOC_SUBORDINATE_USER_BITS - 1 downto 0)
			),
			ReadAddress (
				Addr(MPSOC_SUBORDINATE_ADDRESS_BITS - 1 downto 0),
				ID(MPSOC_SUBORDINATE_ID_BITS - 1 downto 0),
				User(MPSOC_SUBORDINATE_USER_BITS - 1 downto 0)
			),
			ReadData (
				Data(MPSOC_SUBORDINATE_DATA_BITS - 1 downto 0),
				User(MPSOC_SUBORDINATE_USER_BITS - 1 downto 0),
				ID(MPSOC_SUBORDINATE_ID_BITS - 1 downto 0)
			)
		);

		signal Axi4Rec : T_Axi4Rec;
	begin

		manager: entity OSVVM_AXI4.Axi4Manager
			generic map (
				MODEL_ID_NAME => "manager_" & to_string(i),
				tperiod_Clk   => CLOCK_PERIOD,
				DEFAULT_DELAY => 0 ns
			)
			port map (
				-- Globals
				Clk      => Subordinate_clks(i),
				nReset   => '1',
				TransRec => DataGen_Managers(i),
				AxiBus   => Axi4Rec
			);

		conv: to_PoC_AXI4_Bus_Master(
			OSVVM_Bus => Axi4Rec,
			PoC_M2S   => Subordinate_m2s(i),
			PoC_S2M   => Subordinate_s2m(i)
		);
	end generate;

	TX_RX_blk : block
		signal signal_open : std_logic_vector(0 downto 0);
	begin
		Transmitter: entity OSVVM_AXI4.AxiStreamTransmitter
			generic map (
				INIT_USER     => "",
				tperiod_Clk   => CLOCK_PERIOD,
				DEFAULT_DELAY => 0 ns
			)
			port map (
				-- Globals
				Clk       => Clock_100MHz,
				nReset    => '1',
				-- AXI Stream Interface
				TValid    => DMA_StreamIn_m2s.Valid,
				TReady    => DMA_StreamIn_s2m.Ready,
				TID       => signal_open,
				TDest     => signal_open,
				TUser     => DMA_StreamIn_m2s.User,
				TData     => DMA_StreamIn_m2s.Data,
				TStrb     => signal_open,
				TKeep     => DMA_StreamIn_m2s.Keep,
				TLast     => DMA_StreamIn_m2s.Last,
				-- Testbench Transaction Interface
				TransRec => AXIStreamTransmitter
			);

		Receiver: entity OSVVM_AXI4.AxiStreamReceiver
			generic map (
				tperiod_Clk    => CLOCK_PERIOD,
				tpd_Clk_TReady => 0 ns
			)
			port map (
				-- Globals
				Clk      => Clock_100MHz,
				nReset   => '1',
				-- AXI Master Functional Interface
				TValid   => DMA_StreamOut_m2s.Valid,
				TReady   => DMA_StreamOut_s2m.Ready,
				TID      => "0",
				TDest    => "0",
				TUser    => DMA_StreamOut_m2s.User,
				TData    => DMA_StreamOut_m2s.Data,
				TStrb    => "1",
				TKeep    => DMA_StreamOut_m2s.Keep,
				TLast    => DMA_StreamOut_m2s.Last,
				-- Testbench Transaction Interface
				TransRec => AXIStreamReceiver
			);
		end block;

	TestCtrl : component BigDesign_TestController
		generic map (
			PATTERN        => PATTERN,
			SCALING_FACTOR => integer'value(SCALING_FACTOR)
		)
		port map (
			Clock                => Clock_100MHz,
			Reset                => '0',
			DataGen_Managers     => DataGen_Managers,
			AXIStreamTransmitter => AXIStreamTransmitter,
			AXIStreamReceiver    => AXIStreamReceiver,
			GPIO_Button          => GPIO_Button
		);

end architecture;
