--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
--Date        : Mon Jun 30 07:50:41 2025
--Host        : Paebbels-PLC2 running 64-bit major release  (build 9200)
--Command     : generate_target BlochDesign_wrapper.bd
--Design      : BlochDesign_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BlochDesign_wrapper is
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
    FPD_Clock : in STD_LOGIC;
    LPD_Clock : in STD_LOGIC;
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
    Subordinate_2_wvalid : in STD_LOGIC
  );
end BlochDesign_wrapper;

architecture STRUCTURE of BlochDesign_wrapper is
  component BlochDesign is
  port (
    Subordinate_0_aruser : in STD_LOGIC;
    Subordinate_0_awuser : in STD_LOGIC;
    Subordinate_0_awid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_0_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    Subordinate_0_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Subordinate_0_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_0_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_0_awlock : in STD_LOGIC;
    Subordinate_0_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_0_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_0_awvalid : in STD_LOGIC;
    Subordinate_0_awready : out STD_LOGIC;
    Subordinate_0_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    Subordinate_0_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Subordinate_0_wlast : in STD_LOGIC;
    Subordinate_0_wvalid : in STD_LOGIC;
    Subordinate_0_wready : out STD_LOGIC;
    Subordinate_0_bid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_0_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_0_bvalid : out STD_LOGIC;
    Subordinate_0_bready : in STD_LOGIC;
    Subordinate_0_arid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_0_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    Subordinate_0_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Subordinate_0_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_0_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_0_arlock : in STD_LOGIC;
    Subordinate_0_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_0_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_0_arvalid : in STD_LOGIC;
    Subordinate_0_arready : out STD_LOGIC;
    Subordinate_0_rid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_0_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    Subordinate_0_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_0_rlast : out STD_LOGIC;
    Subordinate_0_rvalid : out STD_LOGIC;
    Subordinate_0_rready : in STD_LOGIC;
    Subordinate_0_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_0_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_1_aruser : in STD_LOGIC;
    Subordinate_1_awuser : in STD_LOGIC;
    Subordinate_1_awid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_1_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    Subordinate_1_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Subordinate_1_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_1_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_1_awlock : in STD_LOGIC;
    Subordinate_1_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_1_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_1_awvalid : in STD_LOGIC;
    Subordinate_1_awready : out STD_LOGIC;
    Subordinate_1_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    Subordinate_1_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Subordinate_1_wlast : in STD_LOGIC;
    Subordinate_1_wvalid : in STD_LOGIC;
    Subordinate_1_wready : out STD_LOGIC;
    Subordinate_1_bid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_1_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_1_bvalid : out STD_LOGIC;
    Subordinate_1_bready : in STD_LOGIC;
    Subordinate_1_arid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_1_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    Subordinate_1_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Subordinate_1_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_1_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_1_arlock : in STD_LOGIC;
    Subordinate_1_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_1_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_1_arvalid : in STD_LOGIC;
    Subordinate_1_arready : out STD_LOGIC;
    Subordinate_1_rid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_1_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    Subordinate_1_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_1_rlast : out STD_LOGIC;
    Subordinate_1_rvalid : out STD_LOGIC;
    Subordinate_1_rready : in STD_LOGIC;
    Subordinate_1_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_1_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_2_aruser : in STD_LOGIC;
    Subordinate_2_awuser : in STD_LOGIC;
    Subordinate_2_awid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_2_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    Subordinate_2_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Subordinate_2_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_2_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_2_awlock : in STD_LOGIC;
    Subordinate_2_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_2_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_2_awvalid : in STD_LOGIC;
    Subordinate_2_awready : out STD_LOGIC;
    Subordinate_2_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    Subordinate_2_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Subordinate_2_wlast : in STD_LOGIC;
    Subordinate_2_wvalid : in STD_LOGIC;
    Subordinate_2_wready : out STD_LOGIC;
    Subordinate_2_bid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_2_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_2_bvalid : out STD_LOGIC;
    Subordinate_2_bready : in STD_LOGIC;
    Subordinate_2_arid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_2_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    Subordinate_2_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Subordinate_2_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_2_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_2_arlock : in STD_LOGIC;
    Subordinate_2_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_2_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Subordinate_2_arvalid : in STD_LOGIC;
    Subordinate_2_arready : out STD_LOGIC;
    Subordinate_2_rid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    Subordinate_2_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    Subordinate_2_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Subordinate_2_rlast : out STD_LOGIC;
    Subordinate_2_rvalid : out STD_LOGIC;
    Subordinate_2_rready : in STD_LOGIC;
    Subordinate_2_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Subordinate_2_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Manager_0_awid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_0_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    Manager_0_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Manager_0_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Manager_0_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Manager_0_awlock : out STD_LOGIC;
    Manager_0_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Manager_0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Manager_0_awvalid : out STD_LOGIC;
    Manager_0_awuser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_0_awready : in STD_LOGIC;
    Manager_0_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    Manager_0_wstrb : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_0_wlast : out STD_LOGIC;
    Manager_0_wvalid : out STD_LOGIC;
    Manager_0_wready : in STD_LOGIC;
    Manager_0_bid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Manager_0_bvalid : in STD_LOGIC;
    Manager_0_bready : out STD_LOGIC;
    Manager_0_arid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_0_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    Manager_0_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Manager_0_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Manager_0_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Manager_0_arlock : out STD_LOGIC;
    Manager_0_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Manager_0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Manager_0_arvalid : out STD_LOGIC;
    Manager_0_aruser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_0_arready : in STD_LOGIC;
    Manager_0_rid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_0_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    Manager_0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Manager_0_rlast : in STD_LOGIC;
    Manager_0_rvalid : in STD_LOGIC;
    Manager_0_rready : out STD_LOGIC;
    Manager_0_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Manager_0_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Manager_1_awid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_1_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    Manager_1_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Manager_1_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Manager_1_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Manager_1_awlock : out STD_LOGIC;
    Manager_1_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Manager_1_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Manager_1_awvalid : out STD_LOGIC;
    Manager_1_awuser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_1_awready : in STD_LOGIC;
    Manager_1_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    Manager_1_wstrb : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_1_wlast : out STD_LOGIC;
    Manager_1_wvalid : out STD_LOGIC;
    Manager_1_wready : in STD_LOGIC;
    Manager_1_bid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_1_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Manager_1_bvalid : in STD_LOGIC;
    Manager_1_bready : out STD_LOGIC;
    Manager_1_arid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_1_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    Manager_1_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Manager_1_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Manager_1_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Manager_1_arlock : out STD_LOGIC;
    Manager_1_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Manager_1_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Manager_1_arvalid : out STD_LOGIC;
    Manager_1_aruser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_1_arready : in STD_LOGIC;
    Manager_1_rid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Manager_1_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    Manager_1_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Manager_1_rlast : in STD_LOGIC;
    Manager_1_rvalid : in STD_LOGIC;
    Manager_1_rready : out STD_LOGIC;
    Manager_1_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Manager_1_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Config_0_awid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Config_0_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    Config_0_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Config_0_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Config_0_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Config_0_awlock : out STD_LOGIC;
    Config_0_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Config_0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Config_0_awvalid : out STD_LOGIC;
    Config_0_awuser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Config_0_awready : in STD_LOGIC;
    Config_0_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Config_0_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Config_0_wlast : out STD_LOGIC;
    Config_0_wvalid : out STD_LOGIC;
    Config_0_wready : in STD_LOGIC;
    Config_0_bid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Config_0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Config_0_bvalid : in STD_LOGIC;
    Config_0_bready : out STD_LOGIC;
    Config_0_arid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Config_0_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    Config_0_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Config_0_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Config_0_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Config_0_arlock : out STD_LOGIC;
    Config_0_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Config_0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Config_0_arvalid : out STD_LOGIC;
    Config_0_aruser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Config_0_arready : in STD_LOGIC;
    Config_0_rid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Config_0_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Config_0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Config_0_rlast : in STD_LOGIC;
    Config_0_rvalid : in STD_LOGIC;
    Config_0_rready : out STD_LOGIC;
    Config_0_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Config_0_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Clock_0 : out STD_LOGIC;
    PL_Reset_0 : out STD_LOGIC;
    LPD_Clock : in STD_LOGIC;
    PL_IRQs : in STD_LOGIC_VECTOR ( 7 downto 0 );
    FPD_Clock : in STD_LOGIC
  );
  end component BlochDesign;
begin
BlochDesign_i: component BlochDesign
     port map (
      Clock_0 => Clock_0,
      Config_0_araddr(39 downto 0) => Config_0_araddr(39 downto 0),
      Config_0_arburst(1 downto 0) => Config_0_arburst(1 downto 0),
      Config_0_arcache(3 downto 0) => Config_0_arcache(3 downto 0),
      Config_0_arid(15 downto 0) => Config_0_arid(15 downto 0),
      Config_0_arlen(7 downto 0) => Config_0_arlen(7 downto 0),
      Config_0_arlock => Config_0_arlock,
      Config_0_arprot(2 downto 0) => Config_0_arprot(2 downto 0),
      Config_0_arqos(3 downto 0) => Config_0_arqos(3 downto 0),
      Config_0_arready => Config_0_arready,
      Config_0_arsize(2 downto 0) => Config_0_arsize(2 downto 0),
      Config_0_aruser(15 downto 0) => Config_0_aruser(15 downto 0),
      Config_0_arvalid => Config_0_arvalid,
      Config_0_awaddr(39 downto 0) => Config_0_awaddr(39 downto 0),
      Config_0_awburst(1 downto 0) => Config_0_awburst(1 downto 0),
      Config_0_awcache(3 downto 0) => Config_0_awcache(3 downto 0),
      Config_0_awid(15 downto 0) => Config_0_awid(15 downto 0),
      Config_0_awlen(7 downto 0) => Config_0_awlen(7 downto 0),
      Config_0_awlock => Config_0_awlock,
      Config_0_awprot(2 downto 0) => Config_0_awprot(2 downto 0),
      Config_0_awqos(3 downto 0) => Config_0_awqos(3 downto 0),
      Config_0_awready => Config_0_awready,
      Config_0_awsize(2 downto 0) => Config_0_awsize(2 downto 0),
      Config_0_awuser(15 downto 0) => Config_0_awuser(15 downto 0),
      Config_0_awvalid => Config_0_awvalid,
      Config_0_bid(15 downto 0) => Config_0_bid(15 downto 0),
      Config_0_bready => Config_0_bready,
      Config_0_bresp(1 downto 0) => Config_0_bresp(1 downto 0),
      Config_0_bvalid => Config_0_bvalid,
      Config_0_rdata(31 downto 0) => Config_0_rdata(31 downto 0),
      Config_0_rid(15 downto 0) => Config_0_rid(15 downto 0),
      Config_0_rlast => Config_0_rlast,
      Config_0_rready => Config_0_rready,
      Config_0_rresp(1 downto 0) => Config_0_rresp(1 downto 0),
      Config_0_rvalid => Config_0_rvalid,
      Config_0_wdata(31 downto 0) => Config_0_wdata(31 downto 0),
      Config_0_wlast => Config_0_wlast,
      Config_0_wready => Config_0_wready,
      Config_0_wstrb(3 downto 0) => Config_0_wstrb(3 downto 0),
      Config_0_wvalid => Config_0_wvalid,
      FPD_Clock => FPD_Clock,
      LPD_Clock => LPD_Clock,
      Manager_0_araddr(39 downto 0) => Manager_0_araddr(39 downto 0),
      Manager_0_arburst(1 downto 0) => Manager_0_arburst(1 downto 0),
      Manager_0_arcache(3 downto 0) => Manager_0_arcache(3 downto 0),
      Manager_0_arid(15 downto 0) => Manager_0_arid(15 downto 0),
      Manager_0_arlen(7 downto 0) => Manager_0_arlen(7 downto 0),
      Manager_0_arlock => Manager_0_arlock,
      Manager_0_arprot(2 downto 0) => Manager_0_arprot(2 downto 0),
      Manager_0_arqos(3 downto 0) => Manager_0_arqos(3 downto 0),
      Manager_0_arready => Manager_0_arready,
      Manager_0_arsize(2 downto 0) => Manager_0_arsize(2 downto 0),
      Manager_0_aruser(15 downto 0) => Manager_0_aruser(15 downto 0),
      Manager_0_arvalid => Manager_0_arvalid,
      Manager_0_awaddr(39 downto 0) => Manager_0_awaddr(39 downto 0),
      Manager_0_awburst(1 downto 0) => Manager_0_awburst(1 downto 0),
      Manager_0_awcache(3 downto 0) => Manager_0_awcache(3 downto 0),
      Manager_0_awid(15 downto 0) => Manager_0_awid(15 downto 0),
      Manager_0_awlen(7 downto 0) => Manager_0_awlen(7 downto 0),
      Manager_0_awlock => Manager_0_awlock,
      Manager_0_awprot(2 downto 0) => Manager_0_awprot(2 downto 0),
      Manager_0_awqos(3 downto 0) => Manager_0_awqos(3 downto 0),
      Manager_0_awready => Manager_0_awready,
      Manager_0_awsize(2 downto 0) => Manager_0_awsize(2 downto 0),
      Manager_0_awuser(15 downto 0) => Manager_0_awuser(15 downto 0),
      Manager_0_awvalid => Manager_0_awvalid,
      Manager_0_bid(15 downto 0) => Manager_0_bid(15 downto 0),
      Manager_0_bready => Manager_0_bready,
      Manager_0_bresp(1 downto 0) => Manager_0_bresp(1 downto 0),
      Manager_0_bvalid => Manager_0_bvalid,
      Manager_0_rdata(127 downto 0) => Manager_0_rdata(127 downto 0),
      Manager_0_rid(15 downto 0) => Manager_0_rid(15 downto 0),
      Manager_0_rlast => Manager_0_rlast,
      Manager_0_rready => Manager_0_rready,
      Manager_0_rresp(1 downto 0) => Manager_0_rresp(1 downto 0),
      Manager_0_rvalid => Manager_0_rvalid,
      Manager_0_wdata(127 downto 0) => Manager_0_wdata(127 downto 0),
      Manager_0_wlast => Manager_0_wlast,
      Manager_0_wready => Manager_0_wready,
      Manager_0_wstrb(15 downto 0) => Manager_0_wstrb(15 downto 0),
      Manager_0_wvalid => Manager_0_wvalid,
      Manager_1_araddr(39 downto 0) => Manager_1_araddr(39 downto 0),
      Manager_1_arburst(1 downto 0) => Manager_1_arburst(1 downto 0),
      Manager_1_arcache(3 downto 0) => Manager_1_arcache(3 downto 0),
      Manager_1_arid(15 downto 0) => Manager_1_arid(15 downto 0),
      Manager_1_arlen(7 downto 0) => Manager_1_arlen(7 downto 0),
      Manager_1_arlock => Manager_1_arlock,
      Manager_1_arprot(2 downto 0) => Manager_1_arprot(2 downto 0),
      Manager_1_arqos(3 downto 0) => Manager_1_arqos(3 downto 0),
      Manager_1_arready => Manager_1_arready,
      Manager_1_arsize(2 downto 0) => Manager_1_arsize(2 downto 0),
      Manager_1_aruser(15 downto 0) => Manager_1_aruser(15 downto 0),
      Manager_1_arvalid => Manager_1_arvalid,
      Manager_1_awaddr(39 downto 0) => Manager_1_awaddr(39 downto 0),
      Manager_1_awburst(1 downto 0) => Manager_1_awburst(1 downto 0),
      Manager_1_awcache(3 downto 0) => Manager_1_awcache(3 downto 0),
      Manager_1_awid(15 downto 0) => Manager_1_awid(15 downto 0),
      Manager_1_awlen(7 downto 0) => Manager_1_awlen(7 downto 0),
      Manager_1_awlock => Manager_1_awlock,
      Manager_1_awprot(2 downto 0) => Manager_1_awprot(2 downto 0),
      Manager_1_awqos(3 downto 0) => Manager_1_awqos(3 downto 0),
      Manager_1_awready => Manager_1_awready,
      Manager_1_awsize(2 downto 0) => Manager_1_awsize(2 downto 0),
      Manager_1_awuser(15 downto 0) => Manager_1_awuser(15 downto 0),
      Manager_1_awvalid => Manager_1_awvalid,
      Manager_1_bid(15 downto 0) => Manager_1_bid(15 downto 0),
      Manager_1_bready => Manager_1_bready,
      Manager_1_bresp(1 downto 0) => Manager_1_bresp(1 downto 0),
      Manager_1_bvalid => Manager_1_bvalid,
      Manager_1_rdata(127 downto 0) => Manager_1_rdata(127 downto 0),
      Manager_1_rid(15 downto 0) => Manager_1_rid(15 downto 0),
      Manager_1_rlast => Manager_1_rlast,
      Manager_1_rready => Manager_1_rready,
      Manager_1_rresp(1 downto 0) => Manager_1_rresp(1 downto 0),
      Manager_1_rvalid => Manager_1_rvalid,
      Manager_1_wdata(127 downto 0) => Manager_1_wdata(127 downto 0),
      Manager_1_wlast => Manager_1_wlast,
      Manager_1_wready => Manager_1_wready,
      Manager_1_wstrb(15 downto 0) => Manager_1_wstrb(15 downto 0),
      Manager_1_wvalid => Manager_1_wvalid,
      PL_IRQs(7 downto 0) => PL_IRQs(7 downto 0),
      PL_Reset_0 => PL_Reset_0,
      Subordinate_0_araddr(48 downto 0) => Subordinate_0_araddr(48 downto 0),
      Subordinate_0_arburst(1 downto 0) => Subordinate_0_arburst(1 downto 0),
      Subordinate_0_arcache(3 downto 0) => Subordinate_0_arcache(3 downto 0),
      Subordinate_0_arid(5 downto 0) => Subordinate_0_arid(5 downto 0),
      Subordinate_0_arlen(7 downto 0) => Subordinate_0_arlen(7 downto 0),
      Subordinate_0_arlock => Subordinate_0_arlock,
      Subordinate_0_arprot(2 downto 0) => Subordinate_0_arprot(2 downto 0),
      Subordinate_0_arqos(3 downto 0) => Subordinate_0_arqos(3 downto 0),
      Subordinate_0_arready => Subordinate_0_arready,
      Subordinate_0_arsize(2 downto 0) => Subordinate_0_arsize(2 downto 0),
      Subordinate_0_aruser => Subordinate_0_aruser,
      Subordinate_0_arvalid => Subordinate_0_arvalid,
      Subordinate_0_awaddr(48 downto 0) => Subordinate_0_awaddr(48 downto 0),
      Subordinate_0_awburst(1 downto 0) => Subordinate_0_awburst(1 downto 0),
      Subordinate_0_awcache(3 downto 0) => Subordinate_0_awcache(3 downto 0),
      Subordinate_0_awid(5 downto 0) => Subordinate_0_awid(5 downto 0),
      Subordinate_0_awlen(7 downto 0) => Subordinate_0_awlen(7 downto 0),
      Subordinate_0_awlock => Subordinate_0_awlock,
      Subordinate_0_awprot(2 downto 0) => Subordinate_0_awprot(2 downto 0),
      Subordinate_0_awqos(3 downto 0) => Subordinate_0_awqos(3 downto 0),
      Subordinate_0_awready => Subordinate_0_awready,
      Subordinate_0_awsize(2 downto 0) => Subordinate_0_awsize(2 downto 0),
      Subordinate_0_awuser => Subordinate_0_awuser,
      Subordinate_0_awvalid => Subordinate_0_awvalid,
      Subordinate_0_bid(5 downto 0) => Subordinate_0_bid(5 downto 0),
      Subordinate_0_bready => Subordinate_0_bready,
      Subordinate_0_bresp(1 downto 0) => Subordinate_0_bresp(1 downto 0),
      Subordinate_0_bvalid => Subordinate_0_bvalid,
      Subordinate_0_rdata(127 downto 0) => Subordinate_0_rdata(127 downto 0),
      Subordinate_0_rid(5 downto 0) => Subordinate_0_rid(5 downto 0),
      Subordinate_0_rlast => Subordinate_0_rlast,
      Subordinate_0_rready => Subordinate_0_rready,
      Subordinate_0_rresp(1 downto 0) => Subordinate_0_rresp(1 downto 0),
      Subordinate_0_rvalid => Subordinate_0_rvalid,
      Subordinate_0_wdata(127 downto 0) => Subordinate_0_wdata(127 downto 0),
      Subordinate_0_wlast => Subordinate_0_wlast,
      Subordinate_0_wready => Subordinate_0_wready,
      Subordinate_0_wstrb(15 downto 0) => Subordinate_0_wstrb(15 downto 0),
      Subordinate_0_wvalid => Subordinate_0_wvalid,
      Subordinate_1_araddr(48 downto 0) => Subordinate_1_araddr(48 downto 0),
      Subordinate_1_arburst(1 downto 0) => Subordinate_1_arburst(1 downto 0),
      Subordinate_1_arcache(3 downto 0) => Subordinate_1_arcache(3 downto 0),
      Subordinate_1_arid(5 downto 0) => Subordinate_1_arid(5 downto 0),
      Subordinate_1_arlen(7 downto 0) => Subordinate_1_arlen(7 downto 0),
      Subordinate_1_arlock => Subordinate_1_arlock,
      Subordinate_1_arprot(2 downto 0) => Subordinate_1_arprot(2 downto 0),
      Subordinate_1_arqos(3 downto 0) => Subordinate_1_arqos(3 downto 0),
      Subordinate_1_arready => Subordinate_1_arready,
      Subordinate_1_arsize(2 downto 0) => Subordinate_1_arsize(2 downto 0),
      Subordinate_1_aruser => Subordinate_1_aruser,
      Subordinate_1_arvalid => Subordinate_1_arvalid,
      Subordinate_1_awaddr(48 downto 0) => Subordinate_1_awaddr(48 downto 0),
      Subordinate_1_awburst(1 downto 0) => Subordinate_1_awburst(1 downto 0),
      Subordinate_1_awcache(3 downto 0) => Subordinate_1_awcache(3 downto 0),
      Subordinate_1_awid(5 downto 0) => Subordinate_1_awid(5 downto 0),
      Subordinate_1_awlen(7 downto 0) => Subordinate_1_awlen(7 downto 0),
      Subordinate_1_awlock => Subordinate_1_awlock,
      Subordinate_1_awprot(2 downto 0) => Subordinate_1_awprot(2 downto 0),
      Subordinate_1_awqos(3 downto 0) => Subordinate_1_awqos(3 downto 0),
      Subordinate_1_awready => Subordinate_1_awready,
      Subordinate_1_awsize(2 downto 0) => Subordinate_1_awsize(2 downto 0),
      Subordinate_1_awuser => Subordinate_1_awuser,
      Subordinate_1_awvalid => Subordinate_1_awvalid,
      Subordinate_1_bid(5 downto 0) => Subordinate_1_bid(5 downto 0),
      Subordinate_1_bready => Subordinate_1_bready,
      Subordinate_1_bresp(1 downto 0) => Subordinate_1_bresp(1 downto 0),
      Subordinate_1_bvalid => Subordinate_1_bvalid,
      Subordinate_1_rdata(127 downto 0) => Subordinate_1_rdata(127 downto 0),
      Subordinate_1_rid(5 downto 0) => Subordinate_1_rid(5 downto 0),
      Subordinate_1_rlast => Subordinate_1_rlast,
      Subordinate_1_rready => Subordinate_1_rready,
      Subordinate_1_rresp(1 downto 0) => Subordinate_1_rresp(1 downto 0),
      Subordinate_1_rvalid => Subordinate_1_rvalid,
      Subordinate_1_wdata(127 downto 0) => Subordinate_1_wdata(127 downto 0),
      Subordinate_1_wlast => Subordinate_1_wlast,
      Subordinate_1_wready => Subordinate_1_wready,
      Subordinate_1_wstrb(15 downto 0) => Subordinate_1_wstrb(15 downto 0),
      Subordinate_1_wvalid => Subordinate_1_wvalid,
      Subordinate_2_araddr(48 downto 0) => Subordinate_2_araddr(48 downto 0),
      Subordinate_2_arburst(1 downto 0) => Subordinate_2_arburst(1 downto 0),
      Subordinate_2_arcache(3 downto 0) => Subordinate_2_arcache(3 downto 0),
      Subordinate_2_arid(5 downto 0) => Subordinate_2_arid(5 downto 0),
      Subordinate_2_arlen(7 downto 0) => Subordinate_2_arlen(7 downto 0),
      Subordinate_2_arlock => Subordinate_2_arlock,
      Subordinate_2_arprot(2 downto 0) => Subordinate_2_arprot(2 downto 0),
      Subordinate_2_arqos(3 downto 0) => Subordinate_2_arqos(3 downto 0),
      Subordinate_2_arready => Subordinate_2_arready,
      Subordinate_2_arsize(2 downto 0) => Subordinate_2_arsize(2 downto 0),
      Subordinate_2_aruser => Subordinate_2_aruser,
      Subordinate_2_arvalid => Subordinate_2_arvalid,
      Subordinate_2_awaddr(48 downto 0) => Subordinate_2_awaddr(48 downto 0),
      Subordinate_2_awburst(1 downto 0) => Subordinate_2_awburst(1 downto 0),
      Subordinate_2_awcache(3 downto 0) => Subordinate_2_awcache(3 downto 0),
      Subordinate_2_awid(5 downto 0) => Subordinate_2_awid(5 downto 0),
      Subordinate_2_awlen(7 downto 0) => Subordinate_2_awlen(7 downto 0),
      Subordinate_2_awlock => Subordinate_2_awlock,
      Subordinate_2_awprot(2 downto 0) => Subordinate_2_awprot(2 downto 0),
      Subordinate_2_awqos(3 downto 0) => Subordinate_2_awqos(3 downto 0),
      Subordinate_2_awready => Subordinate_2_awready,
      Subordinate_2_awsize(2 downto 0) => Subordinate_2_awsize(2 downto 0),
      Subordinate_2_awuser => Subordinate_2_awuser,
      Subordinate_2_awvalid => Subordinate_2_awvalid,
      Subordinate_2_bid(5 downto 0) => Subordinate_2_bid(5 downto 0),
      Subordinate_2_bready => Subordinate_2_bready,
      Subordinate_2_bresp(1 downto 0) => Subordinate_2_bresp(1 downto 0),
      Subordinate_2_bvalid => Subordinate_2_bvalid,
      Subordinate_2_rdata(127 downto 0) => Subordinate_2_rdata(127 downto 0),
      Subordinate_2_rid(5 downto 0) => Subordinate_2_rid(5 downto 0),
      Subordinate_2_rlast => Subordinate_2_rlast,
      Subordinate_2_rready => Subordinate_2_rready,
      Subordinate_2_rresp(1 downto 0) => Subordinate_2_rresp(1 downto 0),
      Subordinate_2_rvalid => Subordinate_2_rvalid,
      Subordinate_2_wdata(127 downto 0) => Subordinate_2_wdata(127 downto 0),
      Subordinate_2_wlast => Subordinate_2_wlast,
      Subordinate_2_wready => Subordinate_2_wready,
      Subordinate_2_wstrb(15 downto 0) => Subordinate_2_wstrb(15 downto 0),
      Subordinate_2_wvalid => Subordinate_2_wvalid
    );
end STRUCTURE;
