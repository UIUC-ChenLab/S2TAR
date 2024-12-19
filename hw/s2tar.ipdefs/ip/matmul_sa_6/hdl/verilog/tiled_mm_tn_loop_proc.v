// ==============================================================
// Generated by Vitis HLS v2023.2.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module tiled_mm_tn_loop_proc (
        h_fifo_dout,
        h_fifo_empty_n,
        h_fifo_read,
        v_fifo_dout,
        v_fifo_empty_n,
        v_fifo_read,
        v_fifo_1_dout,
        v_fifo_1_empty_n,
        v_fifo_1_read,
        v_fifo_2_dout,
        v_fifo_2_empty_n,
        v_fifo_2_read,
        v_fifo_3_dout,
        v_fifo_3_empty_n,
        v_fifo_3_read,
        v_fifo_4_dout,
        v_fifo_4_empty_n,
        v_fifo_4_read,
        v_fifo_5_dout,
        v_fifo_5_empty_n,
        v_fifo_5_read,
        h_fifo_1_dout,
        h_fifo_1_empty_n,
        h_fifo_1_read,
        h_fifo_2_dout,
        h_fifo_2_empty_n,
        h_fifo_2_read,
        h_fifo_3_dout,
        h_fifo_3_empty_n,
        h_fifo_3_read,
        h_fifo_4_dout,
        h_fifo_4_empty_n,
        h_fifo_4_read,
        h_fifo_5_dout,
        h_fifo_5_empty_n,
        h_fifo_5_read,
        Cstream_din,
        Cstream_full_n,
        Cstream_write,
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_ready,
        ap_idle,
        ap_continue
);


input  [15:0] h_fifo_dout;
input   h_fifo_empty_n;
output   h_fifo_read;
input  [15:0] v_fifo_dout;
input   v_fifo_empty_n;
output   v_fifo_read;
input  [15:0] v_fifo_1_dout;
input   v_fifo_1_empty_n;
output   v_fifo_1_read;
input  [15:0] v_fifo_2_dout;
input   v_fifo_2_empty_n;
output   v_fifo_2_read;
input  [15:0] v_fifo_3_dout;
input   v_fifo_3_empty_n;
output   v_fifo_3_read;
input  [15:0] v_fifo_4_dout;
input   v_fifo_4_empty_n;
output   v_fifo_4_read;
input  [15:0] v_fifo_5_dout;
input   v_fifo_5_empty_n;
output   v_fifo_5_read;
input  [15:0] h_fifo_1_dout;
input   h_fifo_1_empty_n;
output   h_fifo_1_read;
input  [15:0] h_fifo_2_dout;
input   h_fifo_2_empty_n;
output   h_fifo_2_read;
input  [15:0] h_fifo_3_dout;
input   h_fifo_3_empty_n;
output   h_fifo_3_read;
input  [15:0] h_fifo_4_dout;
input   h_fifo_4_empty_n;
output   h_fifo_4_read;
input  [15:0] h_fifo_5_dout;
input   h_fifo_5_empty_n;
output   h_fifo_5_read;
output  [7:0] Cstream_din;
input   Cstream_full_n;
output   Cstream_write;
input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_ready;
output   ap_idle;
input   ap_continue;

reg ap_done;
reg ap_ready;
reg ap_idle;

wire    dataflow_parent_loop_proc_U0_h_fifo_read;
wire    dataflow_parent_loop_proc_U0_v_fifo_read;
wire    dataflow_parent_loop_proc_U0_v_fifo_1_read;
wire    dataflow_parent_loop_proc_U0_v_fifo_2_read;
wire    dataflow_parent_loop_proc_U0_v_fifo_3_read;
wire    dataflow_parent_loop_proc_U0_v_fifo_4_read;
wire    dataflow_parent_loop_proc_U0_v_fifo_5_read;
wire    dataflow_parent_loop_proc_U0_h_fifo_1_read;
wire    dataflow_parent_loop_proc_U0_h_fifo_2_read;
wire    dataflow_parent_loop_proc_U0_h_fifo_3_read;
wire    dataflow_parent_loop_proc_U0_h_fifo_4_read;
wire    dataflow_parent_loop_proc_U0_h_fifo_5_read;
wire   [7:0] dataflow_parent_loop_proc_U0_Cstream_din;
wire    dataflow_parent_loop_proc_U0_Cstream_write;
wire    dataflow_parent_loop_proc_U0_ap_start;
wire    dataflow_parent_loop_proc_U0_ap_done;
wire    dataflow_parent_loop_proc_U0_ap_ready;
wire    dataflow_parent_loop_proc_U0_ap_idle;
reg    dataflow_parent_loop_proc_U0_ap_continue;
reg   [4:0] loop_dataflow_input_count;
reg   [4:0] loop_dataflow_output_count;
wire   [4:0] bound_minus_1;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 loop_dataflow_input_count = 5'd0;
#0 loop_dataflow_output_count = 5'd0;
end

tiled_mm_dataflow_parent_loop_proc dataflow_parent_loop_proc_U0(
    .h_fifo_dout(h_fifo_dout),
    .h_fifo_empty_n(h_fifo_empty_n),
    .h_fifo_read(dataflow_parent_loop_proc_U0_h_fifo_read),
    .v_fifo_dout(v_fifo_dout),
    .v_fifo_empty_n(v_fifo_empty_n),
    .v_fifo_read(dataflow_parent_loop_proc_U0_v_fifo_read),
    .v_fifo_1_dout(v_fifo_1_dout),
    .v_fifo_1_empty_n(v_fifo_1_empty_n),
    .v_fifo_1_read(dataflow_parent_loop_proc_U0_v_fifo_1_read),
    .v_fifo_2_dout(v_fifo_2_dout),
    .v_fifo_2_empty_n(v_fifo_2_empty_n),
    .v_fifo_2_read(dataflow_parent_loop_proc_U0_v_fifo_2_read),
    .v_fifo_3_dout(v_fifo_3_dout),
    .v_fifo_3_empty_n(v_fifo_3_empty_n),
    .v_fifo_3_read(dataflow_parent_loop_proc_U0_v_fifo_3_read),
    .v_fifo_4_dout(v_fifo_4_dout),
    .v_fifo_4_empty_n(v_fifo_4_empty_n),
    .v_fifo_4_read(dataflow_parent_loop_proc_U0_v_fifo_4_read),
    .v_fifo_5_dout(v_fifo_5_dout),
    .v_fifo_5_empty_n(v_fifo_5_empty_n),
    .v_fifo_5_read(dataflow_parent_loop_proc_U0_v_fifo_5_read),
    .h_fifo_1_dout(h_fifo_1_dout),
    .h_fifo_1_empty_n(h_fifo_1_empty_n),
    .h_fifo_1_read(dataflow_parent_loop_proc_U0_h_fifo_1_read),
    .h_fifo_2_dout(h_fifo_2_dout),
    .h_fifo_2_empty_n(h_fifo_2_empty_n),
    .h_fifo_2_read(dataflow_parent_loop_proc_U0_h_fifo_2_read),
    .h_fifo_3_dout(h_fifo_3_dout),
    .h_fifo_3_empty_n(h_fifo_3_empty_n),
    .h_fifo_3_read(dataflow_parent_loop_proc_U0_h_fifo_3_read),
    .h_fifo_4_dout(h_fifo_4_dout),
    .h_fifo_4_empty_n(h_fifo_4_empty_n),
    .h_fifo_4_read(dataflow_parent_loop_proc_U0_h_fifo_4_read),
    .h_fifo_5_dout(h_fifo_5_dout),
    .h_fifo_5_empty_n(h_fifo_5_empty_n),
    .h_fifo_5_read(dataflow_parent_loop_proc_U0_h_fifo_5_read),
    .Cstream_din(dataflow_parent_loop_proc_U0_Cstream_din),
    .Cstream_full_n(Cstream_full_n),
    .Cstream_write(dataflow_parent_loop_proc_U0_Cstream_write),
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(dataflow_parent_loop_proc_U0_ap_start),
    .ap_done(dataflow_parent_loop_proc_U0_ap_done),
    .ap_ready(dataflow_parent_loop_proc_U0_ap_ready),
    .ap_idle(dataflow_parent_loop_proc_U0_ap_idle),
    .ap_continue(dataflow_parent_loop_proc_U0_ap_continue)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        loop_dataflow_input_count <= 5'd0;
    end else begin
        if ((~(loop_dataflow_input_count == bound_minus_1) & (ap_start == 1'b1) & (dataflow_parent_loop_proc_U0_ap_ready == 1'b1))) begin
            loop_dataflow_input_count <= (loop_dataflow_input_count + 5'd1);
        end else if (((ap_start == 1'b1) & (dataflow_parent_loop_proc_U0_ap_ready == 1'b1) & (loop_dataflow_input_count == bound_minus_1))) begin
            loop_dataflow_input_count <= 5'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        loop_dataflow_output_count <= 5'd0;
    end else begin
        if ((~(loop_dataflow_output_count == bound_minus_1) & (dataflow_parent_loop_proc_U0_ap_continue == 1'b1) & (dataflow_parent_loop_proc_U0_ap_done == 1'b1))) begin
            loop_dataflow_output_count <= (loop_dataflow_output_count + 5'd1);
        end else if (((dataflow_parent_loop_proc_U0_ap_continue == 1'b1) & (dataflow_parent_loop_proc_U0_ap_done == 1'b1) & (loop_dataflow_output_count == bound_minus_1))) begin
            loop_dataflow_output_count <= 5'd0;
        end
    end
end

always @ (*) begin
    if (((dataflow_parent_loop_proc_U0_ap_done == 1'b1) & (loop_dataflow_output_count == bound_minus_1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (dataflow_parent_loop_proc_U0_ap_idle == 1'b1) & (loop_dataflow_output_count == 5'd0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (dataflow_parent_loop_proc_U0_ap_ready == 1'b1) & (loop_dataflow_input_count == bound_minus_1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~(loop_dataflow_output_count == bound_minus_1) | (ap_continue == 1'b1))) begin
        dataflow_parent_loop_proc_U0_ap_continue = 1'b1;
    end else begin
        dataflow_parent_loop_proc_U0_ap_continue = 1'b0;
    end
end

assign Cstream_din = dataflow_parent_loop_proc_U0_Cstream_din;

assign Cstream_write = dataflow_parent_loop_proc_U0_Cstream_write;

assign bound_minus_1 = (5'd16 - 5'd1);

assign dataflow_parent_loop_proc_U0_ap_start = ap_start;

assign h_fifo_1_read = dataflow_parent_loop_proc_U0_h_fifo_1_read;

assign h_fifo_2_read = dataflow_parent_loop_proc_U0_h_fifo_2_read;

assign h_fifo_3_read = dataflow_parent_loop_proc_U0_h_fifo_3_read;

assign h_fifo_4_read = dataflow_parent_loop_proc_U0_h_fifo_4_read;

assign h_fifo_5_read = dataflow_parent_loop_proc_U0_h_fifo_5_read;

assign h_fifo_read = dataflow_parent_loop_proc_U0_h_fifo_read;

assign v_fifo_1_read = dataflow_parent_loop_proc_U0_v_fifo_1_read;

assign v_fifo_2_read = dataflow_parent_loop_proc_U0_v_fifo_2_read;

assign v_fifo_3_read = dataflow_parent_loop_proc_U0_v_fifo_3_read;

assign v_fifo_4_read = dataflow_parent_loop_proc_U0_v_fifo_4_read;

assign v_fifo_5_read = dataflow_parent_loop_proc_U0_v_fifo_5_read;

assign v_fifo_read = dataflow_parent_loop_proc_U0_v_fifo_read;

endmodule //tiled_mm_tn_loop_proc
