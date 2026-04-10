--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
--Date        : Fri Apr 10 17:56:14 2026
--Host        : Paebbels-PLC2 running 64-bit major release  (build 9200)
--Command     : generate_target BlockDesign.bd
--Design      : BlockDesign
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BlockDesign is
  port (
    Clock_0 : out STD_LOGIC;
    Config_0_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    Config_0_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Config_0_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Config_0_arid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Config_0_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Config_0_arlock : out STD_LOGIC;
    Config_0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Config_0_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Config_0_arready : in STD_LOGIC;
    Config_0_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Config_0_aruser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Config_0_arvalid : out STD_LOGIC;
    Config_0_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    Config_0_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Config_0_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Config_0_awid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Config_0_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Config_0_awlock : out STD_LOGIC;
    Config_0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Config_0_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Config_0_awready : in STD_LOGIC;
    Config_0_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Config_0_awuser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Config_0_awvalid : out STD_LOGIC;
    Config_0_bid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Config_0_bready : out STD_LOGIC;
    Config_0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Config_0_bvalid : in STD_LOGIC;
    Config_0_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Config_0_rid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Config_0_rlast : in STD_LOGIC;
    Config_0_rready : out STD_LOGIC;
    Config_0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Config_0_rvalid : in STD_LOGIC;
    Config_0_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Config_0_wlast : out STD_LOGIC;
    Config_0_wready : in STD_LOGIC;
    Config_0_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Config_0_wvalid : out STD_LOGIC;
    Config_Clk : in STD_LOGIC;
    Manager_0_Clk : in STD_LOGIC;
    Manager_0_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    Manager_0_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Manager_0_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Manager_0_arid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_0_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Manager_0_arlock : out STD_LOGIC;
    Manager_0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Manager_0_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Manager_0_arready : in STD_LOGIC;
    Manager_0_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Manager_0_aruser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_0_arvalid : out STD_LOGIC;
    Manager_0_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    Manager_0_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Manager_0_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Manager_0_awid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_0_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Manager_0_awlock : out STD_LOGIC;
    Manager_0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Manager_0_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Manager_0_awready : in STD_LOGIC;
    Manager_0_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Manager_0_awuser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_0_awvalid : out STD_LOGIC;
    Manager_0_bid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_0_bready : out STD_LOGIC;
    Manager_0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Manager_0_bvalid : in STD_LOGIC;
    Manager_0_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    Manager_0_rid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_0_rlast : in STD_LOGIC;
    Manager_0_rready : out STD_LOGIC;
    Manager_0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Manager_0_rvalid : in STD_LOGIC;
    Manager_0_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    Manager_0_wlast : out STD_LOGIC;
    Manager_0_wready : in STD_LOGIC;
    Manager_0_wstrb : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_0_wvalid : out STD_LOGIC;
    Manager_1_Clk : in STD_LOGIC;
    Manager_1_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    Manager_1_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Manager_1_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Manager_1_arid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_1_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Manager_1_arlock : out STD_LOGIC;
    Manager_1_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Manager_1_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Manager_1_arready : in STD_LOGIC;
    Manager_1_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Manager_1_aruser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_1_arvalid : out STD_LOGIC;
    Manager_1_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    Manager_1_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Manager_1_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Manager_1_awid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_1_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Manager_1_awlock : out STD_LOGIC;
    Manager_1_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Manager_1_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Manager_1_awready : in STD_LOGIC;
    Manager_1_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Manager_1_awuser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_1_awvalid : out STD_LOGIC;
    Manager_1_bid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_1_bready : out STD_LOGIC;
    Manager_1_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Manager_1_bvalid : in STD_LOGIC;
    Manager_1_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    Manager_1_rid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_1_rlast : in STD_LOGIC;
    Manager_1_rready : out STD_LOGIC;
    Manager_1_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Manager_1_rvalid : in STD_LOGIC;
    Manager_1_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    Manager_1_wlast : out STD_LOGIC;
    Manager_1_wready : in STD_LOGIC;
    Manager_1_wstrb : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_1_wvalid : out STD_LOGIC;
    PL_IRQs : in STD_LOGIC_VECTOR ( 7 downto 0 );
    PL_Reset_0 : out STD_LOGIC;
    Subordinate_0_Clk : in STD_LOGIC;
    Subordinate_0_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    Subordinate_0_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_0_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_0_arid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_0_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Subordinate_0_arlock : in STD_LOGIC;
    Subordinate_0_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_0_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_0_arready : out STD_LOGIC;
    Subordinate_0_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_0_aruser : in STD_LOGIC;
    Subordinate_0_arvalid : in STD_LOGIC;
    Subordinate_0_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    Subordinate_0_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_0_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_0_awid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_0_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Subordinate_0_awlock : in STD_LOGIC;
    Subordinate_0_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_0_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_0_awready : out STD_LOGIC;
    Subordinate_0_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_0_awuser : in STD_LOGIC;
    Subordinate_0_awvalid : in STD_LOGIC;
    Subordinate_0_bid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_0_bready : in STD_LOGIC;
    Subordinate_0_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_0_bvalid : out STD_LOGIC;
    Subordinate_0_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    Subordinate_0_rid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_0_rlast : out STD_LOGIC;
    Subordinate_0_rready : in STD_LOGIC;
    Subordinate_0_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_0_rvalid : out STD_LOGIC;
    Subordinate_0_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    Subordinate_0_wlast : in STD_LOGIC;
    Subordinate_0_wready : out STD_LOGIC;
    Subordinate_0_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Subordinate_0_wvalid : in STD_LOGIC;
    Subordinate_1_Clk : in STD_LOGIC;
    Subordinate_1_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    Subordinate_1_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_1_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_1_arid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_1_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Subordinate_1_arlock : in STD_LOGIC;
    Subordinate_1_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_1_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_1_arready : out STD_LOGIC;
    Subordinate_1_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_1_aruser : in STD_LOGIC;
    Subordinate_1_arvalid : in STD_LOGIC;
    Subordinate_1_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    Subordinate_1_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_1_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_1_awid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_1_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Subordinate_1_awlock : in STD_LOGIC;
    Subordinate_1_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_1_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_1_awready : out STD_LOGIC;
    Subordinate_1_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_1_awuser : in STD_LOGIC;
    Subordinate_1_awvalid : in STD_LOGIC;
    Subordinate_1_bid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_1_bready : in STD_LOGIC;
    Subordinate_1_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_1_bvalid : out STD_LOGIC;
    Subordinate_1_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    Subordinate_1_rid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_1_rlast : out STD_LOGIC;
    Subordinate_1_rready : in STD_LOGIC;
    Subordinate_1_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_1_rvalid : out STD_LOGIC;
    Subordinate_1_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    Subordinate_1_wlast : in STD_LOGIC;
    Subordinate_1_wready : out STD_LOGIC;
    Subordinate_1_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Subordinate_1_wvalid : in STD_LOGIC;
    Subordinate_2_Clk : in STD_LOGIC;
    Subordinate_2_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    Subordinate_2_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_2_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_2_arid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_2_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Subordinate_2_arlock : in STD_LOGIC;
    Subordinate_2_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_2_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_2_arready : out STD_LOGIC;
    Subordinate_2_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_2_aruser : in STD_LOGIC;
    Subordinate_2_arvalid : in STD_LOGIC;
    Subordinate_2_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    Subordinate_2_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_2_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_2_awid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_2_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Subordinate_2_awlock : in STD_LOGIC;
    Subordinate_2_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_2_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_2_awready : out STD_LOGIC;
    Subordinate_2_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_2_awuser : in STD_LOGIC;
    Subordinate_2_awvalid : in STD_LOGIC;
    Subordinate_2_bid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_2_bready : in STD_LOGIC;
    Subordinate_2_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_2_bvalid : out STD_LOGIC;
    Subordinate_2_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    Subordinate_2_rid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_2_rlast : out STD_LOGIC;
    Subordinate_2_rready : in STD_LOGIC;
    Subordinate_2_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_2_rvalid : out STD_LOGIC;
    Subordinate_2_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    Subordinate_2_wlast : in STD_LOGIC;
    Subordinate_2_wready : out STD_LOGIC;
    Subordinate_2_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Subordinate_2_wvalid : in STD_LOGIC;
    Subordinate_3_Clk : in STD_LOGIC;
    Subordinate_3_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    Subordinate_3_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_3_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_3_arid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_3_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Subordinate_3_arlock : in STD_LOGIC;
    Subordinate_3_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_3_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_3_arready : out STD_LOGIC;
    Subordinate_3_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_3_aruser : in STD_LOGIC;
    Subordinate_3_arvalid : in STD_LOGIC;
    Subordinate_3_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    Subordinate_3_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_3_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_3_awid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_3_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Subordinate_3_awlock : in STD_LOGIC;
    Subordinate_3_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_3_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_3_awready : out STD_LOGIC;
    Subordinate_3_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_3_awuser : in STD_LOGIC;
    Subordinate_3_awvalid : in STD_LOGIC;
    Subordinate_3_bid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_3_bready : in STD_LOGIC;
    Subordinate_3_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_3_bvalid : out STD_LOGIC;
    Subordinate_3_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    Subordinate_3_rid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_3_rlast : out STD_LOGIC;
    Subordinate_3_rready : in STD_LOGIC;
    Subordinate_3_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_3_rvalid : out STD_LOGIC;
    Subordinate_3_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    Subordinate_3_wlast : in STD_LOGIC;
    Subordinate_3_wready : out STD_LOGIC;
    Subordinate_3_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Subordinate_3_wvalid : in STD_LOGIC;
    UART_1_rxd : in STD_LOGIC;
    UART_1_txd : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of BlockDesign : entity is "BlockDesign,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=BlockDesign,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of BlockDesign : entity is "BlockDesign.hwdef";
end BlockDesign;

architecture STRUCTURE of BlockDesign is
  component BlockDesign_PS_0 is
  port (
    maxihpm0_fpd_aclk : in STD_LOGIC;
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
    maxihpm1_fpd_aclk : in STD_LOGIC;
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
    maxihpm0_lpd_aclk : in STD_LOGIC;
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
    saxihp0_fpd_aclk : in STD_LOGIC;
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
    saxihp1_fpd_aclk : in STD_LOGIC;
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
    saxihp2_fpd_aclk : in STD_LOGIC;
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
    saxihp3_fpd_aclk : in STD_LOGIC;
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
    emio_uart1_rxd : in STD_LOGIC;
    pl_ps_irq0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pl_resetn0 : out STD_LOGIC;
    pl_clk0 : out STD_LOGIC
  );
  end component BlockDesign_PS_0;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of Clock_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLOCK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of Clock_0 : signal is "XIL_INTERFACENAME CLK.CLOCK_0, CLK_DOMAIN BlockDesign_PS_0_pl_clk0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of Config_0_arlock : signal is "xilinx.com:interface:aximm:1.0 Config_0 ARLOCK";
  attribute X_INTERFACE_INFO of Config_0_arready : signal is "xilinx.com:interface:aximm:1.0 Config_0 ARREADY";
  attribute X_INTERFACE_INFO of Config_0_arvalid : signal is "xilinx.com:interface:aximm:1.0 Config_0 ARVALID";
  attribute X_INTERFACE_INFO of Config_0_awlock : signal is "xilinx.com:interface:aximm:1.0 Config_0 AWLOCK";
  attribute X_INTERFACE_INFO of Config_0_awready : signal is "xilinx.com:interface:aximm:1.0 Config_0 AWREADY";
  attribute X_INTERFACE_INFO of Config_0_awvalid : signal is "xilinx.com:interface:aximm:1.0 Config_0 AWVALID";
  attribute X_INTERFACE_INFO of Config_0_bready : signal is "xilinx.com:interface:aximm:1.0 Config_0 BREADY";
  attribute X_INTERFACE_INFO of Config_0_bvalid : signal is "xilinx.com:interface:aximm:1.0 Config_0 BVALID";
  attribute X_INTERFACE_INFO of Config_0_rlast : signal is "xilinx.com:interface:aximm:1.0 Config_0 RLAST";
  attribute X_INTERFACE_INFO of Config_0_rready : signal is "xilinx.com:interface:aximm:1.0 Config_0 RREADY";
  attribute X_INTERFACE_INFO of Config_0_rvalid : signal is "xilinx.com:interface:aximm:1.0 Config_0 RVALID";
  attribute X_INTERFACE_INFO of Config_0_wlast : signal is "xilinx.com:interface:aximm:1.0 Config_0 WLAST";
  attribute X_INTERFACE_INFO of Config_0_wready : signal is "xilinx.com:interface:aximm:1.0 Config_0 WREADY";
  attribute X_INTERFACE_INFO of Config_0_wvalid : signal is "xilinx.com:interface:aximm:1.0 Config_0 WVALID";
  attribute X_INTERFACE_INFO of Config_Clk : signal is "xilinx.com:signal:clock:1.0 CLK.CONFIG_CLK CLK";
  attribute X_INTERFACE_PARAMETER of Config_Clk : signal is "XIL_INTERFACENAME CLK.CONFIG_CLK, ASSOCIATED_BUSIF Config_0, CLK_DOMAIN BlockDesign_maxihpm0_lpd_aclk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of Manager_0_Clk : signal is "xilinx.com:signal:clock:1.0 CLK.MANAGER_0_CLK CLK";
  attribute X_INTERFACE_PARAMETER of Manager_0_Clk : signal is "XIL_INTERFACENAME CLK.MANAGER_0_CLK, ASSOCIATED_BUSIF Manager_0, CLK_DOMAIN BlockDesign_Config_Clk1, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of Manager_0_arlock : signal is "xilinx.com:interface:aximm:1.0 Manager_0 ARLOCK";
  attribute X_INTERFACE_INFO of Manager_0_arready : signal is "xilinx.com:interface:aximm:1.0 Manager_0 ARREADY";
  attribute X_INTERFACE_INFO of Manager_0_arvalid : signal is "xilinx.com:interface:aximm:1.0 Manager_0 ARVALID";
  attribute X_INTERFACE_INFO of Manager_0_awlock : signal is "xilinx.com:interface:aximm:1.0 Manager_0 AWLOCK";
  attribute X_INTERFACE_INFO of Manager_0_awready : signal is "xilinx.com:interface:aximm:1.0 Manager_0 AWREADY";
  attribute X_INTERFACE_INFO of Manager_0_awvalid : signal is "xilinx.com:interface:aximm:1.0 Manager_0 AWVALID";
  attribute X_INTERFACE_INFO of Manager_0_bready : signal is "xilinx.com:interface:aximm:1.0 Manager_0 BREADY";
  attribute X_INTERFACE_INFO of Manager_0_bvalid : signal is "xilinx.com:interface:aximm:1.0 Manager_0 BVALID";
  attribute X_INTERFACE_INFO of Manager_0_rlast : signal is "xilinx.com:interface:aximm:1.0 Manager_0 RLAST";
  attribute X_INTERFACE_INFO of Manager_0_rready : signal is "xilinx.com:interface:aximm:1.0 Manager_0 RREADY";
  attribute X_INTERFACE_INFO of Manager_0_rvalid : signal is "xilinx.com:interface:aximm:1.0 Manager_0 RVALID";
  attribute X_INTERFACE_INFO of Manager_0_wlast : signal is "xilinx.com:interface:aximm:1.0 Manager_0 WLAST";
  attribute X_INTERFACE_INFO of Manager_0_wready : signal is "xilinx.com:interface:aximm:1.0 Manager_0 WREADY";
  attribute X_INTERFACE_INFO of Manager_0_wvalid : signal is "xilinx.com:interface:aximm:1.0 Manager_0 WVALID";
  attribute X_INTERFACE_INFO of Manager_1_Clk : signal is "xilinx.com:signal:clock:1.0 CLK.MANAGER_1_CLK CLK";
  attribute X_INTERFACE_PARAMETER of Manager_1_Clk : signal is "XIL_INTERFACENAME CLK.MANAGER_1_CLK, ASSOCIATED_BUSIF Manager_1, CLK_DOMAIN BlockDesign_Config_Clk1, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of Manager_1_arlock : signal is "xilinx.com:interface:aximm:1.0 Manager_1 ARLOCK";
  attribute X_INTERFACE_INFO of Manager_1_arready : signal is "xilinx.com:interface:aximm:1.0 Manager_1 ARREADY";
  attribute X_INTERFACE_INFO of Manager_1_arvalid : signal is "xilinx.com:interface:aximm:1.0 Manager_1 ARVALID";
  attribute X_INTERFACE_INFO of Manager_1_awlock : signal is "xilinx.com:interface:aximm:1.0 Manager_1 AWLOCK";
  attribute X_INTERFACE_INFO of Manager_1_awready : signal is "xilinx.com:interface:aximm:1.0 Manager_1 AWREADY";
  attribute X_INTERFACE_INFO of Manager_1_awvalid : signal is "xilinx.com:interface:aximm:1.0 Manager_1 AWVALID";
  attribute X_INTERFACE_INFO of Manager_1_bready : signal is "xilinx.com:interface:aximm:1.0 Manager_1 BREADY";
  attribute X_INTERFACE_INFO of Manager_1_bvalid : signal is "xilinx.com:interface:aximm:1.0 Manager_1 BVALID";
  attribute X_INTERFACE_INFO of Manager_1_rlast : signal is "xilinx.com:interface:aximm:1.0 Manager_1 RLAST";
  attribute X_INTERFACE_INFO of Manager_1_rready : signal is "xilinx.com:interface:aximm:1.0 Manager_1 RREADY";
  attribute X_INTERFACE_INFO of Manager_1_rvalid : signal is "xilinx.com:interface:aximm:1.0 Manager_1 RVALID";
  attribute X_INTERFACE_INFO of Manager_1_wlast : signal is "xilinx.com:interface:aximm:1.0 Manager_1 WLAST";
  attribute X_INTERFACE_INFO of Manager_1_wready : signal is "xilinx.com:interface:aximm:1.0 Manager_1 WREADY";
  attribute X_INTERFACE_INFO of Manager_1_wvalid : signal is "xilinx.com:interface:aximm:1.0 Manager_1 WVALID";
  attribute X_INTERFACE_INFO of PL_Reset_0 : signal is "xilinx.com:signal:reset:1.0 RST.PL_RESET_0 RST";
  attribute X_INTERFACE_PARAMETER of PL_Reset_0 : signal is "XIL_INTERFACENAME RST.PL_RESET_0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of Subordinate_0_Clk : signal is "xilinx.com:signal:clock:1.0 CLK.SUBORDINATE_0_CLK CLK";
  attribute X_INTERFACE_PARAMETER of Subordinate_0_Clk : signal is "XIL_INTERFACENAME CLK.SUBORDINATE_0_CLK, ASSOCIATED_BUSIF Subordinate_0, CLK_DOMAIN BlockDesign_Subordinate_0_Clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of Subordinate_0_arlock : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 ARLOCK";
  attribute X_INTERFACE_INFO of Subordinate_0_arready : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 ARREADY";
  attribute X_INTERFACE_INFO of Subordinate_0_aruser : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 ARUSER";
  attribute X_INTERFACE_INFO of Subordinate_0_arvalid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 ARVALID";
  attribute X_INTERFACE_INFO of Subordinate_0_awlock : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 AWLOCK";
  attribute X_INTERFACE_INFO of Subordinate_0_awready : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 AWREADY";
  attribute X_INTERFACE_INFO of Subordinate_0_awuser : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 AWUSER";
  attribute X_INTERFACE_INFO of Subordinate_0_awvalid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 AWVALID";
  attribute X_INTERFACE_INFO of Subordinate_0_bready : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 BREADY";
  attribute X_INTERFACE_INFO of Subordinate_0_bvalid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 BVALID";
  attribute X_INTERFACE_INFO of Subordinate_0_rlast : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 RLAST";
  attribute X_INTERFACE_INFO of Subordinate_0_rready : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 RREADY";
  attribute X_INTERFACE_INFO of Subordinate_0_rvalid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 RVALID";
  attribute X_INTERFACE_INFO of Subordinate_0_wlast : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 WLAST";
  attribute X_INTERFACE_INFO of Subordinate_0_wready : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 WREADY";
  attribute X_INTERFACE_INFO of Subordinate_0_wvalid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 WVALID";
  attribute X_INTERFACE_INFO of Subordinate_1_Clk : signal is "xilinx.com:signal:clock:1.0 CLK.SUBORDINATE_1_CLK CLK";
  attribute X_INTERFACE_PARAMETER of Subordinate_1_Clk : signal is "XIL_INTERFACENAME CLK.SUBORDINATE_1_CLK, ASSOCIATED_BUSIF Subordinate_1, CLK_DOMAIN BlockDesign_Subordinate_0_Clk1, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of Subordinate_1_arlock : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 ARLOCK";
  attribute X_INTERFACE_INFO of Subordinate_1_arready : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 ARREADY";
  attribute X_INTERFACE_INFO of Subordinate_1_aruser : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 ARUSER";
  attribute X_INTERFACE_INFO of Subordinate_1_arvalid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 ARVALID";
  attribute X_INTERFACE_INFO of Subordinate_1_awlock : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 AWLOCK";
  attribute X_INTERFACE_INFO of Subordinate_1_awready : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 AWREADY";
  attribute X_INTERFACE_INFO of Subordinate_1_awuser : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 AWUSER";
  attribute X_INTERFACE_INFO of Subordinate_1_awvalid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 AWVALID";
  attribute X_INTERFACE_INFO of Subordinate_1_bready : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 BREADY";
  attribute X_INTERFACE_INFO of Subordinate_1_bvalid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 BVALID";
  attribute X_INTERFACE_INFO of Subordinate_1_rlast : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 RLAST";
  attribute X_INTERFACE_INFO of Subordinate_1_rready : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 RREADY";
  attribute X_INTERFACE_INFO of Subordinate_1_rvalid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 RVALID";
  attribute X_INTERFACE_INFO of Subordinate_1_wlast : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 WLAST";
  attribute X_INTERFACE_INFO of Subordinate_1_wready : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 WREADY";
  attribute X_INTERFACE_INFO of Subordinate_1_wvalid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 WVALID";
  attribute X_INTERFACE_INFO of Subordinate_2_Clk : signal is "xilinx.com:signal:clock:1.0 CLK.SUBORDINATE_2_CLK CLK";
  attribute X_INTERFACE_PARAMETER of Subordinate_2_Clk : signal is "XIL_INTERFACENAME CLK.SUBORDINATE_2_CLK, ASSOCIATED_BUSIF Subordinate_2, CLK_DOMAIN BlockDesign_Subordinate_0_Clk2, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of Subordinate_2_arlock : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 ARLOCK";
  attribute X_INTERFACE_INFO of Subordinate_2_arready : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 ARREADY";
  attribute X_INTERFACE_INFO of Subordinate_2_aruser : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 ARUSER";
  attribute X_INTERFACE_INFO of Subordinate_2_arvalid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 ARVALID";
  attribute X_INTERFACE_INFO of Subordinate_2_awlock : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 AWLOCK";
  attribute X_INTERFACE_INFO of Subordinate_2_awready : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 AWREADY";
  attribute X_INTERFACE_INFO of Subordinate_2_awuser : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 AWUSER";
  attribute X_INTERFACE_INFO of Subordinate_2_awvalid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 AWVALID";
  attribute X_INTERFACE_INFO of Subordinate_2_bready : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 BREADY";
  attribute X_INTERFACE_INFO of Subordinate_2_bvalid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 BVALID";
  attribute X_INTERFACE_INFO of Subordinate_2_rlast : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 RLAST";
  attribute X_INTERFACE_INFO of Subordinate_2_rready : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 RREADY";
  attribute X_INTERFACE_INFO of Subordinate_2_rvalid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 RVALID";
  attribute X_INTERFACE_INFO of Subordinate_2_wlast : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 WLAST";
  attribute X_INTERFACE_INFO of Subordinate_2_wready : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 WREADY";
  attribute X_INTERFACE_INFO of Subordinate_2_wvalid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 WVALID";
  attribute X_INTERFACE_INFO of Subordinate_3_Clk : signal is "xilinx.com:signal:clock:1.0 CLK.SUBORDINATE_3_CLK CLK";
  attribute X_INTERFACE_PARAMETER of Subordinate_3_Clk : signal is "XIL_INTERFACENAME CLK.SUBORDINATE_3_CLK, ASSOCIATED_BUSIF Subordinate_3, CLK_DOMAIN BlockDesign_Subordinate_0_Clk3, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of Subordinate_3_arlock : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 ARLOCK";
  attribute X_INTERFACE_INFO of Subordinate_3_arready : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 ARREADY";
  attribute X_INTERFACE_INFO of Subordinate_3_aruser : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 ARUSER";
  attribute X_INTERFACE_INFO of Subordinate_3_arvalid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 ARVALID";
  attribute X_INTERFACE_INFO of Subordinate_3_awlock : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 AWLOCK";
  attribute X_INTERFACE_INFO of Subordinate_3_awready : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 AWREADY";
  attribute X_INTERFACE_INFO of Subordinate_3_awuser : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 AWUSER";
  attribute X_INTERFACE_INFO of Subordinate_3_awvalid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 AWVALID";
  attribute X_INTERFACE_INFO of Subordinate_3_bready : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 BREADY";
  attribute X_INTERFACE_INFO of Subordinate_3_bvalid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 BVALID";
  attribute X_INTERFACE_INFO of Subordinate_3_rlast : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 RLAST";
  attribute X_INTERFACE_INFO of Subordinate_3_rready : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 RREADY";
  attribute X_INTERFACE_INFO of Subordinate_3_rvalid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 RVALID";
  attribute X_INTERFACE_INFO of Subordinate_3_wlast : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 WLAST";
  attribute X_INTERFACE_INFO of Subordinate_3_wready : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 WREADY";
  attribute X_INTERFACE_INFO of Subordinate_3_wvalid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 WVALID";
  attribute X_INTERFACE_INFO of UART_1_rxd : signal is "xilinx.com:interface:uart:1.0 UART_1 RxD";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of UART_1_rxd : signal is "Master";
  attribute X_INTERFACE_INFO of UART_1_txd : signal is "xilinx.com:interface:uart:1.0 UART_1 TxD";
  attribute X_INTERFACE_INFO of Config_0_araddr : signal is "xilinx.com:interface:aximm:1.0 Config_0 ARADDR";
  attribute X_INTERFACE_MODE of Config_0_araddr : signal is "Master";
  attribute X_INTERFACE_PARAMETER of Config_0_araddr : signal is "XIL_INTERFACENAME Config_0, ADDR_WIDTH 40, ARUSER_WIDTH 16, AWUSER_WIDTH 16, BUSER_WIDTH 0, CLK_DOMAIN BlockDesign_maxihpm0_lpd_aclk_0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 16, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 8, NUM_READ_THREADS 4, NUM_WRITE_OUTSTANDING 8, NUM_WRITE_THREADS 4, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of Config_0_arburst : signal is "xilinx.com:interface:aximm:1.0 Config_0 ARBURST";
  attribute X_INTERFACE_INFO of Config_0_arcache : signal is "xilinx.com:interface:aximm:1.0 Config_0 ARCACHE";
  attribute X_INTERFACE_INFO of Config_0_arid : signal is "xilinx.com:interface:aximm:1.0 Config_0 ARID";
  attribute X_INTERFACE_INFO of Config_0_arlen : signal is "xilinx.com:interface:aximm:1.0 Config_0 ARLEN";
  attribute X_INTERFACE_INFO of Config_0_arprot : signal is "xilinx.com:interface:aximm:1.0 Config_0 ARPROT";
  attribute X_INTERFACE_INFO of Config_0_arqos : signal is "xilinx.com:interface:aximm:1.0 Config_0 ARQOS";
  attribute X_INTERFACE_INFO of Config_0_arsize : signal is "xilinx.com:interface:aximm:1.0 Config_0 ARSIZE";
  attribute X_INTERFACE_INFO of Config_0_aruser : signal is "xilinx.com:interface:aximm:1.0 Config_0 ARUSER";
  attribute X_INTERFACE_INFO of Config_0_awaddr : signal is "xilinx.com:interface:aximm:1.0 Config_0 AWADDR";
  attribute X_INTERFACE_INFO of Config_0_awburst : signal is "xilinx.com:interface:aximm:1.0 Config_0 AWBURST";
  attribute X_INTERFACE_INFO of Config_0_awcache : signal is "xilinx.com:interface:aximm:1.0 Config_0 AWCACHE";
  attribute X_INTERFACE_INFO of Config_0_awid : signal is "xilinx.com:interface:aximm:1.0 Config_0 AWID";
  attribute X_INTERFACE_INFO of Config_0_awlen : signal is "xilinx.com:interface:aximm:1.0 Config_0 AWLEN";
  attribute X_INTERFACE_INFO of Config_0_awprot : signal is "xilinx.com:interface:aximm:1.0 Config_0 AWPROT";
  attribute X_INTERFACE_INFO of Config_0_awqos : signal is "xilinx.com:interface:aximm:1.0 Config_0 AWQOS";
  attribute X_INTERFACE_INFO of Config_0_awsize : signal is "xilinx.com:interface:aximm:1.0 Config_0 AWSIZE";
  attribute X_INTERFACE_INFO of Config_0_awuser : signal is "xilinx.com:interface:aximm:1.0 Config_0 AWUSER";
  attribute X_INTERFACE_INFO of Config_0_bid : signal is "xilinx.com:interface:aximm:1.0 Config_0 BID";
  attribute X_INTERFACE_INFO of Config_0_bresp : signal is "xilinx.com:interface:aximm:1.0 Config_0 BRESP";
  attribute X_INTERFACE_INFO of Config_0_rdata : signal is "xilinx.com:interface:aximm:1.0 Config_0 RDATA";
  attribute X_INTERFACE_INFO of Config_0_rid : signal is "xilinx.com:interface:aximm:1.0 Config_0 RID";
  attribute X_INTERFACE_INFO of Config_0_rresp : signal is "xilinx.com:interface:aximm:1.0 Config_0 RRESP";
  attribute X_INTERFACE_INFO of Config_0_wdata : signal is "xilinx.com:interface:aximm:1.0 Config_0 WDATA";
  attribute X_INTERFACE_INFO of Config_0_wstrb : signal is "xilinx.com:interface:aximm:1.0 Config_0 WSTRB";
  attribute X_INTERFACE_INFO of Manager_0_araddr : signal is "xilinx.com:interface:aximm:1.0 Manager_0 ARADDR";
  attribute X_INTERFACE_MODE of Manager_0_araddr : signal is "Master";
  attribute X_INTERFACE_PARAMETER of Manager_0_araddr : signal is "XIL_INTERFACENAME Manager_0, ADDR_WIDTH 40, ARUSER_WIDTH 16, AWUSER_WIDTH 16, BUSER_WIDTH 0, CLK_DOMAIN BlockDesign_Config_Clk1, DATA_WIDTH 128, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 16, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 8, NUM_READ_THREADS 4, NUM_WRITE_OUTSTANDING 8, NUM_WRITE_THREADS 4, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of Manager_0_arburst : signal is "xilinx.com:interface:aximm:1.0 Manager_0 ARBURST";
  attribute X_INTERFACE_INFO of Manager_0_arcache : signal is "xilinx.com:interface:aximm:1.0 Manager_0 ARCACHE";
  attribute X_INTERFACE_INFO of Manager_0_arid : signal is "xilinx.com:interface:aximm:1.0 Manager_0 ARID";
  attribute X_INTERFACE_INFO of Manager_0_arlen : signal is "xilinx.com:interface:aximm:1.0 Manager_0 ARLEN";
  attribute X_INTERFACE_INFO of Manager_0_arprot : signal is "xilinx.com:interface:aximm:1.0 Manager_0 ARPROT";
  attribute X_INTERFACE_INFO of Manager_0_arqos : signal is "xilinx.com:interface:aximm:1.0 Manager_0 ARQOS";
  attribute X_INTERFACE_INFO of Manager_0_arsize : signal is "xilinx.com:interface:aximm:1.0 Manager_0 ARSIZE";
  attribute X_INTERFACE_INFO of Manager_0_aruser : signal is "xilinx.com:interface:aximm:1.0 Manager_0 ARUSER";
  attribute X_INTERFACE_INFO of Manager_0_awaddr : signal is "xilinx.com:interface:aximm:1.0 Manager_0 AWADDR";
  attribute X_INTERFACE_INFO of Manager_0_awburst : signal is "xilinx.com:interface:aximm:1.0 Manager_0 AWBURST";
  attribute X_INTERFACE_INFO of Manager_0_awcache : signal is "xilinx.com:interface:aximm:1.0 Manager_0 AWCACHE";
  attribute X_INTERFACE_INFO of Manager_0_awid : signal is "xilinx.com:interface:aximm:1.0 Manager_0 AWID";
  attribute X_INTERFACE_INFO of Manager_0_awlen : signal is "xilinx.com:interface:aximm:1.0 Manager_0 AWLEN";
  attribute X_INTERFACE_INFO of Manager_0_awprot : signal is "xilinx.com:interface:aximm:1.0 Manager_0 AWPROT";
  attribute X_INTERFACE_INFO of Manager_0_awqos : signal is "xilinx.com:interface:aximm:1.0 Manager_0 AWQOS";
  attribute X_INTERFACE_INFO of Manager_0_awsize : signal is "xilinx.com:interface:aximm:1.0 Manager_0 AWSIZE";
  attribute X_INTERFACE_INFO of Manager_0_awuser : signal is "xilinx.com:interface:aximm:1.0 Manager_0 AWUSER";
  attribute X_INTERFACE_INFO of Manager_0_bid : signal is "xilinx.com:interface:aximm:1.0 Manager_0 BID";
  attribute X_INTERFACE_INFO of Manager_0_bresp : signal is "xilinx.com:interface:aximm:1.0 Manager_0 BRESP";
  attribute X_INTERFACE_INFO of Manager_0_rdata : signal is "xilinx.com:interface:aximm:1.0 Manager_0 RDATA";
  attribute X_INTERFACE_INFO of Manager_0_rid : signal is "xilinx.com:interface:aximm:1.0 Manager_0 RID";
  attribute X_INTERFACE_INFO of Manager_0_rresp : signal is "xilinx.com:interface:aximm:1.0 Manager_0 RRESP";
  attribute X_INTERFACE_INFO of Manager_0_wdata : signal is "xilinx.com:interface:aximm:1.0 Manager_0 WDATA";
  attribute X_INTERFACE_INFO of Manager_0_wstrb : signal is "xilinx.com:interface:aximm:1.0 Manager_0 WSTRB";
  attribute X_INTERFACE_INFO of Manager_1_araddr : signal is "xilinx.com:interface:aximm:1.0 Manager_1 ARADDR";
  attribute X_INTERFACE_MODE of Manager_1_araddr : signal is "Master";
  attribute X_INTERFACE_PARAMETER of Manager_1_araddr : signal is "XIL_INTERFACENAME Manager_1, ADDR_WIDTH 40, ARUSER_WIDTH 16, AWUSER_WIDTH 16, BUSER_WIDTH 0, CLK_DOMAIN BlockDesign_Config_Clk1, DATA_WIDTH 128, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 16, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 8, NUM_READ_THREADS 4, NUM_WRITE_OUTSTANDING 8, NUM_WRITE_THREADS 4, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of Manager_1_arburst : signal is "xilinx.com:interface:aximm:1.0 Manager_1 ARBURST";
  attribute X_INTERFACE_INFO of Manager_1_arcache : signal is "xilinx.com:interface:aximm:1.0 Manager_1 ARCACHE";
  attribute X_INTERFACE_INFO of Manager_1_arid : signal is "xilinx.com:interface:aximm:1.0 Manager_1 ARID";
  attribute X_INTERFACE_INFO of Manager_1_arlen : signal is "xilinx.com:interface:aximm:1.0 Manager_1 ARLEN";
  attribute X_INTERFACE_INFO of Manager_1_arprot : signal is "xilinx.com:interface:aximm:1.0 Manager_1 ARPROT";
  attribute X_INTERFACE_INFO of Manager_1_arqos : signal is "xilinx.com:interface:aximm:1.0 Manager_1 ARQOS";
  attribute X_INTERFACE_INFO of Manager_1_arsize : signal is "xilinx.com:interface:aximm:1.0 Manager_1 ARSIZE";
  attribute X_INTERFACE_INFO of Manager_1_aruser : signal is "xilinx.com:interface:aximm:1.0 Manager_1 ARUSER";
  attribute X_INTERFACE_INFO of Manager_1_awaddr : signal is "xilinx.com:interface:aximm:1.0 Manager_1 AWADDR";
  attribute X_INTERFACE_INFO of Manager_1_awburst : signal is "xilinx.com:interface:aximm:1.0 Manager_1 AWBURST";
  attribute X_INTERFACE_INFO of Manager_1_awcache : signal is "xilinx.com:interface:aximm:1.0 Manager_1 AWCACHE";
  attribute X_INTERFACE_INFO of Manager_1_awid : signal is "xilinx.com:interface:aximm:1.0 Manager_1 AWID";
  attribute X_INTERFACE_INFO of Manager_1_awlen : signal is "xilinx.com:interface:aximm:1.0 Manager_1 AWLEN";
  attribute X_INTERFACE_INFO of Manager_1_awprot : signal is "xilinx.com:interface:aximm:1.0 Manager_1 AWPROT";
  attribute X_INTERFACE_INFO of Manager_1_awqos : signal is "xilinx.com:interface:aximm:1.0 Manager_1 AWQOS";
  attribute X_INTERFACE_INFO of Manager_1_awsize : signal is "xilinx.com:interface:aximm:1.0 Manager_1 AWSIZE";
  attribute X_INTERFACE_INFO of Manager_1_awuser : signal is "xilinx.com:interface:aximm:1.0 Manager_1 AWUSER";
  attribute X_INTERFACE_INFO of Manager_1_bid : signal is "xilinx.com:interface:aximm:1.0 Manager_1 BID";
  attribute X_INTERFACE_INFO of Manager_1_bresp : signal is "xilinx.com:interface:aximm:1.0 Manager_1 BRESP";
  attribute X_INTERFACE_INFO of Manager_1_rdata : signal is "xilinx.com:interface:aximm:1.0 Manager_1 RDATA";
  attribute X_INTERFACE_INFO of Manager_1_rid : signal is "xilinx.com:interface:aximm:1.0 Manager_1 RID";
  attribute X_INTERFACE_INFO of Manager_1_rresp : signal is "xilinx.com:interface:aximm:1.0 Manager_1 RRESP";
  attribute X_INTERFACE_INFO of Manager_1_wdata : signal is "xilinx.com:interface:aximm:1.0 Manager_1 WDATA";
  attribute X_INTERFACE_INFO of Manager_1_wstrb : signal is "xilinx.com:interface:aximm:1.0 Manager_1 WSTRB";
  attribute X_INTERFACE_INFO of PL_IRQs : signal is "xilinx.com:signal:interrupt:1.0 INTR.PL_IRQS INTERRUPT";
  attribute X_INTERFACE_PARAMETER of PL_IRQs : signal is "XIL_INTERFACENAME INTR.PL_IRQS, PortWidth 8, SENSITIVITY EDGE_RISING";
  attribute X_INTERFACE_INFO of Subordinate_0_araddr : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 ARADDR";
  attribute X_INTERFACE_MODE of Subordinate_0_araddr : signal is "Slave";
  attribute X_INTERFACE_PARAMETER of Subordinate_0_araddr : signal is "XIL_INTERFACENAME Subordinate_0, ADDR_WIDTH 49, ARUSER_WIDTH 1, AWUSER_WIDTH 1, BUSER_WIDTH 0, CLK_DOMAIN BlockDesign_Subordinate_0_Clk, DATA_WIDTH 128, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 16, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of Subordinate_0_arburst : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 ARBURST";
  attribute X_INTERFACE_INFO of Subordinate_0_arcache : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 ARCACHE";
  attribute X_INTERFACE_INFO of Subordinate_0_arid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 ARID";
  attribute X_INTERFACE_INFO of Subordinate_0_arlen : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 ARLEN";
  attribute X_INTERFACE_INFO of Subordinate_0_arprot : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 ARPROT";
  attribute X_INTERFACE_INFO of Subordinate_0_arqos : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 ARQOS";
  attribute X_INTERFACE_INFO of Subordinate_0_arsize : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 ARSIZE";
  attribute X_INTERFACE_INFO of Subordinate_0_awaddr : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 AWADDR";
  attribute X_INTERFACE_INFO of Subordinate_0_awburst : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 AWBURST";
  attribute X_INTERFACE_INFO of Subordinate_0_awcache : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 AWCACHE";
  attribute X_INTERFACE_INFO of Subordinate_0_awid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 AWID";
  attribute X_INTERFACE_INFO of Subordinate_0_awlen : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 AWLEN";
  attribute X_INTERFACE_INFO of Subordinate_0_awprot : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 AWPROT";
  attribute X_INTERFACE_INFO of Subordinate_0_awqos : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 AWQOS";
  attribute X_INTERFACE_INFO of Subordinate_0_awsize : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 AWSIZE";
  attribute X_INTERFACE_INFO of Subordinate_0_bid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 BID";
  attribute X_INTERFACE_INFO of Subordinate_0_bresp : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 BRESP";
  attribute X_INTERFACE_INFO of Subordinate_0_rdata : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 RDATA";
  attribute X_INTERFACE_INFO of Subordinate_0_rid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 RID";
  attribute X_INTERFACE_INFO of Subordinate_0_rresp : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 RRESP";
  attribute X_INTERFACE_INFO of Subordinate_0_wdata : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 WDATA";
  attribute X_INTERFACE_INFO of Subordinate_0_wstrb : signal is "xilinx.com:interface:aximm:1.0 Subordinate_0 WSTRB";
  attribute X_INTERFACE_INFO of Subordinate_1_araddr : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 ARADDR";
  attribute X_INTERFACE_MODE of Subordinate_1_araddr : signal is "Slave";
  attribute X_INTERFACE_PARAMETER of Subordinate_1_araddr : signal is "XIL_INTERFACENAME Subordinate_1, ADDR_WIDTH 49, ARUSER_WIDTH 1, AWUSER_WIDTH 1, BUSER_WIDTH 0, CLK_DOMAIN BlockDesign_Subordinate_0_Clk1, DATA_WIDTH 128, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 16, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of Subordinate_1_arburst : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 ARBURST";
  attribute X_INTERFACE_INFO of Subordinate_1_arcache : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 ARCACHE";
  attribute X_INTERFACE_INFO of Subordinate_1_arid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 ARID";
  attribute X_INTERFACE_INFO of Subordinate_1_arlen : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 ARLEN";
  attribute X_INTERFACE_INFO of Subordinate_1_arprot : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 ARPROT";
  attribute X_INTERFACE_INFO of Subordinate_1_arqos : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 ARQOS";
  attribute X_INTERFACE_INFO of Subordinate_1_arsize : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 ARSIZE";
  attribute X_INTERFACE_INFO of Subordinate_1_awaddr : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 AWADDR";
  attribute X_INTERFACE_INFO of Subordinate_1_awburst : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 AWBURST";
  attribute X_INTERFACE_INFO of Subordinate_1_awcache : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 AWCACHE";
  attribute X_INTERFACE_INFO of Subordinate_1_awid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 AWID";
  attribute X_INTERFACE_INFO of Subordinate_1_awlen : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 AWLEN";
  attribute X_INTERFACE_INFO of Subordinate_1_awprot : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 AWPROT";
  attribute X_INTERFACE_INFO of Subordinate_1_awqos : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 AWQOS";
  attribute X_INTERFACE_INFO of Subordinate_1_awsize : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 AWSIZE";
  attribute X_INTERFACE_INFO of Subordinate_1_bid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 BID";
  attribute X_INTERFACE_INFO of Subordinate_1_bresp : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 BRESP";
  attribute X_INTERFACE_INFO of Subordinate_1_rdata : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 RDATA";
  attribute X_INTERFACE_INFO of Subordinate_1_rid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 RID";
  attribute X_INTERFACE_INFO of Subordinate_1_rresp : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 RRESP";
  attribute X_INTERFACE_INFO of Subordinate_1_wdata : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 WDATA";
  attribute X_INTERFACE_INFO of Subordinate_1_wstrb : signal is "xilinx.com:interface:aximm:1.0 Subordinate_1 WSTRB";
  attribute X_INTERFACE_INFO of Subordinate_2_araddr : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 ARADDR";
  attribute X_INTERFACE_MODE of Subordinate_2_araddr : signal is "Slave";
  attribute X_INTERFACE_PARAMETER of Subordinate_2_araddr : signal is "XIL_INTERFACENAME Subordinate_2, ADDR_WIDTH 49, ARUSER_WIDTH 1, AWUSER_WIDTH 1, BUSER_WIDTH 0, CLK_DOMAIN BlockDesign_Subordinate_0_Clk2, DATA_WIDTH 128, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 16, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of Subordinate_2_arburst : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 ARBURST";
  attribute X_INTERFACE_INFO of Subordinate_2_arcache : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 ARCACHE";
  attribute X_INTERFACE_INFO of Subordinate_2_arid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 ARID";
  attribute X_INTERFACE_INFO of Subordinate_2_arlen : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 ARLEN";
  attribute X_INTERFACE_INFO of Subordinate_2_arprot : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 ARPROT";
  attribute X_INTERFACE_INFO of Subordinate_2_arqos : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 ARQOS";
  attribute X_INTERFACE_INFO of Subordinate_2_arsize : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 ARSIZE";
  attribute X_INTERFACE_INFO of Subordinate_2_awaddr : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 AWADDR";
  attribute X_INTERFACE_INFO of Subordinate_2_awburst : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 AWBURST";
  attribute X_INTERFACE_INFO of Subordinate_2_awcache : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 AWCACHE";
  attribute X_INTERFACE_INFO of Subordinate_2_awid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 AWID";
  attribute X_INTERFACE_INFO of Subordinate_2_awlen : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 AWLEN";
  attribute X_INTERFACE_INFO of Subordinate_2_awprot : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 AWPROT";
  attribute X_INTERFACE_INFO of Subordinate_2_awqos : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 AWQOS";
  attribute X_INTERFACE_INFO of Subordinate_2_awsize : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 AWSIZE";
  attribute X_INTERFACE_INFO of Subordinate_2_bid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 BID";
  attribute X_INTERFACE_INFO of Subordinate_2_bresp : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 BRESP";
  attribute X_INTERFACE_INFO of Subordinate_2_rdata : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 RDATA";
  attribute X_INTERFACE_INFO of Subordinate_2_rid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 RID";
  attribute X_INTERFACE_INFO of Subordinate_2_rresp : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 RRESP";
  attribute X_INTERFACE_INFO of Subordinate_2_wdata : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 WDATA";
  attribute X_INTERFACE_INFO of Subordinate_2_wstrb : signal is "xilinx.com:interface:aximm:1.0 Subordinate_2 WSTRB";
  attribute X_INTERFACE_INFO of Subordinate_3_araddr : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 ARADDR";
  attribute X_INTERFACE_MODE of Subordinate_3_araddr : signal is "Slave";
  attribute X_INTERFACE_PARAMETER of Subordinate_3_araddr : signal is "XIL_INTERFACENAME Subordinate_3, ADDR_WIDTH 49, ARUSER_WIDTH 1, AWUSER_WIDTH 1, BUSER_WIDTH 0, CLK_DOMAIN BlockDesign_Subordinate_0_Clk3, DATA_WIDTH 128, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 16, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of Subordinate_3_arburst : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 ARBURST";
  attribute X_INTERFACE_INFO of Subordinate_3_arcache : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 ARCACHE";
  attribute X_INTERFACE_INFO of Subordinate_3_arid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 ARID";
  attribute X_INTERFACE_INFO of Subordinate_3_arlen : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 ARLEN";
  attribute X_INTERFACE_INFO of Subordinate_3_arprot : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 ARPROT";
  attribute X_INTERFACE_INFO of Subordinate_3_arqos : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 ARQOS";
  attribute X_INTERFACE_INFO of Subordinate_3_arsize : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 ARSIZE";
  attribute X_INTERFACE_INFO of Subordinate_3_awaddr : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 AWADDR";
  attribute X_INTERFACE_INFO of Subordinate_3_awburst : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 AWBURST";
  attribute X_INTERFACE_INFO of Subordinate_3_awcache : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 AWCACHE";
  attribute X_INTERFACE_INFO of Subordinate_3_awid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 AWID";
  attribute X_INTERFACE_INFO of Subordinate_3_awlen : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 AWLEN";
  attribute X_INTERFACE_INFO of Subordinate_3_awprot : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 AWPROT";
  attribute X_INTERFACE_INFO of Subordinate_3_awqos : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 AWQOS";
  attribute X_INTERFACE_INFO of Subordinate_3_awsize : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 AWSIZE";
  attribute X_INTERFACE_INFO of Subordinate_3_bid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 BID";
  attribute X_INTERFACE_INFO of Subordinate_3_bresp : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 BRESP";
  attribute X_INTERFACE_INFO of Subordinate_3_rdata : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 RDATA";
  attribute X_INTERFACE_INFO of Subordinate_3_rid : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 RID";
  attribute X_INTERFACE_INFO of Subordinate_3_rresp : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 RRESP";
  attribute X_INTERFACE_INFO of Subordinate_3_wdata : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 WDATA";
  attribute X_INTERFACE_INFO of Subordinate_3_wstrb : signal is "xilinx.com:interface:aximm:1.0 Subordinate_3 WSTRB";
begin
PS: component BlockDesign_PS_0
     port map (
      emio_uart1_rxd => UART_1_rxd,
      emio_uart1_txd => UART_1_txd,
      maxigp0_araddr(39 downto 0) => Manager_0_araddr(39 downto 0),
      maxigp0_arburst(1 downto 0) => Manager_0_arburst(1 downto 0),
      maxigp0_arcache(3 downto 0) => Manager_0_arcache(3 downto 0),
      maxigp0_arid(15 downto 0) => Manager_0_arid(15 downto 0),
      maxigp0_arlen(7 downto 0) => Manager_0_arlen(7 downto 0),
      maxigp0_arlock => Manager_0_arlock,
      maxigp0_arprot(2 downto 0) => Manager_0_arprot(2 downto 0),
      maxigp0_arqos(3 downto 0) => Manager_0_arqos(3 downto 0),
      maxigp0_arready => Manager_0_arready,
      maxigp0_arsize(2 downto 0) => Manager_0_arsize(2 downto 0),
      maxigp0_aruser(15 downto 0) => Manager_0_aruser(15 downto 0),
      maxigp0_arvalid => Manager_0_arvalid,
      maxigp0_awaddr(39 downto 0) => Manager_0_awaddr(39 downto 0),
      maxigp0_awburst(1 downto 0) => Manager_0_awburst(1 downto 0),
      maxigp0_awcache(3 downto 0) => Manager_0_awcache(3 downto 0),
      maxigp0_awid(15 downto 0) => Manager_0_awid(15 downto 0),
      maxigp0_awlen(7 downto 0) => Manager_0_awlen(7 downto 0),
      maxigp0_awlock => Manager_0_awlock,
      maxigp0_awprot(2 downto 0) => Manager_0_awprot(2 downto 0),
      maxigp0_awqos(3 downto 0) => Manager_0_awqos(3 downto 0),
      maxigp0_awready => Manager_0_awready,
      maxigp0_awsize(2 downto 0) => Manager_0_awsize(2 downto 0),
      maxigp0_awuser(15 downto 0) => Manager_0_awuser(15 downto 0),
      maxigp0_awvalid => Manager_0_awvalid,
      maxigp0_bid(15 downto 0) => Manager_0_bid(15 downto 0),
      maxigp0_bready => Manager_0_bready,
      maxigp0_bresp(1 downto 0) => Manager_0_bresp(1 downto 0),
      maxigp0_bvalid => Manager_0_bvalid,
      maxigp0_rdata(127 downto 0) => Manager_0_rdata(127 downto 0),
      maxigp0_rid(15 downto 0) => Manager_0_rid(15 downto 0),
      maxigp0_rlast => Manager_0_rlast,
      maxigp0_rready => Manager_0_rready,
      maxigp0_rresp(1 downto 0) => Manager_0_rresp(1 downto 0),
      maxigp0_rvalid => Manager_0_rvalid,
      maxigp0_wdata(127 downto 0) => Manager_0_wdata(127 downto 0),
      maxigp0_wlast => Manager_0_wlast,
      maxigp0_wready => Manager_0_wready,
      maxigp0_wstrb(15 downto 0) => Manager_0_wstrb(15 downto 0),
      maxigp0_wvalid => Manager_0_wvalid,
      maxigp1_araddr(39 downto 0) => Manager_1_araddr(39 downto 0),
      maxigp1_arburst(1 downto 0) => Manager_1_arburst(1 downto 0),
      maxigp1_arcache(3 downto 0) => Manager_1_arcache(3 downto 0),
      maxigp1_arid(15 downto 0) => Manager_1_arid(15 downto 0),
      maxigp1_arlen(7 downto 0) => Manager_1_arlen(7 downto 0),
      maxigp1_arlock => Manager_1_arlock,
      maxigp1_arprot(2 downto 0) => Manager_1_arprot(2 downto 0),
      maxigp1_arqos(3 downto 0) => Manager_1_arqos(3 downto 0),
      maxigp1_arready => Manager_1_arready,
      maxigp1_arsize(2 downto 0) => Manager_1_arsize(2 downto 0),
      maxigp1_aruser(15 downto 0) => Manager_1_aruser(15 downto 0),
      maxigp1_arvalid => Manager_1_arvalid,
      maxigp1_awaddr(39 downto 0) => Manager_1_awaddr(39 downto 0),
      maxigp1_awburst(1 downto 0) => Manager_1_awburst(1 downto 0),
      maxigp1_awcache(3 downto 0) => Manager_1_awcache(3 downto 0),
      maxigp1_awid(15 downto 0) => Manager_1_awid(15 downto 0),
      maxigp1_awlen(7 downto 0) => Manager_1_awlen(7 downto 0),
      maxigp1_awlock => Manager_1_awlock,
      maxigp1_awprot(2 downto 0) => Manager_1_awprot(2 downto 0),
      maxigp1_awqos(3 downto 0) => Manager_1_awqos(3 downto 0),
      maxigp1_awready => Manager_1_awready,
      maxigp1_awsize(2 downto 0) => Manager_1_awsize(2 downto 0),
      maxigp1_awuser(15 downto 0) => Manager_1_awuser(15 downto 0),
      maxigp1_awvalid => Manager_1_awvalid,
      maxigp1_bid(15 downto 0) => Manager_1_bid(15 downto 0),
      maxigp1_bready => Manager_1_bready,
      maxigp1_bresp(1 downto 0) => Manager_1_bresp(1 downto 0),
      maxigp1_bvalid => Manager_1_bvalid,
      maxigp1_rdata(127 downto 0) => Manager_1_rdata(127 downto 0),
      maxigp1_rid(15 downto 0) => Manager_1_rid(15 downto 0),
      maxigp1_rlast => Manager_1_rlast,
      maxigp1_rready => Manager_1_rready,
      maxigp1_rresp(1 downto 0) => Manager_1_rresp(1 downto 0),
      maxigp1_rvalid => Manager_1_rvalid,
      maxigp1_wdata(127 downto 0) => Manager_1_wdata(127 downto 0),
      maxigp1_wlast => Manager_1_wlast,
      maxigp1_wready => Manager_1_wready,
      maxigp1_wstrb(15 downto 0) => Manager_1_wstrb(15 downto 0),
      maxigp1_wvalid => Manager_1_wvalid,
      maxigp2_araddr(39 downto 0) => Config_0_araddr(39 downto 0),
      maxigp2_arburst(1 downto 0) => Config_0_arburst(1 downto 0),
      maxigp2_arcache(3 downto 0) => Config_0_arcache(3 downto 0),
      maxigp2_arid(15 downto 0) => Config_0_arid(15 downto 0),
      maxigp2_arlen(7 downto 0) => Config_0_arlen(7 downto 0),
      maxigp2_arlock => Config_0_arlock,
      maxigp2_arprot(2 downto 0) => Config_0_arprot(2 downto 0),
      maxigp2_arqos(3 downto 0) => Config_0_arqos(3 downto 0),
      maxigp2_arready => Config_0_arready,
      maxigp2_arsize(2 downto 0) => Config_0_arsize(2 downto 0),
      maxigp2_aruser(15 downto 0) => Config_0_aruser(15 downto 0),
      maxigp2_arvalid => Config_0_arvalid,
      maxigp2_awaddr(39 downto 0) => Config_0_awaddr(39 downto 0),
      maxigp2_awburst(1 downto 0) => Config_0_awburst(1 downto 0),
      maxigp2_awcache(3 downto 0) => Config_0_awcache(3 downto 0),
      maxigp2_awid(15 downto 0) => Config_0_awid(15 downto 0),
      maxigp2_awlen(7 downto 0) => Config_0_awlen(7 downto 0),
      maxigp2_awlock => Config_0_awlock,
      maxigp2_awprot(2 downto 0) => Config_0_awprot(2 downto 0),
      maxigp2_awqos(3 downto 0) => Config_0_awqos(3 downto 0),
      maxigp2_awready => Config_0_awready,
      maxigp2_awsize(2 downto 0) => Config_0_awsize(2 downto 0),
      maxigp2_awuser(15 downto 0) => Config_0_awuser(15 downto 0),
      maxigp2_awvalid => Config_0_awvalid,
      maxigp2_bid(15 downto 0) => Config_0_bid(15 downto 0),
      maxigp2_bready => Config_0_bready,
      maxigp2_bresp(1 downto 0) => Config_0_bresp(1 downto 0),
      maxigp2_bvalid => Config_0_bvalid,
      maxigp2_rdata(31 downto 0) => Config_0_rdata(31 downto 0),
      maxigp2_rid(15 downto 0) => Config_0_rid(15 downto 0),
      maxigp2_rlast => Config_0_rlast,
      maxigp2_rready => Config_0_rready,
      maxigp2_rresp(1 downto 0) => Config_0_rresp(1 downto 0),
      maxigp2_rvalid => Config_0_rvalid,
      maxigp2_wdata(31 downto 0) => Config_0_wdata(31 downto 0),
      maxigp2_wlast => Config_0_wlast,
      maxigp2_wready => Config_0_wready,
      maxigp2_wstrb(3 downto 0) => Config_0_wstrb(3 downto 0),
      maxigp2_wvalid => Config_0_wvalid,
      maxihpm0_fpd_aclk => Manager_0_Clk,
      maxihpm0_lpd_aclk => Config_Clk,
      maxihpm1_fpd_aclk => Manager_1_Clk,
      pl_clk0 => Clock_0,
      pl_ps_irq0(7 downto 0) => PL_IRQs(7 downto 0),
      pl_resetn0 => PL_Reset_0,
      saxigp2_araddr(48 downto 0) => Subordinate_0_araddr(48 downto 0),
      saxigp2_arburst(1 downto 0) => Subordinate_0_arburst(1 downto 0),
      saxigp2_arcache(3 downto 0) => Subordinate_0_arcache(3 downto 0),
      saxigp2_arid(5 downto 0) => Subordinate_0_arid(5 downto 0),
      saxigp2_arlen(7 downto 0) => Subordinate_0_arlen(7 downto 0),
      saxigp2_arlock => Subordinate_0_arlock,
      saxigp2_arprot(2 downto 0) => Subordinate_0_arprot(2 downto 0),
      saxigp2_arqos(3 downto 0) => Subordinate_0_arqos(3 downto 0),
      saxigp2_arready => Subordinate_0_arready,
      saxigp2_arsize(2 downto 0) => Subordinate_0_arsize(2 downto 0),
      saxigp2_aruser => Subordinate_0_aruser,
      saxigp2_arvalid => Subordinate_0_arvalid,
      saxigp2_awaddr(48 downto 0) => Subordinate_0_awaddr(48 downto 0),
      saxigp2_awburst(1 downto 0) => Subordinate_0_awburst(1 downto 0),
      saxigp2_awcache(3 downto 0) => Subordinate_0_awcache(3 downto 0),
      saxigp2_awid(5 downto 0) => Subordinate_0_awid(5 downto 0),
      saxigp2_awlen(7 downto 0) => Subordinate_0_awlen(7 downto 0),
      saxigp2_awlock => Subordinate_0_awlock,
      saxigp2_awprot(2 downto 0) => Subordinate_0_awprot(2 downto 0),
      saxigp2_awqos(3 downto 0) => Subordinate_0_awqos(3 downto 0),
      saxigp2_awready => Subordinate_0_awready,
      saxigp2_awsize(2 downto 0) => Subordinate_0_awsize(2 downto 0),
      saxigp2_awuser => Subordinate_0_awuser,
      saxigp2_awvalid => Subordinate_0_awvalid,
      saxigp2_bid(5 downto 0) => Subordinate_0_bid(5 downto 0),
      saxigp2_bready => Subordinate_0_bready,
      saxigp2_bresp(1 downto 0) => Subordinate_0_bresp(1 downto 0),
      saxigp2_bvalid => Subordinate_0_bvalid,
      saxigp2_rdata(127 downto 0) => Subordinate_0_rdata(127 downto 0),
      saxigp2_rid(5 downto 0) => Subordinate_0_rid(5 downto 0),
      saxigp2_rlast => Subordinate_0_rlast,
      saxigp2_rready => Subordinate_0_rready,
      saxigp2_rresp(1 downto 0) => Subordinate_0_rresp(1 downto 0),
      saxigp2_rvalid => Subordinate_0_rvalid,
      saxigp2_wdata(127 downto 0) => Subordinate_0_wdata(127 downto 0),
      saxigp2_wlast => Subordinate_0_wlast,
      saxigp2_wready => Subordinate_0_wready,
      saxigp2_wstrb(15 downto 0) => Subordinate_0_wstrb(15 downto 0),
      saxigp2_wvalid => Subordinate_0_wvalid,
      saxigp3_araddr(48 downto 0) => Subordinate_1_araddr(48 downto 0),
      saxigp3_arburst(1 downto 0) => Subordinate_1_arburst(1 downto 0),
      saxigp3_arcache(3 downto 0) => Subordinate_1_arcache(3 downto 0),
      saxigp3_arid(5 downto 0) => Subordinate_1_arid(5 downto 0),
      saxigp3_arlen(7 downto 0) => Subordinate_1_arlen(7 downto 0),
      saxigp3_arlock => Subordinate_1_arlock,
      saxigp3_arprot(2 downto 0) => Subordinate_1_arprot(2 downto 0),
      saxigp3_arqos(3 downto 0) => Subordinate_1_arqos(3 downto 0),
      saxigp3_arready => Subordinate_1_arready,
      saxigp3_arsize(2 downto 0) => Subordinate_1_arsize(2 downto 0),
      saxigp3_aruser => Subordinate_1_aruser,
      saxigp3_arvalid => Subordinate_1_arvalid,
      saxigp3_awaddr(48 downto 0) => Subordinate_1_awaddr(48 downto 0),
      saxigp3_awburst(1 downto 0) => Subordinate_1_awburst(1 downto 0),
      saxigp3_awcache(3 downto 0) => Subordinate_1_awcache(3 downto 0),
      saxigp3_awid(5 downto 0) => Subordinate_1_awid(5 downto 0),
      saxigp3_awlen(7 downto 0) => Subordinate_1_awlen(7 downto 0),
      saxigp3_awlock => Subordinate_1_awlock,
      saxigp3_awprot(2 downto 0) => Subordinate_1_awprot(2 downto 0),
      saxigp3_awqos(3 downto 0) => Subordinate_1_awqos(3 downto 0),
      saxigp3_awready => Subordinate_1_awready,
      saxigp3_awsize(2 downto 0) => Subordinate_1_awsize(2 downto 0),
      saxigp3_awuser => Subordinate_1_awuser,
      saxigp3_awvalid => Subordinate_1_awvalid,
      saxigp3_bid(5 downto 0) => Subordinate_1_bid(5 downto 0),
      saxigp3_bready => Subordinate_1_bready,
      saxigp3_bresp(1 downto 0) => Subordinate_1_bresp(1 downto 0),
      saxigp3_bvalid => Subordinate_1_bvalid,
      saxigp3_rdata(127 downto 0) => Subordinate_1_rdata(127 downto 0),
      saxigp3_rid(5 downto 0) => Subordinate_1_rid(5 downto 0),
      saxigp3_rlast => Subordinate_1_rlast,
      saxigp3_rready => Subordinate_1_rready,
      saxigp3_rresp(1 downto 0) => Subordinate_1_rresp(1 downto 0),
      saxigp3_rvalid => Subordinate_1_rvalid,
      saxigp3_wdata(127 downto 0) => Subordinate_1_wdata(127 downto 0),
      saxigp3_wlast => Subordinate_1_wlast,
      saxigp3_wready => Subordinate_1_wready,
      saxigp3_wstrb(15 downto 0) => Subordinate_1_wstrb(15 downto 0),
      saxigp3_wvalid => Subordinate_1_wvalid,
      saxigp4_araddr(48 downto 0) => Subordinate_2_araddr(48 downto 0),
      saxigp4_arburst(1 downto 0) => Subordinate_2_arburst(1 downto 0),
      saxigp4_arcache(3 downto 0) => Subordinate_2_arcache(3 downto 0),
      saxigp4_arid(5 downto 0) => Subordinate_2_arid(5 downto 0),
      saxigp4_arlen(7 downto 0) => Subordinate_2_arlen(7 downto 0),
      saxigp4_arlock => Subordinate_2_arlock,
      saxigp4_arprot(2 downto 0) => Subordinate_2_arprot(2 downto 0),
      saxigp4_arqos(3 downto 0) => Subordinate_2_arqos(3 downto 0),
      saxigp4_arready => Subordinate_2_arready,
      saxigp4_arsize(2 downto 0) => Subordinate_2_arsize(2 downto 0),
      saxigp4_aruser => Subordinate_2_aruser,
      saxigp4_arvalid => Subordinate_2_arvalid,
      saxigp4_awaddr(48 downto 0) => Subordinate_2_awaddr(48 downto 0),
      saxigp4_awburst(1 downto 0) => Subordinate_2_awburst(1 downto 0),
      saxigp4_awcache(3 downto 0) => Subordinate_2_awcache(3 downto 0),
      saxigp4_awid(5 downto 0) => Subordinate_2_awid(5 downto 0),
      saxigp4_awlen(7 downto 0) => Subordinate_2_awlen(7 downto 0),
      saxigp4_awlock => Subordinate_2_awlock,
      saxigp4_awprot(2 downto 0) => Subordinate_2_awprot(2 downto 0),
      saxigp4_awqos(3 downto 0) => Subordinate_2_awqos(3 downto 0),
      saxigp4_awready => Subordinate_2_awready,
      saxigp4_awsize(2 downto 0) => Subordinate_2_awsize(2 downto 0),
      saxigp4_awuser => Subordinate_2_awuser,
      saxigp4_awvalid => Subordinate_2_awvalid,
      saxigp4_bid(5 downto 0) => Subordinate_2_bid(5 downto 0),
      saxigp4_bready => Subordinate_2_bready,
      saxigp4_bresp(1 downto 0) => Subordinate_2_bresp(1 downto 0),
      saxigp4_bvalid => Subordinate_2_bvalid,
      saxigp4_rdata(127 downto 0) => Subordinate_2_rdata(127 downto 0),
      saxigp4_rid(5 downto 0) => Subordinate_2_rid(5 downto 0),
      saxigp4_rlast => Subordinate_2_rlast,
      saxigp4_rready => Subordinate_2_rready,
      saxigp4_rresp(1 downto 0) => Subordinate_2_rresp(1 downto 0),
      saxigp4_rvalid => Subordinate_2_rvalid,
      saxigp4_wdata(127 downto 0) => Subordinate_2_wdata(127 downto 0),
      saxigp4_wlast => Subordinate_2_wlast,
      saxigp4_wready => Subordinate_2_wready,
      saxigp4_wstrb(15 downto 0) => Subordinate_2_wstrb(15 downto 0),
      saxigp4_wvalid => Subordinate_2_wvalid,
      saxigp5_araddr(48 downto 0) => Subordinate_3_araddr(48 downto 0),
      saxigp5_arburst(1 downto 0) => Subordinate_3_arburst(1 downto 0),
      saxigp5_arcache(3 downto 0) => Subordinate_3_arcache(3 downto 0),
      saxigp5_arid(5 downto 0) => Subordinate_3_arid(5 downto 0),
      saxigp5_arlen(7 downto 0) => Subordinate_3_arlen(7 downto 0),
      saxigp5_arlock => Subordinate_3_arlock,
      saxigp5_arprot(2 downto 0) => Subordinate_3_arprot(2 downto 0),
      saxigp5_arqos(3 downto 0) => Subordinate_3_arqos(3 downto 0),
      saxigp5_arready => Subordinate_3_arready,
      saxigp5_arsize(2 downto 0) => Subordinate_3_arsize(2 downto 0),
      saxigp5_aruser => Subordinate_3_aruser,
      saxigp5_arvalid => Subordinate_3_arvalid,
      saxigp5_awaddr(48 downto 0) => Subordinate_3_awaddr(48 downto 0),
      saxigp5_awburst(1 downto 0) => Subordinate_3_awburst(1 downto 0),
      saxigp5_awcache(3 downto 0) => Subordinate_3_awcache(3 downto 0),
      saxigp5_awid(5 downto 0) => Subordinate_3_awid(5 downto 0),
      saxigp5_awlen(7 downto 0) => Subordinate_3_awlen(7 downto 0),
      saxigp5_awlock => Subordinate_3_awlock,
      saxigp5_awprot(2 downto 0) => Subordinate_3_awprot(2 downto 0),
      saxigp5_awqos(3 downto 0) => Subordinate_3_awqos(3 downto 0),
      saxigp5_awready => Subordinate_3_awready,
      saxigp5_awsize(2 downto 0) => Subordinate_3_awsize(2 downto 0),
      saxigp5_awuser => Subordinate_3_awuser,
      saxigp5_awvalid => Subordinate_3_awvalid,
      saxigp5_bid(5 downto 0) => Subordinate_3_bid(5 downto 0),
      saxigp5_bready => Subordinate_3_bready,
      saxigp5_bresp(1 downto 0) => Subordinate_3_bresp(1 downto 0),
      saxigp5_bvalid => Subordinate_3_bvalid,
      saxigp5_rdata(127 downto 0) => Subordinate_3_rdata(127 downto 0),
      saxigp5_rid(5 downto 0) => Subordinate_3_rid(5 downto 0),
      saxigp5_rlast => Subordinate_3_rlast,
      saxigp5_rready => Subordinate_3_rready,
      saxigp5_rresp(1 downto 0) => Subordinate_3_rresp(1 downto 0),
      saxigp5_rvalid => Subordinate_3_rvalid,
      saxigp5_wdata(127 downto 0) => Subordinate_3_wdata(127 downto 0),
      saxigp5_wlast => Subordinate_3_wlast,
      saxigp5_wready => Subordinate_3_wready,
      saxigp5_wstrb(15 downto 0) => Subordinate_3_wstrb(15 downto 0),
      saxigp5_wvalid => Subordinate_3_wvalid,
      saxihp0_fpd_aclk => Subordinate_0_Clk,
      saxihp1_fpd_aclk => Subordinate_1_Clk,
      saxihp2_fpd_aclk => Subordinate_2_Clk,
      saxihp3_fpd_aclk => Subordinate_3_Clk
    );
end STRUCTURE;
