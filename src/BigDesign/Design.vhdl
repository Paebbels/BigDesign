library IEEE;
use     IEEE.std_logic_1164.all;

entity Design is
	port (
		signal Clock : in std_logic
	);
end entity;

architecture rtl of Design is
	signal PS_Clock : std_logic;
begin

	BD: entity work.BlockDesign_top
		port map (
			Clock => PS_Clock
		);
	
	blkConfig : block
	
	begin
	
	end block;
end architecture;
