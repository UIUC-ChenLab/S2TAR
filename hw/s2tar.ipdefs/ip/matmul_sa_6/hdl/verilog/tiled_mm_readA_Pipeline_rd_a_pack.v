// ==============================================================
// Generated by Vitis HLS v2023.2.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module tiled_mm_readA_Pipeline_rd_a_pack (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
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
        a_line_02_out,
        a_line_02_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
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
output  [511:0] a_line_02_out;
output   a_line_02_out_ap_vld;

reg ap_idle;
reg m_axi_port_a_RREADY;
reg a_line_02_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln101_fu_95_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    port_a_blk_n_R;
wire    ap_block_pp0_stage0;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln101_reg_193;
wire   [5:0] trunc_ln103_fu_113_p1;
reg   [5:0] trunc_ln103_reg_202;
reg   [5:0] trunc_ln103_reg_202_pp0_iter1_reg;
reg   [7:0] port_a_addr_read_reg_207;
reg   [511:0] a_line_02_fu_56;
wire   [511:0] a_line_fu_163_p2;
wire    ap_loop_init;
reg   [6:0] p_03_fu_60;
wire   [6:0] p_5_fu_101_p2;
reg   [6:0] ap_sig_allocacmp_p;
reg    ap_block_pp0_stage0_01001;
wire   [8:0] shl_ln_fu_125_p3;
wire   [511:0] zext_ln103_fu_132_p1;
wire   [511:0] shl_ln103_fu_136_p2;
wire   [511:0] xor_ln103_fu_142_p2;
wire   [511:0] zext_ln103_1_fu_154_p1;
wire   [511:0] and_ln103_fu_148_p2;
wire   [511:0] shl_ln103_1_fu_157_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 a_line_02_fu_56 = 512'd0;
#0 p_03_fu_60 = 7'd0;
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
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
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            a_line_02_fu_56 <= 512'd0;
        end else if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
            a_line_02_fu_56 <= a_line_fu_163_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln101_fu_95_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            p_03_fu_60 <= p_5_fu_101_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            p_03_fu_60 <= 7'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        icmp_ln101_reg_193 <= icmp_ln101_fu_95_p2;
        port_a_addr_read_reg_207 <= m_axi_port_a_RDATA;
        trunc_ln103_reg_202 <= trunc_ln103_fu_113_p1;
        trunc_ln103_reg_202_pp0_iter1_reg <= trunc_ln103_reg_202;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln101_reg_193 == 1'd1))) begin
        a_line_02_out_ap_vld = 1'b1;
    end else begin
        a_line_02_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln101_fu_95_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_p = 7'd0;
    end else begin
        ap_sig_allocacmp_p = p_03_fu_60;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        m_axi_port_a_RREADY = 1'b1;
    end else begin
        m_axi_port_a_RREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        port_a_blk_n_R = m_axi_port_a_RVALID;
    end else begin
        port_a_blk_n_R = 1'b1;
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

assign a_line_02_out = a_line_02_fu_56;

assign a_line_fu_163_p2 = (shl_ln103_1_fu_157_p2 | and_ln103_fu_148_p2);

assign and_ln103_fu_148_p2 = (xor_ln103_fu_142_p2 & a_line_02_fu_56);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state2_pp0_stage0_iter1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state2_pp0_stage0_iter1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state2_pp0_stage0_iter1));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (m_axi_port_a_RVALID == 1'b0);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign icmp_ln101_fu_95_p2 = ((ap_sig_allocacmp_p == 7'd64) ? 1'b1 : 1'b0);

assign m_axi_port_a_ARADDR = 64'd0;

assign m_axi_port_a_ARBURST = 2'd0;

assign m_axi_port_a_ARCACHE = 4'd0;

assign m_axi_port_a_ARID = 1'd0;

assign m_axi_port_a_ARLEN = 32'd0;

assign m_axi_port_a_ARLOCK = 2'd0;

assign m_axi_port_a_ARPROT = 3'd0;

assign m_axi_port_a_ARQOS = 4'd0;

assign m_axi_port_a_ARREGION = 4'd0;

assign m_axi_port_a_ARSIZE = 3'd0;

assign m_axi_port_a_ARUSER = 1'd0;

assign m_axi_port_a_ARVALID = 1'b0;

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

assign p_5_fu_101_p2 = (ap_sig_allocacmp_p + 7'd1);

assign shl_ln103_1_fu_157_p2 = zext_ln103_1_fu_154_p1 << zext_ln103_fu_132_p1;

assign shl_ln103_fu_136_p2 = 512'd255 << zext_ln103_fu_132_p1;

assign shl_ln_fu_125_p3 = {{trunc_ln103_reg_202_pp0_iter1_reg}, {3'd0}};

assign trunc_ln103_fu_113_p1 = ap_sig_allocacmp_p[5:0];

assign xor_ln103_fu_142_p2 = (shl_ln103_fu_136_p2 ^ 512'd13407807929942597099574024998205846127479365820592393377723561443721764030073546976801874298166903427690031858186486050853753882811946569946433649006084095);

assign zext_ln103_1_fu_154_p1 = port_a_addr_read_reg_207;

assign zext_ln103_fu_132_p1 = shl_ln_fu_125_p3;

endmodule //tiled_mm_readA_Pipeline_rd_a_pack
