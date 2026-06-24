-- =============================================================================
-- Authors:
--   Patrick Lehmann
--   Adrian Weiland
--
-- License:
-- =============================================================================
-- Copyright 2025-2026 The BigDesign Authors
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--    http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- =============================================================================

library IEEE;
use     IEEE.std_logic_1164.all;

library PoC;
use     PoC.utils.all;
use     PoC.AXI4_Full.all;
use     PoC.AXI4Lite.all;

library lib_BigDesign;
use     lib_BigDesign.PS_settings_pkg.all;

library lib_IP;
use     lib_IP.IPComponents.all;


entity DMA_wrapper is
	port (
		signal Clock             : in std_logic;
		signal Reset             : in std_logic;

		-- Config
		signal AXI4Lite_m2s      : in  AXI4Lite_A32_D32.Sized_M2S;
		signal AXI4Lite_s2m      : out AXI4Lite_A32_D32.Sized_S2M;
		signal AXI4Lite_tx_irq   : out std_logic;
		signal AXI4Lite_rx_irq   : out std_logic;

		-- (S2MM, MM2S), SG
		signal Data_m2s          : out AXI4_A40_D128.Sized_M2S;
		signal Data_s2m          : in  AXI4_A40_D128.Sized_S2M;
		signal ScatterGather_m2s : out AXI4_A40_D32.Sized_M2S;
		signal ScatterGather_s2m : in  AXI4_A40_D32.Sized_S2M;

		-- Transmitter / Receiver
		signal StreamIn_m2s      : in  AXI4S_D32.Sized_M2S;
		signal StreamIn_s2m      : out AXI4S_D32.Sized_S2M;
		signal StreamOut_m2s     : out AXI4S_D32.Sized_M2S;
		signal StreamOut_s2m     : in  AXI4S_D32.Sized_S2M
	);
end entity;

architecture wrapper of DMA_wrapper is
begin
	DMA_inst : component DMA
		port map (
			s_axi_lite_aclk        => Clock,
			m_axi_sg_aclk          => Clock,
			m_axi_mm2s_aclk        => Clock,
			m_axi_s2mm_aclk        => Clock,
			axi_resetn             => not Reset,

			-- AXI_Lite (Config)
			s_axi_lite_awvalid     => AXI4Lite_m2s.awvalid,
			s_axi_lite_awready     => AXI4Lite_s2m.awready,
			s_axi_lite_awaddr      => resize(AXI4Lite_m2s.awaddr, 10),  -- Config addr width is 32
			s_axi_lite_wvalid      => AXI4Lite_m2s.wvalid,
			s_axi_lite_wready      => AXI4Lite_s2m.wready,
			s_axi_lite_wdata       => AXI4Lite_m2s.wdata,
			s_axi_lite_bresp       => AXI4Lite_s2m.bresp,
			s_axi_lite_bvalid      => AXI4Lite_s2m.bvalid,
			s_axi_lite_bready      => AXI4Lite_m2s.bready,
			s_axi_lite_arvalid     => AXI4Lite_m2s.arvalid,
			s_axi_lite_arready     => AXI4Lite_s2m.arready,
			s_axi_lite_araddr      => resize(AXI4Lite_m2s.araddr, 10),  -- Config addr width is 32
			s_axi_lite_rvalid      => AXI4Lite_s2m.rvalid,
			s_axi_lite_rready      => AXI4Lite_m2s.rready,
			s_axi_lite_rdata       => AXI4Lite_s2m.rdata,
			s_axi_lite_rresp       => AXI4Lite_s2m.rresp,

			-- Scatter / Gather
			m_axi_sg_awaddr        => ScatterGather_m2s.awaddr,
			m_axi_sg_awlen         => ScatterGather_m2s.awlen,
			m_axi_sg_awsize        => ScatterGather_m2s.awsize,
			m_axi_sg_awburst       => ScatterGather_m2s.awburst,
			m_axi_sg_awprot        => ScatterGather_m2s.awprot,
			m_axi_sg_awcache       => ScatterGather_m2s.awcache,
			m_axi_sg_awvalid       => ScatterGather_m2s.awvalid,
			m_axi_sg_awready       => ScatterGather_s2m.awready,
			m_axi_sg_wdata         => ScatterGather_m2s.wdata,
			m_axi_sg_wstrb         => ScatterGather_m2s.wstrb,
			m_axi_sg_wlast         => ScatterGather_m2s.wlast,
			m_axi_sg_wvalid        => ScatterGather_m2s.wvalid,
			m_axi_sg_wready        => ScatterGather_s2m.wready,
			m_axi_sg_bresp         => ScatterGather_s2m.bresp,
			m_axi_sg_bvalid        => ScatterGather_s2m.bvalid,
			m_axi_sg_bready        => ScatterGather_m2s.bready,
			m_axi_sg_araddr        => ScatterGather_m2s.araddr,
			m_axi_sg_arlen         => ScatterGather_m2s.arlen,
			m_axi_sg_arsize        => ScatterGather_m2s.arsize,
			m_axi_sg_arburst       => ScatterGather_m2s.arburst,
			m_axi_sg_arprot        => ScatterGather_m2s.arprot,
			m_axi_sg_arcache       => ScatterGather_m2s.arcache,
			m_axi_sg_arvalid       => ScatterGather_m2s.arvalid,
			m_axi_sg_arready       => ScatterGather_s2m.arready,
			m_axi_sg_rdata         => ScatterGather_s2m.rdata,
			m_axi_sg_rresp         => ScatterGather_s2m.rresp,
			m_axi_sg_rlast         => ScatterGather_s2m.rlast,
			m_axi_sg_rvalid        => ScatterGather_s2m.rvalid,
			m_axi_sg_rready        => ScatterGather_m2s.rready,

			m_axi_mm2s_araddr      => Data_m2s.ARaddr,
			m_axi_mm2s_arlen       => Data_m2s.ARlen,
			m_axi_mm2s_arsize      => Data_m2s.ARsize,
			m_axi_mm2s_arburst     => Data_m2s.ARburst,
			m_axi_mm2s_arprot      => Data_m2s.ARprot,
			m_axi_mm2s_arcache     => Data_m2s.ARcache,
			m_axi_mm2s_arvalid     => Data_m2s.ARvalid,
			m_axi_mm2s_arready     => Data_s2m.ARready,
			m_axi_mm2s_rdata       => Data_s2m.RData,
			m_axi_mm2s_rresp       => Data_s2m.RResp,
			m_axi_mm2s_rlast       => Data_s2m.RLast,
			m_axi_mm2s_rvalid      => Data_s2m.RValid,
			m_axi_mm2s_rready      => Data_m2s.RReady,
			mm2s_prmry_reset_out_n => open,

			m_axis_mm2s_tdata      => StreamOut_m2s.Data,
			m_axis_mm2s_tkeep      => StreamOut_m2s.Keep,
			m_axis_mm2s_tvalid     => StreamOut_m2s.Valid,
			m_axis_mm2s_tready     => StreamOut_s2m.Ready,
			m_axis_mm2s_tlast      => StreamOut_m2s.Last,

			m_axi_s2mm_awaddr      => Data_m2s.AWaddr,
			m_axi_s2mm_awlen       => Data_m2s.AWlen,
			m_axi_s2mm_awsize      => Data_m2s.AWsize,
			m_axi_s2mm_awburst     => Data_m2s.AWburst,
			m_axi_s2mm_awprot      => Data_m2s.AWprot,
			m_axi_s2mm_awcache     => Data_m2s.AWcache,
			m_axi_s2mm_awvalid     => Data_m2s.AWvalid,
			m_axi_s2mm_awready     => Data_s2m.AWready,
			m_axi_s2mm_wdata       => Data_m2s.WData,
			m_axi_s2mm_wstrb       => Data_m2s.WStrb,
			m_axi_s2mm_wlast       => Data_m2s.WLast,
			m_axi_s2mm_wvalid      => Data_m2s.WValid,
			m_axi_s2mm_wready      => Data_s2m.WReady,
			m_axi_s2mm_bresp       => Data_s2m.BResp,
			m_axi_s2mm_bvalid      => Data_s2m.BValid,
			m_axi_s2mm_bready      => Data_m2s.BReady,
			s2mm_prmry_reset_out_n => open,

			s_axis_s2mm_tdata      => StreamIn_m2s.Data,
			s_axis_s2mm_tkeep      => StreamIn_m2s.Keep,
			s_axis_s2mm_tvalid     => StreamIn_m2s.Valid,
			s_axis_s2mm_tready     => StreamIn_s2m.Ready,
			s_axis_s2mm_tlast      => StreamIn_m2s.Last,

			mm2s_introut           => AXI4Lite_tx_irq,
			s2mm_introut           => AXI4Lite_rx_irq,
			axi_dma_tstvec         => open
		);
end architecture;
