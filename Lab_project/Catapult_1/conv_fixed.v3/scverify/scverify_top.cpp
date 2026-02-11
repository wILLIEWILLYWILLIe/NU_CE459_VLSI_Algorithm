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
#define TOP_HDL_ENTITY conv_fixed
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
  sc_signal<sc_logic>                                                                           rst;
  sc_signal<sc_logic>                                                                           rst_n;
  sc_signal<sc_logic>                                                                           SIG_SC_LOGIC_0;
  sc_signal<sc_logic>                                                                           SIG_SC_LOGIC_1;
  sc_signal<sc_logic>                                                                           TLS_design_is_idle;
  sc_signal<bool>                                                                               TLS_design_is_idle_reg;
  sc_clock                                                                                      clk;
  mc_programmable_reset                                                                         rst_driver;
  sc_signal<sc_logic>                                                                           TLS_rst;
  sc_signal<sc_lv<144> >                                                                        TLS_input_rsc_dat;
  sc_signal<sc_logic>                                                                           TLS_input_rsc_triosy_lz;
  sc_signal<sc_lv<16> >                                                                         TLS_output_rsc_dat;
  sc_signal<sc_logic>                                                                           TLS_output_rsc_triosy_lz;
  sc_signal<sc_lv<144> >                                                                        TLS_filter_rsc_dat;
  sc_signal<sc_logic>                                                                           TLS_filter_rsc_triosy_lz;
  ccs_DUT_wrapper                                                                               conv_fixed_INST;
  ccs_in_trans_rsc_v1<1,144 >                                                                   input_rsc_INST;
  ccs_out_trans_rsc_v1<1,16 >                                                                   output_rsc_INST;
  ccs_in_trans_rsc_v1<1,144 >                                                                   filter_rsc_INST;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_fixed<16, 8, true, AC_TRN, AC_WRAP >,9> >               TLS_in_fifo_input;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                   TLS_in_wait_ctrl_fifo_input;
  mc_trios_input_monitor                                                                        trios_monitor_input_rsc_triosy_lz_INST;
  mc_input_transactor<mgc_sysc_ver_array1D<ac_fixed<16, 8, true, AC_TRN, AC_WRAP >,9>,16,true>  transactor_input;
  tlm::tlm_fifo<ac_fixed<16, 8, true, AC_TRN, AC_WRAP > >                                       TLS_out_fifo_output;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                   TLS_out_wait_ctrl_fifo_output;
  mc_trios_output_monitor                                                                       trios_monitor_output_rsc_triosy_lz_INST;
  mc_output_transactor<ac_fixed<16, 8, true, AC_TRN, AC_WRAP >,16,true>                         transactor_output;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_fixed<16, 8, true, AC_TRN, AC_WRAP >,9> >               TLS_in_fifo_filter;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                   TLS_in_wait_ctrl_fifo_filter;
  mc_trios_input_monitor                                                                        trios_monitor_filter_rsc_triosy_lz_INST;
  mc_input_transactor<mgc_sysc_ver_array1D<ac_fixed<16, 8, true, AC_TRN, AC_WRAP >,9>,16,true>  transactor_filter;
  mc_testbench                                                                                  testbench_INST;
  sc_signal<sc_logic>                                                                           catapult_start;
  sc_signal<sc_logic>                                                                           catapult_done;
  sc_signal<sc_logic>                                                                           catapult_ready;
  sc_signal<sc_logic>                                                                           in_sync;
  sc_signal<sc_logic>                                                                           out_sync;
  sc_signal<sc_logic>                                                                           inout_sync;
  sc_signal<unsigned>                                                                           wait_for_init;
  sync_generator                                                                                sync_generator_INST;
  catapult_monitor                                                                              catapult_monitor_INST;
  ccs_probe_monitor                                                                            *ccs_probe_monitor_INST;
  sc_event                                                                                      generate_reset_event;
  sc_event                                                                                      deadlock_event;
  sc_signal<sc_logic>                                                                           deadlocked;
  sc_signal<sc_logic>                                                                           maxsimtime;
  sc_event                                                                                      max_sim_time_event;
  sc_signal<sc_logic>                                                                           TLS_enable_stalls;
  sc_signal<unsigned short>                                                                     TLS_stall_coverage;

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
    , CCS_CLK_CTOR(clk, "clk", 2.5, SC_NS, 0.5, 0, SC_NS, false)
    , rst_driver("rst_driver", 5.000000, false)
    , TLS_rst("TLS_rst")
    , TLS_input_rsc_dat("TLS_input_rsc_dat")
    , TLS_input_rsc_triosy_lz("TLS_input_rsc_triosy_lz")
    , TLS_output_rsc_dat("TLS_output_rsc_dat")
    , TLS_output_rsc_triosy_lz("TLS_output_rsc_triosy_lz")
    , TLS_filter_rsc_dat("TLS_filter_rsc_dat")
    , TLS_filter_rsc_triosy_lz("TLS_filter_rsc_triosy_lz")
    , conv_fixed_INST("rtl", TO_QUOTED_STRING(TOP_HDL_ENTITY))
    , input_rsc_INST("input_rsc", true)
    , output_rsc_INST("output_rsc", true)
    , filter_rsc_INST("filter_rsc", true)
    , TLS_in_fifo_input("TLS_in_fifo_input", -1)
    , TLS_in_wait_ctrl_fifo_input("TLS_in_wait_ctrl_fifo_input", -1)
    , trios_monitor_input_rsc_triosy_lz_INST("trios_monitor_input_rsc_triosy_lz_INST")
    , transactor_input("transactor_input", 0, 144, 0)
    , TLS_out_fifo_output("TLS_out_fifo_output", -1)
    , TLS_out_wait_ctrl_fifo_output("TLS_out_wait_ctrl_fifo_output", -1)
    , trios_monitor_output_rsc_triosy_lz_INST("trios_monitor_output_rsc_triosy_lz_INST")
    , transactor_output("transactor_output", 0, 16, 0)
    , TLS_in_fifo_filter("TLS_in_fifo_filter", -1)
    , TLS_in_wait_ctrl_fifo_filter("TLS_in_wait_ctrl_fifo_filter", -1)
    , trios_monitor_filter_rsc_triosy_lz_INST("trios_monitor_filter_rsc_triosy_lz_INST")
    , transactor_filter("transactor_filter", 0, 144, 0)
    , testbench_INST("user_tb")
    , catapult_start("catapult_start")
    , catapult_done("catapult_done")
    , catapult_ready("catapult_ready")
    , in_sync("in_sync")
    , out_sync("out_sync")
    , inout_sync("inout_sync")
    , wait_for_init("wait_for_init")
    , sync_generator_INST("sync_generator", true, false, false, false, 3, 3, 0)
    , catapult_monitor_INST("Monitor", clk, true, 3LL, 1LL)
    , ccs_probe_monitor_INST(NULL)
    , deadlocked("deadlocked")
    , maxsimtime("maxsimtime")
  {
    rst_driver.reset_out(TLS_rst);

    conv_fixed_INST.clk(clk);
    conv_fixed_INST.rst(TLS_rst);
    conv_fixed_INST.input_rsc_dat(TLS_input_rsc_dat);
    conv_fixed_INST.input_rsc_triosy_lz(TLS_input_rsc_triosy_lz);
    conv_fixed_INST.output_rsc_dat(TLS_output_rsc_dat);
    conv_fixed_INST.output_rsc_triosy_lz(TLS_output_rsc_triosy_lz);
    conv_fixed_INST.filter_rsc_dat(TLS_filter_rsc_dat);
    conv_fixed_INST.filter_rsc_triosy_lz(TLS_filter_rsc_triosy_lz);

    input_rsc_INST.dat(TLS_input_rsc_dat);
    input_rsc_INST.clk(clk);
    input_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_1)));

    output_rsc_INST.dat(TLS_output_rsc_dat);
    output_rsc_INST.clk(clk);
    output_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_2)));

    filter_rsc_INST.dat(TLS_filter_rsc_dat);
    filter_rsc_INST.clk(clk);
    filter_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_3)));

    trios_monitor_input_rsc_triosy_lz_INST.trios(TLS_input_rsc_triosy_lz);
    trios_monitor_input_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_input.in_fifo(TLS_in_fifo_input);
    transactor_input.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_input);
    transactor_input.bind_clk(clk, true, rst);
    transactor_input.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_input.register_block(&input_rsc_INST, input_rsc_INST.basename(), TLS_input_rsc_triosy_lz, 0, 0,
        1);

    trios_monitor_output_rsc_triosy_lz_INST.trios(TLS_output_rsc_triosy_lz);
    trios_monitor_output_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_output.out_fifo(TLS_out_fifo_output);
    transactor_output.out_wait_ctrl_fifo(TLS_out_wait_ctrl_fifo_output);
    transactor_output.bind_clk(clk, true, rst);
    transactor_output.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_output.register_block(&output_rsc_INST, output_rsc_INST.basename(), TLS_output_rsc_triosy_lz, 0,
        0, 1);

    trios_monitor_filter_rsc_triosy_lz_INST.trios(TLS_filter_rsc_triosy_lz);
    trios_monitor_filter_rsc_triosy_lz_INST.register_mon(&catapult_monitor_INST);

    transactor_filter.in_fifo(TLS_in_fifo_filter);
    transactor_filter.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_filter);
    transactor_filter.bind_clk(clk, true, rst);
    transactor_filter.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_filter.register_block(&filter_rsc_INST, filter_rsc_INST.basename(), TLS_filter_rsc_triosy_lz, 0,
        0, 1);

    testbench_INST.clk(clk);
    testbench_INST.ccs_input(TLS_in_fifo_input);
    testbench_INST.ccs_wait_ctrl_input(TLS_in_wait_ctrl_fifo_input);
    testbench_INST.ccs_output(TLS_out_fifo_output);
    testbench_INST.ccs_wait_ctrl_output(TLS_out_wait_ctrl_fifo_output);
    testbench_INST.ccs_filter(TLS_in_fifo_filter);
    testbench_INST.ccs_wait_ctrl_filter(TLS_in_wait_ctrl_fifo_filter);
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
  input_rsc_INST.clear();
  output_rsc_INST.clear();
  filter_rsc_INST.clear();
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
    transactor_input.set_auto_wait_limit(l);
    transactor_output.set_auto_wait_limit(l);
    transactor_filter.set_auto_wait_limit(l);
  }
}

void scverify_top::setup_debug() {
#ifdef MC_DEFAULT_TRANSACTOR_LOG
  static int transactor_input_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_output_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_filter_flags = MC_DEFAULT_TRANSACTOR_LOG;
#else
  static int transactor_input_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_output_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_filter_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
#endif
  static int transactor_input_count = -1;
  static int transactor_output_count = -1;
  static int transactor_filter_count = -1;

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
    debug("transactor_input",transactor_input_flags,transactor_input_count);
    debug("transactor_output",transactor_output_flags,transactor_output_count);
    debug("transactor_filter",transactor_filter_flags,transactor_filter_count);
  }
}

void scverify_top::debug(const char* varname, int flags, int count) {
  sc_module *xlator_p = 0;
  sc_attr_base *debug_attr_p = 0;
  if (strcmp(varname,"transactor_input") == 0)
    xlator_p = &transactor_input;
  if (strcmp(varname,"transactor_output") == 0)
    xlator_p = &transactor_output;
  if (strcmp(varname,"transactor_filter") == 0)
    xlator_p = &transactor_filter;
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
    generate_reset_event.notify(5.000000 , SC_NS);
  } else {
    if (toggle_hw_reset) {
      toggle_hw_reset = false;
      generate_reset_event.notify(5.000000 , SC_NS);
    } else {
      transactor_input.reset_streams();
      transactor_output.reset_streams();
      transactor_filter.reset_streams();
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
