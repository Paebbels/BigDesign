library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;

library PoC;
use     PoC.vectors.all;
use     PoC.physical.all;
use     PoC.AXI4Lite.all;

use work.PS_settings_pkg.all;

entity design_SettingsRegister is
	generic (
		UART_BAUDRATE : BAUD
	);
	port (
		Clock        : in std_logic;
		Reset        : in std_logic;
		AXI4Lite_M2S : in  T_AXI4LITE_BUS_M2S;
		AXI4Lite_S2M : out T_AXI4LITE_BUS_S2M
	);
end entity;

architecture rtl of design_SettingsRegister is
	constant UART_BAUDRATE_US : unsigned(AXI_DATA_WIDTH - 1 downto 0) := to_unsigned(BAUD'pos(UART_BAUDRATE), AXI_DATA_WIDTH);

	function gen_config return T_AXI4_Register_Vector is
		variable temp : T_AXI4_Register_Vector(0 to 0);
		variable addr : natural := 0;
		variable pos  : natural := 0;
	begin
		temp(pos) := to_AXI4_Register(Name => "UART_Baudrate", Address => to_unsigned(addr * 4, AXI_ADDR_WIDTH), RegisterMode => ConstantValue, Init_Value => std_logic_vector(UART_BAUDRATE_US));
		addr      := addr + 1; pos := pos + 1;
		return temp(0 to pos - 1);
	end function;

	constant CONFIG : T_AXI4_Register_Vector := gen_config;
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
end architecture;
