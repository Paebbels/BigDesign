library IEEE;
use     IEEE.std_logic_1164.all;

library PoC;
use     PoC.utils.all;

library OSVVM;
context OSVVM.OsvvmContext;


entity BigDesign_TestController is
	port (
		Clock : in  std_logic;
		Reset : in  std_logic
	);
end entity;
