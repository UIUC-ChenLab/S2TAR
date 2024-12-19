-- ==============================================================
-- Generated by Vitis HLS v2023.2.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tiled_mm_readB_Pipeline_rb_b_pack is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    m_axi_port_b_AWVALID : OUT STD_LOGIC;
    m_axi_port_b_AWREADY : IN STD_LOGIC;
    m_axi_port_b_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_port_b_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_port_b_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_port_b_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_port_b_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_port_b_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_port_b_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_port_b_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_port_b_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_port_b_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_port_b_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_port_b_WVALID : OUT STD_LOGIC;
    m_axi_port_b_WREADY : IN STD_LOGIC;
    m_axi_port_b_WDATA : OUT STD_LOGIC_VECTOR (7 downto 0);
    m_axi_port_b_WSTRB : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_port_b_WLAST : OUT STD_LOGIC;
    m_axi_port_b_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_port_b_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_port_b_ARVALID : OUT STD_LOGIC;
    m_axi_port_b_ARREADY : IN STD_LOGIC;
    m_axi_port_b_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_port_b_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_port_b_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_port_b_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_port_b_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_port_b_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_port_b_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_port_b_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_port_b_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_port_b_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_port_b_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_port_b_RVALID : IN STD_LOGIC;
    m_axi_port_b_RREADY : OUT STD_LOGIC;
    m_axi_port_b_RDATA : IN STD_LOGIC_VECTOR (7 downto 0);
    m_axi_port_b_RLAST : IN STD_LOGIC;
    m_axi_port_b_RID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_port_b_RFIFONUM : IN STD_LOGIC_VECTOR (10 downto 0);
    m_axi_port_b_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_port_b_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_port_b_BVALID : IN STD_LOGIC;
    m_axi_port_b_BREADY : OUT STD_LOGIC;
    m_axi_port_b_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_port_b_BID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_port_b_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    mul_mid2 : IN STD_LOGIC_VECTOR (9 downto 0);
    b : IN STD_LOGIC_VECTOR (63 downto 0);
    mul9 : IN STD_LOGIC_VECTOR (10 downto 0);
    zext_ln149 : IN STD_LOGIC_VECTOR (6 downto 0);
    b_line_02_out : OUT STD_LOGIC_VECTOR (511 downto 0);
    b_line_02_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of tiled_mm_readB_Pipeline_rb_b_pack is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv512_lc_1 : STD_LOGIC_VECTOR (511 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv7_0 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    constant ap_const_lv7_40 : STD_LOGIC_VECTOR (6 downto 0) := "1000000";
    constant ap_const_lv7_1 : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    constant ap_const_lv10_0 : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
    constant ap_const_lv512_lc_2 : STD_LOGIC_VECTOR (511 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111";
    constant ap_const_lv512_lc_3 : STD_LOGIC_VECTOR (511 downto 0) := "11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter4 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter5 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter6 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter7 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter8 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter9 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter10 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state10_pp0_stage0_iter9 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln152_fu_146_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal port_b_blk_n_AR : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal port_b_blk_n_R : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln152_reg_310 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln152_reg_310_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln152_reg_310_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln152_reg_310_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln152_reg_310_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln152_reg_310_pp0_iter5_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln152_reg_310_pp0_iter6_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln152_reg_310_pp0_iter7_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln152_reg_310_pp0_iter8_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal port_b_addr_reg_314 : STD_LOGIC_VECTOR (63 downto 0);
    signal trunc_ln154_fu_230_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal trunc_ln154_reg_320 : STD_LOGIC_VECTOR (5 downto 0);
    signal trunc_ln154_reg_320_pp0_iter1_reg : STD_LOGIC_VECTOR (5 downto 0);
    signal trunc_ln154_reg_320_pp0_iter2_reg : STD_LOGIC_VECTOR (5 downto 0);
    signal trunc_ln154_reg_320_pp0_iter3_reg : STD_LOGIC_VECTOR (5 downto 0);
    signal trunc_ln154_reg_320_pp0_iter4_reg : STD_LOGIC_VECTOR (5 downto 0);
    signal trunc_ln154_reg_320_pp0_iter5_reg : STD_LOGIC_VECTOR (5 downto 0);
    signal trunc_ln154_reg_320_pp0_iter6_reg : STD_LOGIC_VECTOR (5 downto 0);
    signal trunc_ln154_reg_320_pp0_iter7_reg : STD_LOGIC_VECTOR (5 downto 0);
    signal trunc_ln154_reg_320_pp0_iter8_reg : STD_LOGIC_VECTOR (5 downto 0);
    signal trunc_ln154_reg_320_pp0_iter9_reg : STD_LOGIC_VECTOR (5 downto 0);
    signal port_b_addr_read_reg_325 : STD_LOGIC_VECTOR (7 downto 0);
    signal add_ln154_2_fu_218_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal b_line_02_fu_78 : STD_LOGIC_VECTOR (511 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    signal b_line_fu_280_p2 : STD_LOGIC_VECTOR (511 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal p_fu_82 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    signal p_4_fu_152_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_sig_allocacmp_p_3 : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal zext_ln152_fu_158_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal add_ln154_fu_162_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal shl_ln154_1_fu_168_p3 : STD_LOGIC_VECTOR (19 downto 0);
    signal shl_ln154_2_fu_180_p3 : STD_LOGIC_VECTOR (17 downto 0);
    signal zext_ln154_fu_176_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal zext_ln154_1_fu_188_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal sub_ln154_fu_192_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal sub_ln154_cast_fu_198_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln149_cast_fu_129_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal add_ln154_3_fu_208_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal sext_ln154_fu_214_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln154_1_fu_202_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal shl_ln_fu_242_p3 : STD_LOGIC_VECTOR (8 downto 0);
    signal zext_ln154_2_fu_249_p1 : STD_LOGIC_VECTOR (511 downto 0);
    signal shl_ln154_fu_253_p2 : STD_LOGIC_VECTOR (511 downto 0);
    signal xor_ln154_fu_259_p2 : STD_LOGIC_VECTOR (511 downto 0);
    signal zext_ln154_3_fu_271_p1 : STD_LOGIC_VECTOR (511 downto 0);
    signal and_ln154_fu_265_p2 : STD_LOGIC_VECTOR (511 downto 0);
    signal shl_ln154_3_fu_274_p2 : STD_LOGIC_VECTOR (511 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter3_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter4_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter5_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter6_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter7_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter8_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter9_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component tiled_mm_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    flow_control_loop_pipe_sequential_init_U : component tiled_mm_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_loop_exit_ready_pp0_iter9_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter0_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter10_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter10 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter9;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter4_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter4 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter5_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter5 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter6_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter6 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter7_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter7 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter8_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter8 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter8 <= ap_enable_reg_pp0_iter7;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter9_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter9 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter9 <= ap_enable_reg_pp0_iter8;
                end if; 
            end if;
        end if;
    end process;


    b_line_02_fu_78_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    b_line_02_fu_78 <= ap_const_lv512_lc_1;
                elsif ((ap_enable_reg_pp0_iter10 = ap_const_logic_1)) then 
                    b_line_02_fu_78 <= b_line_fu_280_p2;
                end if;
            end if; 
        end if;
    end process;

    p_fu_82_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (icmp_ln152_fu_146_p2 = ap_const_lv1_0))) then 
                    p_fu_82 <= p_4_fu_152_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    p_fu_82 <= ap_const_lv7_0;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
                icmp_ln152_reg_310 <= icmp_ln152_fu_146_p2;
                icmp_ln152_reg_310_pp0_iter1_reg <= icmp_ln152_reg_310;
                port_b_addr_reg_314 <= add_ln154_2_fu_218_p2;
                trunc_ln154_reg_320 <= trunc_ln154_fu_230_p1;
                trunc_ln154_reg_320_pp0_iter1_reg <= trunc_ln154_reg_320;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
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
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln154_1_fu_202_p2 <= std_logic_vector(signed(sub_ln154_cast_fu_198_p1) + signed(b));
    add_ln154_2_fu_218_p2 <= std_logic_vector(signed(sext_ln154_fu_214_p1) + signed(add_ln154_1_fu_202_p2));
    add_ln154_3_fu_208_p2 <= std_logic_vector(unsigned(mul9) + unsigned(zext_ln149_cast_fu_129_p1));
    add_ln154_fu_162_p2 <= std_logic_vector(unsigned(mul_mid2) + unsigned(zext_ln152_fu_158_p1));
    and_ln154_fu_265_p2 <= (xor_ln154_fu_259_p2 and b_line_02_fu_78);
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter9, ap_block_state10_pp0_stage0_iter9)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state10_pp0_stage0_iter9));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter9, m_axi_port_b_ARREADY, ap_block_state10_pp0_stage0_iter9)
    begin
                ap_block_pp0_stage0_11001 <= (((ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state10_pp0_stage0_iter9)) or ((m_axi_port_b_ARREADY = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter9, m_axi_port_b_ARREADY, ap_block_state10_pp0_stage0_iter9)
    begin
                ap_block_pp0_stage0_subdone <= (((ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state10_pp0_stage0_iter9)) or ((m_axi_port_b_ARREADY = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)));
    end process;


    ap_block_state10_pp0_stage0_iter9_assign_proc : process(m_axi_port_b_RVALID)
    begin
                ap_block_state10_pp0_stage0_iter9 <= (m_axi_port_b_RVALID = ap_const_logic_0);
    end process;


    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln152_fu_146_p2)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln152_fu_146_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter9_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter9_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_start_int = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, ap_enable_reg_pp0_iter5, ap_enable_reg_pp0_iter6, ap_enable_reg_pp0_iter7, ap_enable_reg_pp0_iter8, ap_enable_reg_pp0_iter9, ap_enable_reg_pp0_iter10)
    begin
        if (((ap_enable_reg_pp0_iter10 = ap_const_logic_0) and (ap_enable_reg_pp0_iter9 = ap_const_logic_0) and (ap_enable_reg_pp0_iter8 = ap_const_logic_0) and (ap_enable_reg_pp0_iter7 = ap_const_logic_0) and (ap_enable_reg_pp0_iter6 = ap_const_logic_0) and (ap_enable_reg_pp0_iter5 = ap_const_logic_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_p_3_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, p_fu_82)
    begin
        if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            ap_sig_allocacmp_p_3 <= ap_const_lv7_0;
        else 
            ap_sig_allocacmp_p_3 <= p_fu_82;
        end if; 
    end process;

    b_line_02_out <= b_line_02_fu_78;

    b_line_02_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln152_reg_310_pp0_iter8_reg)
    begin
        if (((icmp_ln152_reg_310_pp0_iter8_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            b_line_02_out_ap_vld <= ap_const_logic_1;
        else 
            b_line_02_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    b_line_fu_280_p2 <= (shl_ln154_3_fu_274_p2 or and_ln154_fu_265_p2);
    icmp_ln152_fu_146_p2 <= "1" when (ap_sig_allocacmp_p_3 = ap_const_lv7_40) else "0";
    m_axi_port_b_ARADDR <= port_b_addr_reg_314;
    m_axi_port_b_ARBURST <= ap_const_lv2_0;
    m_axi_port_b_ARCACHE <= ap_const_lv4_0;
    m_axi_port_b_ARID <= ap_const_lv1_0;
    m_axi_port_b_ARLEN <= ap_const_lv32_1;
    m_axi_port_b_ARLOCK <= ap_const_lv2_0;
    m_axi_port_b_ARPROT <= ap_const_lv3_0;
    m_axi_port_b_ARQOS <= ap_const_lv4_0;
    m_axi_port_b_ARREGION <= ap_const_lv4_0;
    m_axi_port_b_ARSIZE <= ap_const_lv3_0;
    m_axi_port_b_ARUSER <= ap_const_lv1_0;

    m_axi_port_b_ARVALID_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            m_axi_port_b_ARVALID <= ap_const_logic_1;
        else 
            m_axi_port_b_ARVALID <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_port_b_AWADDR <= ap_const_lv64_0;
    m_axi_port_b_AWBURST <= ap_const_lv2_0;
    m_axi_port_b_AWCACHE <= ap_const_lv4_0;
    m_axi_port_b_AWID <= ap_const_lv1_0;
    m_axi_port_b_AWLEN <= ap_const_lv32_0;
    m_axi_port_b_AWLOCK <= ap_const_lv2_0;
    m_axi_port_b_AWPROT <= ap_const_lv3_0;
    m_axi_port_b_AWQOS <= ap_const_lv4_0;
    m_axi_port_b_AWREGION <= ap_const_lv4_0;
    m_axi_port_b_AWSIZE <= ap_const_lv3_0;
    m_axi_port_b_AWUSER <= ap_const_lv1_0;
    m_axi_port_b_AWVALID <= ap_const_logic_0;
    m_axi_port_b_BREADY <= ap_const_logic_0;

    m_axi_port_b_RREADY_assign_proc : process(ap_enable_reg_pp0_iter9, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            m_axi_port_b_RREADY <= ap_const_logic_1;
        else 
            m_axi_port_b_RREADY <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_port_b_WDATA <= ap_const_lv8_0;
    m_axi_port_b_WID <= ap_const_lv1_0;
    m_axi_port_b_WLAST <= ap_const_logic_0;
    m_axi_port_b_WSTRB <= ap_const_lv1_0;
    m_axi_port_b_WUSER <= ap_const_lv1_0;
    m_axi_port_b_WVALID <= ap_const_logic_0;
    p_4_fu_152_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_p_3) + unsigned(ap_const_lv7_1));

    port_b_blk_n_AR_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, m_axi_port_b_ARREADY, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            port_b_blk_n_AR <= m_axi_port_b_ARREADY;
        else 
            port_b_blk_n_AR <= ap_const_logic_1;
        end if; 
    end process;


    port_b_blk_n_R_assign_proc : process(ap_enable_reg_pp0_iter9, m_axi_port_b_RVALID, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            port_b_blk_n_R <= m_axi_port_b_RVALID;
        else 
            port_b_blk_n_R <= ap_const_logic_1;
        end if; 
    end process;

        sext_ln154_fu_214_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(add_ln154_3_fu_208_p2),64));

    shl_ln154_1_fu_168_p3 <= (add_ln154_fu_162_p2 & ap_const_lv10_0);
    shl_ln154_2_fu_180_p3 <= (add_ln154_fu_162_p2 & ap_const_lv8_0);
    shl_ln154_3_fu_274_p2 <= std_logic_vector(shift_left(unsigned(zext_ln154_3_fu_271_p1),to_integer(unsigned('0' & zext_ln154_2_fu_249_p1(31-1 downto 0)))));
    shl_ln154_fu_253_p2 <= std_logic_vector(shift_left(unsigned(ap_const_lv512_lc_2),to_integer(unsigned('0' & zext_ln154_2_fu_249_p1(31-1 downto 0)))));
    shl_ln_fu_242_p3 <= (trunc_ln154_reg_320_pp0_iter9_reg & ap_const_lv3_0);
        sub_ln154_cast_fu_198_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sub_ln154_fu_192_p2),64));

    sub_ln154_fu_192_p2 <= std_logic_vector(unsigned(zext_ln154_fu_176_p1) - unsigned(zext_ln154_1_fu_188_p1));
    trunc_ln154_fu_230_p1 <= ap_sig_allocacmp_p_3(6 - 1 downto 0);
    xor_ln154_fu_259_p2 <= (shl_ln154_fu_253_p2 xor ap_const_lv512_lc_3);
    zext_ln149_cast_fu_129_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(zext_ln149),11));
    zext_ln152_fu_158_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_sig_allocacmp_p_3),10));
    zext_ln154_1_fu_188_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(shl_ln154_2_fu_180_p3),21));
    zext_ln154_2_fu_249_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(shl_ln_fu_242_p3),512));
    zext_ln154_3_fu_271_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(port_b_addr_read_reg_325),512));
    zext_ln154_fu_176_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(shl_ln154_1_fu_168_p3),21));
end behav;