// ==============================================================
// Generated by Vitis HLS v2023.2.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module tiled_mm_PE_unsigned_char_384_17 (
        ap_clk,
        ap_rst,
        ap_start,
        start_full_n,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        start_out,
        start_write,
        return_r,
        h_fifo_2_4_dout,
        h_fifo_2_4_num_data_valid,
        h_fifo_2_4_fifo_cap,
        h_fifo_2_4_empty_n,
        h_fifo_2_4_read,
        v_fifo_2_4_dout,
        v_fifo_2_4_num_data_valid,
        v_fifo_2_4_fifo_cap,
        v_fifo_2_4_empty_n,
        v_fifo_2_4_read,
        h_fifo_2_5_din,
        h_fifo_2_5_num_data_valid,
        h_fifo_2_5_fifo_cap,
        h_fifo_2_5_full_n,
        h_fifo_2_5_write,
        v_fifo_3_4_din,
        v_fifo_3_4_num_data_valid,
        v_fifo_3_4_fifo_cap,
        v_fifo_3_4_full_n,
        v_fifo_3_4_write
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state7 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
input   start_full_n;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   start_out;
output   start_write;
output  [7:0] return_r;
input  [15:0] h_fifo_2_4_dout;
input  [2:0] h_fifo_2_4_num_data_valid;
input  [2:0] h_fifo_2_4_fifo_cap;
input   h_fifo_2_4_empty_n;
output   h_fifo_2_4_read;
input  [15:0] v_fifo_2_4_dout;
input  [2:0] v_fifo_2_4_num_data_valid;
input  [2:0] v_fifo_2_4_fifo_cap;
input   v_fifo_2_4_empty_n;
output   v_fifo_2_4_read;
output  [15:0] h_fifo_2_5_din;
input  [2:0] h_fifo_2_5_num_data_valid;
input  [2:0] h_fifo_2_5_fifo_cap;
input   h_fifo_2_5_full_n;
output   h_fifo_2_5_write;
output  [15:0] v_fifo_3_4_din;
input  [2:0] v_fifo_3_4_num_data_valid;
input  [2:0] v_fifo_3_4_fifo_cap;
input   v_fifo_3_4_full_n;
output   v_fifo_3_4_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg[7:0] return_r;
reg h_fifo_2_4_read;
reg v_fifo_2_4_read;
reg h_fifo_2_5_write;
reg v_fifo_3_4_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg    h_fifo_2_4_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg    v_fifo_2_4_blk_n;
reg    h_fifo_2_5_blk_n;
reg    v_fifo_3_4_blk_n;
reg    ap_block_state3_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
wire   [7:0] mul_ln23_fu_153_p2;
reg   [7:0] mul_ln23_reg_212;
reg   [7:0] mul_ln23_reg_212_pp0_iter2_reg;
reg    ap_enable_reg_pp0_iter0;
reg    ap_block_state1;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln15_fu_108_p2;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg   [7:0] accum_02_fu_52;
(* use_dsp48 = "no" *) wire   [7:0] accum_fu_162_p2;
wire    ap_CS_fsm_state7;
reg   [8:0] i_03_fu_56;
wire   [8:0] i_35_fu_114_p2;
reg    ap_block_pp0_stage0_01001;
reg   [7:0] return_r_preg;
wire  signed [7:0] mul_ln23_fu_153_p0;
wire  signed [7:0] mul_ln23_fu_153_p1;
wire  signed [7:0] accum_fu_162_p1;
wire   [7:0] grp_fu_176_p3;
wire  signed [7:0] grp_fu_176_p0;
wire  signed [7:0] grp_fu_176_p1;
reg    grp_fu_176_ce;
reg   [2:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state7_blk;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 3'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 accum_02_fu_52 = 8'd0;
#0 i_03_fu_56 = 9'd0;
#0 return_r_preg = 8'd0;
end

tiled_mm_mul_8s_8s_8_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 8 ),
    .dout_WIDTH( 8 ))
mul_8s_8s_8_1_1_U172(
    .din0(mul_ln23_fu_153_p0),
    .din1(mul_ln23_fu_153_p1),
    .dout(mul_ln23_fu_153_p2)
);

tiled_mm_mac_muladd_8s_8s_8ns_8_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 8 ),
    .din2_WIDTH( 8 ),
    .dout_WIDTH( 8 ))
mac_muladd_8s_8s_8ns_8_4_1_U173(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_176_p0),
    .din1(grp_fu_176_p1),
    .din2(mul_ln23_reg_212_pp0_iter2_reg),
    .ce(grp_fu_176_ce),
    .dout(grp_fu_176_p3)
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
        end else if ((1'b1 == ap_CS_fsm_state7)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((1'b0 == ap_block_state1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state2)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
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
        end else if (((1'b0 == ap_block_state1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter4 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        return_r_preg <= 8'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state7)) begin
            return_r_preg <= accum_02_fu_52;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if (((real_start == 1'b1) & (internal_ap_ready == 1'b0))) begin
            start_once_reg <= 1'b1;
        end else if ((internal_ap_ready == 1'b1)) begin
            start_once_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_state1) & (1'b1 == ap_CS_fsm_state1))) begin
        accum_02_fu_52 <= 8'd0;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        accum_02_fu_52 <= accum_fu_162_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_state1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_03_fu_56 <= 9'd0;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln15_fu_108_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        i_03_fu_56 <= i_35_fu_114_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        mul_ln23_reg_212 <= mul_ln23_fu_153_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        mul_ln23_reg_212_pp0_iter2_reg <= mul_ln23_reg_212;
    end
end

always @ (*) begin
    if ((1'b1 == ap_block_state1)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state7_blk = 1'b0;

always @ (*) begin
    if ((icmp_ln15_fu_108_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((real_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_176_ce = 1'b1;
    end else begin
        grp_fu_176_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        h_fifo_2_4_blk_n = h_fifo_2_4_empty_n;
    end else begin
        h_fifo_2_4_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        h_fifo_2_4_read = 1'b1;
    end else begin
        h_fifo_2_4_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        h_fifo_2_5_blk_n = h_fifo_2_5_full_n;
    end else begin
        h_fifo_2_5_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        h_fifo_2_5_write = 1'b1;
    end else begin
        h_fifo_2_5_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (start_full_n == 1'b0))) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        return_r = accum_02_fu_52;
    end else begin
        return_r = return_r_preg;
    end
end

always @ (*) begin
    if (((real_start == 1'b1) & (start_once_reg == 1'b0))) begin
        start_write = 1'b1;
    end else begin
        start_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        v_fifo_2_4_blk_n = v_fifo_2_4_empty_n;
    end else begin
        v_fifo_2_4_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        v_fifo_2_4_read = 1'b1;
    end else begin
        v_fifo_2_4_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        v_fifo_3_4_blk_n = v_fifo_3_4_full_n;
    end else begin
        v_fifo_3_4_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        v_fifo_3_4_write = 1'b1;
    end else begin
        v_fifo_3_4_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b0 == ap_block_state1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln15_fu_108_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b0)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln15_fu_108_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign accum_fu_162_p1 = grp_fu_176_p3;

assign accum_fu_162_p2 = ($signed(accum_02_fu_52) + $signed(accum_fu_162_p1));

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state3_pp0_stage0_iter1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state3_pp0_stage0_iter1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state3_pp0_stage0_iter1));
end

always @ (*) begin
    ap_block_state1 = ((real_start == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter1 = ((v_fifo_3_4_full_n == 1'b0) | (h_fifo_2_5_full_n == 1'b0) | (v_fifo_2_4_empty_n == 1'b0) | (h_fifo_2_4_empty_n == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_ready = internal_ap_ready;

assign grp_fu_176_p0 = v_fifo_2_4_dout[7:0];

assign grp_fu_176_p1 = h_fifo_2_4_dout[7:0];

assign h_fifo_2_5_din = h_fifo_2_4_dout;

assign i_35_fu_114_p2 = (i_03_fu_56 + 9'd1);

assign icmp_ln15_fu_108_p2 = ((i_03_fu_56 == 9'd384) ? 1'b1 : 1'b0);

assign mul_ln23_fu_153_p0 = {{v_fifo_2_4_dout[15:8]}};

assign mul_ln23_fu_153_p1 = {{h_fifo_2_4_dout[15:8]}};

assign start_out = real_start;

assign v_fifo_3_4_din = v_fifo_2_4_dout;

endmodule //tiled_mm_PE_unsigned_char_384_17
