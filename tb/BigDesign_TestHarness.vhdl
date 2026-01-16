library IEEE;
use     IEEE.std_logic_1164.all;

library lib_BigDesign;

entity BigDesign_TestHarness is
end entity;

architecture TestHarness of BigDesign_TestHarness is
	signal Clock_100MHz : std_logic := '1';
	signal GPIO_Button  : std_logic_vector(1 downto 0);
	signal GPIO_LED     : std_logic_vector(1 downto 0);
	
	component BigDesign_TestController is
		port (
			Clock : in  std_logic;
			Reset : in  std_logic
		);
	end component;
begin
	Clock_100MHz <= not Clock_100MHz after 5 ns;

	DUT : entity lib_BigDesign.Design
		port map (
			Clock  => Clock_100MHz,

			Button => GPIO_Button,
			LED    => GPIO_LED
		);
		
	TestCtrl : component BigDesign_TestController
		port map (
			Clock => Clock_100MHz,
			Reset => '0'
		);
end architecture;
