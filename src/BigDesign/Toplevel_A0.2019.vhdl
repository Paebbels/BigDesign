library IEEE;
use     IEEE.std_logic_1164.all;

entity Toplevel is
	port (
		signal Clock_100MHz : in std_logic;
		
		signal GPIO_Button  : in  std_logic_vector(1 downto 0);
		signal GPIO_LED     : out std_logic_vector(1 downto 0)
	);
end entity;

architecture top of Toplevel is

begin
	InnerTop : entity work.Design
		port map (
			Clock  => Clock_100MHz,
			
			Button => GPIO_Button,
			LED    => GPIO_LED
		);

end architecture;
