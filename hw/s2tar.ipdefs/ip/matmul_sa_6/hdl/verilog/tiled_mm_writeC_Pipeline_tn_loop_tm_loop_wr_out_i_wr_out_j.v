// ==============================================================
// Generated by Vitis HLS v2023.2.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module tiled_mm_writeC_Pipeline_tn_loop_tm_loop_wr_out_i_wr_out_j (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        m_axi_port_c_AWVALID,
        m_axi_port_c_AWREADY,
        m_axi_port_c_AWADDR,
        m_axi_port_c_AWID,
        m_axi_port_c_AWLEN,
        m_axi_port_c_AWSIZE,
        m_axi_port_c_AWBURST,
        m_axi_port_c_AWLOCK,
        m_axi_port_c_AWCACHE,
        m_axi_port_c_AWPROT,
        m_axi_port_c_AWQOS,
        m_axi_port_c_AWREGION,
        m_axi_port_c_AWUSER,
        m_axi_port_c_WVALID,
        m_axi_port_c_WREADY,
        m_axi_port_c_WDATA,
        m_axi_port_c_WSTRB,
        m_axi_port_c_WLAST,
        m_axi_port_c_WID,
        m_axi_port_c_WUSER,
        m_axi_port_c_ARVALID,
        m_axi_port_c_ARREADY,
        m_axi_port_c_ARADDR,
        m_axi_port_c_ARID,
        m_axi_port_c_ARLEN,
        m_axi_port_c_ARSIZE,
        m_axi_port_c_ARBURST,
        m_axi_port_c_ARLOCK,
        m_axi_port_c_ARCACHE,
        m_axi_port_c_ARPROT,
        m_axi_port_c_ARQOS,
        m_axi_port_c_ARREGION,
        m_axi_port_c_ARUSER,
        m_axi_port_c_RVALID,
        m_axi_port_c_RREADY,
        m_axi_port_c_RDATA,
        m_axi_port_c_RLAST,
        m_axi_port_c_RID,
        m_axi_port_c_RFIFONUM,
        m_axi_port_c_RUSER,
        m_axi_port_c_RRESP,
        m_axi_port_c_BVALID,
        m_axi_port_c_BREADY,
        m_axi_port_c_BRESP,
        m_axi_port_c_BID,
        m_axi_port_c_BUSER,
        Cstream_dout,
        Cstream_num_data_valid,
        Cstream_fifo_cap,
        Cstream_empty_n,
        Cstream_read,
        sext_ln198,
        out_load
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output   m_axi_port_c_AWVALID;
input   m_axi_port_c_AWREADY;
output  [63:0] m_axi_port_c_AWADDR;
output  [0:0] m_axi_port_c_AWID;
output  [31:0] m_axi_port_c_AWLEN;
output  [2:0] m_axi_port_c_AWSIZE;
output  [1:0] m_axi_port_c_AWBURST;
output  [1:0] m_axi_port_c_AWLOCK;
output  [3:0] m_axi_port_c_AWCACHE;
output  [2:0] m_axi_port_c_AWPROT;
output  [3:0] m_axi_port_c_AWQOS;
output  [3:0] m_axi_port_c_AWREGION;
output  [0:0] m_axi_port_c_AWUSER;
output   m_axi_port_c_WVALID;
input   m_axi_port_c_WREADY;
output  [7:0] m_axi_port_c_WDATA;
output  [0:0] m_axi_port_c_WSTRB;
output   m_axi_port_c_WLAST;
output  [0:0] m_axi_port_c_WID;
output  [0:0] m_axi_port_c_WUSER;
output   m_axi_port_c_ARVALID;
input   m_axi_port_c_ARREADY;
output  [63:0] m_axi_port_c_ARADDR;
output  [0:0] m_axi_port_c_ARID;
output  [31:0] m_axi_port_c_ARLEN;
output  [2:0] m_axi_port_c_ARSIZE;
output  [1:0] m_axi_port_c_ARBURST;
output  [1:0] m_axi_port_c_ARLOCK;
output  [3:0] m_axi_port_c_ARCACHE;
output  [2:0] m_axi_port_c_ARPROT;
output  [3:0] m_axi_port_c_ARQOS;
output  [3:0] m_axi_port_c_ARREGION;
output  [0:0] m_axi_port_c_ARUSER;
input   m_axi_port_c_RVALID;
output   m_axi_port_c_RREADY;
input  [7:0] m_axi_port_c_RDATA;
input   m_axi_port_c_RLAST;
input  [0:0] m_axi_port_c_RID;
input  [10:0] m_axi_port_c_RFIFONUM;
input  [0:0] m_axi_port_c_RUSER;
input  [1:0] m_axi_port_c_RRESP;
input   m_axi_port_c_BVALID;
output   m_axi_port_c_BREADY;
input  [1:0] m_axi_port_c_BRESP;
input  [0:0] m_axi_port_c_BID;
input  [0:0] m_axi_port_c_BUSER;
input  [7:0] Cstream_dout;
input  [2:0] Cstream_num_data_valid;
input  [2:0] Cstream_fifo_cap;
input   Cstream_empty_n;
output   Cstream_read;
input  [10:0] sext_ln198;
input  [63:0] out_load;

reg ap_idle;
reg m_axi_port_c_AWVALID;
reg m_axi_port_c_WVALID;
reg m_axi_port_c_BREADY;
reg Cstream_read;

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
reg    ap_idle_pp0;
reg    ap_block_state4_pp0_stage0_iter3;
reg   [0:0] or_ln204_reg_673;
reg   [0:0] or_ln204_reg_673_pp0_iter2_reg;
reg    ap_block_state4_io;
reg   [0:0] icmp_ln206_1_reg_692;
reg   [0:0] icmp_ln206_1_reg_692_pp0_iter8_reg;
reg    ap_block_state10_pp0_stage0_iter9;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln198_fu_219_p2;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    Cstream_blk_n;
wire    ap_block_pp0_stage0;
reg    port_c_blk_n_B;
reg    port_c_blk_n_W;
reg    port_c_blk_n_AW;
reg   [0:0] first_iter_0_reg_156;
reg    ap_block_pp0_stage0_11001;
wire  signed [11:0] sext_ln198_cast_fu_168_p1;
reg  signed [11:0] sext_ln198_cast_reg_659;
reg   [0:0] icmp_ln198_reg_664;
wire   [4:0] select_ln201_1_fu_348_p3;
reg   [4:0] select_ln201_1_reg_668;
wire   [0:0] or_ln204_fu_362_p2;
wire   [2:0] select_ln204_fu_368_p3;
reg   [2:0] select_ln204_reg_677;
wire   [7:0] empty_41_fu_402_p2;
reg   [7:0] empty_41_reg_682;
wire   [3:0] empty_42_fu_408_p1;
reg   [3:0] empty_42_reg_687;
wire   [0:0] icmp_ln206_1_fu_438_p2;
reg   [0:0] icmp_ln206_1_reg_692_pp0_iter2_reg;
reg   [0:0] icmp_ln206_1_reg_692_pp0_iter3_reg;
reg   [0:0] icmp_ln206_1_reg_692_pp0_iter4_reg;
reg   [0:0] icmp_ln206_1_reg_692_pp0_iter5_reg;
reg   [0:0] icmp_ln206_1_reg_692_pp0_iter6_reg;
reg   [0:0] icmp_ln206_1_reg_692_pp0_iter7_reg;
reg   [63:0] port_c_addr_reg_696;
reg   [7:0] tmp_reg_702;
reg   [0:0] ap_phi_mux_first_iter_0_phi_fu_160_p4;
wire    ap_loop_init;
wire   [63:0] empty_47_fu_593_p2;
reg    ap_block_pp0_stage0_01001;
reg   [2:0] j_01_fu_94;
wire   [2:0] j_fu_430_p3;
reg   [2:0] i_fu_98;
reg   [5:0] indvar_flatten_fu_102;
wire   [5:0] select_ln204_1_fu_450_p3;
reg   [4:0] m_fu_106;
reg   [10:0] indvar_flatten12_fu_110;
wire   [10:0] select_ln201_2_fu_464_p3;
reg   [4:0] n_fu_114;
wire   [4:0] select_ln198_1_fu_296_p3;
reg   [13:0] indvar_flatten34_fu_118;
wire   [13:0] add_ln198_fu_225_p2;
wire   [0:0] icmp_ln201_fu_246_p2;
wire   [0:0] icmp_ln206_fu_272_p2;
wire   [0:0] xor_ln198_fu_266_p2;
wire   [0:0] icmp_ln204_fu_284_p2;
wire   [4:0] n_2_fu_240_p2;
wire   [4:0] select_ln198_fu_252_p3;
wire   [0:0] and_ln198_1_fu_290_p2;
wire   [0:0] or_ln201_fu_310_p2;
wire   [0:0] or_ln198_fu_260_p2;
wire   [0:0] xor_ln201_fu_330_p2;
wire   [0:0] and_ln198_fu_278_p2;
wire   [0:0] or_ln201_2_fu_336_p2;
wire   [4:0] m_2_fu_304_p2;
wire   [2:0] select_ln201_fu_316_p3;
wire   [0:0] and_ln201_fu_342_p2;
wire   [0:0] or_ln201_1_fu_324_p2;
wire   [2:0] i_4_fu_356_p2;
wire   [3:0] empty_39_fu_376_p1;
wire   [6:0] p_shl2_fu_380_p3;
wire   [4:0] empty_40_fu_392_p2;
wire   [7:0] p_shl2_cast_fu_388_p1;
wire   [7:0] p_shl3_cast_fu_398_p1;
wire   [0:0] or_ln206_fu_418_p2;
wire   [0:0] or_ln206_1_fu_424_p2;
wire   [2:0] add_ln206_fu_412_p2;
wire   [5:0] add_ln204_1_fu_444_p2;
wire   [10:0] add_ln201_1_fu_458_p2;
wire  signed [11:0] sext_ln201_fu_507_p1;
wire   [11:0] tmp2_fu_510_p2;
wire   [6:0] p_shl4_fu_519_p3;
wire   [4:0] empty_43_fu_530_p2;
wire   [7:0] p_shl4_cast_fu_526_p1;
wire   [7:0] p_shl5_cast_fu_535_p1;
wire   [7:0] empty_44_fu_539_p2;
wire   [7:0] zext_ln204_fu_545_p1;
wire   [7:0] empty_45_fu_548_p2;
wire   [17:0] p_shl6_fu_554_p3;
wire   [15:0] p_shl7_fu_566_p3;
wire  signed [18:0] p_shl6_cast_fu_562_p1;
wire  signed [18:0] p_shl7_cast_fu_574_p1;
wire   [18:0] empty_46_fu_578_p2;
wire  signed [63:0] p_cast4_fu_584_p1;
wire  signed [63:0] tmp2_cast_fu_515_p1;
wire   [63:0] tmp1_fu_588_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg    ap_loop_exit_ready_pp0_iter4_reg;
reg    ap_loop_exit_ready_pp0_iter5_reg;
reg    ap_loop_exit_ready_pp0_iter6_reg;
reg    ap_loop_exit_ready_pp0_iter7_reg;
reg    ap_loop_exit_ready_pp0_iter8_reg;
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
#0 j_01_fu_94 = 3'd0;
#0 i_fu_98 = 3'd0;
#0 indvar_flatten_fu_102 = 6'd0;
#0 m_fu_106 = 5'd0;
#0 indvar_flatten12_fu_110 = 11'd0;
#0 n_fu_114 = 5'd0;
#0 indvar_flatten34_fu_118 = 14'd0;
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
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter1_stage0),
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
        end else if (((ap_loop_exit_ready_pp0_iter8_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
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
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln198_reg_664 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        first_iter_0_reg_156 <= 1'd0;
    end else if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        first_iter_0_reg_156 <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if ((ap_loop_init == 1'b1)) begin
            i_fu_98 <= 3'd0;
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln198_fu_219_p2 == 1'd0))) begin
            i_fu_98 <= select_ln204_fu_368_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if ((ap_loop_init == 1'b1)) begin
            indvar_flatten12_fu_110 <= 11'd0;
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln198_fu_219_p2 == 1'd0))) begin
            indvar_flatten12_fu_110 <= select_ln201_2_fu_464_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if ((ap_loop_init == 1'b1)) begin
            indvar_flatten34_fu_118 <= 14'd0;
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln198_fu_219_p2 == 1'd0))) begin
            indvar_flatten34_fu_118 <= add_ln198_fu_225_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if ((ap_loop_init == 1'b1)) begin
            indvar_flatten_fu_102 <= 6'd0;
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln198_fu_219_p2 == 1'd0))) begin
            indvar_flatten_fu_102 <= select_ln204_1_fu_450_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if ((ap_loop_init == 1'b1)) begin
            j_01_fu_94 <= 3'd0;
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln198_fu_219_p2 == 1'd0))) begin
            j_01_fu_94 <= j_fu_430_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if ((ap_loop_init == 1'b1)) begin
            m_fu_106 <= 5'd0;
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln198_fu_219_p2 == 1'd0))) begin
            m_fu_106 <= select_ln201_1_fu_348_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if ((ap_loop_init == 1'b1)) begin
            n_fu_114 <= 5'd0;
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln198_fu_219_p2 == 1'd0))) begin
            n_fu_114 <= select_ln198_1_fu_296_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready;
        empty_41_reg_682[7 : 1] <= empty_41_fu_402_p2[7 : 1];
        empty_42_reg_687 <= empty_42_fu_408_p1;
        icmp_ln198_reg_664 <= icmp_ln198_fu_219_p2;
        icmp_ln206_1_reg_692 <= icmp_ln206_1_fu_438_p2;
        or_ln204_reg_673 <= or_ln204_fu_362_p2;
        select_ln201_1_reg_668 <= select_ln201_1_fu_348_p3;
        select_ln204_reg_677 <= select_ln204_fu_368_p3;
        sext_ln198_cast_reg_659 <= sext_ln198_cast_fu_168_p1;
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
        icmp_ln206_1_reg_692_pp0_iter2_reg <= icmp_ln206_1_reg_692;
        icmp_ln206_1_reg_692_pp0_iter3_reg <= icmp_ln206_1_reg_692_pp0_iter2_reg;
        icmp_ln206_1_reg_692_pp0_iter4_reg <= icmp_ln206_1_reg_692_pp0_iter3_reg;
        icmp_ln206_1_reg_692_pp0_iter5_reg <= icmp_ln206_1_reg_692_pp0_iter4_reg;
        icmp_ln206_1_reg_692_pp0_iter6_reg <= icmp_ln206_1_reg_692_pp0_iter5_reg;
        icmp_ln206_1_reg_692_pp0_iter7_reg <= icmp_ln206_1_reg_692_pp0_iter6_reg;
        icmp_ln206_1_reg_692_pp0_iter8_reg <= icmp_ln206_1_reg_692_pp0_iter7_reg;
        or_ln204_reg_673_pp0_iter2_reg <= or_ln204_reg_673;
        port_c_addr_reg_696 <= empty_47_fu_593_p2;
        tmp_reg_702 <= Cstream_dout;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        Cstream_blk_n = Cstream_empty_n;
    end else begin
        Cstream_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        Cstream_read = 1'b1;
    end else begin
        Cstream_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln198_fu_219_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter8_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter9 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln198_reg_664 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_first_iter_0_phi_fu_160_p4 = 1'd0;
    end else begin
        ap_phi_mux_first_iter_0_phi_fu_160_p4 = first_iter_0_reg_156;
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
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (or_ln204_reg_673_pp0_iter2_reg == 1'd1))) begin
        m_axi_port_c_AWVALID = 1'b1;
    end else begin
        m_axi_port_c_AWVALID = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter9 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln206_1_reg_692_pp0_iter8_reg == 1'd1))) begin
        m_axi_port_c_BREADY = 1'b1;
    end else begin
        m_axi_port_c_BREADY = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        m_axi_port_c_WVALID = 1'b1;
    end else begin
        m_axi_port_c_WVALID = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (or_ln204_reg_673_pp0_iter2_reg == 1'd1))) begin
        port_c_blk_n_AW = m_axi_port_c_AWREADY;
    end else begin
        port_c_blk_n_AW = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter9 == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (icmp_ln206_1_reg_692_pp0_iter8_reg == 1'd1))) begin
        port_c_blk_n_B = m_axi_port_c_BVALID;
    end else begin
        port_c_blk_n_B = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        port_c_blk_n_W = m_axi_port_c_WREADY;
    end else begin
        port_c_blk_n_W = 1'b1;
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

assign add_ln198_fu_225_p2 = (indvar_flatten34_fu_118 + 14'd1);

assign add_ln201_1_fu_458_p2 = (indvar_flatten12_fu_110 + 11'd1);

assign add_ln204_1_fu_444_p2 = (indvar_flatten_fu_102 + 6'd1);

assign add_ln206_fu_412_p2 = (j_01_fu_94 + 3'd1);

assign and_ln198_1_fu_290_p2 = (xor_ln198_fu_266_p2 & icmp_ln204_fu_284_p2);

assign and_ln198_fu_278_p2 = (xor_ln198_fu_266_p2 & icmp_ln206_fu_272_p2);

assign and_ln201_fu_342_p2 = (or_ln201_2_fu_336_p2 & and_ln198_fu_278_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((ap_enable_reg_pp0_iter9 == 1'b1) & (1'b1 == ap_block_state10_pp0_stage0_iter9)) | ((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_block_state4_pp0_stage0_iter3)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_enable_reg_pp0_iter9 == 1'b1) & (1'b1 == ap_block_state10_pp0_stage0_iter9)) | ((m_axi_port_c_WREADY == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1)) | ((ap_enable_reg_pp0_iter3 == 1'b1) & ((1'b1 == ap_block_state4_io) | (1'b1 == ap_block_state4_pp0_stage0_iter3))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_enable_reg_pp0_iter9 == 1'b1) & (1'b1 == ap_block_state10_pp0_stage0_iter9)) | ((m_axi_port_c_WREADY == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1)) | ((ap_enable_reg_pp0_iter3 == 1'b1) & ((1'b1 == ap_block_state4_io) | (1'b1 == ap_block_state4_pp0_stage0_iter3))));
end

always @ (*) begin
    ap_block_state10_pp0_stage0_iter9 = ((icmp_ln206_1_reg_692_pp0_iter8_reg == 1'd1) & (m_axi_port_c_BVALID == 1'b0));
end

always @ (*) begin
    ap_block_state4_io = ((m_axi_port_c_AWREADY == 1'b0) & (or_ln204_reg_673_pp0_iter2_reg == 1'd1));
end

always @ (*) begin
    ap_block_state4_pp0_stage0_iter3 = (1'b0 == Cstream_empty_n);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

assign empty_39_fu_376_p1 = select_ln198_1_fu_296_p3[3:0];

assign empty_40_fu_392_p2 = select_ln198_1_fu_296_p3 << 5'd1;

assign empty_41_fu_402_p2 = (p_shl2_cast_fu_388_p1 - p_shl3_cast_fu_398_p1);

assign empty_42_fu_408_p1 = select_ln201_1_fu_348_p3[3:0];

assign empty_43_fu_530_p2 = select_ln201_1_reg_668 << 5'd1;

assign empty_44_fu_539_p2 = (p_shl4_cast_fu_526_p1 - p_shl5_cast_fu_535_p1);

assign empty_45_fu_548_p2 = (empty_44_fu_539_p2 + zext_ln204_fu_545_p1);

assign empty_46_fu_578_p2 = ($signed(p_shl6_cast_fu_562_p1) - $signed(p_shl7_cast_fu_574_p1));

assign empty_47_fu_593_p2 = ($signed(tmp2_cast_fu_515_p1) + $signed(tmp1_fu_588_p2));

assign i_4_fu_356_p2 = (select_ln201_fu_316_p3 + 3'd1);

assign icmp_ln198_fu_219_p2 = ((indvar_flatten34_fu_118 == 14'd9216) ? 1'b1 : 1'b0);

assign icmp_ln201_fu_246_p2 = ((indvar_flatten12_fu_110 == 11'd576) ? 1'b1 : 1'b0);

assign icmp_ln204_fu_284_p2 = ((indvar_flatten_fu_102 == 6'd36) ? 1'b1 : 1'b0);

assign icmp_ln206_1_fu_438_p2 = ((j_fu_430_p3 == 3'd6) ? 1'b1 : 1'b0);

assign icmp_ln206_fu_272_p2 = ((j_01_fu_94 == 3'd6) ? 1'b1 : 1'b0);

assign j_fu_430_p3 = ((or_ln206_1_fu_424_p2[0:0] == 1'b1) ? 3'd1 : add_ln206_fu_412_p2);

assign m_2_fu_304_p2 = (select_ln198_fu_252_p3 + 5'd1);

assign m_axi_port_c_ARADDR = 64'd0;

assign m_axi_port_c_ARBURST = 2'd0;

assign m_axi_port_c_ARCACHE = 4'd0;

assign m_axi_port_c_ARID = 1'd0;

assign m_axi_port_c_ARLEN = 32'd0;

assign m_axi_port_c_ARLOCK = 2'd0;

assign m_axi_port_c_ARPROT = 3'd0;

assign m_axi_port_c_ARQOS = 4'd0;

assign m_axi_port_c_ARREGION = 4'd0;

assign m_axi_port_c_ARSIZE = 3'd0;

assign m_axi_port_c_ARUSER = 1'd0;

assign m_axi_port_c_ARVALID = 1'b0;

assign m_axi_port_c_AWADDR = port_c_addr_reg_696;

assign m_axi_port_c_AWBURST = 2'd0;

assign m_axi_port_c_AWCACHE = 4'd0;

assign m_axi_port_c_AWID = 1'd0;

assign m_axi_port_c_AWLEN = 32'd6;

assign m_axi_port_c_AWLOCK = 2'd0;

assign m_axi_port_c_AWPROT = 3'd0;

assign m_axi_port_c_AWQOS = 4'd0;

assign m_axi_port_c_AWREGION = 4'd0;

assign m_axi_port_c_AWSIZE = 3'd0;

assign m_axi_port_c_AWUSER = 1'd0;

assign m_axi_port_c_RREADY = 1'b0;

assign m_axi_port_c_WDATA = tmp_reg_702;

assign m_axi_port_c_WID = 1'd0;

assign m_axi_port_c_WLAST = 1'b0;

assign m_axi_port_c_WSTRB = 1'd1;

assign m_axi_port_c_WUSER = 1'd0;

assign n_2_fu_240_p2 = (n_fu_114 + 5'd1);

assign or_ln198_fu_260_p2 = (icmp_ln201_fu_246_p2 | ap_phi_mux_first_iter_0_phi_fu_160_p4);

assign or_ln201_1_fu_324_p2 = (or_ln198_fu_260_p2 | and_ln198_1_fu_290_p2);

assign or_ln201_2_fu_336_p2 = (xor_ln201_fu_330_p2 | icmp_ln201_fu_246_p2);

assign or_ln201_fu_310_p2 = (icmp_ln201_fu_246_p2 | and_ln198_1_fu_290_p2);

assign or_ln204_fu_362_p2 = (or_ln201_1_fu_324_p2 | and_ln201_fu_342_p2);

assign or_ln206_1_fu_424_p2 = (or_ln206_fu_418_p2 | icmp_ln201_fu_246_p2);

assign or_ln206_fu_418_p2 = (and_ln201_fu_342_p2 | and_ln198_1_fu_290_p2);

assign p_cast4_fu_584_p1 = $signed(empty_46_fu_578_p2);

assign p_shl2_cast_fu_388_p1 = p_shl2_fu_380_p3;

assign p_shl2_fu_380_p3 = {{empty_39_fu_376_p1}, {3'd0}};

assign p_shl3_cast_fu_398_p1 = empty_40_fu_392_p2;

assign p_shl4_cast_fu_526_p1 = p_shl4_fu_519_p3;

assign p_shl4_fu_519_p3 = {{empty_42_reg_687}, {3'd0}};

assign p_shl5_cast_fu_535_p1 = empty_43_fu_530_p2;

assign p_shl6_cast_fu_562_p1 = $signed(p_shl6_fu_554_p3);

assign p_shl6_fu_554_p3 = {{empty_45_fu_548_p2}, {10'd0}};

assign p_shl7_cast_fu_574_p1 = $signed(p_shl7_fu_566_p3);

assign p_shl7_fu_566_p3 = {{empty_45_fu_548_p2}, {8'd0}};

assign select_ln198_1_fu_296_p3 = ((icmp_ln201_fu_246_p2[0:0] == 1'b1) ? n_2_fu_240_p2 : n_fu_114);

assign select_ln198_fu_252_p3 = ((icmp_ln201_fu_246_p2[0:0] == 1'b1) ? 5'd0 : m_fu_106);

assign select_ln201_1_fu_348_p3 = ((and_ln198_1_fu_290_p2[0:0] == 1'b1) ? m_2_fu_304_p2 : select_ln198_fu_252_p3);

assign select_ln201_2_fu_464_p3 = ((icmp_ln201_fu_246_p2[0:0] == 1'b1) ? 11'd1 : add_ln201_1_fu_458_p2);

assign select_ln201_fu_316_p3 = ((or_ln201_fu_310_p2[0:0] == 1'b1) ? 3'd0 : i_fu_98);

assign select_ln204_1_fu_450_p3 = ((or_ln201_fu_310_p2[0:0] == 1'b1) ? 6'd1 : add_ln204_1_fu_444_p2);

assign select_ln204_fu_368_p3 = ((and_ln201_fu_342_p2[0:0] == 1'b1) ? i_4_fu_356_p2 : select_ln201_fu_316_p3);

assign sext_ln198_cast_fu_168_p1 = $signed(sext_ln198);

assign sext_ln201_fu_507_p1 = $signed(empty_41_reg_682);

assign tmp1_fu_588_p2 = ($signed(out_load) + $signed(p_cast4_fu_584_p1));

assign tmp2_cast_fu_515_p1 = $signed(tmp2_fu_510_p2);

assign tmp2_fu_510_p2 = ($signed(sext_ln198_cast_reg_659) + $signed(sext_ln201_fu_507_p1));

assign xor_ln198_fu_266_p2 = (icmp_ln201_fu_246_p2 ^ 1'd1);

assign xor_ln201_fu_330_p2 = (icmp_ln204_fu_284_p2 ^ 1'd1);

assign zext_ln204_fu_545_p1 = select_ln204_reg_677;

always @ (posedge ap_clk) begin
    empty_41_reg_682[0] <= 1'b0;
end

endmodule //tiled_mm_writeC_Pipeline_tn_loop_tm_loop_wr_out_i_wr_out_j
