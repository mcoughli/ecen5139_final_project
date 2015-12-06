-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2014.1
-- Copyright (C) 2014 Xilinx Inc. All rights reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity runQueue is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    priorityOut_V : OUT STD_LOGIC_VECTOR (3 downto 0);
    priorityIn_V : IN STD_LOGIC_VECTOR (3 downto 0);
    cmdOut_V : OUT STD_LOGIC_VECTOR (1 downto 0);
    empty : IN STD_LOGIC;
    full : IN STD_LOGIC;
    fullOut : OUT STD_LOGIC;
    iterations : IN STD_LOGIC_VECTOR (31 downto 0);
    iterations_ap_vld : IN STD_LOGIC;
    finished : OUT STD_LOGIC;
    finished_ap_vld : OUT STD_LOGIC;
    ap_return : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of runQueue is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "runQueue,hls_ip_2014_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=5.185000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=0,HLS_SYN_LUT=0}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    constant ap_ST_st2_fsm_1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_ST_st3_fsm_2 : STD_LOGIC_VECTOR (4 downto 0) := "00010";
    constant ap_ST_st4_fsm_3 : STD_LOGIC_VECTOR (4 downto 0) := "00011";
    constant ap_ST_st5_fsm_4 : STD_LOGIC_VECTOR (4 downto 0) := "00100";
    constant ap_ST_st6_fsm_5 : STD_LOGIC_VECTOR (4 downto 0) := "00101";
    constant ap_ST_st7_fsm_6 : STD_LOGIC_VECTOR (4 downto 0) := "00110";
    constant ap_ST_st8_fsm_7 : STD_LOGIC_VECTOR (4 downto 0) := "00111";
    constant ap_ST_st9_fsm_8 : STD_LOGIC_VECTOR (4 downto 0) := "01000";
    constant ap_ST_st10_fsm_9 : STD_LOGIC_VECTOR (4 downto 0) := "01001";
    constant ap_ST_st11_fsm_10 : STD_LOGIC_VECTOR (4 downto 0) := "01010";
    constant ap_ST_st12_fsm_11 : STD_LOGIC_VECTOR (4 downto 0) := "01011";
    constant ap_ST_st13_fsm_12 : STD_LOGIC_VECTOR (4 downto 0) := "01100";
    constant ap_ST_st14_fsm_13 : STD_LOGIC_VECTOR (4 downto 0) := "01101";
    constant ap_ST_st15_fsm_14 : STD_LOGIC_VECTOR (4 downto 0) := "01110";
    constant ap_ST_st16_fsm_15 : STD_LOGIC_VECTOR (4 downto 0) := "01111";
    constant ap_ST_st17_fsm_16 : STD_LOGIC_VECTOR (4 downto 0) := "10000";
    constant ap_ST_st18_fsm_17 : STD_LOGIC_VECTOR (4 downto 0) := "10001";
    constant ap_ST_st19_fsm_18 : STD_LOGIC_VECTOR (4 downto 0) := "10010";
    constant ap_ST_st20_fsm_19 : STD_LOGIC_VECTOR (4 downto 0) := "10011";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv4_5 : STD_LOGIC_VECTOR (3 downto 0) := "0101";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    signal iterations_in_sig : STD_LOGIC_VECTOR (31 downto 0);
    signal iterations_preg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal iterations_ap_vld_in_sig : STD_LOGIC;
    signal iterations_ap_vld_preg : STD_LOGIC := '0';
    signal random_priorities_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal random_priorities_ce0 : STD_LOGIC;
    signal random_priorities_q0 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_sig_bdd_69 : BOOLEAN;
    signal grp_load_fu_329_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal localFull_load_reg_443 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_load_fu_337_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal localEmpty_load_reg_447 : STD_LOGIC_VECTOR (0 downto 0);
    signal result_1_s_fu_356_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_s_fu_362_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal localFull_load_1_reg_465 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_1_fu_368_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_1_reg_472 : STD_LOGIC_VECTOR (31 downto 0);
    signal localEmpty_load_2_reg_482 : STD_LOGIC_VECTOR (0 downto 0);
    signal priorityIn_V_read_1_reg_486 : STD_LOGIC_VECTOR (3 downto 0);
    signal p_result_s_fu_395_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp4_fu_401_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp4_reg_499 : STD_LOGIC_VECTOR (0 downto 0);
    signal j_s_fu_406_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal j_s_reg_503 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_fu_412_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal result_3_reg2mem_reg_260 : STD_LOGIC_VECTOR (0 downto 0);
    signal result_reg2mem_1_reg_165 : STD_LOGIC_VECTOR (0 downto 0);
    signal result_reg2mem_0_ph_reg_273 : STD_LOGIC_VECTOR (0 downto 0);
    signal j_1_reg2mem_1_reg_179 : STD_LOGIC_VECTOR (31 downto 0);
    signal j_1_reg2mem_0_ph_reg_287 : STD_LOGIC_VECTOR (31 downto 0);
    signal op2_assign_reg2mem_reg_193 : STD_LOGIC_VECTOR (31 downto 0);
    signal result_1_reg2mem_reg_204 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_1_reg2mem_reg_214 : STD_LOGIC_VECTOR (31 downto 0);
    signal result_1_reg2mem_1_reg_227 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_3_reg2mem_reg_238 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_result_3_reg2mem_reg_249 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reg2mem_reg_300 : STD_LOGIC_VECTOR (31 downto 0);
    signal result_reg2mem_2_reg_311 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp6_fu_340_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_s_fu_374_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_3_reg2mem_reg_238_temp: signed (32-1 downto 0);
    signal localFull_fu_86 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_read_fu_108_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal localEmpty_fu_90 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_read_fu_123_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal cmdOut_V_preg : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal priorityOut_V_preg : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal tmp_fu_379_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_1_fu_418_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal fullOut_preg : STD_LOGIC := '0';
    signal tmp_3_fu_346_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_4_fu_350_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ult_fu_384_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal rev_fu_389_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_sig_bdd_84 : BOOLEAN;
    signal ap_sig_bdd_204 : BOOLEAN;
    signal ap_sig_bdd_224 : BOOLEAN;

    component runQueue_random_priorities IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (7 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (8 downto 0) );
    end component;



begin
    random_priorities_U : component runQueue_random_priorities
    generic map (
        DataWidth => 9,
        AddressRange => 200,
        AddressWidth => 8)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => random_priorities_address0,
        ce0 => random_priorities_ce0,
        q0 => random_priorities_q0);





    -- the current state (ap_CS_fsm) of the state machine. --
    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_st1_fsm_0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    -- cmdOut_V_preg assign process. --
    cmdOut_V_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                cmdOut_V_preg <= ap_const_lv2_0;
            else
                if ((((ap_ST_st14_fsm_13 = ap_CS_fsm) and (ap_const_lv1_0 = localEmpty_load_2_reg_482) and (grp_load_fu_337_p1 = ap_const_lv1_0)) or ((ap_ST_st5_fsm_4 = ap_CS_fsm) and (grp_load_fu_337_p1 = ap_const_lv1_0)) or ((ap_ST_st7_fsm_6 = ap_CS_fsm) and (localEmpty_load_reg_447 = ap_const_lv1_0) and (grp_load_fu_337_p1 = ap_const_lv1_0)) or ((ap_ST_st12_fsm_11 = ap_CS_fsm) and (grp_load_fu_337_p1 = ap_const_lv1_0)))) then 
                    cmdOut_V_preg <= ap_const_lv2_2;
                elsif ((((ap_ST_st8_fsm_7 = ap_CS_fsm) and (grp_load_fu_329_p1 = ap_const_lv1_0)) or (ap_ST_st11_fsm_10 = ap_CS_fsm) or ((grp_load_fu_329_p1 = ap_const_lv1_0) and (ap_ST_st16_fsm_15 = ap_CS_fsm) and not((localFull_load_reg_443 = ap_const_lv1_0))) or (ap_ST_st3_fsm_2 = ap_CS_fsm) or ((grp_load_fu_329_p1 = ap_const_lv1_0) and (ap_ST_st19_fsm_18 = ap_CS_fsm)))) then 
                    cmdOut_V_preg <= ap_const_lv2_1;
                elsif ((((ap_ST_st1_fsm_0 = ap_CS_fsm) and not(ap_sig_bdd_69)) or (ap_ST_st2_fsm_1 = ap_CS_fsm) or ((ap_ST_st14_fsm_13 = ap_CS_fsm) and (not((ap_const_lv1_0 = localEmpty_load_2_reg_482)) or not((grp_load_fu_337_p1 = ap_const_lv1_0)))) or ((ap_ST_st7_fsm_6 = ap_CS_fsm) and (not((grp_load_fu_337_p1 = ap_const_lv1_0)) or not((localEmpty_load_reg_447 = ap_const_lv1_0)))) or ((ap_ST_st15_fsm_14 = ap_CS_fsm) and not((ap_const_lv1_0 = tmp4_reg_499))) or (ap_ST_st4_fsm_3 = ap_CS_fsm) or ((ap_ST_st10_fsm_9 = ap_CS_fsm) and (not((grp_load_fu_329_p1 = ap_const_lv1_0)) or not((ap_const_lv1_0 = localFull_load_1_reg_465)))))) then 
                    cmdOut_V_preg <= ap_const_lv2_0;
                end if; 
            end if;
        end if;
    end process;


    -- fullOut_preg assign process. --
    fullOut_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                fullOut_preg <= ap_const_logic_0;
            else
                if ((ap_ST_st17_fsm_16 = ap_CS_fsm)) then 
                    fullOut_preg <= grp_read_fu_108_p2(0);
                end if; 
            end if;
        end if;
    end process;


    -- iterations_ap_vld_preg assign process. --
    iterations_ap_vld_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                iterations_ap_vld_preg <= ap_const_logic_0;
            else
                if ((ap_ST_st20_fsm_19 = ap_CS_fsm)) then 
                    iterations_ap_vld_preg <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = iterations_ap_vld) and not(((ap_ST_st1_fsm_0 = ap_CS_fsm) and (ap_const_logic_0 = ap_start))))) then 
                    iterations_ap_vld_preg <= iterations_ap_vld;
                end if; 
            end if;
        end if;
    end process;


    -- iterations_preg assign process. --
    iterations_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                iterations_preg <= ap_const_lv32_0;
            else
                if (((ap_const_logic_1 = iterations_ap_vld) and not(((ap_ST_st1_fsm_0 = ap_CS_fsm) and (ap_const_logic_0 = ap_start))))) then 
                    iterations_preg <= iterations;
                end if; 
            end if;
        end if;
    end process;


    -- priorityOut_V_preg assign process. --
    priorityOut_V_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                priorityOut_V_preg <= ap_const_lv4_0;
            else
                if (((grp_load_fu_329_p1 = ap_const_lv1_0) and (ap_ST_st19_fsm_18 = ap_CS_fsm))) then 
                    priorityOut_V_preg <= tmp_1_fu_418_p1;
                elsif ((ap_ST_st11_fsm_10 = ap_CS_fsm)) then 
                    priorityOut_V_preg <= tmp_fu_379_p1;
                elsif (((ap_ST_st8_fsm_7 = ap_CS_fsm) and (grp_load_fu_329_p1 = ap_const_lv1_0))) then 
                    priorityOut_V_preg <= ap_const_lv4_5;
                elsif ((((grp_load_fu_329_p1 = ap_const_lv1_0) and (ap_ST_st16_fsm_15 = ap_CS_fsm) and not((localFull_load_reg_443 = ap_const_lv1_0))) or (ap_ST_st3_fsm_2 = ap_CS_fsm))) then 
                    priorityOut_V_preg <= ap_const_lv4_0;
                end if; 
            end if;
        end if;
    end process;


    -- i_1_reg2mem_reg_214 assign process. --
    i_1_reg2mem_reg_214_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((grp_load_fu_337_p1 = ap_const_lv1_0)) then
                if (ap_sig_bdd_84) then 
                    i_1_reg2mem_reg_214 <= i_s_fu_362_p2;
                elsif ((ap_ST_st5_fsm_4 = ap_CS_fsm)) then 
                    i_1_reg2mem_reg_214 <= ap_const_lv32_1;
                end if;
            end if; 
        end if;
    end process;

    -- i_3_reg2mem_reg_238 assign process. --
    i_3_reg2mem_reg_238_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st11_fsm_10 = ap_CS_fsm)) then 
                i_3_reg2mem_reg_238 <= i_1_reg_472;
            elsif (((ap_ST_st8_fsm_7 = ap_CS_fsm) and (grp_load_fu_329_p1 = ap_const_lv1_0))) then 
                i_3_reg2mem_reg_238 <= ap_const_lv32_1;
            end if; 
        end if;
    end process;

    -- i_reg2mem_reg_300 assign process. --
    i_reg2mem_reg_300_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_st16_fsm_15 = ap_CS_fsm) and ((grp_load_fu_329_p1 = ap_const_lv1_0) or (localFull_load_reg_443 = ap_const_lv1_0)))) then 
                i_reg2mem_reg_300 <= ap_const_lv32_1;
            elsif (((grp_load_fu_329_p1 = ap_const_lv1_0) and (ap_ST_st19_fsm_18 = ap_CS_fsm))) then 
                i_reg2mem_reg_300 <= i_fu_412_p2;
            end if; 
        end if;
    end process;

    -- j_1_reg2mem_0_ph_reg_287 assign process. --
    j_1_reg2mem_0_ph_reg_287_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st3_fsm_2 = ap_CS_fsm)) then 
                j_1_reg2mem_0_ph_reg_287 <= ap_const_lv32_1;
            elsif (((grp_load_fu_329_p1 = ap_const_lv1_0) and (ap_ST_st16_fsm_15 = ap_CS_fsm) and not((localFull_load_reg_443 = ap_const_lv1_0)))) then 
                j_1_reg2mem_0_ph_reg_287 <= j_s_reg_503;
            end if; 
        end if;
    end process;

    -- j_1_reg2mem_1_reg_179 assign process. --
    j_1_reg2mem_1_reg_179_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (not((grp_load_fu_329_p1 = ap_const_lv1_0))) then
                if ((ap_ST_st19_fsm_18 = ap_CS_fsm)) then 
                    j_1_reg2mem_1_reg_179 <= j_1_reg2mem_0_ph_reg_287;
                elsif ((ap_ST_st2_fsm_1 = ap_CS_fsm)) then 
                    j_1_reg2mem_1_reg_179 <= ap_const_lv32_1;
                elsif (ap_sig_bdd_204) then 
                    j_1_reg2mem_1_reg_179 <= j_s_reg_503;
                end if;
            end if; 
        end if;
    end process;

    -- op2_assign_reg2mem_reg_193 assign process. --
    op2_assign_reg2mem_reg_193_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((grp_load_fu_337_p1 = ap_const_lv1_0)) then
                if (ap_sig_bdd_84) then 
                    op2_assign_reg2mem_reg_193 <= i_1_reg2mem_reg_214;
                elsif ((ap_ST_st5_fsm_4 = ap_CS_fsm)) then 
                    op2_assign_reg2mem_reg_193 <= ap_const_lv32_0;
                end if;
            end if; 
        end if;
    end process;

    -- p_result_3_reg2mem_reg_249 assign process. --
    p_result_3_reg2mem_reg_249_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((grp_load_fu_337_p1 = ap_const_lv1_0)) then
                if (ap_sig_bdd_224) then 
                    p_result_3_reg2mem_reg_249 <= p_result_s_fu_395_p2;
                elsif ((ap_ST_st12_fsm_11 = ap_CS_fsm)) then 
                    p_result_3_reg2mem_reg_249 <= result_1_reg2mem_1_reg_227;
                end if;
            end if; 
        end if;
    end process;

    -- result_1_reg2mem_1_reg_227 assign process. --
    result_1_reg2mem_1_reg_227_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (not((grp_load_fu_337_p1 = ap_const_lv1_0))) then
                if (ap_sig_bdd_84) then 
                    result_1_reg2mem_1_reg_227 <= result_1_s_fu_356_p2;
                elsif ((ap_ST_st5_fsm_4 = ap_CS_fsm)) then 
                    result_1_reg2mem_1_reg_227 <= result_reg2mem_1_reg_165;
                end if;
            end if; 
        end if;
    end process;

    -- result_1_reg2mem_reg_204 assign process. --
    result_1_reg2mem_reg_204_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((grp_load_fu_337_p1 = ap_const_lv1_0)) then
                if (ap_sig_bdd_84) then 
                    result_1_reg2mem_reg_204 <= result_1_s_fu_356_p2;
                elsif ((ap_ST_st5_fsm_4 = ap_CS_fsm)) then 
                    result_1_reg2mem_reg_204 <= result_reg2mem_1_reg_165;
                end if;
            end if; 
        end if;
    end process;

    -- result_3_reg2mem_reg_260 assign process. --
    result_3_reg2mem_reg_260_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (not((grp_load_fu_337_p1 = ap_const_lv1_0))) then
                if (ap_sig_bdd_224) then 
                    result_3_reg2mem_reg_260 <= p_result_3_reg2mem_reg_249;
                elsif ((ap_ST_st12_fsm_11 = ap_CS_fsm)) then 
                    result_3_reg2mem_reg_260 <= result_1_reg2mem_1_reg_227;
                end if;
            end if; 
        end if;
    end process;

    -- result_reg2mem_0_ph_reg_273 assign process. --
    result_reg2mem_0_ph_reg_273_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st3_fsm_2 = ap_CS_fsm)) then 
                result_reg2mem_0_ph_reg_273 <= ap_const_lv1_1;
            elsif (((grp_load_fu_329_p1 = ap_const_lv1_0) and (ap_ST_st16_fsm_15 = ap_CS_fsm) and not((localFull_load_reg_443 = ap_const_lv1_0)))) then 
                result_reg2mem_0_ph_reg_273 <= result_3_reg2mem_reg_260;
            end if; 
        end if;
    end process;

    -- result_reg2mem_1_reg_165 assign process. --
    result_reg2mem_1_reg_165_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (not((grp_load_fu_329_p1 = ap_const_lv1_0))) then
                if ((ap_ST_st19_fsm_18 = ap_CS_fsm)) then 
                    result_reg2mem_1_reg_165 <= result_reg2mem_0_ph_reg_273;
                elsif ((ap_ST_st2_fsm_1 = ap_CS_fsm)) then 
                    result_reg2mem_1_reg_165 <= ap_const_lv1_1;
                elsif (ap_sig_bdd_204) then 
                    result_reg2mem_1_reg_165 <= result_3_reg2mem_reg_260;
                end if;
            end if; 
        end if;
    end process;

    -- result_reg2mem_2_reg_311 assign process. --
    result_reg2mem_2_reg_311_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_st15_fsm_14 = ap_CS_fsm) and (ap_const_lv1_0 = tmp4_reg_499))) then 
                result_reg2mem_2_reg_311 <= result_3_reg2mem_reg_260;
            elsif (((ap_ST_st1_fsm_0 = ap_CS_fsm) and not(ap_sig_bdd_69) and (ap_const_lv1_0 = tmp6_fu_340_p2))) then 
                result_reg2mem_2_reg_311 <= ap_const_lv1_1;
            end if; 
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_st10_fsm_9 = ap_CS_fsm) and (ap_const_lv1_0 = localFull_load_1_reg_465))) then
                i_1_reg_472 <= i_1_fu_368_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st15_fsm_14 = ap_CS_fsm)) then
                j_s_reg_503 <= j_s_fu_406_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_st13_fsm_12 = ap_CS_fsm) or (ap_ST_st4_fsm_3 = ap_CS_fsm) or (ap_ST_st6_fsm_5 = ap_CS_fsm) or ((ap_ST_st10_fsm_9 = ap_CS_fsm) and (not((grp_load_fu_329_p1 = ap_const_lv1_0)) or not((ap_const_lv1_0 = localFull_load_1_reg_465)))))) then
                localEmpty_fu_90 <= grp_read_fu_123_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st12_fsm_11 = ap_CS_fsm)) then
                localEmpty_load_2_reg_482 <= localEmpty_fu_90;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st5_fsm_4 = ap_CS_fsm)) then
                localEmpty_load_reg_447 <= localEmpty_fu_90;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((ap_ST_st1_fsm_0 = ap_CS_fsm) and not(ap_sig_bdd_69) and not((ap_const_lv1_0 = tmp6_fu_340_p2))) or ((ap_ST_st7_fsm_6 = ap_CS_fsm) and (not((grp_load_fu_337_p1 = ap_const_lv1_0)) or not((localEmpty_load_reg_447 = ap_const_lv1_0)))) or (ap_ST_st9_fsm_8 = ap_CS_fsm) or ((ap_ST_st15_fsm_14 = ap_CS_fsm) and not((ap_const_lv1_0 = tmp4_reg_499))) or (ap_ST_st18_fsm_17 = ap_CS_fsm))) then
                localFull_fu_86 <= grp_read_fu_108_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st8_fsm_7 = ap_CS_fsm)) then
                localFull_load_1_reg_465 <= localFull_fu_86;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st2_fsm_1 = ap_CS_fsm)) then
                localFull_load_reg_443 <= localFull_fu_86;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st13_fsm_12 = ap_CS_fsm)) then
                priorityIn_V_read_1_reg_486 <= priorityIn_V;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_st14_fsm_13 = ap_CS_fsm) and (not((ap_const_lv1_0 = localEmpty_load_2_reg_482)) or not((grp_load_fu_337_p1 = ap_const_lv1_0))))) then
                tmp4_reg_499 <= tmp4_fu_401_p2;
            end if;
        end if;
    end process;

    -- the next state (ap_NS_fsm) of the state machine. --
    ap_NS_fsm_assign_proc : process (ap_CS_fsm , ap_sig_bdd_69 , grp_load_fu_329_p1 , localFull_load_reg_443 , grp_load_fu_337_p1 , localEmpty_load_reg_447 , localFull_load_1_reg_465 , localEmpty_load_2_reg_482 , tmp4_reg_499 , tmp6_fu_340_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if ((not(ap_sig_bdd_69) and (ap_const_lv1_0 = tmp6_fu_340_p2))) then
                    ap_NS_fsm <= ap_ST_st20_fsm_19;
                elsif ((not(ap_sig_bdd_69) and not((ap_const_lv1_0 = tmp6_fu_340_p2)))) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_st2_fsm_1 => 
                if (not((grp_load_fu_329_p1 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_st4_fsm_3;
                else
                    ap_NS_fsm <= ap_ST_st3_fsm_2;
                end if;
            when ap_ST_st3_fsm_2 => 
                ap_NS_fsm <= ap_ST_st16_fsm_15;
            when ap_ST_st4_fsm_3 => 
                ap_NS_fsm <= ap_ST_st5_fsm_4;
            when ap_ST_st5_fsm_4 => 
                if ((grp_load_fu_337_p1 = ap_const_lv1_0)) then
                    ap_NS_fsm <= ap_ST_st6_fsm_5;
                else
                    ap_NS_fsm <= ap_ST_st7_fsm_6;
                end if;
            when ap_ST_st6_fsm_5 => 
                ap_NS_fsm <= ap_ST_st7_fsm_6;
            when ap_ST_st7_fsm_6 => 
                if (((localEmpty_load_reg_447 = ap_const_lv1_0) and (grp_load_fu_337_p1 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_st6_fsm_5;
                else
                    ap_NS_fsm <= ap_ST_st8_fsm_7;
                end if;
            when ap_ST_st8_fsm_7 => 
                if ((grp_load_fu_329_p1 = ap_const_lv1_0)) then
                    ap_NS_fsm <= ap_ST_st9_fsm_8;
                else
                    ap_NS_fsm <= ap_ST_st10_fsm_9;
                end if;
            when ap_ST_st9_fsm_8 => 
                ap_NS_fsm <= ap_ST_st10_fsm_9;
            when ap_ST_st10_fsm_9 => 
                if ((not((grp_load_fu_329_p1 = ap_const_lv1_0)) or not((ap_const_lv1_0 = localFull_load_1_reg_465)))) then
                    ap_NS_fsm <= ap_ST_st12_fsm_11;
                else
                    ap_NS_fsm <= ap_ST_st11_fsm_10;
                end if;
            when ap_ST_st11_fsm_10 => 
                ap_NS_fsm <= ap_ST_st9_fsm_8;
            when ap_ST_st12_fsm_11 => 
                if ((grp_load_fu_337_p1 = ap_const_lv1_0)) then
                    ap_NS_fsm <= ap_ST_st13_fsm_12;
                else
                    ap_NS_fsm <= ap_ST_st14_fsm_13;
                end if;
            when ap_ST_st13_fsm_12 => 
                ap_NS_fsm <= ap_ST_st14_fsm_13;
            when ap_ST_st14_fsm_13 => 
                if (((ap_const_lv1_0 = localEmpty_load_2_reg_482) and (grp_load_fu_337_p1 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_st13_fsm_12;
                else
                    ap_NS_fsm <= ap_ST_st15_fsm_14;
                end if;
            when ap_ST_st15_fsm_14 => 
                if ((ap_const_lv1_0 = tmp4_reg_499)) then
                    ap_NS_fsm <= ap_ST_st20_fsm_19;
                else
                    ap_NS_fsm <= ap_ST_st16_fsm_15;
                end if;
            when ap_ST_st16_fsm_15 => 
                if (((grp_load_fu_329_p1 = ap_const_lv1_0) or (localFull_load_reg_443 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_st17_fsm_16;
                else
                    ap_NS_fsm <= ap_ST_st4_fsm_3;
                end if;
            when ap_ST_st17_fsm_16 => 
                ap_NS_fsm <= ap_ST_st18_fsm_17;
            when ap_ST_st18_fsm_17 => 
                ap_NS_fsm <= ap_ST_st19_fsm_18;
            when ap_ST_st19_fsm_18 => 
                if ((grp_load_fu_329_p1 = ap_const_lv1_0)) then
                    ap_NS_fsm <= ap_ST_st17_fsm_16;
                else
                    ap_NS_fsm <= ap_ST_st4_fsm_3;
                end if;
            when ap_ST_st20_fsm_19 => 
                ap_NS_fsm <= ap_ST_st1_fsm_0;
            when others =>  
                ap_NS_fsm <= "XXXXX";
        end case;
    end process;

    -- ap_done assign process. --
    ap_done_assign_proc : process(ap_CS_fsm)
    begin
        if ((ap_ST_st20_fsm_19 = ap_CS_fsm)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_idle assign process. --
    ap_idle_assign_proc : process(ap_start, ap_CS_fsm)
    begin
        if ((not((ap_const_logic_1 = ap_start)) and (ap_ST_st1_fsm_0 = ap_CS_fsm))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_ready assign process. --
    ap_ready_assign_proc : process(ap_CS_fsm)
    begin
        if ((ap_ST_st20_fsm_19 = ap_CS_fsm)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    ap_return <= result_reg2mem_2_reg_311;

    -- ap_sig_bdd_204 assign process. --
    ap_sig_bdd_204_assign_proc : process(ap_CS_fsm, localFull_load_reg_443)
    begin
                ap_sig_bdd_204 <= ((ap_ST_st16_fsm_15 = ap_CS_fsm) and not((localFull_load_reg_443 = ap_const_lv1_0)));
    end process;


    -- ap_sig_bdd_224 assign process. --
    ap_sig_bdd_224_assign_proc : process(ap_CS_fsm, localEmpty_load_2_reg_482)
    begin
                ap_sig_bdd_224 <= ((ap_ST_st14_fsm_13 = ap_CS_fsm) and (ap_const_lv1_0 = localEmpty_load_2_reg_482));
    end process;


    -- ap_sig_bdd_69 assign process. --
    ap_sig_bdd_69_assign_proc : process(ap_start, iterations_ap_vld_in_sig)
    begin
                ap_sig_bdd_69 <= ((iterations_ap_vld_in_sig = ap_const_logic_0) or (ap_start = ap_const_logic_0));
    end process;


    -- ap_sig_bdd_84 assign process. --
    ap_sig_bdd_84_assign_proc : process(ap_CS_fsm, localEmpty_load_reg_447)
    begin
                ap_sig_bdd_84 <= ((ap_ST_st7_fsm_6 = ap_CS_fsm) and (localEmpty_load_reg_447 = ap_const_lv1_0));
    end process;


    -- cmdOut_V assign process. --
    cmdOut_V_assign_proc : process(ap_CS_fsm, ap_sig_bdd_69, grp_load_fu_329_p1, localFull_load_reg_443, grp_load_fu_337_p1, localEmpty_load_reg_447, localFull_load_1_reg_465, localEmpty_load_2_reg_482, tmp4_reg_499, cmdOut_V_preg)
    begin
        if ((((ap_ST_st14_fsm_13 = ap_CS_fsm) and (ap_const_lv1_0 = localEmpty_load_2_reg_482) and (grp_load_fu_337_p1 = ap_const_lv1_0)) or ((ap_ST_st5_fsm_4 = ap_CS_fsm) and (grp_load_fu_337_p1 = ap_const_lv1_0)) or ((ap_ST_st7_fsm_6 = ap_CS_fsm) and (localEmpty_load_reg_447 = ap_const_lv1_0) and (grp_load_fu_337_p1 = ap_const_lv1_0)) or ((ap_ST_st12_fsm_11 = ap_CS_fsm) and (grp_load_fu_337_p1 = ap_const_lv1_0)))) then 
            cmdOut_V <= ap_const_lv2_2;
        elsif ((((ap_ST_st8_fsm_7 = ap_CS_fsm) and (grp_load_fu_329_p1 = ap_const_lv1_0)) or (ap_ST_st11_fsm_10 = ap_CS_fsm) or ((grp_load_fu_329_p1 = ap_const_lv1_0) and (ap_ST_st16_fsm_15 = ap_CS_fsm) and not((localFull_load_reg_443 = ap_const_lv1_0))) or (ap_ST_st3_fsm_2 = ap_CS_fsm) or ((grp_load_fu_329_p1 = ap_const_lv1_0) and (ap_ST_st19_fsm_18 = ap_CS_fsm)))) then 
            cmdOut_V <= ap_const_lv2_1;
        elsif ((((ap_ST_st1_fsm_0 = ap_CS_fsm) and not(ap_sig_bdd_69)) or (ap_ST_st2_fsm_1 = ap_CS_fsm) or ((ap_ST_st14_fsm_13 = ap_CS_fsm) and (not((ap_const_lv1_0 = localEmpty_load_2_reg_482)) or not((grp_load_fu_337_p1 = ap_const_lv1_0)))) or ((ap_ST_st7_fsm_6 = ap_CS_fsm) and (not((grp_load_fu_337_p1 = ap_const_lv1_0)) or not((localEmpty_load_reg_447 = ap_const_lv1_0)))) or ((ap_ST_st15_fsm_14 = ap_CS_fsm) and not((ap_const_lv1_0 = tmp4_reg_499))) or (ap_ST_st4_fsm_3 = ap_CS_fsm) or ((ap_ST_st10_fsm_9 = ap_CS_fsm) and (not((grp_load_fu_329_p1 = ap_const_lv1_0)) or not((ap_const_lv1_0 = localFull_load_1_reg_465)))))) then 
            cmdOut_V <= ap_const_lv2_0;
        else 
            cmdOut_V <= cmdOut_V_preg;
        end if; 
    end process;

    finished <= ap_const_logic_1;

    -- finished_ap_vld assign process. --
    finished_ap_vld_assign_proc : process(ap_CS_fsm)
    begin
        if ((ap_ST_st20_fsm_19 = ap_CS_fsm)) then 
            finished_ap_vld <= ap_const_logic_1;
        else 
            finished_ap_vld <= ap_const_logic_0;
        end if; 
    end process;


    -- fullOut assign process. --
    fullOut_assign_proc : process(ap_CS_fsm, full, fullOut_preg)
    begin
        if ((ap_ST_st17_fsm_16 = ap_CS_fsm)) then 
            fullOut <= full;
        else 
            fullOut <= fullOut_preg;
        end if; 
    end process;

    grp_load_fu_329_p1 <= localFull_fu_86;
    grp_load_fu_337_p1 <= localEmpty_fu_90;
    grp_read_fu_108_p2 <= (0=>full, others=>'-');
    grp_read_fu_123_p2 <= (0=>empty, others=>'-');
    i_1_fu_368_p2 <= std_logic_vector(unsigned(i_3_reg2mem_reg_238) + unsigned(ap_const_lv32_1));
    i_fu_412_p2 <= std_logic_vector(unsigned(i_reg2mem_reg_300) + unsigned(ap_const_lv32_1));
    i_s_fu_362_p2 <= std_logic_vector(unsigned(i_1_reg2mem_reg_214) + unsigned(ap_const_lv32_1));

    -- iterations_ap_vld_in_sig assign process. --
    iterations_ap_vld_in_sig_assign_proc : process(iterations_ap_vld, iterations_ap_vld_preg)
    begin
        if ((ap_const_logic_1 = iterations_ap_vld)) then 
            iterations_ap_vld_in_sig <= iterations_ap_vld;
        else 
            iterations_ap_vld_in_sig <= iterations_ap_vld_preg;
        end if; 
    end process;


    -- iterations_in_sig assign process. --
    iterations_in_sig_assign_proc : process(iterations, iterations_preg, iterations_ap_vld)
    begin
        if ((ap_const_logic_1 = iterations_ap_vld)) then 
            iterations_in_sig <= iterations;
        else 
            iterations_in_sig <= iterations_preg;
        end if; 
    end process;

    j_s_fu_406_p2 <= std_logic_vector(unsigned(j_1_reg2mem_1_reg_179) + unsigned(ap_const_lv32_1));
    p_result_s_fu_395_p2 <= (rev_fu_389_p2 and p_result_3_reg2mem_reg_249);

    -- priorityOut_V assign process. --
    priorityOut_V_assign_proc : process(ap_CS_fsm, grp_load_fu_329_p1, localFull_load_reg_443, priorityOut_V_preg, tmp_fu_379_p1, tmp_1_fu_418_p1)
    begin
        if (((grp_load_fu_329_p1 = ap_const_lv1_0) and (ap_ST_st19_fsm_18 = ap_CS_fsm))) then 
            priorityOut_V <= tmp_1_fu_418_p1;
        elsif ((ap_ST_st11_fsm_10 = ap_CS_fsm)) then 
            priorityOut_V <= tmp_fu_379_p1;
        elsif (((ap_ST_st8_fsm_7 = ap_CS_fsm) and (grp_load_fu_329_p1 = ap_const_lv1_0))) then 
            priorityOut_V <= ap_const_lv4_5;
        elsif ((((grp_load_fu_329_p1 = ap_const_lv1_0) and (ap_ST_st16_fsm_15 = ap_CS_fsm) and not((localFull_load_reg_443 = ap_const_lv1_0))) or (ap_ST_st3_fsm_2 = ap_CS_fsm))) then 
            priorityOut_V <= ap_const_lv4_0;
        else 
            priorityOut_V <= priorityOut_V_preg;
        end if; 
    end process;

    random_priorities_address0 <= tmp_s_fu_374_p1(8 - 1 downto 0);

    -- random_priorities_ce0 assign process. --
    random_priorities_ce0_assign_proc : process(ap_CS_fsm)
    begin
        if ((ap_ST_st10_fsm_9 = ap_CS_fsm)) then 
            random_priorities_ce0 <= ap_const_logic_1;
        else 
            random_priorities_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    result_1_s_fu_356_p2 <= (tmp_4_fu_350_p2 and result_1_reg2mem_reg_204);
    rev_fu_389_p2 <= (ult_fu_384_p2 xor ap_const_lv1_1);
    tmp4_fu_401_p2 <= "1" when (signed(j_1_reg2mem_1_reg_179) < signed(iterations_in_sig)) else "0";
    tmp6_fu_340_p2 <= "1" when (signed(iterations_in_sig) > signed(ap_const_lv32_0)) else "0";
    tmp_1_fu_418_p1 <= i_reg2mem_reg_300(4 - 1 downto 0);
    tmp_3_fu_346_p1 <= std_logic_vector(resize(unsigned(priorityIn_V),32));
    tmp_4_fu_350_p2 <= "1" when (tmp_3_fu_346_p1 = op2_assign_reg2mem_reg_193) else "0";
    tmp_fu_379_p1 <= random_priorities_q0(4 - 1 downto 0);
    
    i_3_reg2mem_reg_238_temp <= signed(i_3_reg2mem_reg_238);
    tmp_s_fu_374_p1 <= std_logic_vector(resize(i_3_reg2mem_reg_238_temp,64));

    ult_fu_384_p2 <= "1" when (unsigned(priorityIn_V) < unsigned(priorityIn_V_read_1_reg_486)) else "0";
end behav;
