void mc_testbench_capture_IN( ac_channel<pack<ac_int<8, true > > > &a_in,  ac_channel<pack<ac_int<8, true > > > &b_in, pack<bool > valid_in,  ac_channel<ac_int<20, true > > &result) { mc_testbench::capture_IN(a_in,b_in,valid_in,result); }
void mc_testbench_capture_OUT( ac_channel<pack<ac_int<8, true > > > &a_in,  ac_channel<pack<ac_int<8, true > > > &b_in, pack<bool > valid_in,  ac_channel<ac_int<20, true > > &result) { mc_testbench::capture_OUT(a_in,b_in,valid_in,result); }
void mc_testbench_wait_for_idle_sync() {mc_testbench::wait_for_idle_sync(); }

