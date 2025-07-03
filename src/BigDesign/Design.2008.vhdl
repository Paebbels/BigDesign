library IEEE;
use     IEEE.std_logic_1164.all;

library PoC;
use     PoC.vectors.all;
use     PoC.AXI4Lite.all;


entity Design is
	port (
		signal Clock  : in  std_logic;
		
		signal Button : in  std_logic_vector(1 downto 0);
		signal LED    : out std_logic_vector(1 downto 0)
	);
end entity;


architecture rtl of Design is
	package AXI4Lite_A40_D32 is new PoC.AXI4Lite_Sized
		generic map (
			ADDRESS_BITS => 40,
			DATA_BITS    => 32
		);
	package AXI4_A40_D128 is new PoC.AXI4Full_Sized
		generic map (
			ADDRESS_BITS => 40,
			DATA_BITS    => 128,
			USER_BITS    => 16,
			ID_BITS      => 16
		);
	package AXI4_A49_D128_I6 is new PoC.AXI4Full_Sized
		generic map (
			ADDRESS_BITS => 49,
			DATA_BITS    => 128,
			USER_BITS    => 16,
			ID_BITS      => 6
		);

	signal PS_Clock        : std_logic;
	signal PL_Reset        : std_logic;
	
	signal Config_m2s      : AXI4Lite_A40_D32.Sized_M2S;
	signal Config_s2m      : AXI4Lite_A40_D32.Sized_S2M;
	
	signal Manager_m2s     : AXI4_A40_D128.Sized_M2S_Vector(0 to 1);
	signal Manager_s2m     : AXI4_A40_D128.Sized_S2M_Vector(0 to 1);
	
	signal Subordinate_m2s : AXI4_A49_D128_I6.Sized_M2S_Vector(0 to 2);
	signal Subordinate_s2m : AXI4_A49_D128_I6.Sized_S2M_Vector(0 to 2);

begin

	BD: entity work.BlockDesign_top
		port map (
			Clock => PS_Clock,
			
			Config_m2s => Config_m2s,
			Config_s2m => Config_s2m,
		
			Manager_m2s => Manager_m2s,
			Manager_s2m => Manager_s2m,
		
			Subordinate_m2s => Subordinate_m2s,
			Subordinate_s2m => Subordinate_s2m
		);
	
	blkGPIO : block
		constant CONFIG : T_AXI4_Register_Vector := (
			to_AXI4_Register(Name => "Buttons", Address => 32x"00", RegisterMode => ReadOnly_NotRegistered),
			to_AXI4_Register(Name => "LEDs",    Address => 32x"04", RegisterMode => ReadWrite_NotRegistered)
		);
	
		signal ReadPort  : T_SLVV(0 to 1)(31 downto 0);
		signal WritePort : T_SLVV(0 to 1)(31 downto 0);
	begin
		GPIO: entity PoC.AXI4Lite_Register
			generic map (
				CONFIG => CONFIG
			)
			port map (
				Clock                         => PS_Clock,
				Reset                         => PL_Reset,
		
				AXI4Lite_m2s                  => Config_m2s,
				AXI4Lite_s2m                  => Config_s2m,
				AXI4Lite_IRQ                  => open,
		
				RegisterFile_ReadPort         => ReadPort,
				RegisterFile_ReadPort_hit     => open,
				RegisterFile_WritePort        => WritePort,
				RegisterFile_WritePort_hit    => open,
				RegisterFile_WritePort_strobe => open
			);
		
		WritePort(get_Index("Buttons", CONFIG)) <= 30x"0" & Button;
		
		LED <= ReadPort(get_Index("LEDs", CONFIG))(1 downto 0);
	end block;
end architecture;
