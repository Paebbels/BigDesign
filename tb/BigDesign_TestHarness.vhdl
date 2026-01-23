library IEEE;
use     IEEE.std_logic_1164.all;

library PoC;
use     PoC.AXI4_Full.all;
use     PoC.AXI4_OSVVM.all;

library OSVVM_Common ;
context OSVVM_Common.OsvvmCommonContext ;

library OSVVM_AXI4;
use     OSVVM_AXI4.Axi4InterfacePkg.all ;

library lib_BigDesign;


entity BigDesign_TestHarness is
end entity;

architecture TestHarness of BigDesign_TestHarness is
	signal Clock_100MHz : std_logic := '1';
	signal GPIO_Button  : std_logic_vector(1 downto 0);
	signal GPIO_LED     : std_logic_vector(1 downto 0);

	constant ADDRESS_BITS : positive := 49;
	constant DATA_BITS    : positive := 128;
	constant USER_BITS    : positive := 16;
	constant ID_BITS      : positive := 6;

	package AXI4_A49_D128_I6 is new PoC.AXI4Full_Sized
		generic map (
			ADDRESS_BITS => ADDRESS_BITS,
			DATA_BITS    => DATA_BITS,
			USER_BITS    => USER_BITS,
			ID_BITS      => ID_BITS
		);

	signal Subordinate_m2s : AXI4_A49_D128_I6.Sized_M2S_Vector(0 to 3);
	signal Subordinate_s2m : AXI4_A49_D128_I6.Sized_S2M_Vector(0 to 3);

	signal SubordinateArray : AddressBusRecArrayType(0 to 3)(
		Address(ADDRESS_BITS - 1 downto 0),
		DataToModel(DATA_BITS - 1 downto 0),
		DataFromModel(DATA_BITS - 1 downto 0)
	);
	
	component BigDesign_TestController is
		port (
			Clock       : in  std_logic;
			Reset       : in  std_logic;
			AXI_Manager : inout AddressBusRecArrayType
		);
	end component;
begin
	Clock_100MHz <= not Clock_100MHz after 5 ns;

	DUT : entity lib_BigDesign.Design
		port map (
			Clock  => Clock_100MHz,

			Button => GPIO_Button,
			LED    => GPIO_LED,
			
			Subordinate_m2s => Subordinate_m2s,
			Subordinate_s2m => Subordinate_s2m
		);

	gen_M: for i in Subordinate_m2s'range generate
		subtype T_Axi4Rec is Axi4RecType(
			WriteAddress (
				Addr(ADDRESS_BITS - 1 downto 0),
				ID(ID_BITS - 1 downto 0),
				User(USER_BITS - 1 downto 0)
			),
			WriteData (
				Data(DATA_BITS - 1 downto 0),
				Strb(DATA_BITS / 8 - 1 downto 0),
				User(USER_BITS - 1 downto 0),
				ID(ID_BITS - 1 downto 0)
			),
			WriteResponse (
				ID(ID_BITS - 1 downto 0),
				User(USER_BITS - 1 downto 0)
			),
			ReadAddress (
				Addr(ADDRESS_BITS - 1 downto 0),
				ID(ID_BITS - 1 downto 0),
				User(USER_BITS - 1 downto 0)
			),
			ReadData (
				Data(DATA_BITS - 1 downto 0),
				User(USER_BITS - 1 downto 0),
				ID(ID_BITS - 1 downto 0)
			)
		);

		signal Axi4Rec : T_Axi4Rec;
	begin
		
		manager: entity OSVVM_AXI4.Axi4Manager
			generic map (
				MODEL_ID_NAME => "manager_" & to_string(i),
				tperiod_Clk   => 10 ns,
				DEFAULT_DELAY => 0 ns 
			)
			port map (
				-- Globals
				Clk      => Clock_100MHz,  -- todo: add clocks from Stub
				nReset   => '1',
				AxiBus   => Axi4Rec,
				TransRec => SubordinateArray(i)
			);

		to_PoC_AXI4_Bus_Master(Subordinate_m2s(i), Subordinate_s2m(i), Axi4Rec);
	end generate;

	TestCtrl : component BigDesign_TestController
		port map (
			Clock       => Clock_100MHz,
			Reset       => '0',
			AXI_Manager => SubordinateArray
		);

end architecture;
