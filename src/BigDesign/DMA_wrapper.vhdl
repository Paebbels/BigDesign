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
use     PoC.AXI4_Full.all;
use     PoC.AXI4Lite.all;

library lib_BigDesign;
use     lib_BigDesign.PS_settings_pkg.all;

library axi_dma_v7_1_37;


entity DMA_wrapper is
	port (
		signal Clock             : in std_logic;
		signal Reset             : in std_logic;

		-- Config
		signal AXI4Lite_m2s      : in  AXI4Lite_A40_D32.Sized_M2S;
		signal AXI4Lite_s2m      : out AXI4Lite_A40_D32.Sized_S2M;
		signal AXI4Lite_tx_irq   : out std_logic;
		signal AXI4Lite_rx_irq   : out std_logic;

		-- (S2MM, MM2S), SG
		signal Data_m2s          : out AXI4_A40_D32.Sized_M2S;
		signal Data_s2m          : in  AXI4_A40_D32.Sized_S2M;
		signal ScatterGather_m2s : out AXI4_A40_D32.Sized_M2S;
		signal ScatterGather_s2m : in  AXI4_A40_D32.Sized_S2M;

		-- Transmitter / Receiver
		signal StreamIn_s2m      : out AXI4S_D32.Sized_S2M;
		signal StreamIn_m2s      : in  AXI4S_D32.Sized_M2S;
		signal StreamOut_s2m     : in  AXI4S_D32.Sized_S2M;
		signal StreamOut_m2s     : out AXI4S_D32.Sized_M2S
	);
end entity;

architecture wrapper of DMA_wrapper is
begin
	DMA_inst : DMA
		port map (
			s_axi_lite_aclk        => Clock,
			m_axi_sg_aclk          => Clock,
			m_axi_mm2s_aclk        => Clock,
			m_axi_s2mm_aclk        => Clock,
			axi_resetn             => not Reset,

			-- AXI_Lite (Config)
			s_axi_lite_awvalid     => AXI4Lite_m2s.awvalid,
			s_axi_lite_awready     => AXI4Lite_s2m.awready,
			s_axi_lite_awaddr      => AXI4Lite_m2s.awaddr,
			s_axi_lite_wvalid      => AXI4Lite_m2s.wvalid,
			s_axi_lite_wready      => AXI4Lite_s2m.wready,
			s_axi_lite_wdata       => AXI4Lite_m2s.wdata,
			s_axi_lite_bresp       => AXI4Lite_s2m.bresp,
			s_axi_lite_bvalid      => AXI4Lite_s2m.bvalid,
			s_axi_lite_bready      => AXI4Lite_m2s.bready,
			s_axi_lite_arvalid     => AXI4Lite_m2s.arvalid,
			s_axi_lite_arready     => AXI4Lite_s2m.arready,
			s_axi_lite_araddr      => AXI4Lite_m2s.araddr,
			s_axi_lite_rvalid      => AXI4Lite_s2m.rvalid,
			s_axi_lite_rready      => AXI4Lite_m2s.rready,
			s_axi_lite_rdata       => AXI4Lite_s2m.rdata,
			s_axi_lite_rresp       => AXI4Lite_s2m.rresp,

			-- Scatter / Gather
			m_axi_sg_awaddr        => m_axi_sg_awaddr,
			m_axi_sg_awlen         => m_axi_sg_awlen,
			m_axi_sg_awsize        => m_axi_sg_awsize,
			m_axi_sg_awburst       => m_axi_sg_awburst,
			m_axi_sg_awprot        => m_axi_sg_awprot,
			m_axi_sg_awcache       => m_axi_sg_awcache,
			m_axi_sg_awvalid       => m_axi_sg_awvalid,
			m_axi_sg_awready       => m_axi_sg_awready,
			m_axi_sg_wdata         => m_axi_sg_wdata,
			m_axi_sg_wstrb         => m_axi_sg_wstrb,
			m_axi_sg_wlast         => m_axi_sg_wlast,
			m_axi_sg_wvalid        => m_axi_sg_wvalid,
			m_axi_sg_wready        => m_axi_sg_wready,
			m_axi_sg_bresp         => m_axi_sg_bresp,
			m_axi_sg_bvalid        => m_axi_sg_bvalid,
			m_axi_sg_bready        => m_axi_sg_bready,
			m_axi_sg_araddr        => m_axi_sg_araddr,
			m_axi_sg_arlen         => m_axi_sg_arlen,
			m_axi_sg_arsize        => m_axi_sg_arsize,
			m_axi_sg_arburst       => m_axi_sg_arburst,
			m_axi_sg_arprot        => m_axi_sg_arprot,
			m_axi_sg_arcache       => m_axi_sg_arcache,
			m_axi_sg_arvalid       => m_axi_sg_arvalid,
			m_axi_sg_arready       => m_axi_sg_arready,
			m_axi_sg_rdata         => m_axi_sg_rdata,
			m_axi_sg_rresp         => m_axi_sg_rresp,
			m_axi_sg_rlast         => m_axi_sg_rlast,
			m_axi_sg_rvalid        => m_axi_sg_rvalid,
			m_axi_sg_rready        => m_axi_sg_rready,

			m_axi_mm2s_araddr      => DMA_MM2S.ARaddr,
			m_axi_mm2s_arlen       => DMA_MM2S.ARlen,
			m_axi_mm2s_arsize      => DMA_MM2S.ARsize,
			m_axi_mm2s_arburst     => DMA_MM2S.ARburst,
			m_axi_mm2s_arprot      => DMA_MM2S.ARprot,
			m_axi_mm2s_arcache     => DMA_MM2S.ARcache,
			m_axi_mm2s_arvalid     => DMA_MM2S.ARvalid,
			m_axi_mm2s_arready     => DMA_MM2S.ARready,
			m_axi_mm2s_rdata       => DMA_MM2S.RData,
			m_axi_mm2s_rresp       => DMA_MM2S.RResp,
			m_axi_mm2s_rlast       => DMA_MM2S.RLast,
			m_axi_mm2s_rvalid      => DMA_MM2S.RValid,
			m_axi_mm2s_rready      => DMA_MM2S.RReady,
			mm2s_prmry_reset_out_n => open,

			m_axis_mm2s_tdata      => open,
			m_axis_mm2s_tkeep      => open,
			m_axis_mm2s_tvalid     => open,
			m_axis_mm2s_tready     => open,
			m_axis_mm2s_tlast      => open,

			m_axi_s2mm_awaddr      => DMA_S2MM.AWaddr,
			m_axi_s2mm_awlen       => DMA_S2MM.AWlen,
			m_axi_s2mm_awsize      => DMA_S2MM.AWsize,
			m_axi_s2mm_awburst     => DMA_S2MM.AWburst,
			m_axi_s2mm_awprot      => DMA_S2MM.AWprot,
			m_axi_s2mm_awcache     => DMA_S2MM.AWcache,
			m_axi_s2mm_awvalid     => DMA_S2MM.AWvalid,
			m_axi_s2mm_awready     => DMA_S2MM.AWready,
			m_axi_s2mm_wdata       => DMA_S2MM.WData,
			m_axi_s2mm_wstrb       => DMA_S2MM.WStrb,
			m_axi_s2mm_wlast       => DMA_S2MM.WLast,
			m_axi_s2mm_wvalid      => DMA_S2MM.WValid,
			m_axi_s2mm_wready      => DMA_S2MM.WReady,
			m_axi_s2mm_bresp       => DMA_S2MM.BResp,
			m_axi_s2mm_bvalid      => DMA_S2MM.BValid,
			m_axi_s2mm_bready      => DMA_S2MM.BReady,
			s2mm_prmry_reset_out_n => open,

			s_axis_s2mm_tdata      => open,
			s_axis_s2mm_tkeep      => open,
			s_axis_s2mm_tvalid     => open,
			s_axis_s2mm_tready     => open,
			s_axis_s2mm_tlast      => open,

			mm2s_introut           => AXI4Lite_tx_irq,
			s2mm_introut           => AXI4Lite_rx_irq,
			axi_dma_tstvec         => open
		);
end architecture;
