library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;

library PoC;
use     PoC.AXI4_Full.all;


package PS_settings_pkg is
	constant NUM_MANAGERS         : positive := 2;
	constant NUM_SUBORDINATES     : positive := 4;

	constant ADDRESS_BITS         : positive := 40;
	constant DATA_BITS            : positive := 128;
	constant USER_BITS            : positive := 16;
	constant ID_BITS              : positive := 6;

	package AXI4_A40_D32 is new PoC.AXI4Full_Sized
		generic map (
			ADDRESS_BITS => ADDRESS_BITS,
			DATA_BITS    => 32,
			USER_BITS    => USER_BITS,
			ID_BITS      => 16
		);

	package AXI4Lite_A40_D32 is new PoC.AXI4Lite_Sized
		generic map (
			ADDRESS_BITS => ADDRESS_BITS,
			DATA_BITS    => 32
		);

	package AXI4_A40_D128 is new PoC.AXI4Full_Sized
		generic map (
			ADDRESS_BITS => ADDRESS_BITS,
			DATA_BITS    => 128,
			USER_BITS    => USER_BITS,
			ID_BITS      => 16
		);

end package;
