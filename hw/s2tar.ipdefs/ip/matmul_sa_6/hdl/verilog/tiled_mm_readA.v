// ==============================================================
// Generated by Vitis HLS v2023.2.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module tiled_mm_readA (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        m_axi_port_a_AWVALID,
        m_axi_port_a_AWREADY,
        m_axi_port_a_AWADDR,
        m_axi_port_a_AWID,
        m_axi_port_a_AWLEN,
        m_axi_port_a_AWSIZE,
        m_axi_port_a_AWBURST,
        m_axi_port_a_AWLOCK,
        m_axi_port_a_AWCACHE,
        m_axi_port_a_AWPROT,
        m_axi_port_a_AWQOS,
        m_axi_port_a_AWREGION,
        m_axi_port_a_AWUSER,
        m_axi_port_a_WVALID,
        m_axi_port_a_WREADY,
        m_axi_port_a_WDATA,
        m_axi_port_a_WSTRB,
        m_axi_port_a_WLAST,
        m_axi_port_a_WID,
        m_axi_port_a_WUSER,
        m_axi_port_a_ARVALID,
        m_axi_port_a_ARREADY,
        m_axi_port_a_ARADDR,
        m_axi_port_a_ARID,
        m_axi_port_a_ARLEN,
        m_axi_port_a_ARSIZE,
        m_axi_port_a_ARBURST,
        m_axi_port_a_ARLOCK,
        m_axi_port_a_ARCACHE,
        m_axi_port_a_ARPROT,
        m_axi_port_a_ARQOS,
        m_axi_port_a_ARREGION,
        m_axi_port_a_ARUSER,
        m_axi_port_a_RVALID,
        m_axi_port_a_RREADY,
        m_axi_port_a_RDATA,
        m_axi_port_a_RLAST,
        m_axi_port_a_RID,
        m_axi_port_a_RFIFONUM,
        m_axi_port_a_RUSER,
        m_axi_port_a_RRESP,
        m_axi_port_a_BVALID,
        m_axi_port_a_BREADY,
        m_axi_port_a_BRESP,
        m_axi_port_a_BID,
        m_axi_port_a_BUSER,
        a,
        a_cache_0_address0,
        a_cache_0_ce0,
        a_cache_0_we0,
        a_cache_0_d0,
        a_cache_1_address0,
        a_cache_1_ce0,
        a_cache_1_we0,
        a_cache_1_d0,
        a_cache_2_address0,
        a_cache_2_ce0,
        a_cache_2_we0,
        a_cache_2_d0,
        a_cache_3_address0,
        a_cache_3_ce0,
        a_cache_3_we0,
        a_cache_3_d0,
        a_cache_4_address0,
        a_cache_4_ce0,
        a_cache_4_we0,
        a_cache_4_d0,
        a_cache_5_address0,
        a_cache_5_ce0,
        a_cache_5_we0,
        a_cache_5_d0
);

parameter    ap_ST_fsm_state1 = 20'd1;
parameter    ap_ST_fsm_state2 = 20'd2;
parameter    ap_ST_fsm_state3 = 20'd4;
parameter    ap_ST_fsm_state4 = 20'd8;
parameter    ap_ST_fsm_state5 = 20'd16;
parameter    ap_ST_fsm_state6 = 20'd32;
parameter    ap_ST_fsm_state7 = 20'd64;
parameter    ap_ST_fsm_state8 = 20'd128;
parameter    ap_ST_fsm_state9 = 20'd256;
parameter    ap_ST_fsm_state10 = 20'd512;
parameter    ap_ST_fsm_state11 = 20'd1024;
parameter    ap_ST_fsm_state12 = 20'd2048;
parameter    ap_ST_fsm_state13 = 20'd4096;
parameter    ap_ST_fsm_state14 = 20'd8192;
parameter    ap_ST_fsm_state15 = 20'd16384;
parameter    ap_ST_fsm_state16 = 20'd32768;
parameter    ap_ST_fsm_state17 = 20'd65536;
parameter    ap_ST_fsm_state18 = 20'd131072;
parameter    ap_ST_fsm_state19 = 20'd262144;
parameter    ap_ST_fsm_state20 = 20'd524288;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   m_axi_port_a_AWVALID;
input   m_axi_port_a_AWREADY;
output  [63:0] m_axi_port_a_AWADDR;
output  [0:0] m_axi_port_a_AWID;
output  [31:0] m_axi_port_a_AWLEN;
output  [2:0] m_axi_port_a_AWSIZE;
output  [1:0] m_axi_port_a_AWBURST;
output  [1:0] m_axi_port_a_AWLOCK;
output  [3:0] m_axi_port_a_AWCACHE;
output  [2:0] m_axi_port_a_AWPROT;
output  [3:0] m_axi_port_a_AWQOS;
output  [3:0] m_axi_port_a_AWREGION;
output  [0:0] m_axi_port_a_AWUSER;
output   m_axi_port_a_WVALID;
input   m_axi_port_a_WREADY;
output  [7:0] m_axi_port_a_WDATA;
output  [0:0] m_axi_port_a_WSTRB;
output   m_axi_port_a_WLAST;
output  [0:0] m_axi_port_a_WID;
output  [0:0] m_axi_port_a_WUSER;
output   m_axi_port_a_ARVALID;
input   m_axi_port_a_ARREADY;
output  [63:0] m_axi_port_a_ARADDR;
output  [0:0] m_axi_port_a_ARID;
output  [31:0] m_axi_port_a_ARLEN;
output  [2:0] m_axi_port_a_ARSIZE;
output  [1:0] m_axi_port_a_ARBURST;
output  [1:0] m_axi_port_a_ARLOCK;
output  [3:0] m_axi_port_a_ARCACHE;
output  [2:0] m_axi_port_a_ARPROT;
output  [3:0] m_axi_port_a_ARQOS;
output  [3:0] m_axi_port_a_ARREGION;
output  [0:0] m_axi_port_a_ARUSER;
input   m_axi_port_a_RVALID;
output   m_axi_port_a_RREADY;
input  [7:0] m_axi_port_a_RDATA;
input   m_axi_port_a_RLAST;
input  [0:0] m_axi_port_a_RID;
input  [10:0] m_axi_port_a_RFIFONUM;
input  [0:0] m_axi_port_a_RUSER;
input  [1:0] m_axi_port_a_RRESP;
input   m_axi_port_a_BVALID;
output   m_axi_port_a_BREADY;
input  [1:0] m_axi_port_a_BRESP;
input  [0:0] m_axi_port_a_BID;
input  [0:0] m_axi_port_a_BUSER;
input  [63:0] a;
output  [7:0] a_cache_0_address0;
output   a_cache_0_ce0;
output   a_cache_0_we0;
output  [511:0] a_cache_0_d0;
output  [7:0] a_cache_1_address0;
output   a_cache_1_ce0;
output   a_cache_1_we0;
output  [511:0] a_cache_1_d0;
output  [7:0] a_cache_2_address0;
output   a_cache_2_ce0;
output   a_cache_2_we0;
output  [511:0] a_cache_2_d0;
output  [7:0] a_cache_3_address0;
output   a_cache_3_ce0;
output   a_cache_3_we0;
output  [511:0] a_cache_3_d0;
output  [7:0] a_cache_4_address0;
output   a_cache_4_ce0;
output   a_cache_4_we0;
output  [511:0] a_cache_4_d0;
output  [7:0] a_cache_5_address0;
output   a_cache_5_ce0;
output   a_cache_5_we0;
output  [511:0] a_cache_5_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg m_axi_port_a_ARVALID;
reg[63:0] m_axi_port_a_ARADDR;
reg[0:0] m_axi_port_a_ARID;
reg[31:0] m_axi_port_a_ARLEN;
reg[2:0] m_axi_port_a_ARSIZE;
reg[1:0] m_axi_port_a_ARBURST;
reg[1:0] m_axi_port_a_ARLOCK;
reg[3:0] m_axi_port_a_ARCACHE;
reg[2:0] m_axi_port_a_ARPROT;
reg[3:0] m_axi_port_a_ARQOS;
reg[3:0] m_axi_port_a_ARREGION;
reg[0:0] m_axi_port_a_ARUSER;
reg m_axi_port_a_RREADY;
reg a_cache_0_ce0;
reg a_cache_0_we0;
reg a_cache_1_ce0;
reg a_cache_1_we0;
reg a_cache_2_ce0;
reg a_cache_2_we0;
reg a_cache_3_ce0;
reg a_cache_3_we0;
reg a_cache_4_ce0;
reg a_cache_4_we0;
reg a_cache_5_ce0;
reg a_cache_5_we0;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [19:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    port_a_blk_n_AR;
reg    ap_block_state1;
wire   [10:0] add_ln95_fu_246_p2;
reg   [10:0] add_ln95_reg_435;
wire    ap_CS_fsm_state9;
wire   [3:0] select_ln95_fu_270_p3;
reg   [3:0] select_ln95_reg_440;
wire   [6:0] select_ln95_1_fu_278_p3;
reg   [6:0] select_ln95_1_reg_446;
wire   [2:0] grp_fu_286_p2;
reg   [2:0] urem_ln95_reg_453;
wire    ap_CS_fsm_state19;
wire   [7:0] add_ln105_fu_350_p2;
reg   [7:0] add_ln105_reg_458;
wire    grp_readA_Pipeline_rd_a_pack_fu_207_ap_start;
wire    grp_readA_Pipeline_rd_a_pack_fu_207_ap_done;
wire    grp_readA_Pipeline_rd_a_pack_fu_207_ap_idle;
wire    grp_readA_Pipeline_rd_a_pack_fu_207_ap_ready;
wire    grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWVALID;
wire   [63:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWADDR;
wire   [0:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWID;
wire   [31:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWLEN;
wire   [2:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWSIZE;
wire   [1:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWBURST;
wire   [1:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWLOCK;
wire   [3:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWCACHE;
wire   [2:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWPROT;
wire   [3:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWQOS;
wire   [3:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWREGION;
wire   [0:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWUSER;
wire    grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_WVALID;
wire   [7:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_WDATA;
wire   [0:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_WSTRB;
wire    grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_WLAST;
wire   [0:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_WID;
wire   [0:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_WUSER;
wire    grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARVALID;
wire   [63:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARADDR;
wire   [0:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARID;
wire   [31:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARLEN;
wire   [2:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARSIZE;
wire   [1:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARBURST;
wire   [1:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARLOCK;
wire   [3:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARCACHE;
wire   [2:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARPROT;
wire   [3:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARQOS;
wire   [3:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARREGION;
wire   [0:0] grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARUSER;
wire    grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_RREADY;
wire    grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_BREADY;
wire   [511:0] grp_readA_Pipeline_rd_a_pack_fu_207_a_line_02_out;
wire    grp_readA_Pipeline_rd_a_pack_fu_207_a_line_02_out_ap_vld;
reg    grp_readA_Pipeline_rd_a_pack_fu_207_ap_start_reg;
wire   [0:0] icmp_ln95_fu_240_p2;
wire    ap_CS_fsm_state10;
wire   [63:0] zext_ln105_2_fu_359_p1;
wire    ap_CS_fsm_state20;
reg   [3:0] i_fu_100;
wire   [3:0] i_7_fu_377_p2;
reg   [6:0] m_fu_104;
reg   [10:0] indvar_flatten_fu_108;
wire   [2:0] trunc_ln95_fu_356_p1;
wire   [0:0] icmp_ln98_fu_264_p2;
wire   [6:0] m_4_fu_258_p2;
wire   [6:0] grp_fu_286_p0;
wire   [3:0] grp_fu_286_p1;
wire   [6:0] mul_ln95_fu_295_p0;
wire   [8:0] mul_ln95_fu_295_p1;
wire   [14:0] mul_ln95_fu_295_p2;
wire   [3:0] tmp_cast_fu_311_p4;
wire   [4:0] tmp_cast1_fu_301_p4;
wire   [6:0] tmp_s_fu_329_p3;
wire   [7:0] tmp_9_fu_321_p3;
wire   [7:0] zext_ln105_fu_337_p1;
wire   [7:0] sub_ln105_fu_341_p2;
wire   [7:0] zext_ln105_1_fu_347_p1;
reg    grp_fu_286_ap_start;
wire    grp_fu_286_ap_done;
reg    grp_fu_286_ce;
wire    ap_CS_fsm_state11;
wire    ap_CS_fsm_state12;
wire    ap_CS_fsm_state13;
wire    ap_CS_fsm_state14;
wire    ap_CS_fsm_state15;
wire    ap_CS_fsm_state16;
wire    ap_CS_fsm_state17;
wire    ap_CS_fsm_state18;
reg   [19:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
reg    ap_ST_fsm_state10_blk;
wire    ap_ST_fsm_state11_blk;
wire    ap_ST_fsm_state12_blk;
wire    ap_ST_fsm_state13_blk;
wire    ap_ST_fsm_state14_blk;
wire    ap_ST_fsm_state15_blk;
wire    ap_ST_fsm_state16_blk;
wire    ap_ST_fsm_state17_blk;
wire    ap_ST_fsm_state18_blk;
wire    ap_ST_fsm_state19_blk;
wire    ap_ST_fsm_state20_blk;
wire   [14:0] mul_ln95_fu_295_p00;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 20'd1;
#0 grp_readA_Pipeline_rd_a_pack_fu_207_ap_start_reg = 1'b0;
#0 i_fu_100 = 4'd0;
#0 m_fu_104 = 7'd0;
#0 indvar_flatten_fu_108 = 11'd0;
end

tiled_mm_readA_Pipeline_rd_a_pack grp_readA_Pipeline_rd_a_pack_fu_207(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_readA_Pipeline_rd_a_pack_fu_207_ap_start),
    .ap_done(grp_readA_Pipeline_rd_a_pack_fu_207_ap_done),
    .ap_idle(grp_readA_Pipeline_rd_a_pack_fu_207_ap_idle),
    .ap_ready(grp_readA_Pipeline_rd_a_pack_fu_207_ap_ready),
    .m_axi_port_a_AWVALID(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWVALID),
    .m_axi_port_a_AWREADY(1'b0),
    .m_axi_port_a_AWADDR(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWADDR),
    .m_axi_port_a_AWID(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWID),
    .m_axi_port_a_AWLEN(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWLEN),
    .m_axi_port_a_AWSIZE(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWSIZE),
    .m_axi_port_a_AWBURST(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWBURST),
    .m_axi_port_a_AWLOCK(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWLOCK),
    .m_axi_port_a_AWCACHE(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWCACHE),
    .m_axi_port_a_AWPROT(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWPROT),
    .m_axi_port_a_AWQOS(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWQOS),
    .m_axi_port_a_AWREGION(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWREGION),
    .m_axi_port_a_AWUSER(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_AWUSER),
    .m_axi_port_a_WVALID(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_WVALID),
    .m_axi_port_a_WREADY(1'b0),
    .m_axi_port_a_WDATA(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_WDATA),
    .m_axi_port_a_WSTRB(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_WSTRB),
    .m_axi_port_a_WLAST(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_WLAST),
    .m_axi_port_a_WID(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_WID),
    .m_axi_port_a_WUSER(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_WUSER),
    .m_axi_port_a_ARVALID(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARVALID),
    .m_axi_port_a_ARREADY(m_axi_port_a_ARREADY),
    .m_axi_port_a_ARADDR(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARADDR),
    .m_axi_port_a_ARID(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARID),
    .m_axi_port_a_ARLEN(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARLEN),
    .m_axi_port_a_ARSIZE(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARSIZE),
    .m_axi_port_a_ARBURST(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARBURST),
    .m_axi_port_a_ARLOCK(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARLOCK),
    .m_axi_port_a_ARCACHE(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARCACHE),
    .m_axi_port_a_ARPROT(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARPROT),
    .m_axi_port_a_ARQOS(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARQOS),
    .m_axi_port_a_ARREGION(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARREGION),
    .m_axi_port_a_ARUSER(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARUSER),
    .m_axi_port_a_RVALID(m_axi_port_a_RVALID),
    .m_axi_port_a_RREADY(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_RREADY),
    .m_axi_port_a_RDATA(m_axi_port_a_RDATA),
    .m_axi_port_a_RLAST(m_axi_port_a_RLAST),
    .m_axi_port_a_RID(m_axi_port_a_RID),
    .m_axi_port_a_RFIFONUM(m_axi_port_a_RFIFONUM),
    .m_axi_port_a_RUSER(m_axi_port_a_RUSER),
    .m_axi_port_a_RRESP(m_axi_port_a_RRESP),
    .m_axi_port_a_BVALID(1'b0),
    .m_axi_port_a_BREADY(grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_BREADY),
    .m_axi_port_a_BRESP(2'd0),
    .m_axi_port_a_BID(1'd0),
    .m_axi_port_a_BUSER(1'd0),
    .a(a),
    .a_line_02_out(grp_readA_Pipeline_rd_a_pack_fu_207_a_line_02_out),
    .a_line_02_out_ap_vld(grp_readA_Pipeline_rd_a_pack_fu_207_a_line_02_out_ap_vld)
);

tiled_mm_urem_7ns_4ns_3_11_seq_1 #(
    .ID( 1 ),
    .NUM_STAGE( 11 ),
    .din0_WIDTH( 7 ),
    .din1_WIDTH( 4 ),
    .dout_WIDTH( 3 ))
urem_7ns_4ns_3_11_seq_1_U6(
    .clk(ap_clk),
    .reset(ap_rst),
    .start(grp_fu_286_ap_start),
    .done(grp_fu_286_ap_done),
    .din0(grp_fu_286_p0),
    .din1(grp_fu_286_p1),
    .ce(grp_fu_286_ce),
    .dout(grp_fu_286_p2)
);

tiled_mm_mul_7ns_9ns_15_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 7 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 15 ))
mul_7ns_9ns_15_1_1_U7(
    .din0(mul_ln95_fu_295_p0),
    .din1(mul_ln95_fu_295_p1),
    .dout(mul_ln95_fu_295_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((icmp_ln95_fu_240_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state9))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_readA_Pipeline_rd_a_pack_fu_207_ap_start_reg <= 1'b0;
    end else begin
        if (((icmp_ln95_fu_240_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state9))) begin
            grp_readA_Pipeline_rd_a_pack_fu_207_ap_start_reg <= 1'b1;
        end else if ((grp_readA_Pipeline_rd_a_pack_fu_207_ap_ready == 1'b1)) begin
            grp_readA_Pipeline_rd_a_pack_fu_207_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((m_axi_port_a_ARREADY == 1'b0) | (1'b1 == ap_block_state1)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_fu_100 <= 4'd0;
    end else if ((1'b1 == ap_CS_fsm_state20)) begin
        i_fu_100 <= i_7_fu_377_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((m_axi_port_a_ARREADY == 1'b0) | (1'b1 == ap_block_state1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_fu_108 <= 11'd0;
    end else if ((1'b1 == ap_CS_fsm_state20)) begin
        indvar_flatten_fu_108 <= add_ln95_reg_435;
    end
end

always @ (posedge ap_clk) begin
    if ((~((m_axi_port_a_ARREADY == 1'b0) | (1'b1 == ap_block_state1)) & (1'b1 == ap_CS_fsm_state1))) begin
        m_fu_104 <= 7'd0;
    end else if ((1'b1 == ap_CS_fsm_state20)) begin
        m_fu_104 <= select_ln95_1_reg_446;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state19)) begin
        add_ln105_reg_458 <= add_ln105_fu_350_p2;
        urem_ln95_reg_453 <= grp_fu_286_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        add_ln95_reg_435 <= add_ln95_fu_246_p2;
        select_ln95_1_reg_446 <= select_ln95_1_fu_278_p3;
        select_ln95_reg_440 <= select_ln95_fu_270_p3;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state20)) begin
        a_cache_0_ce0 = 1'b1;
    end else begin
        a_cache_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln95_fu_356_p1 == 3'd0) & (1'b1 == ap_CS_fsm_state20))) begin
        a_cache_0_we0 = 1'b1;
    end else begin
        a_cache_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state20)) begin
        a_cache_1_ce0 = 1'b1;
    end else begin
        a_cache_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln95_fu_356_p1 == 3'd1) & (1'b1 == ap_CS_fsm_state20))) begin
        a_cache_1_we0 = 1'b1;
    end else begin
        a_cache_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state20)) begin
        a_cache_2_ce0 = 1'b1;
    end else begin
        a_cache_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln95_fu_356_p1 == 3'd2) & (1'b1 == ap_CS_fsm_state20))) begin
        a_cache_2_we0 = 1'b1;
    end else begin
        a_cache_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state20)) begin
        a_cache_3_ce0 = 1'b1;
    end else begin
        a_cache_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln95_fu_356_p1 == 3'd3) & (1'b1 == ap_CS_fsm_state20))) begin
        a_cache_3_we0 = 1'b1;
    end else begin
        a_cache_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state20)) begin
        a_cache_4_ce0 = 1'b1;
    end else begin
        a_cache_4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln95_fu_356_p1 == 3'd4) & (1'b1 == ap_CS_fsm_state20))) begin
        a_cache_4_we0 = 1'b1;
    end else begin
        a_cache_4_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state20)) begin
        a_cache_5_ce0 = 1'b1;
    end else begin
        a_cache_5_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~(trunc_ln95_fu_356_p1 == 3'd0) & ~(trunc_ln95_fu_356_p1 == 3'd1) & ~(trunc_ln95_fu_356_p1 == 3'd2) & ~(trunc_ln95_fu_356_p1 == 3'd3) & ~(trunc_ln95_fu_356_p1 == 3'd4) & (1'b1 == ap_CS_fsm_state20))) begin
        a_cache_5_we0 = 1'b1;
    end else begin
        a_cache_5_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((grp_readA_Pipeline_rd_a_pack_fu_207_ap_done == 1'b0)) begin
        ap_ST_fsm_state10_blk = 1'b1;
    end else begin
        ap_ST_fsm_state10_blk = 1'b0;
    end
end

assign ap_ST_fsm_state11_blk = 1'b0;

assign ap_ST_fsm_state12_blk = 1'b0;

assign ap_ST_fsm_state13_blk = 1'b0;

assign ap_ST_fsm_state14_blk = 1'b0;

assign ap_ST_fsm_state15_blk = 1'b0;

assign ap_ST_fsm_state16_blk = 1'b0;

assign ap_ST_fsm_state17_blk = 1'b0;

assign ap_ST_fsm_state18_blk = 1'b0;

assign ap_ST_fsm_state19_blk = 1'b0;

always @ (*) begin
    if (((m_axi_port_a_ARREADY == 1'b0) | (1'b1 == ap_block_state1))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state20_blk = 1'b0;

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if (((icmp_ln95_fu_240_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state9))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln95_fu_240_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state9))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln95_fu_240_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state9))) begin
        grp_fu_286_ap_start = 1'b1;
    end else begin
        grp_fu_286_ap_start = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state18) | (1'b1 == ap_CS_fsm_state17) | (1'b1 == ap_CS_fsm_state16) | (1'b1 == ap_CS_fsm_state15) | (1'b1 == ap_CS_fsm_state14) | (1'b1 == ap_CS_fsm_state13) | (1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state19) | (1'b1 == ap_CS_fsm_state9))) begin
        grp_fu_286_ce = 1'b1;
    end else begin
        grp_fu_286_ce = 1'b0;
    end
end

always @ (*) begin
    if ((~((m_axi_port_a_ARREADY == 1'b0) | (1'b1 == ap_block_state1)) & (1'b1 == ap_CS_fsm_state1))) begin
        m_axi_port_a_ARADDR = a;
    end else if (((1'b1 == ap_CS_fsm_state10) | ((icmp_ln95_fu_240_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state9)))) begin
        m_axi_port_a_ARADDR = grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARADDR;
    end else begin
        m_axi_port_a_ARADDR = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | ((icmp_ln95_fu_240_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state9)))) begin
        m_axi_port_a_ARBURST = grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARBURST;
    end else begin
        m_axi_port_a_ARBURST = 2'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | ((icmp_ln95_fu_240_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state9)))) begin
        m_axi_port_a_ARCACHE = grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARCACHE;
    end else begin
        m_axi_port_a_ARCACHE = 4'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | ((icmp_ln95_fu_240_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state9)))) begin
        m_axi_port_a_ARID = grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARID;
    end else begin
        m_axi_port_a_ARID = 1'd0;
    end
end

always @ (*) begin
    if ((~((m_axi_port_a_ARREADY == 1'b0) | (1'b1 == ap_block_state1)) & (1'b1 == ap_CS_fsm_state1))) begin
        m_axi_port_a_ARLEN = 32'd73728;
    end else if (((1'b1 == ap_CS_fsm_state10) | ((icmp_ln95_fu_240_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state9)))) begin
        m_axi_port_a_ARLEN = grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARLEN;
    end else begin
        m_axi_port_a_ARLEN = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | ((icmp_ln95_fu_240_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state9)))) begin
        m_axi_port_a_ARLOCK = grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARLOCK;
    end else begin
        m_axi_port_a_ARLOCK = 2'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | ((icmp_ln95_fu_240_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state9)))) begin
        m_axi_port_a_ARPROT = grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARPROT;
    end else begin
        m_axi_port_a_ARPROT = 3'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | ((icmp_ln95_fu_240_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state9)))) begin
        m_axi_port_a_ARQOS = grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARQOS;
    end else begin
        m_axi_port_a_ARQOS = 4'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | ((icmp_ln95_fu_240_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state9)))) begin
        m_axi_port_a_ARREGION = grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARREGION;
    end else begin
        m_axi_port_a_ARREGION = 4'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | ((icmp_ln95_fu_240_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state9)))) begin
        m_axi_port_a_ARSIZE = grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARSIZE;
    end else begin
        m_axi_port_a_ARSIZE = 3'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | ((icmp_ln95_fu_240_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state9)))) begin
        m_axi_port_a_ARUSER = grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARUSER;
    end else begin
        m_axi_port_a_ARUSER = 1'd0;
    end
end

always @ (*) begin
    if ((~((m_axi_port_a_ARREADY == 1'b0) | (1'b1 == ap_block_state1)) & (1'b1 == ap_CS_fsm_state1))) begin
        m_axi_port_a_ARVALID = 1'b1;
    end else if (((1'b1 == ap_CS_fsm_state10) | ((icmp_ln95_fu_240_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state9)))) begin
        m_axi_port_a_ARVALID = grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_ARVALID;
    end else begin
        m_axi_port_a_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | ((icmp_ln95_fu_240_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state9)))) begin
        m_axi_port_a_RREADY = grp_readA_Pipeline_rd_a_pack_fu_207_m_axi_port_a_RREADY;
    end else begin
        m_axi_port_a_RREADY = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        port_a_blk_n_AR = m_axi_port_a_ARREADY;
    end else begin
        port_a_blk_n_AR = 1'b1;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((m_axi_port_a_ARREADY == 1'b0) | (1'b1 == ap_block_state1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            if (((icmp_ln95_fu_240_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state9))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        ap_ST_fsm_state10 : begin
            if (((1'b1 == ap_CS_fsm_state10) & (grp_readA_Pipeline_rd_a_pack_fu_207_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state15;
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            ap_NS_fsm = ap_ST_fsm_state17;
        end
        ap_ST_fsm_state17 : begin
            ap_NS_fsm = ap_ST_fsm_state18;
        end
        ap_ST_fsm_state18 : begin
            ap_NS_fsm = ap_ST_fsm_state19;
        end
        ap_ST_fsm_state19 : begin
            ap_NS_fsm = ap_ST_fsm_state20;
        end
        ap_ST_fsm_state20 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign a_cache_0_address0 = zext_ln105_2_fu_359_p1;

assign a_cache_0_d0 = grp_readA_Pipeline_rd_a_pack_fu_207_a_line_02_out;

assign a_cache_1_address0 = zext_ln105_2_fu_359_p1;

assign a_cache_1_d0 = grp_readA_Pipeline_rd_a_pack_fu_207_a_line_02_out;

assign a_cache_2_address0 = zext_ln105_2_fu_359_p1;

assign a_cache_2_d0 = grp_readA_Pipeline_rd_a_pack_fu_207_a_line_02_out;

assign a_cache_3_address0 = zext_ln105_2_fu_359_p1;

assign a_cache_3_d0 = grp_readA_Pipeline_rd_a_pack_fu_207_a_line_02_out;

assign a_cache_4_address0 = zext_ln105_2_fu_359_p1;

assign a_cache_4_d0 = grp_readA_Pipeline_rd_a_pack_fu_207_a_line_02_out;

assign a_cache_5_address0 = zext_ln105_2_fu_359_p1;

assign a_cache_5_d0 = grp_readA_Pipeline_rd_a_pack_fu_207_a_line_02_out;

assign add_ln105_fu_350_p2 = (sub_ln105_fu_341_p2 + zext_ln105_1_fu_347_p1);

assign add_ln95_fu_246_p2 = (indvar_flatten_fu_108 + 11'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];

assign ap_CS_fsm_state14 = ap_CS_fsm[32'd13];

assign ap_CS_fsm_state15 = ap_CS_fsm[32'd14];

assign ap_CS_fsm_state16 = ap_CS_fsm[32'd15];

assign ap_CS_fsm_state17 = ap_CS_fsm[32'd16];

assign ap_CS_fsm_state18 = ap_CS_fsm[32'd17];

assign ap_CS_fsm_state19 = ap_CS_fsm[32'd18];

assign ap_CS_fsm_state20 = ap_CS_fsm[32'd19];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign grp_fu_286_p0 = ((icmp_ln98_fu_264_p2[0:0] == 1'b1) ? m_4_fu_258_p2 : m_fu_104);

assign grp_fu_286_p1 = 7'd6;

assign grp_readA_Pipeline_rd_a_pack_fu_207_ap_start = grp_readA_Pipeline_rd_a_pack_fu_207_ap_start_reg;

assign i_7_fu_377_p2 = (select_ln95_reg_440 + 4'd1);

assign icmp_ln95_fu_240_p2 = ((indvar_flatten_fu_108 == 11'd1152) ? 1'b1 : 1'b0);

assign icmp_ln98_fu_264_p2 = ((i_fu_100 == 4'd12) ? 1'b1 : 1'b0);

assign m_4_fu_258_p2 = (m_fu_104 + 7'd1);

assign m_axi_port_a_AWADDR = 64'd0;

assign m_axi_port_a_AWBURST = 2'd0;

assign m_axi_port_a_AWCACHE = 4'd0;

assign m_axi_port_a_AWID = 1'd0;

assign m_axi_port_a_AWLEN = 32'd0;

assign m_axi_port_a_AWLOCK = 2'd0;

assign m_axi_port_a_AWPROT = 3'd0;

assign m_axi_port_a_AWQOS = 4'd0;

assign m_axi_port_a_AWREGION = 4'd0;

assign m_axi_port_a_AWSIZE = 3'd0;

assign m_axi_port_a_AWUSER = 1'd0;

assign m_axi_port_a_AWVALID = 1'b0;

assign m_axi_port_a_BREADY = 1'b0;

assign m_axi_port_a_WDATA = 8'd0;

assign m_axi_port_a_WID = 1'd0;

assign m_axi_port_a_WLAST = 1'b0;

assign m_axi_port_a_WSTRB = 1'd0;

assign m_axi_port_a_WUSER = 1'd0;

assign m_axi_port_a_WVALID = 1'b0;

assign mul_ln95_fu_295_p0 = mul_ln95_fu_295_p00;

assign mul_ln95_fu_295_p00 = select_ln95_1_reg_446;

assign mul_ln95_fu_295_p1 = 15'd171;

assign select_ln95_1_fu_278_p3 = ((icmp_ln98_fu_264_p2[0:0] == 1'b1) ? m_4_fu_258_p2 : m_fu_104);

assign select_ln95_fu_270_p3 = ((icmp_ln98_fu_264_p2[0:0] == 1'b1) ? 4'd0 : i_fu_100);

assign sub_ln105_fu_341_p2 = (tmp_9_fu_321_p3 - zext_ln105_fu_337_p1);

assign tmp_9_fu_321_p3 = {{tmp_cast_fu_311_p4}, {4'd0}};

assign tmp_cast1_fu_301_p4 = {{mul_ln95_fu_295_p2[14:10]}};

assign tmp_cast_fu_311_p4 = {{mul_ln95_fu_295_p2[13:10]}};

assign tmp_s_fu_329_p3 = {{tmp_cast1_fu_301_p4}, {2'd0}};

assign trunc_ln95_fu_356_p1 = urem_ln95_reg_453[2:0];

assign zext_ln105_1_fu_347_p1 = select_ln95_reg_440;

assign zext_ln105_2_fu_359_p1 = add_ln105_reg_458;

assign zext_ln105_fu_337_p1 = tmp_s_fu_329_p3;

endmodule //tiled_mm_readA