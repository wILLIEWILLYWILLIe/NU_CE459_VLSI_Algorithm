#include <string>
#include <fstream>
#include <iostream>
#include "mc_testbench.h"
#include <mc_reset.h>
#include <mc_transactors.h>
#include <mc_scverify.h>
#include <mc_stall_ctrl.h>
#include "/vol/mentor/Catapult_Synthesis_10.4a/Mgc_home/pkgs/siflibs/ccs_ram_sync_singleport_trans_rsc.h"
#include "ccs_ioport_trans_rsc_v1.h"
#include <mc_monitor.h>
#include <mc_simulator_extensions.h>
#include "mc_dut_wrapper.h"
#include "ccs_probes.cpp"
#include <mt19937ar.c>
#ifndef TO_QUOTED_STRING
#define TO_QUOTED_STRING(x) TO_QUOTED_STRING1(x)
#define TO_QUOTED_STRING1(x) #x
#endif
#ifndef TOP_HDL_ENTITY
#define TOP_HDL_ENTITY matrix_mul
#endif
// Hold time for the SCVerify testbench to account for the gate delay after downstream synthesis in pico second(s)
// Hold time value is obtained from 'top_gate_constraints.cpp', which is generated at the end of RTL synthesis
#ifdef CCS_DUT_GATE
extern double __scv_hold_time;
extern double __scv_hold_time_RSCID_1;
extern double __scv_hold_time_RSCID_2;
extern double __scv_hold_time_RSCID_3;
#else
double __scv_hold_time = 0.0; // default for non-gate simulation is zero
double __scv_hold_time_RSCID_1 = 0;
double __scv_hold_time_RSCID_2 = 0;
double __scv_hold_time_RSCID_3 = 0;
#endif

class scverify_top : public sc_module
{
public:
  sc_signal<sc_logic>                                                                                     rst;
  sc_signal<sc_logic>                                                                                     rst_n;
  sc_signal<sc_logic>                                                                                     SIG_SC_LOGIC_0;
  sc_signal<sc_logic>                                                                                     SIG_SC_LOGIC_1;
  sc_signal<sc_logic>                                                                                     TLS_design_is_idle;
  sc_signal<bool>                                                                                         TLS_design_is_idle_reg;
  sc_clock                                                                                                clk;
  mc_programmable_reset                                                                                   rst_driver;
  sc_signal<sc_logic>                                                                                     TLS_rst;
  sc_signal<sc_lv<32768> >                                                                                TLS_A_rsc_dat;
  sc_signal<sc_logic>                                                                                     TLS_A_rsc_triosy_lz;
  sc_signal<sc_lv<32768> >                                                                                TLS_B_rsc_dat;
  sc_signal<sc_logic>                                                                                     TLS_B_rsc_triosy_lz;
  sc_signal<sc_lv<10> >                                                                                   TLS_C_rsc_adr;
  sc_signal<sc_lv<32> >                                                                                   TLS_C_rsc_d;
  sc_signal<sc_logic>                                                                                     TLS_C_rsc_we;
  sc_signal<sc_lv<32> >                                                                                   TLS_C_rsc_q;
  sc_signal<sc_logic>                                                                                     TLS_C_rsc_triosy_lz;
  ccs_DUT_wrapper                                                                                         matrix_mul_INST;
  ccs_in_trans_rsc_v1<1,32768 >                                                                           A_rsc_INST;
  ccs_in_trans_rsc_v1<1,32768 >                                                                           B_rsc_INST;
  ccs_ram_sync_singleport_trans_rsc<32,10,1024 >                                                          C_rsc_INST;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_fixed<32, 18, true, AC_RND_CONV, AC_WRAP >,1024> >                TLS_in_fifo_A;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                             TLS_in_wait_ctrl_fifo_A;
  mc_trios_input_monitor                                                                                  trios_monitor_A_rsc_triosy_lz_INST;
  mc_input_transactor<mgc_sysc_ver_array1D<ac_fixed<32, 18, true, AC_RND_CONV, AC_WRAP >,1024>,32,true>   transactor_A;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_fixed<32, 18, true, AC_RND_CONV, AC_WRAP >,1024> >                TLS_in_fifo_B;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                             TLS_in_wait_ctrl_fifo_B;
  mc_trios_input_monitor                                                                                  trios_monitor_B_rsc_triosy_lz_INST;
  mc_input_transactor<mgc_sysc_ver_array1D<ac_fixed<32, 18, true, AC_RND_CONV, AC_WRAP >,1024>,32,true>   transactor_B;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_fixed<32, 18, true, AC_RND_CONV, AC_WRAP >,1024> >                TLS_out_fifo_C;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                             TLS_out_wait_ctrl_fifo_C;
  mc_trios_output_monitor                                                                                 trios_monitor_C_rsc_triosy_lz_INST;
  mc_output_transactor<mgc_sysc_ver_array1D<ac_fixed<32, 18, true, AC_RND_CONV, AC_WRAP >,1024>,32,true>  transactor_C;
  mc_testbench                                                                                            testbench_INST;
  sc_signal<sc_logic>                                                                                     catapult_start;
  sc_signal<sc_logic>                                                                                     catapult_done;
  sc_signal<sc_logic>                                                                                     catapult_ready;
  sc_signal<sc_logic>                                                                                     in_sync;
  sc_signal<sc_logic>                                                                                     out_sync;
  sc_signal<sc_logic>                                                                                     inout_sync;
  sc_signal<unsigned>                                                                                     wait_for_init;
  sync_generator                                                                                          sync_generator_INST;
  catapult_monitor                                                                                        catapult_monitor_INST;
  ccs_probe_monitor                                                                                      *ccs_probe_monitor_INST;
  sc_event                                                                                                generate_reset_event;
  sc_event                                                                                                deadlock_event;
  sc_signal<sc_logic>                                                                                     deadlocked;
  sc_signal<sc_logic>                                                                                     maxsimtime;
  sc_event                                                                                                max_sim_time_event;
  sc_signal<sc_logic>                                                                                     TLS_enable_stalls;
  sc_signal<unsigned short>                                                                               TLS_stall_coverage;

  void TLS_rst_method();
  void max_sim_time_notify();
  void start_of_simulation();
  void setup_debug();
  void debug(const char* varname, int flags, int count);
  void generate_reset();
  void install_observe_foreign_signals();
  void deadlock_watch();
  void deadlock_notify();

  // Constructor
  SC_HAS_PROCESS(scverify_top);
  scverify_top(const sc_module_name& name)
    : rst("rst")
    , rst_n("rst_n")
    , SIG_SC_LOGIC_0("SIG_SC_LOGIC_0")
    , SIG_SC_LOGIC_1("SIG_SC_LOGIC_1")
    , TLS_design_is_idle("TLS_design_is_idle")
    , TLS_design_is_idle_reg("TLS_design_is_idle_reg")
    , CCS_CLK_CTOR(clk, "clk", 5, SC_NS, 0.5, 0, SC_NS, false)
    , rst_driver("rst_driver", 10.000000, false)
    , TLS_rst("TLS_rst")
    , TLS_A_rsc_dat("TLS_A_rsc_dat")
    , TLS_A_rsc_triosy_lz("TLS_A_rsc_triosy_lz")
    , TLS_B_rsc_dat("TLS_B_rsc_dat")
    , TLS_B_rsc_triosy_lz("TLS_B_rsc_triosy_lz")
    , TLS_C_rsc_adr("TLS_C_rsc_adr")
    , TLS_C_rsc_d("TLS_C_rsc_d")
    , TLS_C_rsc_we("TLS_C_rsc_we")
    , TLS_C_rsc_q("TLS_C_rsc_q")
    , TLS_C_rsc_triosy_lz("TLS_C_rsc_triosy_lz")
    , matrix_mul_INST("rtl", TO_QUOTED_STRING(TOP_HDL_ENTITY))
    , A_rsc_INST("A_rsc", true)
    , B_rsc_INST("B_rsc", true)
    , C_rsc_INST("C_rsc", true)
    , TLS_in_fifo_A("TLS_in_fifo_A", -1)
    , TLS_in_wait_ctrl_fifo_A("TLS_in_wait_ctrl_fifo_A", -1)
    , trios_monitor_A_rsc_triosy_lz_INST("trios_monitor_A_rsc_triosy_lz_INST")
    , transactor_A("transactor_A", 0, 32768, 0)
    , TLS_in_fifo_B("TLS_in_fifo_B", -1)
    , TLS_in_wait_ctrl_fifo_B("TLS_in_wait_ctrl_fifo_B", -1)
    , trios_monitor_B_rsc_triosy_lz_INST("trios_monitor_B_rsc_triosy_lz_INST")
    , transactor_B("transactor_B", 0, 32768, 0)
    , TLS_out_fifo_C("TLS_out_fifo_C", -1)
    , TLS_out_wait_ctrl_fifo_C("TLS_out_wait_ctrl_fifo_C", -1)
    , trios_monitor_C_rsc_triosy_lz_INST("trios_monitor_C_rsc_triosy_lz_INST")
    , transactor_C("transactor_C", 0, 32, 0)
    , testbench_INST("user_tb")
    , catapult_start("catapult_start")
    , catapult_done("catapult_done")
    , catapult_ready("catapult_ready")
    , in_sync("in_sync")
    , out_sync("out_sync")
    , inout_sync("inout_sync")
    , wait_for_init("wait_for_init")
    , sync_generator_INST("sync_generator", true, false, false, false, 34850, 34850, 0)
    , catapult_monitor_INST("Monitor", clk, true, 34850LL, 34850LL)
    , ccs_probe_monitor_INST(NULL)
    , deadlocked("deadlocked")
    , maxsimtime("maxsimtime")
  {
    rst_driver.reset_out(TLS_rst);

    matrix_mul_INST.clk(clk);
    matrix_mul_INST.rst(TLS_rst);
    matrix_mul_INST.A_rsc_dat(TLS_A_rsc_dat);
    matrix_mul_INST.A_rsc_triosy_lz(TLS_A_rsc_triosy_lz);
    matrix_mul_INST.B_rsc_dat(TLS_B_rsc_dat);
    matrix_mul_INST.B_rsc_triosy_lz(TLS_B_rsc_triosy_lz);
    matrix_mul_INST.C_rsc_adr(TLS_C_rsc_adr);
    matrix_mul_INST.C_rsc_d(TLS_C_rsc_d);
    matrix_mul_INST.C_rsc_we(TLS_C_rsc_we);
    matrix_mul_INST.C_rsc_q(TLS_C_rsc_q);
    matrix_mul_INST.C_rsc_triosy_lz(TLS_C_rsc_triosy_lz);

    A_rsc_INST.dat(TLS_A_rsc_dat);
    A_rsc_INST.clk(clk);
    A_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_1)));

    B_rsc_INST.dat(TLS_B_rsc_dat);
    B_rsc_INST.clk(clk);
    B_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_2)));

    C_rsc_INST.q(TLS_C_rsc_q);
    C_rsc_INST.we(TLS_C_rsc_we);
    C_rsc_INST.d(TLS_C_rsc_d);
    C_rsc_INST.adr(TLS_C_rsc_adr);
    C_rsc_INST.en(SIG_SC_LOGIC_1);
    C_rsc_INST.clk(clk);
    C_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_3)));

    trios_monitor_A_rsc_triosy_lz_INST.trios(TLS_A_rsc_triosy_lz);
    trios_monitor_A_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_A.in_fifo(TLS_in_fifo_A);
    transactor_A.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_A);
    transactor_A.bind_clk(clk, true, rst);
    transactor_A.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_A.register_block(&A_rsc_INST, A_rsc_INST.basename(), TLS_A_rsc_triosy_lz, 0, 0, 1);

    trios_monitor_B_rsc_triosy_lz_INST.trios(TLS_B_rsc_triosy_lz);
    trios_monitor_B_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_B.in_fifo(TLS_in_fifo_B);
    transactor_B.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_B);
    transactor_B.bind_clk(clk, true, rst);
    transactor_B.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_B.register_block(&B_rsc_INST, B_rsc_INST.basename(), TLS_B_rsc_triosy_lz, 0, 0, 1);

    trios_monitor_C_rsc_triosy_lz_INST.trios(TLS_C_rsc_triosy_lz);
    trios_monitor_C_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_C.out_fifo(TLS_out_fifo_C);
    transactor_C.out_wait_ctrl_fifo(TLS_out_wait_ctrl_fifo_C);
    transactor_C.bind_clk(clk, true, rst);
    transactor_C.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_C.register_block(&C_rsc_INST, C_rsc_INST.basename(), TLS_C_rsc_triosy_lz, 0, 1023, 1);

    testbench_INST.clk(clk);
    testbench_INST.ccs_A(TLS_in_fifo_A);
    testbench_INST.ccs_wait_ctrl_A(TLS_in_wait_ctrl_fifo_A);
    testbench_INST.ccs_B(TLS_in_fifo_B);
    testbench_INST.ccs_wait_ctrl_B(TLS_in_wait_ctrl_fifo_B);
    testbench_INST.ccs_C(TLS_out_fifo_C);
    testbench_INST.ccs_wait_ctrl_C(TLS_out_wait_ctrl_fifo_C);
    testbench_INST.design_is_idle(TLS_design_is_idle_reg);
    testbench_INST.enable_stalls(TLS_enable_stalls);
    testbench_INST.stall_coverage(TLS_stall_coverage);

    sync_generator_INST.clk(clk);
    sync_generator_INST.rst(rst);
    sync_generator_INST.in_sync(in_sync);
    sync_generator_INST.out_sync(out_sync);
    sync_generator_INST.inout_sync(inout_sync);
    sync_generator_INST.wait_for_init(wait_for_init);
    sync_generator_INST.catapult_start(catapult_start);
    sync_generator_INST.catapult_ready(catapult_ready);
    sync_generator_INST.catapult_done(catapult_done);

    catapult_monitor_INST.rst(rst);


    SC_METHOD(TLS_rst_method);
      sensitive_pos << TLS_rst;
      dont_initialize();

    SC_METHOD(max_sim_time_notify);
      sensitive << max_sim_time_event;
      dont_initialize();

    SC_METHOD(generate_reset);
      sensitive << generate_reset_event;
      sensitive << testbench_INST.reset_request_event;

    SC_METHOD(deadlock_watch);
      sensitive << clk;
      dont_initialize();

    SC_METHOD(deadlock_notify);
      sensitive << deadlock_event;
      dont_initialize();


    #if defined(CCS_SCVERIFY) && defined(CCS_DUT_RTL) && !defined(CCS_DUT_SYSC) && !defined(CCS_SYSC) && !defined(CCS_DUT_POWER)
        ccs_probe_monitor_INST = new ccs_probe_monitor("ccs_probe_monitor");
    ccs_probe_monitor_INST->clk(clk);
    ccs_probe_monitor_INST->rst(rst);
    #endif
    SIG_SC_LOGIC_0.write(SC_LOGIC_0);
    SIG_SC_LOGIC_1.write(SC_LOGIC_1);
    mt19937_init_genrand(19650218UL);
    install_observe_foreign_signals();
  }
};
void scverify_top::TLS_rst_method() {
  std::ostringstream msg;
  msg << "TLS_rst active @ " << sc_time_stamp();
  SC_REPORT_INFO("HW reset", msg.str().c_str());
  A_rsc_INST.clear();
  B_rsc_INST.clear();
  C_rsc_INST.clear();
}

void scverify_top::max_sim_time_notify() {
  testbench_INST.set_failed(true);
  testbench_INST.check_results();
  SC_REPORT_ERROR("System", "Specified maximum simulation time reached");
  sc_stop();
}

void scverify_top::start_of_simulation() {
  char *SCVerify_AUTOWAIT = getenv("SCVerify_AUTOWAIT");
  if (SCVerify_AUTOWAIT) {
    int l = atoi(SCVerify_AUTOWAIT);
    transactor_A.set_auto_wait_limit(l);
    transactor_B.set_auto_wait_limit(l);
    transactor_C.set_auto_wait_limit(l);
  }
}

void scverify_top::setup_debug() {
#ifdef MC_DEFAULT_TRANSACTOR_LOG
  static int transactor_A_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_B_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_C_flags = MC_DEFAULT_TRANSACTOR_LOG;
#else
  static int transactor_A_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_B_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_C_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
#endif
  static int transactor_A_count = -1;
  static int transactor_B_count = -1;
  static int transactor_C_count = -1;

  // At the breakpoint, modify the local variables
  // above to turn on/off different levels of transaction
  // logging for each variable. Available flags are:
  //   MC_TRANSACTOR_EMPTY       - log empty FIFOs (on by default)
  //   MC_TRANSACTOR_UNDERFLOW   - log FIFOs that run empty and then are loaded again (off)
  //   MC_TRANSACTOR_READ        - log all read events
  //   MC_TRANSACTOR_WRITE       - log all write events
  //   MC_TRANSACTOR_LOAD        - log all FIFO load events
  //   MC_TRANSACTOR_DUMP        - log all FIFO dump events
  //   MC_TRANSACTOR_STREAMCNT   - log all streamed port index counter events
  //   MC_TRANSACTOR_WAIT        - log user specified handshake waits
  //   MC_TRANSACTOR_SIZE        - log input FIFO size updates

  std::ifstream debug_cmds;
  debug_cmds.open("scverify.cmd",std::fstream::in);
  if (debug_cmds.is_open()) {
    std::cout << "Reading SCVerify debug commands from file 'scverify.cmd'" << std::endl;
    std::string line;
    while (getline(debug_cmds,line)) {
      std::size_t pos1 = line.find(" ");
      if (pos1 == std::string::npos) continue;
      std::size_t pos2 = line.find(" ", pos1+1);
      std::string varname = line.substr(0,pos1);
      std::string flags = line.substr(pos1+1,pos2-pos1-1);
      std::string count = line.substr(pos2+1);
      debug(varname.c_str(),std::atoi(flags.c_str()),std::atoi(count.c_str()));
    }
    debug_cmds.close();
  } else {
    debug("transactor_A",transactor_A_flags,transactor_A_count);
    debug("transactor_B",transactor_B_flags,transactor_B_count);
    debug("transactor_C",transactor_C_flags,transactor_C_count);
  }
}

void scverify_top::debug(const char* varname, int flags, int count) {
  sc_module *xlator_p = 0;
  sc_attr_base *debug_attr_p = 0;
  if (strcmp(varname,"transactor_A") == 0)
    xlator_p = &transactor_A;
  if (strcmp(varname,"transactor_B") == 0)
    xlator_p = &transactor_B;
  if (strcmp(varname,"transactor_C") == 0)
    xlator_p = &transactor_C;
  if (xlator_p) {
    debug_attr_p = xlator_p->get_attribute("MC_TRANSACTOR_EVENT");
    if (!debug_attr_p) {
      debug_attr_p = new sc_attribute<int>("MC_TRANSACTOR_EVENT",flags);
      xlator_p->add_attribute(*debug_attr_p);
    }
    ((sc_attribute<int>*)debug_attr_p)->value = flags;
  }

  if (count>=0) {
    debug_attr_p = xlator_p->get_attribute("MC_TRANSACTOR_COUNT");
    if (!debug_attr_p) {
      debug_attr_p = new sc_attribute<int>("MC_TRANSACTOR_COUNT",count);
      xlator_p->add_attribute(*debug_attr_p);
    }
    ((sc_attribute<int>*)debug_attr_p)->value = count;
  }
}

// Process: SC_METHOD generate_reset
void scverify_top::generate_reset() {
  static bool activate_reset = true;
  static bool toggle_hw_reset = false;
  if (activate_reset || sc_time_stamp() == SC_ZERO_TIME) {
    setup_debug();
    activate_reset = false;
    rst.write(SC_LOGIC_1);
    rst_driver.reset_driver();
    generate_reset_event.notify(10.000000 , SC_NS);
  } else {
    if (toggle_hw_reset) {
      toggle_hw_reset = false;
      generate_reset_event.notify(10.000000 , SC_NS);
    } else {
      transactor_A.reset_streams();
      transactor_B.reset_streams();
      transactor_C.reset_streams();
      rst.write(SC_LOGIC_0);
    }
    activate_reset = true;
  }
}

void scverify_top::install_observe_foreign_signals() {
#if !defined(CCS_DUT_SYSC) && defined(DEADLOCK_DETECTION)
#if defined(CCS_DUT_CYCLE) || defined(CCS_DUT_RTL)
#endif
#endif
}

void scverify_top::deadlock_watch() {
#if !defined(CCS_DUT_SYSC) && defined(DEADLOCK_DETECTION)
#if defined(CCS_DUT_CYCLE) || defined(CCS_DUT_RTL)
#if defined(MTI_SYSTEMC) || defined(NCSC) || defined(VCS_SYSTEMC)
#endif
#endif
#endif
}

void scverify_top::deadlock_notify() {
  if (deadlocked.read() == SC_LOGIC_1) {
    testbench_INST.check_results();
    SC_REPORT_ERROR("System", "Simulation deadlock detected");
    sc_stop();
  }
}

#if defined(MC_SIMULATOR_OSCI) || defined(MC_SIMULATOR_VCS)
int sc_main(int argc, char *argv[]) {
  sc_report_handler::set_actions("/IEEE_Std_1666/deprecated", SC_DO_NOTHING);
  scverify_top scverify_top("scverify_top");
  sc_start();
  return scverify_top.testbench_INST.failed();
}
#else
MC_MODULE_EXPORT(scverify_top);
#endif
