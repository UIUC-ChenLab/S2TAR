// ==============================================================
// Generated by Vitis HLS v2023.2.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module tiled_mm_writevfifo (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        v_fifo_0_0_din,
        v_fifo_0_0_num_data_valid,
        v_fifo_0_0_fifo_cap,
        v_fifo_0_0_full_n,
        v_fifo_0_0_write,
        v_fifo_0_1_din,
        v_fifo_0_1_num_data_valid,
        v_fifo_0_1_fifo_cap,
        v_fifo_0_1_full_n,
        v_fifo_0_1_write,
        v_fifo_0_2_din,
        v_fifo_0_2_num_data_valid,
        v_fifo_0_2_fifo_cap,
        v_fifo_0_2_full_n,
        v_fifo_0_2_write,
        v_fifo_0_3_din,
        v_fifo_0_3_num_data_valid,
        v_fifo_0_3_fifo_cap,
        v_fifo_0_3_full_n,
        v_fifo_0_3_write,
        v_fifo_0_4_din,
        v_fifo_0_4_num_data_valid,
        v_fifo_0_4_fifo_cap,
        v_fifo_0_4_full_n,
        v_fifo_0_4_write,
        v_fifo_0_5_din,
        v_fifo_0_5_num_data_valid,
        v_fifo_0_5_fifo_cap,
        v_fifo_0_5_full_n,
        v_fifo_0_5_write,
        b_cache_0_address0,
        b_cache_0_ce0,
        b_cache_0_q0,
        b_cache_1_address0,
        b_cache_1_ce0,
        b_cache_1_q0,
        b_cache_2_address0,
        b_cache_2_ce0,
        b_cache_2_q0,
        b_cache_3_address0,
        b_cache_3_ce0,
        b_cache_3_q0,
        b_cache_4_address0,
        b_cache_4_ce0,
        b_cache_4_q0,
        b_cache_5_address0,
        b_cache_5_ce0,
        b_cache_5_q0
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [15:0] v_fifo_0_0_din;
input  [2:0] v_fifo_0_0_num_data_valid;
input  [2:0] v_fifo_0_0_fifo_cap;
input   v_fifo_0_0_full_n;
output   v_fifo_0_0_write;
output  [15:0] v_fifo_0_1_din;
input  [2:0] v_fifo_0_1_num_data_valid;
input  [2:0] v_fifo_0_1_fifo_cap;
input   v_fifo_0_1_full_n;
output   v_fifo_0_1_write;
output  [15:0] v_fifo_0_2_din;
input  [2:0] v_fifo_0_2_num_data_valid;
input  [2:0] v_fifo_0_2_fifo_cap;
input   v_fifo_0_2_full_n;
output   v_fifo_0_2_write;
output  [15:0] v_fifo_0_3_din;
input  [2:0] v_fifo_0_3_num_data_valid;
input  [2:0] v_fifo_0_3_fifo_cap;
input   v_fifo_0_3_full_n;
output   v_fifo_0_3_write;
output  [15:0] v_fifo_0_4_din;
input  [2:0] v_fifo_0_4_num_data_valid;
input  [2:0] v_fifo_0_4_fifo_cap;
input   v_fifo_0_4_full_n;
output   v_fifo_0_4_write;
output  [15:0] v_fifo_0_5_din;
input  [2:0] v_fifo_0_5_num_data_valid;
input  [2:0] v_fifo_0_5_fifo_cap;
input   v_fifo_0_5_full_n;
output   v_fifo_0_5_write;
output  [7:0] b_cache_0_address0;
output   b_cache_0_ce0;
input  [511:0] b_cache_0_q0;
output  [7:0] b_cache_1_address0;
output   b_cache_1_ce0;
input  [511:0] b_cache_1_q0;
output  [7:0] b_cache_2_address0;
output   b_cache_2_ce0;
input  [511:0] b_cache_2_q0;
output  [7:0] b_cache_3_address0;
output   b_cache_3_ce0;
input  [511:0] b_cache_3_q0;
output  [7:0] b_cache_4_address0;
output   b_cache_4_ce0;
input  [511:0] b_cache_4_q0;
output  [7:0] b_cache_5_address0;
output   b_cache_5_ce0;
input  [511:0] b_cache_5_q0;

reg ap_idle;
reg v_fifo_0_0_write;
reg v_fifo_0_1_write;
reg v_fifo_0_2_write;
reg v_fifo_0_3_write;
reg v_fifo_0_4_write;
reg v_fifo_0_5_write;
reg b_cache_0_ce0;
reg b_cache_1_ce0;
reg b_cache_2_ce0;
reg b_cache_3_ce0;
reg b_cache_4_ce0;
reg b_cache_5_ce0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_idle_pp0;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg    ap_block_state5_pp0_stage0_iter4;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln163_fu_275_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    ap_condition_exit_pp0_iter0_stage0_pp0_iter1_reg;
reg    ap_block_pp0_stage0_11001;
reg    ap_loop_exit_ready_delayed;
reg    v_fifo_0_0_blk_n;
wire    ap_block_pp0_stage0;
reg    v_fifo_0_1_blk_n;
reg    v_fifo_0_2_blk_n;
reg    v_fifo_0_3_blk_n;
reg    v_fifo_0_4_blk_n;
reg    v_fifo_0_5_blk_n;
wire   [0:0] icmp_ln166_fu_290_p2;
reg   [0:0] icmp_ln166_reg_703;
reg   [0:0] icmp_ln166_reg_703_pp0_iter1_reg;
wire   [3:0] select_ln169_1_fu_413_p3;
reg   [3:0] select_ln169_1_reg_712;
wire   [4:0] trunc_ln179_fu_421_p1;
reg   [4:0] trunc_ln179_reg_717;
reg   [4:0] trunc_ln179_reg_717_pp0_iter2_reg;
wire   [7:0] Btmp_fu_531_p1;
reg   [7:0] Btmp_reg_752;
wire   [7:0] Btmp_1_fu_541_p1;
reg   [7:0] Btmp_1_reg_757;
wire   [7:0] Btmp_2_fu_551_p1;
reg   [7:0] Btmp_2_reg_762;
wire   [7:0] Btmp_3_fu_561_p1;
reg   [7:0] Btmp_3_reg_767;
wire   [7:0] Btmp_4_fu_571_p1;
reg   [7:0] Btmp_4_reg_772;
wire   [7:0] Btmp_5_fu_581_p1;
reg   [7:0] Btmp_5_reg_777;
wire   [63:0] p_cast58_fu_493_p1;
reg   [5:0] p_fu_98;
wire   [5:0] p_1_fu_425_p2;
wire    ap_loop_init;
reg    ap_loop_init_pp0_iter1_reg;
reg   [5:0] ap_sig_allocacmp_p_load;
reg   [3:0] i_fu_102;
reg   [3:0] ap_sig_allocacmp_i_load;
reg   [9:0] indvar_flatten_fu_106;
wire   [9:0] select_ln169_2_fu_437_p3;
reg   [9:0] ap_sig_allocacmp_indvar_flatten_load;
reg   [13:0] indvar_flatten12_fu_110;
wire   [13:0] select_ln166_1_fu_302_p3;
reg   [13:0] ap_sig_allocacmp_indvar_flatten12_load;
reg   [4:0] tn_fu_114;
wire   [4:0] select_ln163_fu_469_p3;
reg    ap_loop_init_pp0_iter2_reg;
reg   [4:0] ap_sig_allocacmp_tn_load;
reg   [16:0] indvar_flatten34_fu_118;
wire   [16:0] add_ln163_fu_281_p2;
reg   [16:0] ap_sig_allocacmp_indvar_flatten34_load;
reg    ap_block_pp0_stage0_01001;
wire   [13:0] add_ln166_fu_296_p2;
wire   [0:0] icmp_ln169_fu_340_p2;
wire   [0:0] xor_ln163_fu_329_p2;
wire   [0:0] and_ln163_1_fu_346_p2;
wire   [0:0] or_ln166_fu_352_p2;
wire   [0:0] xor_ln166_fu_365_p2;
wire   [0:0] or_ln166_1_fu_371_p2;
wire   [0:0] and_ln163_fu_376_p2;
wire   [0:0] icmp_ln171_fu_334_p2;
wire   [3:0] select_ln166_fu_357_p3;
wire   [0:0] and_ln166_fu_382_p2;
wire   [0:0] or_ln169_fu_394_p2;
wire   [0:0] or_ln169_1_fu_400_p2;
wire   [3:0] i_2_fu_388_p2;
wire   [5:0] select_ln169_fu_405_p3;
wire   [9:0] add_ln169_1_fu_431_p2;
wire   [4:0] tn_2_fu_463_p2;
wire   [7:0] tmp_fu_480_p3;
wire   [7:0] select_ln163_1_cast_fu_476_p1;
wire   [7:0] empty_fu_487_p2;
wire   [8:0] shl_ln_fu_508_p3;
wire   [8:0] or_ln179_fu_515_p2;
wire   [511:0] zext_ln179_fu_521_p1;
wire   [511:0] lshr_ln179_fu_525_p2;
wire   [511:0] lshr_ln179_1_fu_535_p2;
wire   [511:0] lshr_ln179_2_fu_545_p2;
wire   [511:0] lshr_ln179_3_fu_555_p2;
wire   [511:0] lshr_ln179_4_fu_565_p2;
wire   [511:0] lshr_ln179_5_fu_575_p2;
wire   [15:0] B_pack_fu_585_p1;
wire   [15:0] B_pack_1_fu_597_p1;
wire   [15:0] B_pack_2_fu_609_p1;
wire   [15:0] B_pack_3_fu_621_p1;
wire   [15:0] B_pack_4_fu_633_p1;
wire   [15:0] B_pack_5_fu_645_p1;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_221;
reg    ap_condition_243;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_done_reg = 1'b0;
#0 p_fu_98 = 6'd0;
#0 i_fu_102 = 4'd0;
#0 indvar_flatten_fu_106 = 10'd0;
#0 indvar_flatten12_fu_110 = 14'd0;
#0 tn_fu_114 = 5'd0;
#0 indvar_flatten34_fu_118 = 17'd0;
end

tiled_mm_flow_control_loop_delay_pipe flow_control_loop_delay_pipe_U(
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
    .ap_done_int(ap_done_int),
    .ap_continue(ap_continue),
    .ap_loop_exit_ready_delayed(ap_loop_exit_ready_delayed)
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
        end else if (((ap_loop_exit_ready_pp0_iter3_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if ((1'b1 == ap_condition_221)) begin
        i_fu_102 <= select_ln169_1_fu_413_p3;
    end
end

always @ (posedge ap_clk) begin
if ((1'b1 == ap_condition_243)) begin
    if ((icmp_ln163_fu_275_p2 == 1'd0)) begin
        indvar_flatten12_fu_110 <= select_ln166_1_fu_302_p3;
    end else if ((ap_loop_init == 1'b1)) begin
        indvar_flatten12_fu_110 <= 14'd0;
    end
end
end

always @ (posedge ap_clk) begin
if ((1'b1 == ap_condition_243)) begin
    if ((icmp_ln163_fu_275_p2 == 1'd0)) begin
        indvar_flatten34_fu_118 <= add_ln163_fu_281_p2;
    end else if ((ap_loop_init == 1'b1)) begin
        indvar_flatten34_fu_118 <= 17'd0;
    end
end
end

always @ (posedge ap_clk) begin
if ((1'b1 == ap_condition_221)) begin
    indvar_flatten_fu_106 <= select_ln169_2_fu_437_p3;
end
end

always @ (posedge ap_clk) begin
if ((1'b1 == ap_condition_221)) begin
    p_fu_98 <= p_1_fu_425_p2;
end
end

always @ (posedge ap_clk) begin
if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
    tn_fu_114 <= select_ln163_fu_469_p3;
end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        Btmp_1_reg_757 <= Btmp_1_fu_541_p1;
        Btmp_2_reg_762 <= Btmp_2_fu_551_p1;
        Btmp_3_reg_767 <= Btmp_3_fu_561_p1;
        Btmp_4_reg_772 <= Btmp_4_fu_571_p1;
        Btmp_5_reg_777 <= Btmp_5_fu_581_p1;
        Btmp_reg_752 <= Btmp_fu_531_p1;
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        trunc_ln179_reg_717_pp0_iter2_reg <= trunc_ln179_reg_717;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_condition_exit_pp0_iter0_stage0_pp0_iter1_reg <= ap_condition_exit_pp0_iter0_stage0;
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        ap_loop_init_pp0_iter1_reg <= ap_loop_init;
        ap_loop_init_pp0_iter2_reg <= ap_loop_init_pp0_iter1_reg;
        icmp_ln166_reg_703 <= icmp_ln166_fu_290_p2;
        icmp_ln166_reg_703_pp0_iter1_reg <= icmp_ln166_reg_703;
        select_ln169_1_reg_712 <= select_ln169_1_fu_413_p3;
        trunc_ln179_reg_717 <= trunc_ln179_fu_421_p1;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln163_fu_275_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter3_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if (((ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_exit_pp0_iter0_stage0_pp0_iter1_reg) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_loop_exit_ready_delayed = 1'b1;
    end else begin
        ap_loop_exit_ready_delayed = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (ap_loop_init_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_sig_allocacmp_i_load = 4'd0;
    end else begin
        ap_sig_allocacmp_i_load = i_fu_102;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_sig_allocacmp_indvar_flatten12_load = 14'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten12_load = indvar_flatten12_fu_110;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_sig_allocacmp_indvar_flatten34_load = 17'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten34_load = indvar_flatten34_fu_118;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (ap_loop_init_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_sig_allocacmp_indvar_flatten_load = 10'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten_load = indvar_flatten_fu_106;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (ap_loop_init_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_sig_allocacmp_p_load = 6'd0;
    end else begin
        ap_sig_allocacmp_p_load = p_fu_98;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (ap_loop_init_pp0_iter2_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_sig_allocacmp_tn_load = 5'd0;
    end else begin
        ap_sig_allocacmp_tn_load = tn_fu_114;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        b_cache_0_ce0 = 1'b1;
    end else begin
        b_cache_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        b_cache_1_ce0 = 1'b1;
    end else begin
        b_cache_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        b_cache_2_ce0 = 1'b1;
    end else begin
        b_cache_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        b_cache_3_ce0 = 1'b1;
    end else begin
        b_cache_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        b_cache_4_ce0 = 1'b1;
    end else begin
        b_cache_4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        b_cache_5_ce0 = 1'b1;
    end else begin
        b_cache_5_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        v_fifo_0_0_blk_n = v_fifo_0_0_full_n;
    end else begin
        v_fifo_0_0_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        v_fifo_0_0_write = 1'b1;
    end else begin
        v_fifo_0_0_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        v_fifo_0_1_blk_n = v_fifo_0_1_full_n;
    end else begin
        v_fifo_0_1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        v_fifo_0_1_write = 1'b1;
    end else begin
        v_fifo_0_1_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        v_fifo_0_2_blk_n = v_fifo_0_2_full_n;
    end else begin
        v_fifo_0_2_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        v_fifo_0_2_write = 1'b1;
    end else begin
        v_fifo_0_2_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        v_fifo_0_3_blk_n = v_fifo_0_3_full_n;
    end else begin
        v_fifo_0_3_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        v_fifo_0_3_write = 1'b1;
    end else begin
        v_fifo_0_3_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        v_fifo_0_4_blk_n = v_fifo_0_4_full_n;
    end else begin
        v_fifo_0_4_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        v_fifo_0_4_write = 1'b1;
    end else begin
        v_fifo_0_4_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        v_fifo_0_5_blk_n = v_fifo_0_5_full_n;
    end else begin
        v_fifo_0_5_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        v_fifo_0_5_write = 1'b1;
    end else begin
        v_fifo_0_5_write = 1'b0;
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

assign B_pack_1_fu_597_p1 = 'bx;

assign B_pack_2_fu_609_p1 = 'bx;

assign B_pack_3_fu_621_p1 = 'bx;

assign B_pack_4_fu_633_p1 = 'bx;

assign B_pack_5_fu_645_p1 = 'bx;

assign B_pack_fu_585_p1 = 'bx;

assign Btmp_1_fu_541_p1 = lshr_ln179_1_fu_535_p2[7:0];

assign Btmp_2_fu_551_p1 = lshr_ln179_2_fu_545_p2[7:0];

assign Btmp_3_fu_561_p1 = lshr_ln179_3_fu_555_p2[7:0];

assign Btmp_4_fu_571_p1 = lshr_ln179_4_fu_565_p2[7:0];

assign Btmp_5_fu_581_p1 = lshr_ln179_5_fu_575_p2[7:0];

assign Btmp_fu_531_p1 = lshr_ln179_fu_525_p2[7:0];

assign add_ln163_fu_281_p2 = (ap_sig_allocacmp_indvar_flatten34_load + 17'd1);

assign add_ln166_fu_296_p2 = (ap_sig_allocacmp_indvar_flatten12_load + 14'd1);

assign add_ln169_1_fu_431_p2 = (ap_sig_allocacmp_indvar_flatten_load + 10'd1);

assign and_ln163_1_fu_346_p2 = (xor_ln163_fu_329_p2 & icmp_ln169_fu_340_p2);

assign and_ln163_fu_376_p2 = (xor_ln163_fu_329_p2 & or_ln166_1_fu_371_p2);

assign and_ln166_fu_382_p2 = (icmp_ln171_fu_334_p2 & and_ln163_fu_376_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_block_state5_pp0_stage0_iter4)) | ((ap_start_int == 1'b1) & (1'b1 == ap_block_state1_pp0_stage0_iter0)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_block_state5_pp0_stage0_iter4)) | ((ap_start_int == 1'b1) & (1'b1 == ap_block_state1_pp0_stage0_iter0)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_block_state5_pp0_stage0_iter4)) | ((ap_start_int == 1'b1) & (1'b1 == ap_block_state1_pp0_stage0_iter0)));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_done_reg == 1'b1);
end

always @ (*) begin
    ap_block_state5_pp0_stage0_iter4 = ((v_fifo_0_5_full_n == 1'b0) | (v_fifo_0_4_full_n == 1'b0) | (v_fifo_0_3_full_n == 1'b0) | (v_fifo_0_2_full_n == 1'b0) | (v_fifo_0_1_full_n == 1'b0) | (v_fifo_0_0_full_n == 1'b0));
end

always @ (*) begin
    ap_condition_221 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001));
end

always @ (*) begin
    ap_condition_243 = ((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign b_cache_0_address0 = p_cast58_fu_493_p1;

assign b_cache_1_address0 = p_cast58_fu_493_p1;

assign b_cache_2_address0 = p_cast58_fu_493_p1;

assign b_cache_3_address0 = p_cast58_fu_493_p1;

assign b_cache_4_address0 = p_cast58_fu_493_p1;

assign b_cache_5_address0 = p_cast58_fu_493_p1;

assign empty_fu_487_p2 = (tmp_fu_480_p3 + select_ln163_1_cast_fu_476_p1);

assign i_2_fu_388_p2 = (select_ln166_fu_357_p3 + 4'd1);

assign icmp_ln163_fu_275_p2 = ((ap_sig_allocacmp_indvar_flatten34_load == 17'd98304) ? 1'b1 : 1'b0);

assign icmp_ln166_fu_290_p2 = ((ap_sig_allocacmp_indvar_flatten12_load == 14'd6144) ? 1'b1 : 1'b0);

assign icmp_ln169_fu_340_p2 = ((ap_sig_allocacmp_indvar_flatten_load == 10'd384) ? 1'b1 : 1'b0);

assign icmp_ln171_fu_334_p2 = ((ap_sig_allocacmp_p_load == 6'd32) ? 1'b1 : 1'b0);

assign lshr_ln179_1_fu_535_p2 = b_cache_1_q0 >> zext_ln179_fu_521_p1;

assign lshr_ln179_2_fu_545_p2 = b_cache_2_q0 >> zext_ln179_fu_521_p1;

assign lshr_ln179_3_fu_555_p2 = b_cache_3_q0 >> zext_ln179_fu_521_p1;

assign lshr_ln179_4_fu_565_p2 = b_cache_4_q0 >> zext_ln179_fu_521_p1;

assign lshr_ln179_5_fu_575_p2 = b_cache_5_q0 >> zext_ln179_fu_521_p1;

assign lshr_ln179_fu_525_p2 = b_cache_0_q0 >> zext_ln179_fu_521_p1;

assign or_ln166_1_fu_371_p2 = (xor_ln166_fu_365_p2 | icmp_ln166_reg_703);

assign or_ln166_fu_352_p2 = (icmp_ln166_reg_703 | and_ln163_1_fu_346_p2);

assign or_ln169_1_fu_400_p2 = (or_ln169_fu_394_p2 | icmp_ln166_reg_703);

assign or_ln169_fu_394_p2 = (and_ln166_fu_382_p2 | and_ln163_1_fu_346_p2);

assign or_ln179_fu_515_p2 = (shl_ln_fu_508_p3 | 9'd8);

assign p_1_fu_425_p2 = (select_ln169_fu_405_p3 + 6'd1);

assign p_cast58_fu_493_p1 = empty_fu_487_p2;

assign select_ln163_1_cast_fu_476_p1 = select_ln163_fu_469_p3;

assign select_ln163_fu_469_p3 = ((icmp_ln166_reg_703_pp0_iter1_reg[0:0] == 1'b1) ? tn_2_fu_463_p2 : ap_sig_allocacmp_tn_load);

assign select_ln166_1_fu_302_p3 = ((icmp_ln166_fu_290_p2[0:0] == 1'b1) ? 14'd1 : add_ln166_fu_296_p2);

assign select_ln166_fu_357_p3 = ((or_ln166_fu_352_p2[0:0] == 1'b1) ? 4'd0 : ap_sig_allocacmp_i_load);

assign select_ln169_1_fu_413_p3 = ((and_ln166_fu_382_p2[0:0] == 1'b1) ? i_2_fu_388_p2 : select_ln166_fu_357_p3);

assign select_ln169_2_fu_437_p3 = ((or_ln166_fu_352_p2[0:0] == 1'b1) ? 10'd1 : add_ln169_1_fu_431_p2);

assign select_ln169_fu_405_p3 = ((or_ln169_1_fu_400_p2[0:0] == 1'b1) ? 6'd0 : ap_sig_allocacmp_p_load);

assign shl_ln_fu_508_p3 = {{trunc_ln179_reg_717_pp0_iter2_reg}, {4'd0}};

assign tmp_fu_480_p3 = {{select_ln169_1_reg_712}, {4'd0}};

assign tn_2_fu_463_p2 = (ap_sig_allocacmp_tn_load + 5'd1);

assign trunc_ln179_fu_421_p1 = select_ln169_fu_405_p3[4:0];

assign v_fifo_0_0_din = {{Btmp_reg_752}, {B_pack_fu_585_p1[7:0]}};

assign v_fifo_0_1_din = {{Btmp_1_reg_757}, {B_pack_1_fu_597_p1[7:0]}};

assign v_fifo_0_2_din = {{Btmp_2_reg_762}, {B_pack_2_fu_609_p1[7:0]}};

assign v_fifo_0_3_din = {{Btmp_3_reg_767}, {B_pack_3_fu_621_p1[7:0]}};

assign v_fifo_0_4_din = {{Btmp_4_reg_772}, {B_pack_4_fu_633_p1[7:0]}};

assign v_fifo_0_5_din = {{Btmp_5_reg_777}, {B_pack_5_fu_645_p1[7:0]}};

assign xor_ln163_fu_329_p2 = (icmp_ln166_reg_703 ^ 1'd1);

assign xor_ln166_fu_365_p2 = (icmp_ln169_fu_340_p2 ^ 1'd1);

assign zext_ln179_fu_521_p1 = or_ln179_fu_515_p2;

endmodule //tiled_mm_writevfifo