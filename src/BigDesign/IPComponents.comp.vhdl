-- =============================================================================
-- Authors:
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
use     IEEE.numeric_std.all;

package IPComponents is
    component DMA is
        port ( 
            s_axi_lite_aclk : in STD_LOGIC;
            m_axi_sg_aclk : in STD_LOGIC;
            m_axi_mm2s_aclk : in STD_LOGIC;
            m_axi_s2mm_aclk : in STD_LOGIC;
            axi_resetn : in STD_LOGIC;
            s_axi_lite_awvalid : in STD_LOGIC;
            s_axi_lite_awready : out STD_LOGIC;
            s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
            s_axi_lite_wvalid : in STD_LOGIC;
            s_axi_lite_wready : out STD_LOGIC;
            s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
            s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
            s_axi_lite_bvalid : out STD_LOGIC;
            s_axi_lite_bready : in STD_LOGIC;
            s_axi_lite_arvalid : in STD_LOGIC;
            s_axi_lite_arready : out STD_LOGIC;
            s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
            s_axi_lite_rvalid : out STD_LOGIC;
            s_axi_lite_rready : in STD_LOGIC;
            s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
            s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
            m_axi_sg_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
            m_axi_sg_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
            m_axi_sg_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
            m_axi_sg_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
            m_axi_sg_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
            m_axi_sg_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
            m_axi_sg_awvalid : out STD_LOGIC;
            m_axi_sg_awready : in STD_LOGIC;
            m_axi_sg_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
            m_axi_sg_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
            m_axi_sg_wlast : out STD_LOGIC;
            m_axi_sg_wvalid : out STD_LOGIC;
            m_axi_sg_wready : in STD_LOGIC;
            m_axi_sg_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
            m_axi_sg_bvalid : in STD_LOGIC;
            m_axi_sg_bready : out STD_LOGIC;
            m_axi_sg_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
            m_axi_sg_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
            m_axi_sg_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
            m_axi_sg_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
            m_axi_sg_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
            m_axi_sg_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
            m_axi_sg_arvalid : out STD_LOGIC;
            m_axi_sg_arready : in STD_LOGIC;
            m_axi_sg_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
            m_axi_sg_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
            m_axi_sg_rlast : in STD_LOGIC;
            m_axi_sg_rvalid : in STD_LOGIC;
            m_axi_sg_rready : out STD_LOGIC;
            m_axi_mm2s_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
            m_axi_mm2s_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
            m_axi_mm2s_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
            m_axi_mm2s_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
            m_axi_mm2s_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
            m_axi_mm2s_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
            m_axi_mm2s_arvalid : out STD_LOGIC;
            m_axi_mm2s_arready : in STD_LOGIC;
            m_axi_mm2s_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
            m_axi_mm2s_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
            m_axi_mm2s_rlast : in STD_LOGIC;
            m_axi_mm2s_rvalid : in STD_LOGIC;
            m_axi_mm2s_rready : out STD_LOGIC;
            mm2s_prmry_reset_out_n : out STD_LOGIC;
            m_axis_mm2s_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
            m_axis_mm2s_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
            m_axis_mm2s_tvalid : out STD_LOGIC;
            m_axis_mm2s_tready : in STD_LOGIC;
            m_axis_mm2s_tlast : out STD_LOGIC;
            m_axi_s2mm_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
            m_axi_s2mm_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
            m_axi_s2mm_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
            m_axi_s2mm_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
            m_axi_s2mm_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
            m_axi_s2mm_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
            m_axi_s2mm_awvalid : out STD_LOGIC;
            m_axi_s2mm_awready : in STD_LOGIC;
            m_axi_s2mm_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
            m_axi_s2mm_wstrb : out STD_LOGIC_VECTOR ( 15 downto 0 );
            m_axi_s2mm_wlast : out STD_LOGIC;
            m_axi_s2mm_wvalid : out STD_LOGIC;
            m_axi_s2mm_wready : in STD_LOGIC;
            m_axi_s2mm_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
            m_axi_s2mm_bvalid : in STD_LOGIC;
            m_axi_s2mm_bready : out STD_LOGIC;
            s2mm_prmry_reset_out_n : out STD_LOGIC;
            s_axis_s2mm_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
            s_axis_s2mm_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
            s_axis_s2mm_tvalid : in STD_LOGIC;
            s_axis_s2mm_tready : out STD_LOGIC;
            s_axis_s2mm_tlast : in STD_LOGIC;
            mm2s_introut : out STD_LOGIC;
            s2mm_introut : out STD_LOGIC;
            axi_dma_tstvec : out STD_LOGIC_VECTOR ( 31 downto 0 )
        );
    end component;

end package;
