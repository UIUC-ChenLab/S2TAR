// ==============================================================
// Generated by Vitis HLS v2023.2.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module tiled_mm_readB_Pipeline_rb_b_pack (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        m_axi_port_b_AWVALID,
        m_axi_port_b_AWREADY,
        m_axi_port_b_AWADDR,
        m_axi_port_b_AWID,
        m_axi_port_b_AWLEN,
        m_axi_port_b_AWSIZE,
        m_axi_port_b_AWBURST,
        m_axi_port_b_AWLOCK,
        m_axi_port_b_AWCACHE,
        m_axi_port_b_AWPROT,
        m_axi_port_b_AWQOS,
        m_axi_port_b_AWREGION,
        m_axi_port_b_AWUSER,
        m_axi_port_b_WVALID,
        m_axi_port_b_WREADY,
        m_axi_port_b_WDATA,
        m_axi_port_b_WSTRB,
        m_axi_port_b_WLAST,
        m_axi_port_b_WID,
        m_axi_port_b_WUSER,
        m_axi_port_b_ARVALID,
        m_axi_port_b_ARREADY,
        m_axi_port_b_ARADDR,
        m_axi_port_b_ARID,
        m_axi_port_b_ARLEN,
        m_axi_port_b_ARSIZE,
        m_axi_port_b_ARBURST,
        m_axi_port_b_ARLOCK,
        m_axi_port_b_ARCACHE,
        m_axi_port_b_ARPROT,
        m_axi_port_b_ARQOS,
        m_axi_port_b_ARREGION,
        m_axi_port_b_ARUSER,
        m_axi_port_b_RVALID,
        m_axi_port_b_RREADY,
        m_axi_port_b_RDATA,
        m_axi_port_b_RLAST,
        m_axi_port_b_RID,
        m_axi_port_b_RFIFONUM,
        m_axi_port_b_RUSER,
        m_axi_port_b_RRESP,
        m_axi_port_b_BVALID,
        m_axi_port_b_BREADY,
        m_axi_port_b_BRESP,
        m_axi_port_b_BID,
        m_axi_port_b_BUSER,
        mul_mid2,
        b,
        mul9,
        zext_ln149,
        b_line_02_out,
        b_line_02_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output   m_axi_port_b_AWVALID;
input   m_axi_port_b_AWREADY;
output  [63:0] m_axi_port_b_AWADDR;
output  [0:0] m_axi_port_b_AWID;
output  [31:0] m_axi_port_b_AWLEN;
output  [2:0] m_axi_port_b_AWSIZE;
output  [1:0] m_axi_port_b_AWBURST;
output  [1:0] m_axi_port_b_AWLOCK;
output  [3:0] m_axi_port_b_AWCACHE;
output  [2:0] m_axi_port_b_AWPROT;
output  [3:0] m_axi_port_b_AWQOS;
output  [3:0] m_axi_port_b_AWREGION;
output  [0:0] m_axi_port_b_AWUSER;
output   m_axi_port_b_WVALID;
input   m_axi_port_b_WREADY;
output  [7:0] m_axi_port_b_WDATA;
output  [0:0] m_axi_port_b_WSTRB;
output   m_axi_port_b_WLAST;
output  [0:0] m_axi_port_b_WID;
output  [0:0] m_axi_port_b_WUSER;
output   m_axi_port_b_ARVALID;
input   m_axi_port_b_ARREADY;
output  [63:0] m_axi_port_b_ARADDR;
output  [0:0] m_axi_port_b_ARID;
output  [31:0] m_axi_port_b_ARLEN;
output  [2:0] m_axi_port_b_ARSIZE;
output  [1:0] m_axi_port_b_ARBURST;
output  [1:0] m_axi_port_b_ARLOCK;
output  [3:0] m_axi_port_b_ARCACHE;
output  [2:0] m_axi_port_b_ARPROT;
output  [3:0] m_axi_port_b_ARQOS;
output  [3:0] m_axi_port_b_ARREGION;
output  [0:0] m_axi_port_b_ARUSER;
input   m_axi_port_b_RVALID;
output   m_axi_port_b_RREADY;
input  [7:0] m_axi_port_b_RDATA;
input   m_axi_port_b_RLAST;
input  [0:0] m_axi_port_b_RID;
input  [10:0] m_axi_port_b_RFIFONUM;
input  [0:0] m_axi_port_b_RUSER;
input  [1:0] m_axi_port_b_RRESP;
input   m_axi_port_b_BVALID;
output   m_axi_port_b_BREADY;
input  [1:0] m_axi_port_b_BRESP;
input  [0:0] m_axi_port_b_BID;
input  [0:0] m_axi_port_b_BUSER;
input  [9:0] mul_mid2;
input  [63:0] b;
input  [10:0] mul9;
input  [6:0] zext_ln149;
output  [511:0] b_line_02_out;
output   b_line_02_out_ap_vld;

reg ap_idle;
reg m_axi_port_b_ARVALID;
reg m_axi_port_b_RREADY;
reg b_line_02_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg    ap_enable_reg_pp0_iter7;
reg    ap_enable_reg_pp0_iter8;
reg    ap_enable_reg_pp0_iter9;
reg    ap_enable_reg_pp0_iter10;
reg    ap_idle_pp0;
reg    ap_block_state10_pp0_stage0_iter9;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln152_fu_146_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    port_b_blk_n_AR;
wire    ap_block_pp0_stage0;
reg    port_b_blk_n_R;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln152_reg_310;
reg   [0:0] icmp_ln152_reg_310_pp0_iter1_reg;
reg   [0:0] icmp_ln152_reg_310_pp0_iter2_reg;
reg   [0:0] icmp_ln152_reg_310_pp0_iter3_reg;
reg   [0:0] icmp_ln152_reg_310_pp0_iter4_reg;
reg   [0:0] icmp_ln152_reg_310_pp0_iter5_reg;
reg   [0:0] icmp_ln152_reg_310_pp0_iter6_reg;
reg   [0:0] icmp_ln152_reg_310_pp0_iter7_reg;
reg   [0:0] icmp_ln152_reg_310_pp0_iter8_reg;
reg   [63:0] port_b_addr_reg_314;
wire   [5:0] trunc_ln154_fu_230_p1;
reg   [5:0] trunc_ln154_reg_320;
reg   [5:0] trunc_ln154_reg_320_pp0_iter1_reg;
reg   [5:0] trunc_ln154_reg_320_pp0_iter2_reg;
reg   [5:0] trunc_ln154_reg_320_pp0_iter3_reg;
reg   [5:0] trunc_ln154_reg_320_pp0_iter4_reg;
reg   [5:0] trunc_ln154_reg_320_pp0_iter5_reg;
reg   [5:0] trunc_ln154_reg_320_pp0_iter6_reg;
reg   [5:0] trunc_ln154_reg_320_pp0_iter7_reg;
reg   [5:0] trunc_ln154_reg_320_pp0_iter8_reg;
reg   [5:0] trunc_ln154_reg_320_pp0_iter9_reg;
reg   [7:0] port_b_addr_read_reg_325;
wire   [63:0] add_ln154_2_fu_218_p2;
reg   [511:0] b_line_02_fu_78;
wire   [511:0] b_line_fu_280_p2;
wire    ap_loop_init;
reg   [6:0] p_fu_82;
wire   [6:0] p_4_fu_152_p2;
reg   [6:0] ap_sig_allocacmp_p_3;
reg    ap_block_pp0_stage0_01001;
wire   [9:0] zext_ln152_fu_158_p1;
wire   [9:0] add_ln154_fu_162_p2;
wire   [19:0] shl_ln154_1_fu_168_p3;
wire   [17:0] shl_ln154_2_fu_180_p3;
wire   [20:0] zext_ln154_fu_176_p1;
wire   [20:0] zext_ln154_1_fu_188_p1;
wire   [20:0] sub_ln154_fu_192_p2;
wire  signed [63:0] sub_ln154_cast_fu_198_p1;
wire   [10:0] zext_ln149_cast_fu_129_p1;
wire   [10:0] add_ln154_3_fu_208_p2;
wire  signed [63:0] sext_ln154_fu_214_p1;
wire   [63:0] add_ln154_1_fu_202_p2;
wire   [8:0] shl_ln_fu_242_p3;
wire   [511:0] zext_ln154_2_fu_249_p1;
wire   [511:0] shl_ln154_fu_253_p2;
wire   [511:0] xor_ln154_fu_259_p2;
wire   [511:0] zext_ln154_3_fu_271_p1;
wire   [511:0] and_ln154_fu_265_p2;
wire   [511:0] shl_ln154_3_fu_274_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg    ap_loop_exit_ready_pp0_iter4_reg;
reg    ap_loop_exit_ready_pp0_iter5_reg;
reg    ap_loop_exit_ready_pp0_iter6_reg;
reg    ap_loop_exit_ready_pp0_iter7_reg;
reg    ap_loop_exit_ready_pp0_iter8_reg;
reg    ap_loop_exit_ready_pp0_iter9_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 ap_enable_reg_pp0_iter7 = 1'b0;
#0 ap_enable_reg_pp0_iter8 = 1'b0;
#0 ap_enable_reg_pp0_iter9 = 1'b0;
#0 ap_enable_reg_pp0_iter10 = 1'b0;
#0 b_line_02_fu_78 = 512'd0;
#0 p_fu_82 = 7'd0;
#0 ap_done_reg = 1'b0;
end

tiled_mm_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready_pp0_iter9_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter10 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter9;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter6 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter7 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter8 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter8 <= ap_enable_reg_pp0_iter7;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter9 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter9 <= ap_enable_reg_pp0_iter8;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            b_line_02_fu_78 <= 512'd0;
        end else if ((ap_enable_reg_pp0_iter10 == 1'b1)) begin
            b_line_02_fu_78 <= b_line_fu_280_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln152_fu_146_p2 == 1'd0))) begin
            p_fu_82 <= p_4_fu_152_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            p_fu_82 <= 7'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        icmp_ln152_reg_310 <= icmp_ln152_fu_146_p2;
        icmp_ln152_reg_310_pp0_iter1_reg <= icmp_ln152_reg_310;
        port_b_addr_reg_314 <= add_ln154_2_fu_218_p2;
        trunc_ln154_reg_320 <= trunc_ln154_fu_230_p1;
        trunc_ln154_reg_320_pp0_iter1_reg <= trunc_ln154_reg_320;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
        ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
        ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
        ap_loop_exit_ready_pp0_iter7_reg <= ap_loop_exit_ready_pp0_iter6_reg;
        ap_loop_exit_ready_pp0_iter8_reg <= ap_loop_exit_ready_pp0_iter7_reg;
        ap_loop_exit_ready_pp0_iter9_reg <= ap_loop_exit_ready_pp0_iter8_reg;
        icmp_ln152_reg_310_pp0_iter2_reg <= icmp_ln152_reg_310_pp0_iter1_reg;
        icmp_ln152_reg_310_pp0_iter3_reg <= icmp_ln152_reg_310_pp0_iter2_reg;
        icmp_ln152_reg_310_pp0_iter4_reg <= icmp_ln152_reg_310_pp0_iter3_reg;
        icmp_ln152_reg_310_pp0_iter5_reg <= icmp_ln152_reg_310_pp0_iter4_reg;
        icmp_ln152_reg_310_pp0_iter6_reg <= icmp_ln152_reg_310_pp0_iter5_reg;
        icmp_ln152_reg_310_pp0_iter7_reg <= icmp_ln152_reg_310_pp0_iter6_reg;
        icmp_ln152_reg_310_pp0_iter8_reg <= icmp_ln152_reg_310_pp0_iter7_reg;
        port_b_addr_read_reg_325 <= m_axi_port_b_RDATA;
        trunc_ln154_reg_320_pp0_iter2_reg <= trunc_ln154_reg_320_pp0_iter1_reg;
        trunc_ln154_reg_320_pp0_iter3_reg <= trunc_ln154_reg_320_pp0_iter2_reg;
        trunc_ln154_reg_320_pp0_iter4_reg <= trunc_ln154_reg_320_pp0_iter3_reg;
        trunc_ln154_reg_320_pp0_iter5_reg <= trunc_ln154_reg_320_pp0_iter4_reg;
        trunc_ln154_reg_320_pp0_iter6_reg <= trunc_ln154_reg_320_pp0_iter5_reg;
        trunc_ln154_reg_320_pp0_iter7_reg <= trunc_ln154_reg_320_pp0_iter6_reg;
        trunc_ln154_reg_320_pp0_iter8_reg <= trunc_ln154_reg_320_pp0_iter7_reg;
        trunc_ln154_reg_320_pp0_iter9_reg <= trunc_ln154_reg_320_pp0_iter8_reg;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln152_fu_146_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter9_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter10 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_sig_allocacmp_p_3 = 7'd0;
    end else begin
        ap_sig_allocacmp_p_3 = p_fu_82;
    end
end

always @ (*) begin
    if (((icmp_ln152_reg_310_pp0_iter8_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        b_line_02_out_ap_vld = 1'b1;
    end else begin
        b_line_02_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        m_axi_port_b_ARVALID = 1'b1;
    end else begin
        m_axi_port_b_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter9 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        m_axi_port_b_RREADY = 1'b1;
    end else begin
        m_axi_port_b_RREADY = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        port_b_blk_n_AR = m_axi_port_b_ARREADY;
    end else begin
        port_b_blk_n_AR = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter9 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        port_b_blk_n_R = m_axi_port_b_RVALID;
    end else begin
        port_b_blk_n_R = 1'b1;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln154_1_fu_202_p2 = ($signed(sub_ln154_cast_fu_198_p1) + $signed(b));

assign add_ln154_2_fu_218_p2 = ($signed(sext_ln154_fu_214_p1) + $signed(add_ln154_1_fu_202_p2));

assign add_ln154_3_fu_208_p2 = (mul9 + zext_ln149_cast_fu_129_p1);

assign add_ln154_fu_162_p2 = (mul_mid2 + zext_ln152_fu_158_p1);

assign and_ln154_fu_265_p2 = (xor_ln154_fu_259_p2 & b_line_02_fu_78);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_enable_reg_pp0_iter9 == 1'b1) & (1'b1 == ap_block_state10_pp0_stage0_iter9));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_enable_reg_pp0_iter9 == 1'b1) & (1'b1 == ap_block_state10_pp0_stage0_iter9)) | ((m_axi_port_b_ARREADY == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_enable_reg_pp0_iter9 == 1'b1) & (1'b1 == ap_block_state10_pp0_stage0_iter9)) | ((m_axi_port_b_ARREADY == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_state10_pp0_stage0_iter9 = (m_axi_port_b_RVALID == 1'b0);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign b_line_02_out = b_line_02_fu_78;

assign b_line_fu_280_p2 = (shl_ln154_3_fu_274_p2 | and_ln154_fu_265_p2);

assign icmp_ln152_fu_146_p2 = ((ap_sig_allocacmp_p_3 == 7'd64) ? 1'b1 : 1'b0);

assign m_axi_port_b_ARADDR = port_b_addr_reg_314;

assign m_axi_port_b_ARBURST = 2'd0;

assign m_axi_port_b_ARCACHE = 4'd0;

assign m_axi_port_b_ARID = 1'd0;

assign m_axi_port_b_ARLEN = 32'd1;

assign m_axi_port_b_ARLOCK = 2'd0;

assign m_axi_port_b_ARPROT = 3'd0;

assign m_axi_port_b_ARQOS = 4'd0;

assign m_axi_port_b_ARREGION = 4'd0;

assign m_axi_port_b_ARSIZE = 3'd0;

assign m_axi_port_b_ARUSER = 1'd0;

assign m_axi_port_b_AWADDR = 64'd0;

assign m_axi_port_b_AWBURST = 2'd0;

assign m_axi_port_b_AWCACHE = 4'd0;

assign m_axi_port_b_AWID = 1'd0;

assign m_axi_port_b_AWLEN = 32'd0;

assign m_axi_port_b_AWLOCK = 2'd0;

assign m_axi_port_b_AWPROT = 3'd0;

assign m_axi_port_b_AWQOS = 4'd0;

assign m_axi_port_b_AWREGION = 4'd0;

assign m_axi_port_b_AWSIZE = 3'd0;

assign m_axi_port_b_AWUSER = 1'd0;

assign m_axi_port_b_AWVALID = 1'b0;

assign m_axi_port_b_BREADY = 1'b0;

assign m_axi_port_b_WDATA = 8'd0;

assign m_axi_port_b_WID = 1'd0;

assign m_axi_port_b_WLAST = 1'b0;

assign m_axi_port_b_WSTRB = 1'd0;

assign m_axi_port_b_WUSER = 1'd0;

assign m_axi_port_b_WVALID = 1'b0;

assign p_4_fu_152_p2 = (ap_sig_allocacmp_p_3 + 7'd1);

assign sext_ln154_fu_214_p1 = $signed(add_ln154_3_fu_208_p2);

assign shl_ln154_1_fu_168_p3 = {{add_ln154_fu_162_p2}, {10'd0}};

assign shl_ln154_2_fu_180_p3 = {{add_ln154_fu_162_p2}, {8'd0}};

assign shl_ln154_3_fu_274_p2 = zext_ln154_3_fu_271_p1 << zext_ln154_2_fu_249_p1;

assign shl_ln154_fu_253_p2 = 512'd255 << zext_ln154_2_fu_249_p1;

assign shl_ln_fu_242_p3 = {{trunc_ln154_reg_320_pp0_iter9_reg}, {3'd0}};

assign sub_ln154_cast_fu_198_p1 = $signed(sub_ln154_fu_192_p2);

assign sub_ln154_fu_192_p2 = (zext_ln154_fu_176_p1 - zext_ln154_1_fu_188_p1);

assign trunc_ln154_fu_230_p1 = ap_sig_allocacmp_p_3[5:0];

assign xor_ln154_fu_259_p2 = (shl_ln154_fu_253_p2 ^ 512'd13407807929942597099574024998205846127479365820592393377723561443721764030073546976801874298166903427690031858186486050853753882811946569946433649006084095);

assign zext_ln149_cast_fu_129_p1 = zext_ln149;

assign zext_ln152_fu_158_p1 = ap_sig_allocacmp_p_3;

assign zext_ln154_1_fu_188_p1 = shl_ln154_2_fu_180_p3;

assign zext_ln154_2_fu_249_p1 = shl_ln_fu_242_p3;

assign zext_ln154_3_fu_271_p1 = port_b_addr_read_reg_325;

assign zext_ln154_fu_176_p1 = shl_ln154_1_fu_168_p3;

endmodule //tiled_mm_readB_Pipeline_rb_b_pack
