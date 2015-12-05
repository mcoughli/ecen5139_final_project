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
    ap_return : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of runQueue is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "runQueue,hls_ip_2014_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.640000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=0,HLS_SYN_LUT=0}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_ST_st2_fsm_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_st3_fsm_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv14_0 : STD_LOGIC_VECTOR (13 downto 0) := "00000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv14_2710 : STD_LOGIC_VECTOR (13 downto 0) := "10011100010000";
    constant ap_const_lv14_1 : STD_LOGIC_VECTOR (13 downto 0) := "00000000000001";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal i_1_fu_84_p2 : STD_LOGIC_VECTOR (13 downto 0);
    signal i_1_reg_99 : STD_LOGIC_VECTOR (13 downto 0);
    signal result_1_fu_90_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_runTest_fu_66_ap_done : STD_LOGIC;
    signal grp_runTest_fu_66_ap_start : STD_LOGIC;
    signal grp_runTest_fu_66_ap_idle : STD_LOGIC;
    signal grp_runTest_fu_66_ap_ready : STD_LOGIC;
    signal grp_runTest_fu_66_ap_return : STD_LOGIC_VECTOR (0 downto 0);
    signal result_reg_42 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reg_54 : STD_LOGIC_VECTOR (13 downto 0);
    signal grp_runTest_fu_66_ap_start_ap_start_reg : STD_LOGIC := '0';
    signal exitcond_fu_78_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);

    component runTest IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_return : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;



begin
    grp_runTest_fu_66 : component runTest
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_runTest_fu_66_ap_start,
        ap_done => grp_runTest_fu_66_ap_done,
        ap_idle => grp_runTest_fu_66_ap_idle,
        ap_ready => grp_runTest_fu_66_ap_ready,
        ap_return => grp_runTest_fu_66_ap_return);





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


    -- grp_runTest_fu_66_ap_start_ap_start_reg assign process. --
    grp_runTest_fu_66_ap_start_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_runTest_fu_66_ap_start_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_ST_st2_fsm_1 = ap_CS_fsm) and (exitcond_fu_78_p2 = ap_const_lv1_0))) then 
                    grp_runTest_fu_66_ap_start_ap_start_reg <= ap_const_logic_1;
                elsif ((ap_const_logic_1 = grp_runTest_fu_66_ap_ready)) then 
                    grp_runTest_fu_66_ap_start_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    -- i_reg_54 assign process. --
    i_reg_54_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_st3_fsm_2 = ap_CS_fsm) and not((ap_const_logic_0 = grp_runTest_fu_66_ap_done)))) then 
                i_reg_54 <= i_1_reg_99;
            elsif (((ap_ST_st1_fsm_0 = ap_CS_fsm) and not((ap_start = ap_const_logic_0)))) then 
                i_reg_54 <= ap_const_lv14_0;
            end if; 
        end if;
    end process;

    -- result_reg_42 assign process. --
    result_reg_42_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_st3_fsm_2 = ap_CS_fsm) and not((ap_const_logic_0 = grp_runTest_fu_66_ap_done)))) then 
                result_reg_42 <= result_1_fu_90_p2;
            elsif (((ap_ST_st1_fsm_0 = ap_CS_fsm) and not((ap_start = ap_const_logic_0)))) then 
                result_reg_42 <= ap_const_lv1_1;
            end if; 
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st2_fsm_1 = ap_CS_fsm)) then
                i_1_reg_99 <= i_1_fu_84_p2;
            end if;
        end if;
    end process;

    -- the next state (ap_NS_fsm) of the state machine. --
    ap_NS_fsm_assign_proc : process (ap_start , ap_CS_fsm , grp_runTest_fu_66_ap_done , exitcond_fu_78_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if (not((ap_start = ap_const_logic_0))) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_st2_fsm_1 => 
                if (not((exitcond_fu_78_p2 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                else
                    ap_NS_fsm <= ap_ST_st3_fsm_2;
                end if;
            when ap_ST_st3_fsm_2 => 
                if (not((ap_const_logic_0 = grp_runTest_fu_66_ap_done))) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st3_fsm_2;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;

    -- ap_done assign process. --
    ap_done_assign_proc : process(ap_CS_fsm, exitcond_fu_78_p2)
    begin
        if (((ap_ST_st2_fsm_1 = ap_CS_fsm) and not((exitcond_fu_78_p2 = ap_const_lv1_0)))) then 
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
    ap_ready_assign_proc : process(ap_CS_fsm, exitcond_fu_78_p2)
    begin
        if (((ap_ST_st2_fsm_1 = ap_CS_fsm) and not((exitcond_fu_78_p2 = ap_const_lv1_0)))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    ap_return <= result_reg_42;
    exitcond_fu_78_p2 <= "1" when (i_reg_54 = ap_const_lv14_2710) else "0";
    grp_runTest_fu_66_ap_start <= grp_runTest_fu_66_ap_start_ap_start_reg;
    i_1_fu_84_p2 <= std_logic_vector(unsigned(i_reg_54) + unsigned(ap_const_lv14_1));
    result_1_fu_90_p2 <= (grp_runTest_fu_66_ap_return and result_reg_42);
end behav;