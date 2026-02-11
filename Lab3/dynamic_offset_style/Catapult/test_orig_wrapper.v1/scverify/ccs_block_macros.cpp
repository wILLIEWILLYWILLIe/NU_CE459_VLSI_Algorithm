void mc_testbench_capture_IN( int din_in[40], ac_int<6, false > offset,  int dout[40]) { mc_testbench::capture_IN(din_in,offset,dout); }
void mc_testbench_capture_OUT( int din_in[40], ac_int<6, false > offset,  int dout[40]) { mc_testbench::capture_OUT(din_in,offset,dout); }
void mc_testbench_wait_for_idle_sync() {mc_testbench::wait_for_idle_sync(); }

