library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;

library PoC;
use     PoC.AXI4_Full.all;


package PS_settings_pkg is
	----------------------
	------- General ------
	----------------------
	constant NUM_MANAGERS         : positive := 2;
	constant NUM_SUBORDINATES     : positive := 4;

	----------------------
	----- Bit widths -----
	----------------------
	constant MANAGER_ADDRESS_BITS      : positive := 40;
	constant MANAGER_ID_BITS           : positive := 16;

	constant SUBORDINATE_ADDRESS_BITS  : positive := 49;  -- do not change
	constant SUBORDINATE_ID_BITS       : positive := 6;

	constant MEMORY_MODEL_ADDRESS_BITS : positive := 32;  -- fails for i.e. 40 ("bad pointer ...")

	constant CONFIG_DATA_BITS          : positive := 32;
	constant DATA_BITS                 : positive := 128;
	constant USER_BITS                 : positive := 16;

	----------------------
	------ Packages ------
	----------------------
	package AXI4_A40_D32 is new PoC.AXI4Full_Sized
		generic map (
			ADDRESS_BITS => MANAGER_ADDRESS_BITS,
			DATA_BITS    => CONFIG_DATA_BITS,
			USER_BITS    => USER_BITS,
			ID_BITS      => MANAGER_ID_BITS
		);

	package AXI4Lite_A40_D32 is new PoC.AXI4Lite_Sized
		generic map (
			ADDRESS_BITS => MANAGER_ADDRESS_BITS,
			DATA_BITS    => CONFIG_DATA_BITS
		);

	package AXI4_A40_D128 is new PoC.AXI4Full_Sized
		generic map (
			ADDRESS_BITS => MANAGER_ADDRESS_BITS,
			DATA_BITS    => DATA_BITS,
			USER_BITS    => USER_BITS,
			ID_BITS      => MANAGER_ID_BITS
		);

	package AXI4_A49_D128_I6 is new PoC.AXI4Full_Sized
		generic map (
			ADDRESS_BITS => SUBORDINATE_ADDRESS_BITS,
			DATA_BITS    => DATA_BITS,
			USER_BITS    => USER_BITS,
			ID_BITS      => SUBORDINATE_ID_BITS
		);
end package;
