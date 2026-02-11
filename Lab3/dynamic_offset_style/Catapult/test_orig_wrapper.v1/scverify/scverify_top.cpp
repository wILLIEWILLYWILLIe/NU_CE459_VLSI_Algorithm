#include <string>
#include <fstream>
#include <iostream>
#include "mc_testbench.h"
#include <mc_reset.h>
#include <mc_transactors.h>
#include <mc_scverify.h>
#include <mc_stall_ctrl.h>
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
#define TOP_HDL_ENTITY test_orig_wrapper
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
  sc_signal<sc_logic>                                         rst;
  sc_signal<sc_logic>                                         rst_n;
  sc_signal<sc_logic>                                         SIG_SC_LOGIC_0;
  sc_signal<sc_logic>                                         SIG_SC_LOGIC_1;
  sc_signal<sc_logic>                                         TLS_design_is_idle;
  sc_signal<bool>                                             TLS_design_is_idle_reg;
  sc_clock                                                    clk;
  mc_programmable_reset                                       rst_driver;
  sc_signal<sc_logic>                                         TLS_rst;
  sc_signal<sc_lv<1280> >                                     TLS_din_in_rsc_dat;
  sc_signal<sc_logic>                                         TLS_din_in_rsc_triosy_lz;
  sc_signal<sc_lv<6> >                                        TLS_offset_rsc_dat;
  sc_signal<sc_logic>                                         TLS_offset_rsc_triosy_lz;
  sc_signal<sc_lv<1280> >                                     TLS_dout_rsc_dat;
  sc_signal<sc_logic>                                         TLS_dout_rsc_triosy_lz;
  ccs_DUT_wrapper                                             test_orig_wrapper_INST;
  ccs_in_trans_rsc_v1<1,1280 >                                din_in_rsc_INST;
  ccs_in_trans_rsc_v1<1,6 >                                   offset_rsc_INST;
  ccs_out_trans_rsc_v1<1,1280 >                               dout_rsc_INST;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<int,40> >                TLS_in_fifo_din_in;
  tlm::tlm_fifo<mc_wait_ctrl>                                 TLS_in_wait_ctrl_fifo_din_in;
  mc_trios_input_monitor                                      trios_monitor_din_in_rsc_triosy_lz_INST;
  mc_input_transactor<mgc_sysc_ver_array1D<int,40>,32,true>   transactor_din_in;
  tlm::tlm_fifo<ac_int<6, false > >                           TLS_in_fifo_offset;
  tlm::tlm_fifo<mc_wait_ctrl>                                 TLS_in_wait_ctrl_fifo_offset;
  mc_trios_input_monitor                                      trios_monitor_offset_rsc_triosy_lz_INST;
  mc_input_transactor<ac_int<6, false >,6,false>              transactor_offset;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<int,40> >                TLS_out_fifo_dout;
  tlm::tlm_fifo<mc_wait_ctrl>                                 TLS_out_wait_ctrl_fifo_dout;
  mc_trios_output_monitor                                     trios_monitor_dout_rsc_triosy_lz_INST;
  mc_output_transactor<mgc_sysc_ver_array1D<int,40>,32,true>  transactor_dout;
  mc_testbench                                                testbench_INST;
  sc_signal<sc_logic>                                         catapult_start;
  sc_signal<sc_logic>                                         catapult_done;
  sc_signal<sc_logic>                                         catapult_ready;
  sc_signal<sc_logic>                                         in_sync;
  sc_signal<sc_logic>                                         out_sync;
  sc_signal<sc_logic>                                         inout_sync;
  sc_signal<unsigned>                                         wait_for_init;
  sync_generator                                              sync_generator_INST;
  catapult_monitor                                            catapult_monitor_INST;
  ccs_probe_monitor                                          *ccs_probe_monitor_INST;
  sc_event                                                    generate_reset_event;
  sc_event                                                    deadlock_event;
  sc_signal<sc_logic>                                         deadlocked;
  sc_signal<sc_logic>                                         maxsimtime;
  sc_event                                                    max_sim_time_event;
  sc_signal<sc_logic>                                         TLS_enable_stalls;
  sc_signal<unsigned short>                                   TLS_stall_coverage;

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
    , CCS_CLK_CTOR(clk, "clk", 2, SC_NS, 0.5, 0, SC_NS, false)
    , rst_driver("rst_driver", 4.000000, false)
    , TLS_rst("TLS_rst")
    , TLS_din_in_rsc_dat("TLS_din_in_rsc_dat")
    , TLS_din_in_rsc_triosy_lz("TLS_din_in_rsc_triosy_lz")
    , TLS_offset_rsc_dat("TLS_offset_rsc_dat")
    , TLS_offset_rsc_triosy_lz("TLS_offset_rsc_triosy_lz")
    , TLS_dout_rsc_dat("TLS_dout_rsc_dat")
    , TLS_dout_rsc_triosy_lz("TLS_dout_rsc_triosy_lz")
    , test_orig_wrapper_INST("rtl", TO_QUOTED_STRING(TOP_HDL_ENTITY))
    , din_in_rsc_INST("din_in_rsc", true)
    , offset_rsc_INST("offset_rsc", true)
    , dout_rsc_INST("dout_rsc", true)
    , TLS_in_fifo_din_in("TLS_in_fifo_din_in", -1)
    , TLS_in_wait_ctrl_fifo_din_in("TLS_in_wait_ctrl_fifo_din_in", -1)
    , trios_monitor_din_in_rsc_triosy_lz_INST("trios_monitor_din_in_rsc_triosy_lz_INST")
    , transactor_din_in("transactor_din_in", 0, 1280, 0)
    , TLS_in_fifo_offset("TLS_in_fifo_offset", -1)
    , TLS_in_wait_ctrl_fifo_offset("TLS_in_wait_ctrl_fifo_offset", -1)
    , trios_monitor_offset_rsc_triosy_lz_INST("trios_monitor_offset_rsc_triosy_lz_INST")
    , transactor_offset("transactor_offset", 0, 6, 0)
    , TLS_out_fifo_dout("TLS_out_fifo_dout", -1)
    , TLS_out_wait_ctrl_fifo_dout("TLS_out_wait_ctrl_fifo_dout", -1)
    , trios_monitor_dout_rsc_triosy_lz_INST("trios_monitor_dout_rsc_triosy_lz_INST")
    , transactor_dout("transactor_dout", 0, 1280, 0)
    , testbench_INST("user_tb")
    , catapult_start("catapult_start")
    , catapult_done("catapult_done")
    , catapult_ready("catapult_ready")
    , in_sync("in_sync")
    , out_sync("out_sync")
    , inout_sync("inout_sync")
    , wait_for_init("wait_for_init")
    , sync_generator_INST("sync_generator", true, false, false, false, 2, 2, 0)
    , catapult_monitor_INST("Monitor", clk, true, 2LL, 1LL)
    , ccs_probe_monitor_INST(NULL)
    , deadlocked("deadlocked")
    , maxsimtime("maxsimtime")
  {
    rst_driver.reset_out(TLS_rst);

    test_orig_wrapper_INST.clk(clk);
    test_orig_wrapper_INST.rst(TLS_rst);
    test_orig_wrapper_INST.din_in_rsc_dat(TLS_din_in_rsc_dat);
    test_orig_wrapper_INST.din_in_rsc_triosy_lz(TLS_din_in_rsc_triosy_lz);
    test_orig_wrapper_INST.offset_rsc_dat(TLS_offset_rsc_dat);
    test_orig_wrapper_INST.offset_rsc_triosy_lz(TLS_offset_rsc_triosy_lz);
    test_orig_wrapper_INST.dout_rsc_dat(TLS_dout_rsc_dat);
    test_orig_wrapper_INST.dout_rsc_triosy_lz(TLS_dout_rsc_triosy_lz);

    din_in_rsc_INST.dat(TLS_din_in_rsc_dat);
    din_in_rsc_INST.clk(clk);
    din_in_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_1)));

    offset_rsc_INST.dat(TLS_offset_rsc_dat);
    offset_rsc_INST.clk(clk);
    offset_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_2)));

    dout_rsc_INST.dat(TLS_dout_rsc_dat);
    dout_rsc_INST.clk(clk);
    dout_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_3)));

    trios_monitor_din_in_rsc_triosy_lz_INST.trios(TLS_din_in_rsc_triosy_lz);
    trios_monitor_din_in_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_din_in.in_fifo(TLS_in_fifo_din_in);
    transactor_din_in.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_din_in);
    transactor_din_in.bind_clk(clk, true, rst);
    transactor_din_in.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_din_in.register_block(&din_in_rsc_INST, din_in_rsc_INST.basename(), TLS_din_in_rsc_triosy_lz, 0,
        0, 1);

    trios_monitor_offset_rsc_triosy_lz_INST.trios(TLS_offset_rsc_triosy_lz);
    trios_monitor_offset_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_offset.in_fifo(TLS_in_fifo_offset);
    transactor_offset.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_offset);
    transactor_offset.bind_clk(clk, true, rst);
    transactor_offset.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_offset.register_block(&offset_rsc_INST, offset_rsc_INST.basename(), TLS_offset_rsc_triosy_lz, 0,
        0, 1);

    trios_monitor_dout_rsc_triosy_lz_INST.trios(TLS_dout_rsc_triosy_lz);
    trios_monitor_dout_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_dout.out_fifo(TLS_out_fifo_dout);
    transactor_dout.out_wait_ctrl_fifo(TLS_out_wait_ctrl_fifo_dout);
    transactor_dout.bind_clk(clk, true, rst);
    transactor_dout.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_dout.register_block(&dout_rsc_INST, dout_rsc_INST.basename(), TLS_dout_rsc_triosy_lz, 0, 0, 1);

    testbench_INST.clk(clk);
    testbench_INST.ccs_din_in(TLS_in_fifo_din_in);
    testbench_INST.ccs_wait_ctrl_din_in(TLS_in_wait_ctrl_fifo_din_in);
    testbench_INST.ccs_offset(TLS_in_fifo_offset);
    testbench_INST.ccs_wait_ctrl_offset(TLS_in_wait_ctrl_fifo_offset);
    testbench_INST.ccs_dout(TLS_out_fifo_dout);
    testbench_INST.ccs_wait_ctrl_dout(TLS_out_wait_ctrl_fifo_dout);
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
  din_in_rsc_INST.clear();
  offset_rsc_INST.clear();
  dout_rsc_INST.clear();
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
    transactor_din_in.set_auto_wait_limit(l);
    transactor_offset.set_auto_wait_limit(l);
    transactor_dout.set_auto_wait_limit(l);
  }
}

void scverify_top::setup_debug() {
#ifdef MC_DEFAULT_TRANSACTOR_LOG
  static int transactor_din_in_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_offset_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_dout_flags = MC_DEFAULT_TRANSACTOR_LOG;
#else
  static int transactor_din_in_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_offset_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_dout_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
#endif
  static int transactor_din_in_count = -1;
  static int transactor_offset_count = -1;
  static int transactor_dout_count = -1;

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
    debug("transactor_din_in",transactor_din_in_flags,transactor_din_in_count);
    debug("transactor_offset",transactor_offset_flags,transactor_offset_count);
    debug("transactor_dout",transactor_dout_flags,transactor_dout_count);
  }
}

void scverify_top::debug(const char* varname, int flags, int count) {
  sc_module *xlator_p = 0;
  sc_attr_base *debug_attr_p = 0;
  if (strcmp(varname,"transactor_din_in") == 0)
    xlator_p = &transactor_din_in;
  if (strcmp(varname,"transactor_offset") == 0)
    xlator_p = &transactor_offset;
  if (strcmp(varname,"transactor_dout") == 0)
    xlator_p = &transactor_dout;
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
    generate_reset_event.notify(4.000000 , SC_NS);
  } else {
    if (toggle_hw_reset) {
      toggle_hw_reset = false;
      generate_reset_event.notify(4.000000 , SC_NS);
    } else {
      transactor_din_in.reset_streams();
      transactor_offset.reset_streams();
      transactor_dout.reset_streams();
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
