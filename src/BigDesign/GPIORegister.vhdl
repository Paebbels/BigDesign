library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;

library PoC;
use     PoC.vectors.all;
use     PoC.AXI4Lite.all;

entity GPIORegister is
	port (
		Clock        : in std_logic;
		Reset        : in std_logic;
		AXI4Lite_M2S : in  T_AXI4LITE_BUS_M2S;
		AXI4Lite_S2M : out T_AXI4LITE_BUS_S2M;

		Button       : in std_logic_vector(1 downto 0);
		LED          : out std_logic_vector(1 downto 0)
	);
end entity;

architecture rtl of GPIORegister is
	constant CONFIG : T_AXI4_Register_Vector := (
		to_AXI4_Register(Name => "Buttons", Address => 32x"00", RegisterMode => ReadOnly_NotRegistered),
		to_AXI4_Register(Name => "LEDs",    Address => 32x"04", RegisterMode => ReadWrite)
	);

	signal ReadPort  : T_SLVV(0 to CONFIG'length - 1)(31 downto 0) := (others => (others => 'Z'));
	signal WritePort : T_SLVV(0 to CONFIG'length - 1)(31 downto 0) := (others => (others => 'Z'));
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

	WritePort(get_Index("Buttons", CONFIG)) <= 30x"0" & Button;

	LED <= ReadPort(get_Index("LEDs", CONFIG))(1 downto 0);
end architecture;
