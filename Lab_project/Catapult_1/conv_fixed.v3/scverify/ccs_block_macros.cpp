void mc_testbench_capture_IN( ac_fixed<16, 8, true, AC_TRN, AC_WRAP > input[9],  ac_fixed<16, 8, true, AC_TRN, AC_WRAP > *output,  ac_fixed<16, 8, true, AC_TRN, AC_WRAP > filter[9]) { mc_testbench::capture_IN(input,output,filter); }
void mc_testbench_capture_OUT( ac_fixed<16, 8, true, AC_TRN, AC_WRAP > input[9],  ac_fixed<16, 8, true, AC_TRN, AC_WRAP > *output,  ac_fixed<16, 8, true, AC_TRN, AC_WRAP > filter[9]) { mc_testbench::capture_OUT(input,output,filter); }
void mc_testbench_wait_for_idle_sync() {mc_testbench::wait_for_idle_sync(); }

