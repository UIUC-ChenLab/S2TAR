-- ==============================================================
-- Generated by Vitis HLS v2023.2.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tiled_mm_PE_H_unsigned_char_384_31 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    return_r : OUT STD_LOGIC_VECTOR (7 downto 0);
    h_fifo_5_2_dout : IN STD_LOGIC_VECTOR (15 downto 0);
    h_fifo_5_2_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
    h_fifo_5_2_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
    h_fifo_5_2_empty_n : IN STD_LOGIC;
    h_fifo_5_2_read : OUT STD_LOGIC;
    v_fifo_5_2_dout : IN STD_LOGIC_VECTOR (15 downto 0);
    v_fifo_5_2_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
    v_fifo_5_2_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
    v_fifo_5_2_empty_n : IN STD_LOGIC;
    v_fifo_5_2_read : OUT STD_LOGIC;
    h_fifo_5_3_din : OUT STD_LOGIC_VECTOR (15 downto 0);
    h_fifo_5_3_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
    h_fifo_5_3_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
    h_fifo_5_3_full_n : IN STD_LOGIC;
    h_fifo_5_3_write : OUT STD_LOGIC );
end;


architecture behav of tiled_mm_PE_H_unsigned_char_384_31 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv9_180 : STD_LOGIC_VECTOR (8 downto 0) := "110000000";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal h_fifo_5_2_blk_n : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal v_fifo_5_2_blk_n : STD_LOGIC;
    signal h_fifo_5_3_blk_n : STD_LOGIC;
    signal ap_block_state3_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal mul_ln41_fu_143_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal mul_ln41_reg_202 : STD_LOGIC_VECTOR (7 downto 0);
    signal mul_ln41_reg_202_pp0_iter2_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal ap_block_state1 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln33_fu_98_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_pp0_exit_iter0_state2 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter4 : STD_LOGIC := '0';
    signal accum_02_fu_50 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    signal accum_fu_152_p2 : STD_LOGIC_VECTOR (7 downto 0);
    attribute use_dsp48 : string;
    attribute use_dsp48 of accum_fu_152_p2 : signal is "no";
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal i_03_fu_54 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    signal i_15_fu_104_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal return_r_preg : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    signal mul_ln41_fu_143_p0 : STD_LOGIC_VECTOR (7 downto 0);
    signal mul_ln41_fu_143_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal accum_fu_152_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_166_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_166_p0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_166_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_166_ce : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state7_blk : STD_LOGIC;
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component tiled_mm_mul_8s_8s_8_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (7 downto 0);
        dout : OUT STD_LOGIC_VECTOR (7 downto 0) );
    end component;


    component tiled_mm_mac_muladd_8s_8s_8ns_8_4_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (7 downto 0);
        din2 : IN STD_LOGIC_VECTOR (7 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (7 downto 0) );
    end component;



begin
    mul_8s_8s_8_1_1_U279 : component tiled_mm_mul_8s_8s_8_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 8,
        din1_WIDTH => 8,
        dout_WIDTH => 8)
    port map (
        din0 => mul_ln41_fu_143_p0,
        din1 => mul_ln41_fu_143_p1,
        dout => mul_ln41_fu_143_p2);

    mac_muladd_8s_8s_8ns_8_4_1_U280 : component tiled_mm_mac_muladd_8s_8s_8ns_8_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 8,
        din1_WIDTH => 8,
        din2_WIDTH => 8,
        dout_WIDTH => 8)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_166_p0,
        din1 => grp_fu_166_p1,
        din2 => mul_ln41_reg_202_pp0_iter2_reg,
        ce => grp_fu_166_ce,
        dout => grp_fu_166_p3);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
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
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state2) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_state1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
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
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then
                    if ((ap_const_logic_1 = ap_condition_pp0_exit_iter0_state2)) then 
                        ap_enable_reg_pp0_iter1 <= (ap_const_logic_1 xor ap_condition_pp0_exit_iter0_state2);
                    elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                        ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                    end if;
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
                elsif (((ap_const_boolean_0 = ap_block_state1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_enable_reg_pp0_iter4 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    return_r_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                return_r_preg <= ap_const_lv8_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
                    return_r_preg <= accum_02_fu_50;
                end if; 
            end if;
        end if;
    end process;


    accum_02_fu_50_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_state1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                accum_02_fu_50 <= ap_const_lv8_0;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1))) then 
                accum_02_fu_50 <= accum_fu_152_p2;
            end if; 
        end if;
    end process;

    i_03_fu_54_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_state1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                i_03_fu_54 <= ap_const_lv9_0;
            elsif (((icmp_ln33_fu_98_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                i_03_fu_54 <= i_15_fu_104_p2;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                mul_ln41_reg_202 <= mul_ln41_fu_143_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                mul_ln41_reg_202_pp0_iter2_reg <= mul_ln41_reg_202;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_CS_fsm_state1, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter0, ap_block_state1, ap_block_pp0_stage0_subdone, icmp_ln33_fu_98_p2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_boolean_0 = ap_block_state1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((icmp_ln33_fu_98_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) and not(((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0))))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif ((((icmp_ln33_fu_98_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0)) or ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0)))) then
                    ap_NS_fsm <= ap_ST_fsm_state7;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    accum_fu_152_p1 <= grp_fu_166_p3;
    accum_fu_152_p2 <= std_logic_vector(unsigned(accum_02_fu_50) + unsigned(accum_fu_152_p1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(1);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state7 <= ap_CS_fsm(2);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_block_state1)
    begin
        if ((ap_const_boolean_1 = ap_block_state1)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state7_blk <= ap_const_logic_0;
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter1, ap_block_state3_pp0_stage0_iter1)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state3_pp0_stage0_iter1));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter1, ap_block_state3_pp0_stage0_iter1)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state3_pp0_stage0_iter1));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter1, ap_block_state3_pp0_stage0_iter1)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state3_pp0_stage0_iter1));
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_block_state3_pp0_stage0_iter1_assign_proc : process(h_fifo_5_2_empty_n, v_fifo_5_2_empty_n, h_fifo_5_3_full_n)
    begin
                ap_block_state3_pp0_stage0_iter1 <= ((h_fifo_5_3_full_n = ap_const_logic_0) or (v_fifo_5_2_empty_n = ap_const_logic_0) or (h_fifo_5_2_empty_n = ap_const_logic_0));
    end process;


    ap_condition_pp0_exit_iter0_state2_assign_proc : process(icmp_ln33_fu_98_p2)
    begin
        if ((icmp_ln33_fu_98_p2 = ap_const_lv1_1)) then 
            ap_condition_pp0_exit_iter0_state2 <= ap_const_logic_1;
        else 
            ap_condition_pp0_exit_iter0_state2 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state7)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state7)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    grp_fu_166_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            grp_fu_166_ce <= ap_const_logic_1;
        else 
            grp_fu_166_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_166_p0 <= v_fifo_5_2_dout(8 - 1 downto 0);
    grp_fu_166_p1 <= h_fifo_5_2_dout(8 - 1 downto 0);

    h_fifo_5_2_blk_n_assign_proc : process(h_fifo_5_2_empty_n, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            h_fifo_5_2_blk_n <= h_fifo_5_2_empty_n;
        else 
            h_fifo_5_2_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    h_fifo_5_2_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            h_fifo_5_2_read <= ap_const_logic_1;
        else 
            h_fifo_5_2_read <= ap_const_logic_0;
        end if; 
    end process;


    h_fifo_5_3_blk_n_assign_proc : process(h_fifo_5_3_full_n, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            h_fifo_5_3_blk_n <= h_fifo_5_3_full_n;
        else 
            h_fifo_5_3_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    h_fifo_5_3_din <= h_fifo_5_2_dout;

    h_fifo_5_3_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            h_fifo_5_3_write <= ap_const_logic_1;
        else 
            h_fifo_5_3_write <= ap_const_logic_0;
        end if; 
    end process;

    i_15_fu_104_p2 <= std_logic_vector(unsigned(i_03_fu_54) + unsigned(ap_const_lv9_1));
    icmp_ln33_fu_98_p2 <= "1" when (i_03_fu_54 = ap_const_lv9_180) else "0";
    mul_ln41_fu_143_p0 <= v_fifo_5_2_dout(15 downto 8);
    mul_ln41_fu_143_p1 <= h_fifo_5_2_dout(15 downto 8);

    return_r_assign_proc : process(accum_02_fu_50, ap_CS_fsm_state7, return_r_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            return_r <= accum_02_fu_50;
        else 
            return_r <= return_r_preg;
        end if; 
    end process;


    v_fifo_5_2_blk_n_assign_proc : process(v_fifo_5_2_empty_n, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            v_fifo_5_2_blk_n <= v_fifo_5_2_empty_n;
        else 
            v_fifo_5_2_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    v_fifo_5_2_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            v_fifo_5_2_read <= ap_const_logic_1;
        else 
            v_fifo_5_2_read <= ap_const_logic_0;
        end if; 
    end process;

end behav;
