void mc_testbench_capture_IN( ac_channel<ac_int<10, true > > &data_in,  ac_int<7, true > coeffs[32][4],  ac_channel<ac_int<5, false > > &coeff_addr,  ac_channel<ac_int<19, true > > &result) { mc_testbench::capture_IN(data_in,coeffs,coeff_addr,result); }
void mc_testbench_capture_OUT( ac_channel<ac_int<10, true > > &data_in,  ac_int<7, true > coeffs[32][4],  ac_channel<ac_int<5, false > > &coeff_addr,  ac_channel<ac_int<19, true > > &result) { mc_testbench::capture_OUT(data_in,coeffs,coeff_addr,result); }
void mc_testbench_wait_for_idle_sync() {mc_testbench::wait_for_idle_sync(); }

