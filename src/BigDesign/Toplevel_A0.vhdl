library IEEE;
use     IEEE.std_logic_1164.all;

entity Toplevel is
	port (
		signal Clock_100MHz : in std_logic
	);
end entity;

architecture top of Toplevel is

begin
	
	
	
	InnerTop : entity work.Design
		port map (
			Clock => Clock_100MHz
		);

end architecture;
