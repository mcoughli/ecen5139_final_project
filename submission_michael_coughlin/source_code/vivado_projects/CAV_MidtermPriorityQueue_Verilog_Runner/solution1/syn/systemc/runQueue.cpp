// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2014.1
// Copyright (C) 2014 Xilinx Inc. All rights reserved.
// 
// ===========================================================

#include "runQueue.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

const sc_logic runQueue::ap_const_logic_1 = sc_dt::Log_1;
const sc_logic runQueue::ap_const_logic_0 = sc_dt::Log_0;
const sc_lv<5> runQueue::ap_ST_st1_fsm_0 = "00000";
const sc_lv<5> runQueue::ap_ST_st2_fsm_1 = "1";
const sc_lv<5> runQueue::ap_ST_st3_fsm_2 = "10";
const sc_lv<5> runQueue::ap_ST_st4_fsm_3 = "11";
const sc_lv<5> runQueue::ap_ST_st5_fsm_4 = "100";
const sc_lv<5> runQueue::ap_ST_st6_fsm_5 = "101";
const sc_lv<5> runQueue::ap_ST_st7_fsm_6 = "110";
const sc_lv<5> runQueue::ap_ST_st8_fsm_7 = "111";
const sc_lv<5> runQueue::ap_ST_st9_fsm_8 = "1000";
const sc_lv<5> runQueue::ap_ST_st10_fsm_9 = "1001";
const sc_lv<5> runQueue::ap_ST_st11_fsm_10 = "1010";
const sc_lv<5> runQueue::ap_ST_st12_fsm_11 = "1011";
const sc_lv<5> runQueue::ap_ST_st13_fsm_12 = "1100";
const sc_lv<5> runQueue::ap_ST_st14_fsm_13 = "1101";
const sc_lv<5> runQueue::ap_ST_st15_fsm_14 = "1110";
const sc_lv<5> runQueue::ap_ST_st16_fsm_15 = "1111";
const sc_lv<5> runQueue::ap_ST_st17_fsm_16 = "10000";
const sc_lv<5> runQueue::ap_ST_st18_fsm_17 = "10001";
const sc_lv<5> runQueue::ap_ST_st19_fsm_18 = "10010";
const sc_lv<5> runQueue::ap_ST_st20_fsm_19 = "10011";
const sc_lv<5> runQueue::ap_ST_st21_fsm_20 = "10100";
const sc_lv<5> runQueue::ap_ST_st22_fsm_21 = "10101";
const sc_lv<5> runQueue::ap_ST_st23_fsm_22 = "10110";
const sc_lv<5> runQueue::ap_ST_st24_fsm_23 = "10111";
const sc_lv<5> runQueue::ap_ST_st25_fsm_24 = "11000";
const sc_lv<5> runQueue::ap_ST_st26_fsm_25 = "11001";
const sc_lv<5> runQueue::ap_ST_st27_fsm_26 = "11010";
const sc_lv<5> runQueue::ap_ST_st28_fsm_27 = "11011";
const sc_lv<32> runQueue::ap_const_lv32_0 = "00000000000000000000000000000000";
const sc_lv<1> runQueue::ap_const_lv1_0 = "0";
const sc_lv<8> runQueue::ap_const_lv8_0 = "00000000";
const sc_lv<2> runQueue::ap_const_lv2_0 = "00";
const sc_lv<2> runQueue::ap_const_lv2_1 = "1";
const sc_lv<2> runQueue::ap_const_lv2_2 = "10";
const sc_lv<1> runQueue::ap_const_lv1_1 = "1";
const sc_lv<32> runQueue::ap_const_lv32_1 = "1";

runQueue::runQueue(sc_module_name name) : sc_module(name), mVcdFile(0) {
    random_priorities_U = new runQueue_random_priorities("random_priorities_U");
    random_priorities_U->clk(ap_clk);
    random_priorities_U->reset(ap_rst);
    random_priorities_U->address0(random_priorities_address0);
    random_priorities_U->ce0(random_priorities_ce0);
    random_priorities_U->q0(random_priorities_q0);

    SC_METHOD(thread_ap_clk_no_reset_);
    dont_initialize();
    sensitive << ( ap_clk.pos() );

    SC_METHOD(thread_ap_done);
    sensitive << ( ap_CS_fsm );
    sensitive << ( tmp_fu_325_p2 );

    SC_METHOD(thread_ap_idle);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_ready);
    sensitive << ( ap_CS_fsm );
    sensitive << ( tmp_fu_325_p2 );

    SC_METHOD(thread_ap_return);
    sensitive << ( ap_CS_fsm );
    sensitive << ( result_reg_193 );
    sensitive << ( tmp_fu_325_p2 );

    SC_METHOD(thread_ap_sig_bdd_79);
    sensitive << ( ap_start );
    sensitive << ( iterations_ap_vld_in_sig );

    SC_METHOD(thread_cmdOut_V);
    sensitive << ( ap_CS_fsm );
    sensitive << ( ap_sig_bdd_79 );
    sensitive << ( grp_load_fu_309_p1 );
    sensitive << ( tmp_fu_325_p2 );
    sensitive << ( grp_load_fu_317_p1 );
    sensitive << ( cmdOut_V_preg );

    SC_METHOD(thread_count_1_fu_346_p2);
    sensitive << ( count_fu_86 );

    SC_METHOD(thread_currentIteration);
    sensitive << ( ap_CS_fsm );
    sensitive << ( j_reg_181 );
    sensitive << ( tmp_fu_325_p2 );
    sensitive << ( currentIteration_preg );

    SC_METHOD(thread_finished);
    sensitive << ( ap_CS_fsm );
    sensitive << ( tmp_fu_325_p2 );

    SC_METHOD(thread_finished_ap_vld);
    sensitive << ( ap_CS_fsm );
    sensitive << ( tmp_fu_325_p2 );

    SC_METHOD(thread_fullOut);
    sensitive << ( ap_CS_fsm );
    sensitive << ( full );
    sensitive << ( fullOut_preg );

    SC_METHOD(thread_grp_load_fu_309_p1);
    sensitive << ( ap_CS_fsm );
    sensitive << ( localFull_fu_90 );

    SC_METHOD(thread_grp_load_fu_317_p1);
    sensitive << ( ap_CS_fsm );
    sensitive << ( localEmpty_fu_94 );

    SC_METHOD(thread_grp_read_fu_119_p2);
    sensitive << ( ap_CS_fsm );
    sensitive << ( full );
    sensitive << ( tmp_fu_325_p2 );
    sensitive << ( grp_load_fu_317_p1 );

    SC_METHOD(thread_grp_read_fu_141_p2);
    sensitive << ( ap_CS_fsm );
    sensitive << ( empty );
    sensitive << ( grp_load_fu_309_p1 );

    SC_METHOD(thread_i_1_fu_383_p2);
    sensitive << ( i_2_reg_251 );

    SC_METHOD(thread_i_3_fu_357_p2);
    sensitive << ( op2_assign_reg_216 );

    SC_METHOD(thread_i_fu_336_p2);
    sensitive << ( val_assign_reg_205 );

    SC_METHOD(thread_iterations_ap_vld_in_sig);
    sensitive << ( iterations_ap_vld );
    sensitive << ( iterations_ap_vld_preg );

    SC_METHOD(thread_iterations_in_sig);
    sensitive << ( iterations );
    sensitive << ( iterations_preg );
    sensitive << ( iterations_ap_vld );

    SC_METHOD(thread_j_1_fu_330_p2);
    sensitive << ( j_reg_181 );

    SC_METHOD(thread_priorityOut_V);
    sensitive << ( ap_CS_fsm );
    sensitive << ( tmp_1_reg_455 );
    sensitive << ( priorityOut_V_preg );
    sensitive << ( tmp_9_fu_394_p1 );

    SC_METHOD(thread_random_priorities_address0);
    sensitive << ( ap_CS_fsm );
    sensitive << ( tmp_7_fu_389_p1 );

    SC_METHOD(thread_random_priorities_ce0);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_result_5_fu_377_p2);
    sensitive << ( result_1_reg_228 );
    sensitive << ( tmp_5_fu_373_p1 );

    SC_METHOD(thread_result_6_fu_409_p2);
    sensitive << ( result_3_reg_275 );
    sensitive << ( tmp_6_fu_405_p1 );

    SC_METHOD(thread_tmp_1_fu_342_p1);
    sensitive << ( val_assign_reg_205 );

    SC_METHOD(thread_tmp_2_fu_399_p2);
    sensitive << ( ap_CS_fsm );
    sensitive << ( priorityIn_V );
    sensitive << ( last_reg_263 );

    SC_METHOD(thread_tmp_3_fu_363_p1);
    sensitive << ( priorityIn_V );

    SC_METHOD(thread_tmp_4_fu_367_p2);
    sensitive << ( ap_CS_fsm );
    sensitive << ( op2_assign_reg_216 );
    sensitive << ( tmp_3_fu_363_p1 );

    SC_METHOD(thread_tmp_5_fu_373_p1);
    sensitive << ( priorityIn_V );

    SC_METHOD(thread_tmp_6_fu_405_p1);
    sensitive << ( priorityIn_V );

    SC_METHOD(thread_tmp_7_fu_389_p1);
    sensitive << ( i_2_reg_251 );

    SC_METHOD(thread_tmp_9_fu_394_p1);
    sensitive << ( random_priorities_q0 );

    SC_METHOD(thread_tmp_fu_325_p2);
    sensitive << ( ap_CS_fsm );
    sensitive << ( iterations_in_sig );
    sensitive << ( j_reg_181 );

    SC_METHOD(thread_total);
    sensitive << ( ap_CS_fsm );
    sensitive << ( count_fu_86 );
    sensitive << ( tmp_fu_325_p2 );
    sensitive << ( total_preg );

    SC_METHOD(thread_ap_NS_fsm);
    sensitive << ( ap_CS_fsm );
    sensitive << ( ap_sig_bdd_79 );
    sensitive << ( grp_load_fu_309_p1 );
    sensitive << ( tmp_2_fu_399_p2 );
    sensitive << ( tmp_fu_325_p2 );
    sensitive << ( grp_load_fu_317_p1 );

    SC_THREAD(thread_hdltv_gen);
    sensitive << ( ap_clk.pos() );

    ap_CS_fsm = "00000";
    iterations_preg = "00000000000000000000000000000000";
    iterations_ap_vld_preg = SC_LOGIC_0;
    cmdOut_V_preg = "00";
    currentIteration_preg = "00000000000000000000000000000000";
    total_preg = "00000000000000000000000000000000";
    priorityOut_V_preg = "00000000";
    fullOut_preg = SC_LOGIC_0;
    static int apTFileNum = 0;
    stringstream apTFilenSS;
    apTFilenSS << "runQueue_sc_trace_" << apTFileNum ++;
    string apTFn = apTFilenSS.str();
    mVcdFile = sc_create_vcd_trace_file(apTFn.c_str());
    mVcdFile->set_time_unit(1, SC_PS);
    if (1) {
#ifdef __HLS_TRACE_LEVEL_PORT__
    sc_trace(mVcdFile, ap_clk, "(port)ap_clk");
    sc_trace(mVcdFile, ap_rst, "(port)ap_rst");
    sc_trace(mVcdFile, ap_start, "(port)ap_start");
    sc_trace(mVcdFile, ap_done, "(port)ap_done");
    sc_trace(mVcdFile, ap_idle, "(port)ap_idle");
    sc_trace(mVcdFile, ap_ready, "(port)ap_ready");
    sc_trace(mVcdFile, priorityOut_V, "(port)priorityOut_V");
    sc_trace(mVcdFile, priorityIn_V, "(port)priorityIn_V");
    sc_trace(mVcdFile, cmdOut_V, "(port)cmdOut_V");
    sc_trace(mVcdFile, empty, "(port)empty");
    sc_trace(mVcdFile, full, "(port)full");
    sc_trace(mVcdFile, fullOut, "(port)fullOut");
    sc_trace(mVcdFile, iterations, "(port)iterations");
    sc_trace(mVcdFile, iterations_ap_vld, "(port)iterations_ap_vld");
    sc_trace(mVcdFile, finished, "(port)finished");
    sc_trace(mVcdFile, finished_ap_vld, "(port)finished_ap_vld");
    sc_trace(mVcdFile, currentIteration, "(port)currentIteration");
    sc_trace(mVcdFile, total, "(port)total");
    sc_trace(mVcdFile, ap_return, "(port)ap_return");
#endif
#ifdef __HLS_TRACE_LEVEL_INT__
    sc_trace(mVcdFile, ap_CS_fsm, "ap_CS_fsm");
    sc_trace(mVcdFile, iterations_in_sig, "iterations_in_sig");
    sc_trace(mVcdFile, iterations_preg, "iterations_preg");
    sc_trace(mVcdFile, iterations_ap_vld_in_sig, "iterations_ap_vld_in_sig");
    sc_trace(mVcdFile, iterations_ap_vld_preg, "iterations_ap_vld_preg");
    sc_trace(mVcdFile, random_priorities_address0, "random_priorities_address0");
    sc_trace(mVcdFile, random_priorities_ce0, "random_priorities_ce0");
    sc_trace(mVcdFile, random_priorities_q0, "random_priorities_q0");
    sc_trace(mVcdFile, ap_sig_bdd_79, "ap_sig_bdd_79");
    sc_trace(mVcdFile, j_1_fu_330_p2, "j_1_fu_330_p2");
    sc_trace(mVcdFile, j_1_reg_442, "j_1_reg_442");
    sc_trace(mVcdFile, i_fu_336_p2, "i_fu_336_p2");
    sc_trace(mVcdFile, i_reg_450, "i_reg_450");
    sc_trace(mVcdFile, tmp_1_fu_342_p1, "tmp_1_fu_342_p1");
    sc_trace(mVcdFile, tmp_1_reg_455, "tmp_1_reg_455");
    sc_trace(mVcdFile, grp_load_fu_309_p1, "grp_load_fu_309_p1");
    sc_trace(mVcdFile, i_3_fu_357_p2, "i_3_fu_357_p2");
    sc_trace(mVcdFile, i_3_reg_463, "i_3_reg_463");
    sc_trace(mVcdFile, tmp_4_fu_367_p2, "tmp_4_fu_367_p2");
    sc_trace(mVcdFile, tmp_4_reg_468, "tmp_4_reg_468");
    sc_trace(mVcdFile, result_5_fu_377_p2, "result_5_fu_377_p2");
    sc_trace(mVcdFile, i_1_fu_383_p2, "i_1_fu_383_p2");
    sc_trace(mVcdFile, i_1_reg_480, "i_1_reg_480");
    sc_trace(mVcdFile, result_6_fu_409_p2, "result_6_fu_409_p2");
    sc_trace(mVcdFile, priorityIn_V_read_4_reg_501, "priorityIn_V_read_4_reg_501");
    sc_trace(mVcdFile, j_reg_181, "j_reg_181");
    sc_trace(mVcdFile, result_reg_193, "result_reg_193");
    sc_trace(mVcdFile, result_3_reg_275, "result_3_reg_275");
    sc_trace(mVcdFile, val_assign_reg_205, "val_assign_reg_205");
    sc_trace(mVcdFile, op2_assign_reg_216, "op2_assign_reg_216");
    sc_trace(mVcdFile, result_1_reg_228, "result_1_reg_228");
    sc_trace(mVcdFile, result_2_reg_239, "result_2_reg_239");
    sc_trace(mVcdFile, i_2_reg_251, "i_2_reg_251");
    sc_trace(mVcdFile, last_reg_263, "last_reg_263");
    sc_trace(mVcdFile, result_4_reg_287, "result_4_reg_287");
    sc_trace(mVcdFile, tmp_2_fu_399_p2, "tmp_2_fu_399_p2");
    sc_trace(mVcdFile, tmp_7_fu_389_p1, "tmp_7_fu_389_p1");
    sc_trace(mVcdFile, count_fu_86, "count_fu_86");
    sc_trace(mVcdFile, count_1_fu_346_p2, "count_1_fu_346_p2");
    sc_trace(mVcdFile, tmp_fu_325_p2, "tmp_fu_325_p2");
    sc_trace(mVcdFile, localFull_fu_90, "localFull_fu_90");
    sc_trace(mVcdFile, grp_read_fu_119_p2, "grp_read_fu_119_p2");
    sc_trace(mVcdFile, grp_load_fu_317_p1, "grp_load_fu_317_p1");
    sc_trace(mVcdFile, localEmpty_fu_94, "localEmpty_fu_94");
    sc_trace(mVcdFile, grp_read_fu_141_p2, "grp_read_fu_141_p2");
    sc_trace(mVcdFile, cmdOut_V_preg, "cmdOut_V_preg");
    sc_trace(mVcdFile, currentIteration_preg, "currentIteration_preg");
    sc_trace(mVcdFile, total_preg, "total_preg");
    sc_trace(mVcdFile, priorityOut_V_preg, "priorityOut_V_preg");
    sc_trace(mVcdFile, tmp_9_fu_394_p1, "tmp_9_fu_394_p1");
    sc_trace(mVcdFile, fullOut_preg, "fullOut_preg");
    sc_trace(mVcdFile, tmp_3_fu_363_p1, "tmp_3_fu_363_p1");
    sc_trace(mVcdFile, tmp_5_fu_373_p1, "tmp_5_fu_373_p1");
    sc_trace(mVcdFile, tmp_6_fu_405_p1, "tmp_6_fu_405_p1");
    sc_trace(mVcdFile, ap_NS_fsm, "ap_NS_fsm");
#endif

    }
    mHdltvinHandle.open("runQueue.hdltvin.dat");
    mHdltvoutHandle.open("runQueue.hdltvout.dat");
}

runQueue::~runQueue() {
    if (mVcdFile) 
        sc_close_vcd_trace_file(mVcdFile);

    mHdltvinHandle << "] " << endl;
    mHdltvoutHandle << "] " << endl;
    mHdltvinHandle.close();
    mHdltvoutHandle.close();
    delete random_priorities_U;
}

void runQueue::thread_ap_clk_no_reset_() {
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_CS_fsm = ap_ST_st1_fsm_0;
    } else {
        ap_CS_fsm = ap_NS_fsm.read();
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        cmdOut_V_preg = ap_const_lv2_0;
    } else {
        if ((esl_seteq<1,5,5>(ap_ST_st9_fsm_8, ap_CS_fsm.read()) || 
             (esl_seteq<1,5,5>(ap_ST_st10_fsm_9, ap_CS_fsm.read()) && 
              esl_seteq<1,1,1>(ap_const_lv1_0, grp_load_fu_317_p1.read())) || 
             (esl_seteq<1,1,1>(ap_const_lv1_0, grp_load_fu_317_p1.read()) && 
              esl_seteq<1,5,5>(ap_ST_st22_fsm_21, ap_CS_fsm.read())))) {
            cmdOut_V_preg = ap_const_lv2_2;
        } else if (((esl_seteq<1,5,5>(ap_ST_st4_fsm_3, ap_CS_fsm.read()) && 
                     esl_seteq<1,1,1>(grp_load_fu_309_p1.read(), ap_const_lv1_0)) || 
                    esl_seteq<1,5,5>(ap_ST_st3_fsm_2, ap_CS_fsm.read()) || 
                    esl_seteq<1,5,5>(ap_ST_st15_fsm_14, ap_CS_fsm.read()) || 
                    (esl_seteq<1,1,1>(grp_load_fu_309_p1.read(), ap_const_lv1_0) && 
                     esl_seteq<1,5,5>(ap_ST_st16_fsm_15, ap_CS_fsm.read())))) {
            cmdOut_V_preg = ap_const_lv2_1;
        } else if (((esl_seteq<1,5,5>(ap_ST_st1_fsm_0, ap_CS_fsm.read()) && 
                     !ap_sig_bdd_79.read()) || 
                    (esl_seteq<1,5,5>(ap_ST_st16_fsm_15, ap_CS_fsm.read()) && 
                     !esl_seteq<1,1,1>(grp_load_fu_309_p1.read(), ap_const_lv1_0)) || 
                    (esl_seteq<1,5,5>(ap_ST_st2_fsm_1, ap_CS_fsm.read()) && 
                     !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_fu_325_p2.read())) || 
                    (esl_seteq<1,5,5>(ap_ST_st10_fsm_9, ap_CS_fsm.read()) && 
                     !esl_seteq<1,1,1>(ap_const_lv1_0, grp_load_fu_317_p1.read())) || 
                    (esl_seteq<1,5,5>(ap_ST_st4_fsm_3, ap_CS_fsm.read()) && 
                     !esl_seteq<1,1,1>(grp_load_fu_309_p1.read(), ap_const_lv1_0)) || 
                    esl_seteq<1,5,5>(ap_ST_st7_fsm_6, ap_CS_fsm.read()) || 
                    esl_seteq<1,5,5>(ap_ST_st13_fsm_12, ap_CS_fsm.read()) || 
                    esl_seteq<1,5,5>(ap_ST_st20_fsm_19, ap_CS_fsm.read()) || 
                    (!esl_seteq<1,1,1>(ap_const_lv1_0, grp_load_fu_317_p1.read()) && 
                     esl_seteq<1,5,5>(ap_ST_st22_fsm_21, ap_CS_fsm.read())) || 
                    esl_seteq<1,5,5>(ap_ST_st26_fsm_25, ap_CS_fsm.read()))) {
            cmdOut_V_preg = ap_const_lv2_0;
        }
    }
    if (esl_seteq<1,5,5>(ap_ST_st8_fsm_7, ap_CS_fsm.read())) {
        count_fu_86 = count_1_fu_346_p2.read();
    } else if ((esl_seteq<1,5,5>(ap_ST_st1_fsm_0, ap_CS_fsm.read()) && 
                !ap_sig_bdd_79.read())) {
        count_fu_86 = ap_const_lv32_0;
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        currentIteration_preg = ap_const_lv32_0;
    } else {
        if ((esl_seteq<1,5,5>(ap_ST_st2_fsm_1, ap_CS_fsm.read()) && 
             !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_fu_325_p2.read()))) {
            currentIteration_preg = j_reg_181.read();
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        fullOut_preg = ap_const_logic_0;
    } else {
        if (esl_seteq<1,5,5>(ap_ST_st5_fsm_4, ap_CS_fsm.read())) {
            fullOut_preg =  (sc_logic) (grp_read_fu_119_p2.read()[0]);
        }
    }
    if (esl_seteq<1,5,5>(ap_ST_st21_fsm_20, ap_CS_fsm.read())) {
        i_2_reg_251 = i_1_reg_480.read();
    } else if (esl_seteq<1,5,5>(ap_ST_st15_fsm_14, ap_CS_fsm.read())) {
        i_2_reg_251 = ap_const_lv32_0;
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        iterations_ap_vld_preg = ap_const_logic_0;
    } else {
        if ((esl_seteq<1,5,5>(ap_ST_st2_fsm_1, ap_CS_fsm.read()) && 
             esl_seteq<1,1,1>(ap_const_lv1_0, tmp_fu_325_p2.read()))) {
            iterations_ap_vld_preg = ap_const_logic_0;
        } else if ((esl_seteq<1,1,1>(ap_const_logic_1, iterations_ap_vld.read()) && 
                    !(esl_seteq<1,5,5>(ap_ST_st1_fsm_0, ap_CS_fsm.read()) && esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read())))) {
            iterations_ap_vld_preg = iterations_ap_vld.read();
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        iterations_preg = ap_const_lv32_0;
    } else {
        if ((esl_seteq<1,1,1>(ap_const_logic_1, iterations_ap_vld.read()) && 
             !(esl_seteq<1,5,5>(ap_ST_st1_fsm_0, ap_CS_fsm.read()) && esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read())))) {
            iterations_preg = iterations.read();
        }
    }
    if (esl_seteq<1,5,5>(ap_ST_st28_fsm_27, ap_CS_fsm.read())) {
        j_reg_181 = j_1_reg_442.read();
    } else if ((esl_seteq<1,5,5>(ap_ST_st1_fsm_0, ap_CS_fsm.read()) && 
                !ap_sig_bdd_79.read())) {
        j_reg_181 = ap_const_lv32_0;
    }
    if (esl_seteq<1,5,5>(ap_ST_st27_fsm_26, ap_CS_fsm.read())) {
        last_reg_263 = priorityIn_V_read_4_reg_501.read();
    } else if ((esl_seteq<1,5,5>(ap_ST_st16_fsm_15, ap_CS_fsm.read()) && 
                !esl_seteq<1,1,1>(grp_load_fu_309_p1.read(), ap_const_lv1_0))) {
        last_reg_263 = ap_const_lv8_0;
    }
    if (esl_seteq<1,5,5>(ap_ST_st14_fsm_13, ap_CS_fsm.read())) {
        op2_assign_reg_216 = i_3_reg_463.read();
    } else if (esl_seteq<1,5,5>(ap_ST_st9_fsm_8, ap_CS_fsm.read())) {
        op2_assign_reg_216 = ap_const_lv32_0;
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        priorityOut_V_preg = ap_const_lv8_0;
    } else {
        if (esl_seteq<1,5,5>(ap_ST_st18_fsm_17, ap_CS_fsm.read())) {
            priorityOut_V_preg = tmp_9_fu_394_p1.read();
        } else if (esl_seteq<1,5,5>(ap_ST_st5_fsm_4, ap_CS_fsm.read())) {
            priorityOut_V_preg = tmp_1_reg_455.read();
        }
    }
    if (esl_seteq<1,5,5>(ap_ST_st14_fsm_13, ap_CS_fsm.read())) {
        result_1_reg_228 = result_2_reg_239.read();
    } else if (esl_seteq<1,5,5>(ap_ST_st9_fsm_8, ap_CS_fsm.read())) {
        result_1_reg_228 = result_reg_193.read();
    }
    if ((esl_seteq<1,5,5>(ap_ST_st11_fsm_10, ap_CS_fsm.read()) && 
         !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_4_fu_367_p2.read()))) {
        result_2_reg_239 = result_1_reg_228.read();
    } else if ((esl_seteq<1,5,5>(ap_ST_st12_fsm_11, ap_CS_fsm.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_0, tmp_4_reg_468.read()))) {
        result_2_reg_239 = result_5_fu_377_p2.read();
    }
    if (esl_seteq<1,5,5>(ap_ST_st27_fsm_26, ap_CS_fsm.read())) {
        result_3_reg_275 = result_4_reg_287.read();
    } else if ((esl_seteq<1,5,5>(ap_ST_st16_fsm_15, ap_CS_fsm.read()) && 
                !esl_seteq<1,1,1>(grp_load_fu_309_p1.read(), ap_const_lv1_0))) {
        result_3_reg_275 = result_1_reg_228.read();
    }
    if ((esl_seteq<1,5,5>(ap_ST_st23_fsm_22, ap_CS_fsm.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_0, tmp_2_fu_399_p2.read()))) {
        result_4_reg_287 = result_3_reg_275.read();
    } else if (esl_seteq<1,5,5>(ap_ST_st24_fsm_23, ap_CS_fsm.read())) {
        result_4_reg_287 = result_6_fu_409_p2.read();
    }
    if (esl_seteq<1,5,5>(ap_ST_st28_fsm_27, ap_CS_fsm.read())) {
        result_reg_193 = result_3_reg_275.read();
    } else if ((esl_seteq<1,5,5>(ap_ST_st1_fsm_0, ap_CS_fsm.read()) && 
                !ap_sig_bdd_79.read())) {
        result_reg_193 = ap_const_lv32_0;
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        total_preg = ap_const_lv32_0;
    } else {
        if ((esl_seteq<1,5,5>(ap_ST_st2_fsm_1, ap_CS_fsm.read()) && 
             esl_seteq<1,1,1>(ap_const_lv1_0, tmp_fu_325_p2.read()))) {
            total_preg = count_fu_86.read();
        }
    }
    if (esl_seteq<1,5,5>(ap_ST_st8_fsm_7, ap_CS_fsm.read())) {
        val_assign_reg_205 = i_reg_450.read();
    } else if (esl_seteq<1,5,5>(ap_ST_st3_fsm_2, ap_CS_fsm.read())) {
        val_assign_reg_205 = ap_const_lv32_0;
    }
    if (esl_seteq<1,5,5>(ap_ST_st16_fsm_15, ap_CS_fsm.read())) {
        i_1_reg_480 = i_1_fu_383_p2.read();
    }
    if (esl_seteq<1,5,5>(ap_ST_st10_fsm_9, ap_CS_fsm.read())) {
        i_3_reg_463 = i_3_fu_357_p2.read();
    }
    if (esl_seteq<1,5,5>(ap_ST_st4_fsm_3, ap_CS_fsm.read())) {
        i_reg_450 = i_fu_336_p2.read();
    }
    if (esl_seteq<1,5,5>(ap_ST_st2_fsm_1, ap_CS_fsm.read())) {
        j_1_reg_442 = j_1_fu_330_p2.read();
    }
    if ((esl_seteq<1,5,5>(ap_ST_st12_fsm_11, ap_CS_fsm.read()) || esl_seteq<1,5,5>(ap_ST_st25_fsm_24, ap_CS_fsm.read()) || (esl_seteq<1,5,5>(ap_ST_st16_fsm_15, ap_CS_fsm.read()) && 
  !esl_seteq<1,1,1>(grp_load_fu_309_p1.read(), ap_const_lv1_0)) || (esl_seteq<1,5,5>(ap_ST_st4_fsm_3, ap_CS_fsm.read()) && 
  !esl_seteq<1,1,1>(grp_load_fu_309_p1.read(), ap_const_lv1_0)))) {
        localEmpty_fu_94 = grp_read_fu_141_p2.read();
    }
    if (((esl_seteq<1,5,5>(ap_ST_st2_fsm_1, ap_CS_fsm.read()) && 
  !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_fu_325_p2.read())) || esl_seteq<1,5,5>(ap_ST_st6_fsm_5, ap_CS_fsm.read()) || (esl_seteq<1,5,5>(ap_ST_st10_fsm_9, ap_CS_fsm.read()) && 
  !esl_seteq<1,1,1>(ap_const_lv1_0, grp_load_fu_317_p1.read())) || esl_seteq<1,5,5>(ap_ST_st19_fsm_18, ap_CS_fsm.read()))) {
        localFull_fu_90 = grp_read_fu_119_p2.read();
    }
    if (esl_seteq<1,5,5>(ap_ST_st25_fsm_24, ap_CS_fsm.read())) {
        priorityIn_V_read_4_reg_501 = priorityIn_V.read();
    }
    if ((esl_seteq<1,5,5>(ap_ST_st4_fsm_3, ap_CS_fsm.read()) && esl_seteq<1,1,1>(grp_load_fu_309_p1.read(), ap_const_lv1_0))) {
        tmp_1_reg_455 = tmp_1_fu_342_p1.read();
    }
    if (esl_seteq<1,5,5>(ap_ST_st11_fsm_10, ap_CS_fsm.read())) {
        tmp_4_reg_468 = tmp_4_fu_367_p2.read();
    }
}

void runQueue::thread_ap_done() {
    if ((esl_seteq<1,5,5>(ap_ST_st2_fsm_1, ap_CS_fsm.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_0, tmp_fu_325_p2.read()))) {
        ap_done = ap_const_logic_1;
    } else {
        ap_done = ap_const_logic_0;
    }
}

void runQueue::thread_ap_idle() {
    if ((!esl_seteq<1,1,1>(ap_const_logic_1, ap_start.read()) && 
         esl_seteq<1,5,5>(ap_ST_st1_fsm_0, ap_CS_fsm.read()))) {
        ap_idle = ap_const_logic_1;
    } else {
        ap_idle = ap_const_logic_0;
    }
}

void runQueue::thread_ap_ready() {
    if ((esl_seteq<1,5,5>(ap_ST_st2_fsm_1, ap_CS_fsm.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_0, tmp_fu_325_p2.read()))) {
        ap_ready = ap_const_logic_1;
    } else {
        ap_ready = ap_const_logic_0;
    }
}

void runQueue::thread_ap_return() {
    ap_return = result_reg_193.read();
}

void runQueue::thread_ap_sig_bdd_79() {
    ap_sig_bdd_79 = (esl_seteq<1,1,1>(iterations_ap_vld_in_sig.read(), ap_const_logic_0) || esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0));
}

void runQueue::thread_cmdOut_V() {
    if ((esl_seteq<1,5,5>(ap_ST_st9_fsm_8, ap_CS_fsm.read()) || 
         (esl_seteq<1,5,5>(ap_ST_st10_fsm_9, ap_CS_fsm.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_0, grp_load_fu_317_p1.read())) || 
         (esl_seteq<1,1,1>(ap_const_lv1_0, grp_load_fu_317_p1.read()) && 
          esl_seteq<1,5,5>(ap_ST_st22_fsm_21, ap_CS_fsm.read())))) {
        cmdOut_V = ap_const_lv2_2;
    } else if (((esl_seteq<1,5,5>(ap_ST_st4_fsm_3, ap_CS_fsm.read()) && 
                 esl_seteq<1,1,1>(grp_load_fu_309_p1.read(), ap_const_lv1_0)) || 
                esl_seteq<1,5,5>(ap_ST_st3_fsm_2, ap_CS_fsm.read()) || 
                esl_seteq<1,5,5>(ap_ST_st15_fsm_14, ap_CS_fsm.read()) || 
                (esl_seteq<1,1,1>(grp_load_fu_309_p1.read(), ap_const_lv1_0) && 
                 esl_seteq<1,5,5>(ap_ST_st16_fsm_15, ap_CS_fsm.read())))) {
        cmdOut_V = ap_const_lv2_1;
    } else if (((esl_seteq<1,5,5>(ap_ST_st1_fsm_0, ap_CS_fsm.read()) && 
                 !ap_sig_bdd_79.read()) || 
                (esl_seteq<1,5,5>(ap_ST_st16_fsm_15, ap_CS_fsm.read()) && 
                 !esl_seteq<1,1,1>(grp_load_fu_309_p1.read(), ap_const_lv1_0)) || 
                (esl_seteq<1,5,5>(ap_ST_st2_fsm_1, ap_CS_fsm.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_fu_325_p2.read())) || 
                (esl_seteq<1,5,5>(ap_ST_st10_fsm_9, ap_CS_fsm.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, grp_load_fu_317_p1.read())) || 
                (esl_seteq<1,5,5>(ap_ST_st4_fsm_3, ap_CS_fsm.read()) && 
                 !esl_seteq<1,1,1>(grp_load_fu_309_p1.read(), ap_const_lv1_0)) || 
                esl_seteq<1,5,5>(ap_ST_st7_fsm_6, ap_CS_fsm.read()) || 
                esl_seteq<1,5,5>(ap_ST_st13_fsm_12, ap_CS_fsm.read()) || 
                esl_seteq<1,5,5>(ap_ST_st20_fsm_19, ap_CS_fsm.read()) || 
                (!esl_seteq<1,1,1>(ap_const_lv1_0, grp_load_fu_317_p1.read()) && 
                 esl_seteq<1,5,5>(ap_ST_st22_fsm_21, ap_CS_fsm.read())) || 
                esl_seteq<1,5,5>(ap_ST_st26_fsm_25, ap_CS_fsm.read()))) {
        cmdOut_V = ap_const_lv2_0;
    } else {
        cmdOut_V = cmdOut_V_preg.read();
    }
}

void runQueue::thread_count_1_fu_346_p2() {
    count_1_fu_346_p2 = (!count_fu_86.read().is_01() || !ap_const_lv32_1.is_01())? sc_lv<32>(): (sc_bigint<32>(count_fu_86.read()) + sc_biguint<32>(ap_const_lv32_1));
}

void runQueue::thread_currentIteration() {
    if ((esl_seteq<1,5,5>(ap_ST_st2_fsm_1, ap_CS_fsm.read()) && 
         !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_fu_325_p2.read()))) {
        currentIteration = j_reg_181.read();
    } else {
        currentIteration = currentIteration_preg.read();
    }
}

void runQueue::thread_finished() {
    finished =  (sc_logic) (ap_const_lv1_1[0]);
}

void runQueue::thread_finished_ap_vld() {
    if ((esl_seteq<1,5,5>(ap_ST_st2_fsm_1, ap_CS_fsm.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_0, tmp_fu_325_p2.read()))) {
        finished_ap_vld = ap_const_logic_1;
    } else {
        finished_ap_vld = ap_const_logic_0;
    }
}

void runQueue::thread_fullOut() {
    if (esl_seteq<1,5,5>(ap_ST_st5_fsm_4, ap_CS_fsm.read())) {
        fullOut = full.read();
    } else {
        fullOut = fullOut_preg.read();
    }
}

void runQueue::thread_grp_load_fu_309_p1() {
    grp_load_fu_309_p1 = localFull_fu_90.read();
}

void runQueue::thread_grp_load_fu_317_p1() {
    grp_load_fu_317_p1 = localEmpty_fu_94.read();
}

void runQueue::thread_grp_read_fu_119_p2() {
    grp_read_fu_119_p2 =  (sc_lv<1>) (full.read());
}

void runQueue::thread_grp_read_fu_141_p2() {
    grp_read_fu_141_p2 =  (sc_lv<1>) (empty.read());
}

void runQueue::thread_i_1_fu_383_p2() {
    i_1_fu_383_p2 = (!i_2_reg_251.read().is_01() || !ap_const_lv32_1.is_01())? sc_lv<32>(): (sc_bigint<32>(i_2_reg_251.read()) + sc_biguint<32>(ap_const_lv32_1));
}

void runQueue::thread_i_3_fu_357_p2() {
    i_3_fu_357_p2 = (!op2_assign_reg_216.read().is_01() || !ap_const_lv32_1.is_01())? sc_lv<32>(): (sc_bigint<32>(op2_assign_reg_216.read()) + sc_biguint<32>(ap_const_lv32_1));
}

void runQueue::thread_i_fu_336_p2() {
    i_fu_336_p2 = (!val_assign_reg_205.read().is_01() || !ap_const_lv32_1.is_01())? sc_lv<32>(): (sc_bigint<32>(val_assign_reg_205.read()) + sc_biguint<32>(ap_const_lv32_1));
}

void runQueue::thread_iterations_ap_vld_in_sig() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, iterations_ap_vld.read())) {
        iterations_ap_vld_in_sig = iterations_ap_vld.read();
    } else {
        iterations_ap_vld_in_sig = iterations_ap_vld_preg.read();
    }
}

void runQueue::thread_iterations_in_sig() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, iterations_ap_vld.read())) {
        iterations_in_sig = iterations.read();
    } else {
        iterations_in_sig = iterations_preg.read();
    }
}

void runQueue::thread_j_1_fu_330_p2() {
    j_1_fu_330_p2 = (!j_reg_181.read().is_01() || !ap_const_lv32_1.is_01())? sc_lv<32>(): (sc_bigint<32>(j_reg_181.read()) + sc_biguint<32>(ap_const_lv32_1));
}

void runQueue::thread_priorityOut_V() {
    if (esl_seteq<1,5,5>(ap_ST_st18_fsm_17, ap_CS_fsm.read())) {
        priorityOut_V = tmp_9_fu_394_p1.read();
    } else if (esl_seteq<1,5,5>(ap_ST_st5_fsm_4, ap_CS_fsm.read())) {
        priorityOut_V = tmp_1_reg_455.read();
    } else {
        priorityOut_V = priorityOut_V_preg.read();
    }
}

void runQueue::thread_random_priorities_address0() {
    random_priorities_address0 =  (sc_lv<8>) (tmp_7_fu_389_p1.read());
}

void runQueue::thread_random_priorities_ce0() {
    if (esl_seteq<1,5,5>(ap_ST_st17_fsm_16, ap_CS_fsm.read())) {
        random_priorities_ce0 = ap_const_logic_1;
    } else {
        random_priorities_ce0 = ap_const_logic_0;
    }
}

void runQueue::thread_result_5_fu_377_p2() {
    result_5_fu_377_p2 = (!result_1_reg_228.read().is_01() || !tmp_5_fu_373_p1.read().is_01())? sc_lv<32>(): (sc_bigint<32>(result_1_reg_228.read()) + sc_biguint<32>(tmp_5_fu_373_p1.read()));
}

void runQueue::thread_result_6_fu_409_p2() {
    result_6_fu_409_p2 = (!result_3_reg_275.read().is_01() || !tmp_6_fu_405_p1.read().is_01())? sc_lv<32>(): (sc_bigint<32>(result_3_reg_275.read()) + sc_biguint<32>(tmp_6_fu_405_p1.read()));
}

void runQueue::thread_tmp_1_fu_342_p1() {
    tmp_1_fu_342_p1 = val_assign_reg_205.read().range(8-1, 0);
}

void runQueue::thread_tmp_2_fu_399_p2() {
    tmp_2_fu_399_p2 = (!last_reg_263.read().is_01() || !priorityIn_V.read().is_01())? sc_lv<1>(): (sc_biguint<8>(last_reg_263.read()) > sc_biguint<8>(priorityIn_V.read()));
}

void runQueue::thread_tmp_3_fu_363_p1() {
    tmp_3_fu_363_p1 = esl_zext<32,8>(priorityIn_V.read());
}

void runQueue::thread_tmp_4_fu_367_p2() {
    tmp_4_fu_367_p2 = (!tmp_3_fu_363_p1.read().is_01() || !op2_assign_reg_216.read().is_01())? sc_lv<1>(): sc_lv<1>(tmp_3_fu_363_p1.read() == op2_assign_reg_216.read());
}

void runQueue::thread_tmp_5_fu_373_p1() {
    tmp_5_fu_373_p1 = esl_zext<32,8>(priorityIn_V.read());
}

void runQueue::thread_tmp_6_fu_405_p1() {
    tmp_6_fu_405_p1 = esl_zext<32,8>(priorityIn_V.read());
}

void runQueue::thread_tmp_7_fu_389_p1() {
    tmp_7_fu_389_p1 = esl_zext<64,32>(i_2_reg_251.read());
}

void runQueue::thread_tmp_9_fu_394_p1() {
    tmp_9_fu_394_p1 = random_priorities_q0.read().range(8-1, 0);
}

void runQueue::thread_tmp_fu_325_p2() {
    tmp_fu_325_p2 = (!j_reg_181.read().is_01() || !iterations_in_sig.read().is_01())? sc_lv<1>(): (sc_bigint<32>(j_reg_181.read()) < sc_bigint<32>(iterations_in_sig.read()));
}

void runQueue::thread_total() {
    if ((esl_seteq<1,5,5>(ap_ST_st2_fsm_1, ap_CS_fsm.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_0, tmp_fu_325_p2.read()))) {
        total = count_fu_86.read();
    } else {
        total = total_preg.read();
    }
}

void runQueue::thread_ap_NS_fsm() {
    switch (ap_CS_fsm.read().to_uint()) {
        case 0 : 
            if (!ap_sig_bdd_79.read()) {
                ap_NS_fsm = ap_ST_st2_fsm_1;
            } else {
                ap_NS_fsm = ap_ST_st1_fsm_0;
            }
            break;
        case 1 : 
            if (esl_seteq<1,1,1>(ap_const_lv1_0, tmp_fu_325_p2.read())) {
                ap_NS_fsm = ap_ST_st1_fsm_0;
            } else {
                ap_NS_fsm = ap_ST_st3_fsm_2;
            }
            break;
        case 2 : 
            ap_NS_fsm = ap_ST_st4_fsm_3;
            break;
        case 3 : 
            if (!esl_seteq<1,1,1>(grp_load_fu_309_p1.read(), ap_const_lv1_0)) {
                ap_NS_fsm = ap_ST_st9_fsm_8;
            } else {
                ap_NS_fsm = ap_ST_st5_fsm_4;
            }
            break;
        case 4 : 
            ap_NS_fsm = ap_ST_st6_fsm_5;
            break;
        case 5 : 
            ap_NS_fsm = ap_ST_st7_fsm_6;
            break;
        case 6 : 
            ap_NS_fsm = ap_ST_st8_fsm_7;
            break;
        case 7 : 
            ap_NS_fsm = ap_ST_st4_fsm_3;
            break;
        case 8 : 
            ap_NS_fsm = ap_ST_st10_fsm_9;
            break;
        case 9 : 
            if (!esl_seteq<1,1,1>(ap_const_lv1_0, grp_load_fu_317_p1.read())) {
                ap_NS_fsm = ap_ST_st15_fsm_14;
            } else {
                ap_NS_fsm = ap_ST_st11_fsm_10;
            }
            break;
        case 10 : 
            ap_NS_fsm = ap_ST_st12_fsm_11;
            break;
        case 11 : 
            ap_NS_fsm = ap_ST_st13_fsm_12;
            break;
        case 12 : 
            ap_NS_fsm = ap_ST_st14_fsm_13;
            break;
        case 13 : 
            ap_NS_fsm = ap_ST_st10_fsm_9;
            break;
        case 14 : 
            ap_NS_fsm = ap_ST_st16_fsm_15;
            break;
        case 15 : 
            if (!esl_seteq<1,1,1>(grp_load_fu_309_p1.read(), ap_const_lv1_0)) {
                ap_NS_fsm = ap_ST_st22_fsm_21;
            } else {
                ap_NS_fsm = ap_ST_st17_fsm_16;
            }
            break;
        case 16 : 
            ap_NS_fsm = ap_ST_st18_fsm_17;
            break;
        case 17 : 
            ap_NS_fsm = ap_ST_st19_fsm_18;
            break;
        case 18 : 
            ap_NS_fsm = ap_ST_st20_fsm_19;
            break;
        case 19 : 
            ap_NS_fsm = ap_ST_st21_fsm_20;
            break;
        case 20 : 
            ap_NS_fsm = ap_ST_st16_fsm_15;
            break;
        case 21 : 
            if (!esl_seteq<1,1,1>(ap_const_lv1_0, grp_load_fu_317_p1.read())) {
                ap_NS_fsm = ap_ST_st28_fsm_27;
            } else {
                ap_NS_fsm = ap_ST_st23_fsm_22;
            }
            break;
        case 22 : 
            if (esl_seteq<1,1,1>(ap_const_lv1_0, tmp_2_fu_399_p2.read())) {
                ap_NS_fsm = ap_ST_st25_fsm_24;
            } else {
                ap_NS_fsm = ap_ST_st24_fsm_23;
            }
            break;
        case 23 : 
            ap_NS_fsm = ap_ST_st25_fsm_24;
            break;
        case 24 : 
            ap_NS_fsm = ap_ST_st26_fsm_25;
            break;
        case 25 : 
            ap_NS_fsm = ap_ST_st27_fsm_26;
            break;
        case 26 : 
            ap_NS_fsm = ap_ST_st22_fsm_21;
            break;
        case 27 : 
            ap_NS_fsm = ap_ST_st2_fsm_1;
            break;
        default : 
            ap_NS_fsm = "XXXXX";
            break;
    }
}
void runQueue::thread_hdltv_gen() {
    const char* dump_tv = std::getenv("AP_WRITE_TV");
    if (!(dump_tv && string(dump_tv) == "on")) return;

    wait();

    mHdltvinHandle << "[ " << endl;
    mHdltvoutHandle << "[ " << endl;
    int ap_cycleNo = 0;
    while (1) {
        wait();
        const char* mComma = ap_cycleNo == 0 ? " " : ", " ;
        mHdltvinHandle << mComma << "{"  <<  " \"ap_rst\" :  \"" << ap_rst.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"ap_start\" :  \"" << ap_start.read() << "\" ";
        mHdltvoutHandle << mComma << "{"  <<  " \"ap_done\" :  \"" << ap_done.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"ap_idle\" :  \"" << ap_idle.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"ap_ready\" :  \"" << ap_ready.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"priorityOut_V\" :  \"" << priorityOut_V.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"priorityIn_V\" :  \"" << priorityIn_V.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"cmdOut_V\" :  \"" << cmdOut_V.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"empty\" :  \"" << empty.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"full\" :  \"" << full.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"fullOut\" :  \"" << fullOut.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"iterations\" :  \"" << iterations.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"iterations_ap_vld\" :  \"" << iterations_ap_vld.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"finished\" :  \"" << finished.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"finished_ap_vld\" :  \"" << finished_ap_vld.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"currentIteration\" :  \"" << currentIteration.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"total\" :  \"" << total.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"ap_return\" :  \"" << ap_return.read() << "\" ";
        mHdltvinHandle << "}" << std::endl;
        mHdltvoutHandle << "}" << std::endl;
        ap_cycleNo++;
    }
}

}

