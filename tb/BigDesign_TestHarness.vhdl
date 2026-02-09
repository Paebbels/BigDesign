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
use     lib_BigDesign.PS_settings_pkg.all;


entity BigDesign_TestHarness is
	generic (
		PATTERN : string := "1"
	);
end entity;

architecture TestHarness of BigDesign_TestHarness is
	signal Clock_100MHz : std_logic := '1';
	signal GPIO_Button  : std_logic_vector(1 downto 0);
	signal GPIO_LED     : std_logic_vector(1 downto 0);

	signal Config_Clk   : std_logic;
	signal Manager_Clks : std_logic_vector(0 to NUM_MANAGERS - 1);

	signal Subordinate_m2s  : AXI4_A49_D128_I6.Sized_M2S_Vector(0 to NUM_SUBORDINATES - 1);
	signal Subordinate_s2m  : AXI4_A49_D128_I6.Sized_S2M_Vector(0 to NUM_SUBORDINATES - 1);
	signal Subordinate_Clks : std_logic_vector(0 to NUM_SUBORDINATES - 1);

	signal DataGen_Managers : AddressBusRecArrayType(0 to NUM_SUBORDINATES - 1)(
		Address(SUBORDINATE_ADDRESS_BITS - 1 downto 0),
		DataToModel(DATA_BITS - 1 downto 0),
		DataFromModel(DATA_BITS - 1 downto 0)
	);
	
	component BigDesign_TestController is
		generic (
			PATTERN : string
		);
		port (
			Clock            : in  std_logic;
			Reset            : in  std_logic;
			DataGen_Managers : inout AddressBusRecArrayType
		);
	end component;
begin
	Clock_100MHz <= not Clock_100MHz after 5 ns;

	DUT : entity lib_BigDesign.Design
		port map (
			Clock            => Clock_100MHz,

			Button           => GPIO_Button,
			LED              => GPIO_LED,

			Config_Clk       => Config_Clk,

			Manager_Clks     => Manager_Clks,

			Subordinate_m2s  => Subordinate_m2s,
			Subordinate_s2m  => Subordinate_s2m,
			Subordinate_Clks => Subordinate_Clks
		);

	gen_M: for i in Subordinate_m2s'range generate
		subtype T_Axi4Rec is Axi4RecType(
			WriteAddress (
				Addr(SUBORDINATE_ADDRESS_BITS - 1 downto 0),
				ID(SUBORDINATE_ID_BITS - 1 downto 0),
				User(USER_BITS - 1 downto 0)
			),
			WriteData (
				Data(DATA_BITS - 1 downto 0),
				Strb(DATA_BITS / 8 - 1 downto 0),
				User(USER_BITS - 1 downto 0),
				ID(SUBORDINATE_ID_BITS - 1 downto 0)
			),
			WriteResponse (
				ID(SUBORDINATE_ID_BITS - 1 downto 0),
				User(USER_BITS - 1 downto 0)
			),
			ReadAddress (
				Addr(SUBORDINATE_ADDRESS_BITS - 1 downto 0),
				ID(SUBORDINATE_ID_BITS - 1 downto 0),
				User(USER_BITS - 1 downto 0)
			),
			ReadData (
				Data(DATA_BITS - 1 downto 0),
				User(USER_BITS - 1 downto 0),
				ID(SUBORDINATE_ID_BITS - 1 downto 0)
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
				Clk      => Subordinate_clks(i),
				nReset   => '1',
				TransRec => DataGen_Managers(i),
				AxiBus   => Axi4Rec
			);

		conv: to_PoC_AXI4_Bus_Master(
			OSVVM_Bus => Axi4Rec,
			PoC_M2S   => Subordinate_m2s(i),
			PoC_S2M   => Subordinate_s2m(i)
		);
	end generate;

	TestCtrl : component BigDesign_TestController
		generic map (
			PATTERN => PATTERN
		)
		port map (
			Clock            => Clock_100MHz,
			Reset            => '0',
			DataGen_Managers => DataGen_Managers
		);

end architecture;
