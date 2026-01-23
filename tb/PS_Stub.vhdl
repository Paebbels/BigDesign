library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;

library OSVVM_AXI4;
context OSVVM_AXI4.Axi4Context;


entity BlockDesign_PS_0 is
	port (
		pl_clk0    : out STD_LOGIC;
		pl_resetn0 : out STD_LOGIC;
		pl_ps_irq0 : in STD_LOGIC_VECTOR ( 7 downto 0 );

		maxihpm0_fpd_aclk : in STD_LOGIC;
		maxihpm1_fpd_aclk : in STD_LOGIC;
		maxihpm0_lpd_aclk : in STD_LOGIC;
		
		saxihp0_fpd_aclk  : in STD_LOGIC;
		saxihp1_fpd_aclk  : in STD_LOGIC;
		saxihp2_fpd_aclk  : in STD_LOGIC;
		saxihp3_fpd_aclk  : in STD_LOGIC;

		maxigp0_awid : out STD_LOGIC_VECTOR ( 15 downto 0 );
		maxigp0_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
		maxigp0_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
		maxigp0_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
		maxigp0_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
		maxigp0_awlock : out STD_LOGIC;
		maxigp0_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
		maxigp0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
		maxigp0_awvalid : out STD_LOGIC;
		maxigp0_awuser : out STD_LOGIC_VECTOR ( 15 downto 0 );
		maxigp0_awready : in STD_LOGIC;
		maxigp0_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
		maxigp0_wstrb : out STD_LOGIC_VECTOR ( 15 downto 0 );
		maxigp0_wlast : out STD_LOGIC;
		maxigp0_wvalid : out STD_LOGIC;
		maxigp0_wready : in STD_LOGIC;
		maxigp0_bid : in STD_LOGIC_VECTOR ( 15 downto 0 );
		maxigp0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
		maxigp0_bvalid : in STD_LOGIC;
		maxigp0_bready : out STD_LOGIC;
		maxigp0_arid : out STD_LOGIC_VECTOR ( 15 downto 0 );
		maxigp0_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
		maxigp0_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
		maxigp0_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
		maxigp0_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
		maxigp0_arlock : out STD_LOGIC;
		maxigp0_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
		maxigp0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
		maxigp0_arvalid : out STD_LOGIC;
		maxigp0_aruser : out STD_LOGIC_VECTOR ( 15 downto 0 );
		maxigp0_arready : in STD_LOGIC;
		maxigp0_rid : in STD_LOGIC_VECTOR ( 15 downto 0 );
		maxigp0_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
		maxigp0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
		maxigp0_rlast : in STD_LOGIC;
		maxigp0_rvalid : in STD_LOGIC;
		maxigp0_rready : out STD_LOGIC;
		maxigp0_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
		maxigp0_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );

		maxigp1_awid : out STD_LOGIC_VECTOR ( 15 downto 0 );
		maxigp1_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
		maxigp1_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
		maxigp1_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
		maxigp1_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
		maxigp1_awlock : out STD_LOGIC;
		maxigp1_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
		maxigp1_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
		maxigp1_awvalid : out STD_LOGIC;
		maxigp1_awuser : out STD_LOGIC_VECTOR ( 15 downto 0 );
		maxigp1_awready : in STD_LOGIC;
		maxigp1_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
		maxigp1_wstrb : out STD_LOGIC_VECTOR ( 15 downto 0 );
		maxigp1_wlast : out STD_LOGIC;
		maxigp1_wvalid : out STD_LOGIC;
		maxigp1_wready : in STD_LOGIC;
		maxigp1_bid : in STD_LOGIC_VECTOR ( 15 downto 0 );
		maxigp1_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
		maxigp1_bvalid : in STD_LOGIC;
		maxigp1_bready : out STD_LOGIC;
		maxigp1_arid : out STD_LOGIC_VECTOR ( 15 downto 0 );
		maxigp1_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
		maxigp1_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
		maxigp1_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
		maxigp1_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
		maxigp1_arlock : out STD_LOGIC;
		maxigp1_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
		maxigp1_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
		maxigp1_arvalid : out STD_LOGIC;
		maxigp1_aruser : out STD_LOGIC_VECTOR ( 15 downto 0 );
		maxigp1_arready : in STD_LOGIC;
		maxigp1_rid : in STD_LOGIC_VECTOR ( 15 downto 0 );
		maxigp1_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
		maxigp1_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
		maxigp1_rlast : in STD_LOGIC;
		maxigp1_rvalid : in STD_LOGIC;
		maxigp1_rready : out STD_LOGIC;
		maxigp1_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
		maxigp1_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );

		maxigp2_awid : out STD_LOGIC_VECTOR ( 15 downto 0 );
		maxigp2_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
		maxigp2_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
		maxigp2_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
		maxigp2_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
		maxigp2_awlock : out STD_LOGIC;
		maxigp2_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
		maxigp2_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
		maxigp2_awvalid : out STD_LOGIC;
		maxigp2_awuser : out STD_LOGIC_VECTOR ( 15 downto 0 );
		maxigp2_awready : in STD_LOGIC;
		maxigp2_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
		maxigp2_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
		maxigp2_wlast : out STD_LOGIC;
		maxigp2_wvalid : out STD_LOGIC;
		maxigp2_wready : in STD_LOGIC;
		maxigp2_bid : in STD_LOGIC_VECTOR ( 15 downto 0 );
		maxigp2_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
		maxigp2_bvalid : in STD_LOGIC;
		maxigp2_bready : out STD_LOGIC;
		maxigp2_arid : out STD_LOGIC_VECTOR ( 15 downto 0 );
		maxigp2_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
		maxigp2_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
		maxigp2_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
		maxigp2_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
		maxigp2_arlock : out STD_LOGIC;
		maxigp2_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
		maxigp2_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
		maxigp2_arvalid : out STD_LOGIC;
		maxigp2_aruser : out STD_LOGIC_VECTOR ( 15 downto 0 );
		maxigp2_arready : in STD_LOGIC;
		maxigp2_rid : in STD_LOGIC_VECTOR ( 15 downto 0 );
		maxigp2_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
		maxigp2_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
		maxigp2_rlast : in STD_LOGIC;
		maxigp2_rvalid : in STD_LOGIC;
		maxigp2_rready : out STD_LOGIC;
		maxigp2_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
		maxigp2_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );

		saxigp2_aruser : in STD_LOGIC;
		saxigp2_awuser : in STD_LOGIC;
		saxigp2_awid : in STD_LOGIC_VECTOR ( 5 downto 0 );
		saxigp2_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
		saxigp2_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
		saxigp2_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
		saxigp2_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
		saxigp2_awlock : in STD_LOGIC;
		saxigp2_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
		saxigp2_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
		saxigp2_awvalid : in STD_LOGIC;
		saxigp2_awready : out STD_LOGIC;
		saxigp2_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
		saxigp2_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
		saxigp2_wlast : in STD_LOGIC;
		saxigp2_wvalid : in STD_LOGIC;
		saxigp2_wready : out STD_LOGIC;
		saxigp2_bid : out STD_LOGIC_VECTOR ( 5 downto 0 );
		saxigp2_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
		saxigp2_bvalid : out STD_LOGIC;
		saxigp2_bready : in STD_LOGIC;
		saxigp2_arid : in STD_LOGIC_VECTOR ( 5 downto 0 );
		saxigp2_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
		saxigp2_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
		saxigp2_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
		saxigp2_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
		saxigp2_arlock : in STD_LOGIC;
		saxigp2_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
		saxigp2_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
		saxigp2_arvalid : in STD_LOGIC;
		saxigp2_arready : out STD_LOGIC;
		saxigp2_rid : out STD_LOGIC_VECTOR ( 5 downto 0 );
		saxigp2_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
		saxigp2_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
		saxigp2_rlast : out STD_LOGIC;
		saxigp2_rvalid : out STD_LOGIC;
		saxigp2_rready : in STD_LOGIC;
		saxigp2_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
		saxigp2_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );

		saxigp3_aruser : in STD_LOGIC;
		saxigp3_awuser : in STD_LOGIC;
		saxigp3_awid : in STD_LOGIC_VECTOR ( 5 downto 0 );
		saxigp3_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
		saxigp3_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
		saxigp3_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
		saxigp3_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
		saxigp3_awlock : in STD_LOGIC;
		saxigp3_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
		saxigp3_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
		saxigp3_awvalid : in STD_LOGIC;
		saxigp3_awready : out STD_LOGIC;
		saxigp3_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
		saxigp3_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
		saxigp3_wlast : in STD_LOGIC;
		saxigp3_wvalid : in STD_LOGIC;
		saxigp3_wready : out STD_LOGIC;
		saxigp3_bid : out STD_LOGIC_VECTOR ( 5 downto 0 );
		saxigp3_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
		saxigp3_bvalid : out STD_LOGIC;
		saxigp3_bready : in STD_LOGIC;
		saxigp3_arid : in STD_LOGIC_VECTOR ( 5 downto 0 );
		saxigp3_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
		saxigp3_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
		saxigp3_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
		saxigp3_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
		saxigp3_arlock : in STD_LOGIC;
		saxigp3_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
		saxigp3_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
		saxigp3_arvalid : in STD_LOGIC;
		saxigp3_arready : out STD_LOGIC;
		saxigp3_rid : out STD_LOGIC_VECTOR ( 5 downto 0 );
		saxigp3_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
		saxigp3_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
		saxigp3_rlast : out STD_LOGIC;
		saxigp3_rvalid : out STD_LOGIC;
		saxigp3_rready : in STD_LOGIC;
		saxigp3_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
		saxigp3_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );

		saxigp4_aruser : in STD_LOGIC;
		saxigp4_awuser : in STD_LOGIC;
		saxigp4_awid : in STD_LOGIC_VECTOR ( 5 downto 0 );
		saxigp4_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
		saxigp4_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
		saxigp4_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
		saxigp4_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
		saxigp4_awlock : in STD_LOGIC;
		saxigp4_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
		saxigp4_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
		saxigp4_awvalid : in STD_LOGIC;
		saxigp4_awready : out STD_LOGIC;
		saxigp4_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
		saxigp4_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
		saxigp4_wlast : in STD_LOGIC;
		saxigp4_wvalid : in STD_LOGIC;
		saxigp4_wready : out STD_LOGIC;
		saxigp4_bid : out STD_LOGIC_VECTOR ( 5 downto 0 );
		saxigp4_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
		saxigp4_bvalid : out STD_LOGIC;
		saxigp4_bready : in STD_LOGIC;
		saxigp4_arid : in STD_LOGIC_VECTOR ( 5 downto 0 );
		saxigp4_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
		saxigp4_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
		saxigp4_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
		saxigp4_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
		saxigp4_arlock : in STD_LOGIC;
		saxigp4_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
		saxigp4_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
		saxigp4_arvalid : in STD_LOGIC;
		saxigp4_arready : out STD_LOGIC;
		saxigp4_rid : out STD_LOGIC_VECTOR ( 5 downto 0 );
		saxigp4_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
		saxigp4_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
		saxigp4_rlast : out STD_LOGIC;
		saxigp4_rvalid : out STD_LOGIC;
		saxigp4_rready : in STD_LOGIC;
		saxigp4_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
		saxigp4_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );

		saxigp5_aruser : in STD_LOGIC;
		saxigp5_awuser : in STD_LOGIC;
		saxigp5_awid : in STD_LOGIC_VECTOR ( 5 downto 0 );
		saxigp5_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
		saxigp5_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
		saxigp5_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
		saxigp5_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
		saxigp5_awlock : in STD_LOGIC;
		saxigp5_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
		saxigp5_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
		saxigp5_awvalid : in STD_LOGIC;
		saxigp5_awready : out STD_LOGIC;
		saxigp5_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
		saxigp5_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
		saxigp5_wlast : in STD_LOGIC;
		saxigp5_wvalid : in STD_LOGIC;
		saxigp5_wready : out STD_LOGIC;
		saxigp5_bid : out STD_LOGIC_VECTOR ( 5 downto 0 );
		saxigp5_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
		saxigp5_bvalid : out STD_LOGIC;
		saxigp5_bready : in STD_LOGIC;
		saxigp5_arid : in STD_LOGIC_VECTOR ( 5 downto 0 );
		saxigp5_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
		saxigp5_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
		saxigp5_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
		saxigp5_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
		saxigp5_arlock : in STD_LOGIC;
		saxigp5_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
		saxigp5_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
		saxigp5_arvalid : in STD_LOGIC;
		saxigp5_arready : out STD_LOGIC;
		saxigp5_rid : out STD_LOGIC_VECTOR ( 5 downto 0 );
		saxigp5_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
		saxigp5_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
		saxigp5_rlast : out STD_LOGIC;
		saxigp5_rvalid : out STD_LOGIC;
		saxigp5_rready : in STD_LOGIC;
		saxigp5_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
		saxigp5_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );

		emio_uart1_txd : out STD_LOGIC;
		emio_uart1_rxd : in STD_LOGIC
	);
end entity;

architecture Stub of BlockDesign_PS_0 is

	signal pl_clock0 : std_logic := '1';

begin
	pl_clock0 <= not pl_clock0 after 10 ns;
	pl_clk0   <= pl_clock0;

	-- Slave -> Axi memory

	blk_HPM0_FPD : block
		signal AxiBus : Axi4RecType(
			WriteAddress(
				Addr(maxigp0_awaddr'range),
				ID(maxigp0_awid'range),
				User(maxigp0_awuser'range)
			),
			WriteData   (
				Data(maxigp0_wdata'range),
				Strb(maxigp0_wstrb'range),
				User(-1 downto 0),
				ID(maxigp0_awid'range)
			),
			WriteResponse(
				ID(maxigp0_bid'range),
				User(-1 downto 0)
			),
			ReadAddress (
				Addr(maxigp0_araddr'range),
				ID(maxigp0_arid'range),
				User(maxigp0_aruser'range)
			),
			ReadData    (
				Data(maxigp0_rdata'range),
				ID(maxigp0_rid'range),
				User(-1 downto 0)
			)
		);
	begin
		Manager : Axi4ManagerVti
		generic map (
			MODEL_ID_NAME => "HPM0_FPD"
		)
		port map (
			-- Globals
			Clk         => maxihpm0_fpd_aclk,
			nReset      => '1',

			-- AXI Manager Functional Interface
			AxiBus      => AxiBus
		) ;

		maxigp0_awid               <= AxiBus.WriteAddress.ID;
		maxigp0_awaddr             <= AxiBus.WriteAddress.Addr;
		maxigp0_awlen              <= AxiBus.WriteAddress.Len;
		maxigp0_awsize             <= AxiBus.WriteAddress.Size;
		maxigp0_awburst            <= AxiBus.WriteAddress.Burst;
		maxigp0_awlock             <= AxiBus.WriteAddress.Lock;
		maxigp0_awcache            <= AxiBus.WriteAddress.Cache;
		maxigp0_awprot             <= AxiBus.WriteAddress.Prot;
		maxigp0_awvalid            <= AxiBus.WriteAddress.Valid;
		maxigp0_awuser             <= AxiBus.WriteAddress.User;
		maxigp0_awqos              <= AxiBus.WriteAddress.QOS;
		AxiBus.WriteAddress.Ready  <= maxigp0_awready;

		maxigp0_wdata              <= AxiBus.WriteData.Data;
		maxigp0_wstrb              <= AxiBus.WriteData.Strb;
		maxigp0_wlast              <= AxiBus.WriteData.Last;
		maxigp0_wvalid             <= AxiBus.WriteData.Valid;
		AxiBus.WriteData.Ready     <= maxigp0_wready;

		AxiBus.WriteResponse.ID    <= maxigp0_bid;
		AxiBus.WriteResponse.Resp  <= maxigp0_bresp;
		AxiBus.WriteResponse.Valid <= maxigp0_bvalid;
		maxigp0_bready             <= AxiBus.WriteResponse.Ready;

		maxigp0_arid               <= AxiBus.ReadAddress.ID;
		maxigp0_araddr             <= AxiBus.ReadAddress.Addr;
		maxigp0_arlen              <= AxiBus.ReadAddress.Len;
		maxigp0_arsize             <= AxiBus.ReadAddress.Size;
		maxigp0_arburst            <= AxiBus.ReadAddress.Burst;
		maxigp0_arlock             <= AxiBus.ReadAddress.Lock;
		maxigp0_arcache            <= AxiBus.ReadAddress.Cache;
		maxigp0_arprot             <= AxiBus.ReadAddress.Prot;
		maxigp0_arvalid            <= AxiBus.ReadAddress.Valid;
		maxigp0_aruser             <= AxiBus.ReadAddress.User;
		maxigp0_arqos              <= AxiBus.ReadAddress.QOS;
		AxiBus.ReadAddress.Ready   <= maxigp0_arready;

		AxiBus.ReadData.ID         <= maxigp0_rid;
		AxiBus.ReadData.Data       <= maxigp0_rdata;
		AxiBus.ReadData.Resp       <= maxigp0_rresp;
		AxiBus.ReadData.Last       <= maxigp0_rlast;
		AxiBus.ReadData.Valid      <= maxigp0_rvalid;
		maxigp0_rready             <= AxiBus.ReadData.Ready;
	end block;

	blk_HPM1_FPD : block
		signal AxiBus : Axi4RecType(
			WriteAddress(
				Addr(maxigp1_awaddr'range),
				ID(maxigp1_awid'range),
				User(maxigp1_awuser'range)
			),
			WriteData   (
				Data(maxigp1_wdata'range),
				Strb(maxigp1_wstrb'range),
				User(-1 downto 0),
				ID(maxigp1_awid'range)
			),
			WriteResponse(
				ID(maxigp1_bid'range),
				User(-1 downto 0)
			),
			ReadAddress (
				Addr(maxigp1_araddr'range),
				ID(maxigp1_arid'range),
				User(maxigp1_aruser'range)
			),
			ReadData    (
				Data(maxigp1_rdata'range),
				ID(maxigp1_rid'range),
				User(-1 downto 0)
			)
		);
	begin
		Manager : Axi4ManagerVti
		generic map (
			MODEL_ID_NAME => "HPM1_FPD"
		)
		port map (
			-- Globals
			Clk         => maxihpm1_fpd_aclk,
			nReset      => '1',

			-- AXI Manager Functional Interface
			AxiBus      => AxiBus
		);

		maxigp1_awid               <= AxiBus.WriteAddress.ID;
		maxigp1_awaddr             <= AxiBus.WriteAddress.Addr;
		maxigp1_awlen              <= AxiBus.WriteAddress.Len;
		maxigp1_awsize             <= AxiBus.WriteAddress.Size;
		maxigp1_awburst            <= AxiBus.WriteAddress.Burst;
		maxigp1_awlock             <= AxiBus.WriteAddress.Lock;
		maxigp1_awcache            <= AxiBus.WriteAddress.Cache;
		maxigp1_awprot             <= AxiBus.WriteAddress.Prot;
		maxigp1_awvalid            <= AxiBus.WriteAddress.Valid;
		maxigp1_awuser             <= AxiBus.WriteAddress.User;
		maxigp1_awqos              <= AxiBus.WriteAddress.QOS;
		AxiBus.WriteAddress.Ready  <= maxigp1_awready;

		maxigp1_wdata              <= AxiBus.WriteData.Data;
		maxigp1_wstrb              <= AxiBus.WriteData.Strb;
		maxigp1_wlast              <= AxiBus.WriteData.Last;
		maxigp1_wvalid             <= AxiBus.WriteData.Valid;
		AxiBus.WriteData.Ready     <= maxigp1_wready;

		AxiBus.WriteResponse.ID    <= maxigp1_bid;
		AxiBus.WriteResponse.Resp  <= maxigp1_bresp;
		AxiBus.WriteResponse.Valid <= maxigp1_bvalid;
		maxigp1_bready             <= AxiBus.WriteResponse.Ready;

		maxigp1_arid               <= AxiBus.ReadAddress.ID;
		maxigp1_araddr             <= AxiBus.ReadAddress.Addr;
		maxigp1_arlen              <= AxiBus.ReadAddress.Len;
		maxigp1_arsize             <= AxiBus.ReadAddress.Size;
		maxigp1_arburst            <= AxiBus.ReadAddress.Burst;
		maxigp1_arlock             <= AxiBus.ReadAddress.Lock;
		maxigp1_arcache            <= AxiBus.ReadAddress.Cache;
		maxigp1_arprot             <= AxiBus.ReadAddress.Prot;
		maxigp1_arvalid            <= AxiBus.ReadAddress.Valid;
		maxigp1_aruser             <= AxiBus.ReadAddress.User;
		maxigp1_arqos              <= AxiBus.ReadAddress.QOS;
		AxiBus.ReadAddress.Ready   <= maxigp1_arready;

		AxiBus.ReadData.ID         <= maxigp1_rid;
		AxiBus.ReadData.Data       <= maxigp1_rdata;
		AxiBus.ReadData.Resp       <= maxigp1_rresp;
		AxiBus.ReadData.Last       <= maxigp1_rlast;
		AxiBus.ReadData.Valid      <= maxigp1_rvalid;
		maxigp1_rready             <= AxiBus.ReadData.Ready;
	end block;

	blk_HPM0_LPD : block
		signal AxiBus : Axi4RecType(
			WriteAddress(
				Addr(maxigp2_awaddr'range),
				ID(maxigp2_awid'range),
				User(maxigp2_awuser'range)
			),
			WriteData   (
				Data(maxigp2_wdata'range),
				Strb(maxigp2_wstrb'range),
				User(-1 downto 0),
				ID(maxigp2_awid'range)
			),
			WriteResponse(
				ID(maxigp2_bid'range),
				User(-1 downto 0)
			),
			ReadAddress (
				Addr(maxigp2_araddr'range),
				ID(maxigp2_arid'range),
				User(maxigp2_aruser'range)
			),
			ReadData    (
				Data(maxigp2_rdata'range),
				ID(maxigp2_rid'range),
				User(-1 downto 0)
			)
		);
	begin
		Manager : Axi4ManagerVti
		generic map (
			MODEL_ID_NAME => "HPM0_LPD"
		)
		port map (
			-- Globals
			Clk         => maxihpm0_lpd_aclk,
			nReset      => '1',

			-- AXI Manager Functional Interface
			AxiBus      => AxiBus
		);

		maxigp2_awid               <= AxiBus.WriteAddress.ID;
		maxigp2_awaddr             <= AxiBus.WriteAddress.Addr;
		maxigp2_awlen              <= AxiBus.WriteAddress.Len;
		maxigp2_awsize             <= AxiBus.WriteAddress.Size;
		maxigp2_awburst            <= AxiBus.WriteAddress.Burst;
		maxigp2_awlock             <= AxiBus.WriteAddress.Lock;
		maxigp2_awcache            <= AxiBus.WriteAddress.Cache;
		maxigp2_awprot             <= AxiBus.WriteAddress.Prot;
		maxigp2_awvalid            <= AxiBus.WriteAddress.Valid;
		maxigp2_awuser             <= AxiBus.WriteAddress.User;
		maxigp2_awqos              <= AxiBus.WriteAddress.QOS;
		AxiBus.WriteAddress.Ready  <= maxigp2_awready;

		maxigp2_wdata              <= AxiBus.WriteData.Data;
		maxigp2_wstrb              <= AxiBus.WriteData.Strb;
		maxigp2_wlast              <= AxiBus.WriteData.Last;
		maxigp2_wvalid             <= AxiBus.WriteData.Valid;
		AxiBus.WriteData.Ready     <= maxigp2_wready;

		AxiBus.WriteResponse.ID    <= maxigp2_bid;
		AxiBus.WriteResponse.Resp  <= maxigp2_bresp;
		AxiBus.WriteResponse.Valid <= maxigp2_bvalid;
		maxigp2_bready             <= AxiBus.WriteResponse.Ready;

		maxigp2_arid               <= AxiBus.ReadAddress.ID;
		maxigp2_araddr             <= AxiBus.ReadAddress.Addr;
		maxigp2_arlen              <= AxiBus.ReadAddress.Len;
		maxigp2_arsize             <= AxiBus.ReadAddress.Size;
		maxigp2_arburst            <= AxiBus.ReadAddress.Burst;
		maxigp2_arlock             <= AxiBus.ReadAddress.Lock;
		maxigp2_arcache            <= AxiBus.ReadAddress.Cache;
		maxigp2_arprot             <= AxiBus.ReadAddress.Prot;
		maxigp2_arvalid            <= AxiBus.ReadAddress.Valid;
		maxigp2_aruser             <= AxiBus.ReadAddress.User;
		maxigp2_arqos              <= AxiBus.ReadAddress.QOS;
		AxiBus.ReadAddress.Ready   <= maxigp2_arready;

		AxiBus.ReadData.ID         <= maxigp2_rid;
		AxiBus.ReadData.Data       <= maxigp2_rdata;
		AxiBus.ReadData.Resp       <= maxigp2_rresp;
		AxiBus.ReadData.Last       <= maxigp2_rlast;
		AxiBus.ReadData.Valid      <= maxigp2_rvalid;
		maxigp2_rready             <= AxiBus.ReadData.Ready;
	end block;

	blk_HP0_FPD : block
		signal AxiBus : Axi4RecType(
			WriteAddress(
				Addr(31 downto 0),--(saxigp2_awaddr'range),
				ID(saxigp2_awid'range),
				User(0 downto 0)
			),
			WriteData   (
				Data(saxigp2_wdata'range),
				Strb(saxigp2_wstrb'range),
				User(-1 downto 0),
				ID(saxigp2_awid'range)
			),
			WriteResponse(
				ID(saxigp2_bid'range),
				User(-1 downto 0)
			),
			ReadAddress (
				Addr(31 downto 0),--(saxigp2_araddr'range),
				ID(saxigp2_arid'range),
				User(0 downto 0)
			),
			ReadData    (
				Data(saxigp2_rdata'range),
				ID(saxigp2_rid'range),
				User(-1 downto 0)
			)
		);
	begin
		Memory : Axi4MemoryVti
		generic map (
			MODEL_ID_NAME => "HP0_FPD",
			MEMORY_NAME   => "PSDDR4"
		)
		port map (
			-- Globals
			Clk         => saxihp0_fpd_aclk,
			nReset      => '1',

			-- AXI Manager Functional Interface
			AxiBus      => AxiBus
		);

		AxiBus.WriteAddress.ID      <= saxigp2_awid;
		AxiBus.WriteAddress.Addr    <= saxigp2_awaddr(31 downto 0);
		AxiBus.WriteAddress.Len     <= saxigp2_awlen;
		AxiBus.WriteAddress.Size    <= saxigp2_awsize;
		AxiBus.WriteAddress.Burst   <= saxigp2_awburst;
		AxiBus.WriteAddress.Lock    <= saxigp2_awlock;
		AxiBus.WriteAddress.Cache   <= saxigp2_awcache;
		AxiBus.WriteAddress.Prot    <= saxigp2_awprot;
		AxiBus.WriteAddress.Valid   <= saxigp2_awvalid;
		AxiBus.WriteAddress.User(0) <= saxigp2_awuser;
		AxiBus.WriteAddress.QOS     <= saxigp2_awqos;
		saxigp2_awready             <= AxiBus.WriteAddress.Ready;

		AxiBus.WriteData.Data       <= saxigp2_wdata;
		AxiBus.WriteData.Strb       <= saxigp2_wstrb;
		AxiBus.WriteData.Last       <= saxigp2_wlast;
		AxiBus.WriteData.Valid      <= saxigp2_wvalid;
		saxigp2_wready              <= AxiBus.WriteData.Ready;

		saxigp2_bid                 <= AxiBus.WriteResponse.ID;
		saxigp2_bresp               <= AxiBus.WriteResponse.Resp;
		saxigp2_bvalid              <= AxiBus.WriteResponse.Valid;
		AxiBus.WriteResponse.Ready  <= saxigp2_bready;

		AxiBus.ReadAddress.ID       <= saxigp2_arid;
		AxiBus.ReadAddress.Addr     <= saxigp2_araddr(31 downto 0);
		AxiBus.ReadAddress.Len      <= saxigp2_arlen;
		AxiBus.ReadAddress.Size     <= saxigp2_arsize;
		AxiBus.ReadAddress.Burst    <= saxigp2_arburst;
		AxiBus.ReadAddress.Lock     <= saxigp2_arlock;
		AxiBus.ReadAddress.Cache    <= saxigp2_arcache;
		AxiBus.ReadAddress.Prot     <= saxigp2_arprot;
		AxiBus.ReadAddress.Valid    <= saxigp2_arvalid;
		AxiBus.ReadAddress.User(0)  <= saxigp2_aruser;
		AxiBus.ReadAddress.QOS      <= saxigp2_arqos;
		saxigp2_arready             <= AxiBus.ReadAddress.Ready;

		saxigp2_rid                 <= AxiBus.ReadData.ID;
		saxigp2_rdata               <= AxiBus.ReadData.Data;
		saxigp2_rresp               <= AxiBus.ReadData.Resp;
		saxigp2_rlast               <= AxiBus.ReadData.Last;
		saxigp2_rvalid              <= AxiBus.ReadData.Valid;
		AxiBus.ReadData.Ready       <= saxigp2_rready;
	end block;

	blk_HP1_FPD : block
		signal AxiBus : Axi4RecType(
			WriteAddress(
				Addr(31 downto 0),--saxigp3_awaddr'range),
				ID(saxigp3_awid'range),
				User(0 downto 0)
			),
			WriteData   (
				Data(saxigp3_wdata'range),
				Strb(saxigp3_wstrb'range),
				User(-1 downto 0),
				ID(saxigp3_awid'range)
			),
			WriteResponse(
				ID(saxigp3_bid'range),
				User(-1 downto 0)
			),
			ReadAddress (
				Addr(31 downto 0),--(saxigp3_araddr'range),
				ID(saxigp3_arid'range),
				User(0 downto 0)
			),
			ReadData    (
				Data(saxigp3_rdata'range),
				ID(saxigp3_rid'range),
				User(-1 downto 0)
			)
		);
	begin
		Memory : Axi4MemoryVti
		generic map (
			MODEL_ID_NAME => "HP1_FPD",
			MEMORY_NAME   => "PSDDR4"
		)
		port map (
			-- Globals
			Clk         => saxihp1_fpd_aclk,
			nReset      => '1',

			-- AXI Manager Functional Interface
			AxiBus      => AxiBus
		);

		AxiBus.WriteAddress.ID      <= saxigp3_awid;
		AxiBus.WriteAddress.Addr    <= saxigp3_awaddr(31 downto 0);
		AxiBus.WriteAddress.Len     <= saxigp3_awlen;
		AxiBus.WriteAddress.Size    <= saxigp3_awsize;
		AxiBus.WriteAddress.Burst   <= saxigp3_awburst;
		AxiBus.WriteAddress.Lock    <= saxigp3_awlock;
		AxiBus.WriteAddress.Cache   <= saxigp3_awcache;
		AxiBus.WriteAddress.Prot    <= saxigp3_awprot;
		AxiBus.WriteAddress.Valid   <= saxigp3_awvalid;
		AxiBus.WriteAddress.User(0) <= saxigp3_awuser;
		AxiBus.WriteAddress.QOS     <= saxigp3_awqos;
		saxigp3_awready             <= AxiBus.WriteAddress.Ready;

		AxiBus.WriteData.Data       <= saxigp3_wdata;
		AxiBus.WriteData.Strb       <= saxigp3_wstrb;
		AxiBus.WriteData.Last       <= saxigp3_wlast;
		AxiBus.WriteData.Valid      <= saxigp3_wvalid;
		saxigp3_wready              <= AxiBus.WriteData.Ready;

		saxigp3_bid                 <= AxiBus.WriteResponse.ID;
		saxigp3_bresp               <= AxiBus.WriteResponse.Resp;
		saxigp3_bvalid              <= AxiBus.WriteResponse.Valid;
		AxiBus.WriteResponse.Ready  <= saxigp3_bready;

		AxiBus.ReadAddress.ID       <= saxigp3_arid;
		AxiBus.ReadAddress.Addr     <= saxigp3_araddr(31 downto 0);
		AxiBus.ReadAddress.Len      <= saxigp3_arlen;
		AxiBus.ReadAddress.Size     <= saxigp3_arsize;
		AxiBus.ReadAddress.Burst    <= saxigp3_arburst;
		AxiBus.ReadAddress.Lock     <= saxigp3_arlock;
		AxiBus.ReadAddress.Cache    <= saxigp3_arcache;
		AxiBus.ReadAddress.Prot     <= saxigp3_arprot;
		AxiBus.ReadAddress.Valid    <= saxigp3_arvalid;
		AxiBus.ReadAddress.User(0)  <= saxigp3_aruser;
		AxiBus.ReadAddress.QOS      <= saxigp3_arqos;
		saxigp3_arready             <= AxiBus.ReadAddress.Ready;

		saxigp3_rid                 <= AxiBus.ReadData.ID;
		saxigp3_rdata               <= AxiBus.ReadData.Data;
		saxigp3_rresp               <= AxiBus.ReadData.Resp;
		saxigp3_rlast               <= AxiBus.ReadData.Last;
		saxigp3_rvalid              <= AxiBus.ReadData.Valid;
		AxiBus.ReadData.Ready       <= saxigp3_rready;
	end block;

	blk_HP2_FPD : block
		signal AxiBus : Axi4RecType(
			WriteAddress(
				Addr(31 downto 0),--(saxigp3_awaddr'range),
				ID(saxigp3_awid'range),
				User(0 downto 0)
			),
			WriteData   (
				Data(saxigp3_wdata'range),
				Strb(saxigp3_wstrb'range),
				User(-1 downto 0),
				ID(saxigp3_awid'range)
			),
			WriteResponse(
				ID(saxigp3_bid'range),
				User(-1 downto 0)
			),
			ReadAddress (
				Addr(31 downto 0),--(saxigp3_araddr'range),
				ID(saxigp3_arid'range),
				User(0 downto 0)
			),
			ReadData    (
				Data(saxigp3_rdata'range),
				ID(saxigp3_rid'range),
				User(-1 downto 0)
			)
		);
	begin
		Memory : Axi4MemoryVti
		generic map (
			MODEL_ID_NAME => "HP2_FPD",
			MEMORY_NAME   => "PSDDR4"
		)
		port map (
			-- Globals
			Clk         => saxihp2_fpd_aclk,
			nReset      => '1',

			-- AXI Manager Functional Interface
			AxiBus      => AxiBus
		);

		AxiBus.WriteAddress.ID      <= saxigp4_awid;
		AxiBus.WriteAddress.Addr    <= saxigp4_awaddr(31 downto 0);
		AxiBus.WriteAddress.Len     <= saxigp4_awlen;
		AxiBus.WriteAddress.Size    <= saxigp4_awsize;
		AxiBus.WriteAddress.Burst   <= saxigp4_awburst;
		AxiBus.WriteAddress.Lock    <= saxigp4_awlock;
		AxiBus.WriteAddress.Cache   <= saxigp4_awcache;
		AxiBus.WriteAddress.Prot    <= saxigp4_awprot;
		AxiBus.WriteAddress.Valid   <= saxigp4_awvalid;
		AxiBus.WriteAddress.User(0) <= saxigp4_awuser;
		AxiBus.WriteAddress.QOS     <= saxigp4_awqos;
		saxigp4_awready             <= AxiBus.WriteAddress.Ready;

		AxiBus.WriteData.Data       <= saxigp4_wdata;
		AxiBus.WriteData.Strb       <= saxigp4_wstrb;
		AxiBus.WriteData.Last       <= saxigp4_wlast;
		AxiBus.WriteData.Valid      <= saxigp4_wvalid;
		saxigp4_wready              <= AxiBus.WriteData.Ready;

		saxigp4_bid                 <= AxiBus.WriteResponse.ID;
		saxigp4_bresp               <= AxiBus.WriteResponse.Resp;
		saxigp4_bvalid              <= AxiBus.WriteResponse.Valid;
		AxiBus.WriteResponse.Ready  <= saxigp4_bready;

		AxiBus.ReadAddress.ID       <= saxigp4_arid;
		AxiBus.ReadAddress.Addr     <= saxigp4_araddr(31 downto 0);
		AxiBus.ReadAddress.Len      <= saxigp4_arlen;
		AxiBus.ReadAddress.Size     <= saxigp4_arsize;
		AxiBus.ReadAddress.Burst    <= saxigp4_arburst;
		AxiBus.ReadAddress.Lock     <= saxigp4_arlock;
		AxiBus.ReadAddress.Cache    <= saxigp4_arcache;
		AxiBus.ReadAddress.Prot     <= saxigp4_arprot;
		AxiBus.ReadAddress.Valid    <= saxigp4_arvalid;
		AxiBus.ReadAddress.User(0)  <= saxigp4_aruser;
		AxiBus.ReadAddress.QOS      <= saxigp4_arqos;
		saxigp4_arready             <= AxiBus.ReadAddress.Ready;

		saxigp4_rid                 <= AxiBus.ReadData.ID;
		saxigp4_rdata               <= AxiBus.ReadData.Data;
		saxigp4_rresp               <= AxiBus.ReadData.Resp;
		saxigp4_rlast               <= AxiBus.ReadData.Last;
		saxigp4_rvalid              <= AxiBus.ReadData.Valid;
		AxiBus.ReadData.Ready       <= saxigp4_rready;
	end block;

	blk_HP3_FPD : block
		signal AxiBus : Axi4RecType(
			WriteAddress(
				Addr(31 downto 0),--(saxigp5_awaddr'range),
				ID(saxigp5_awid'range),
				User(0 downto 0)
			),
			WriteData   (
				Data(saxigp5_wdata'range),
				Strb(saxigp5_wstrb'range),
				User(-1 downto 0),
				ID(saxigp5_awid'range)
			),
			WriteResponse(
				ID(saxigp5_bid'range),
				User(-1 downto 0)
			),
			ReadAddress (
				Addr(31 downto 0),--(saxigp5_araddr'range),
				ID(saxigp5_arid'range),
				User(0 downto 0)
			),
			ReadData    (
				Data(saxigp5_rdata'range),
				ID(saxigp5_rid'range),
				User(-1 downto 0)
			)
		);
	begin
		Memory : Axi4MemoryVti
		generic map (
			MODEL_ID_NAME => "HP3_FPD",
			MEMORY_NAME   => "PSDDR4"
		)
		port map (
			-- Globals
			Clk         => saxihp3_fpd_aclk,
			nReset      => '1',

			-- AXI Manager Functional Interface
			AxiBus      => AxiBus
		);

		AxiBus.WriteAddress.ID      <= saxigp5_awid;
		AxiBus.WriteAddress.Addr    <= saxigp5_awaddr(31 downto 0);
		AxiBus.WriteAddress.Len     <= saxigp5_awlen;
		AxiBus.WriteAddress.Size    <= saxigp5_awsize;
		AxiBus.WriteAddress.Burst   <= saxigp5_awburst;
		AxiBus.WriteAddress.Lock    <= saxigp5_awlock;
		AxiBus.WriteAddress.Cache   <= saxigp5_awcache;
		AxiBus.WriteAddress.Prot    <= saxigp5_awprot;
		AxiBus.WriteAddress.Valid   <= saxigp5_awvalid;
		AxiBus.WriteAddress.User(0) <= saxigp5_awuser;
		AxiBus.WriteAddress.QOS     <= saxigp5_awqos;
		saxigp5_awready             <= AxiBus.WriteAddress.Ready;

		AxiBus.WriteData.Data       <= saxigp5_wdata;
		AxiBus.WriteData.Strb       <= saxigp5_wstrb;
		AxiBus.WriteData.Last       <= saxigp5_wlast;
		AxiBus.WriteData.Valid      <= saxigp5_wvalid;
		saxigp5_wready              <= AxiBus.WriteData.Ready;

		saxigp5_bid                 <= AxiBus.WriteResponse.ID;
		saxigp5_bresp               <= AxiBus.WriteResponse.Resp;
		saxigp5_bvalid              <= AxiBus.WriteResponse.Valid;
		AxiBus.WriteResponse.Ready  <= saxigp5_bready;

		AxiBus.ReadAddress.ID       <= saxigp5_arid;
		AxiBus.ReadAddress.Addr     <= saxigp5_araddr(31 downto 0);
		AxiBus.ReadAddress.Len      <= saxigp5_arlen;
		AxiBus.ReadAddress.Size     <= saxigp5_arsize;
		AxiBus.ReadAddress.Burst    <= saxigp5_arburst;
		AxiBus.ReadAddress.Lock     <= saxigp5_arlock;
		AxiBus.ReadAddress.Cache    <= saxigp5_arcache;
		AxiBus.ReadAddress.Prot     <= saxigp5_arprot;
		AxiBus.ReadAddress.Valid    <= saxigp5_arvalid;
		AxiBus.ReadAddress.User(0)  <= saxigp5_aruser;
		AxiBus.ReadAddress.QOS      <= saxigp5_arqos;
		saxigp5_arready             <= AxiBus.ReadAddress.Ready;

		saxigp5_rid                 <= AxiBus.ReadData.ID;
		saxigp5_rdata               <= AxiBus.ReadData.Data;
		saxigp5_rresp               <= AxiBus.ReadData.Resp;
		saxigp5_rlast               <= AxiBus.ReadData.Last;
		saxigp5_rvalid              <= AxiBus.ReadData.Valid;
		AxiBus.ReadData.Ready       <= saxigp5_rready;
	end block;
end architecture;
