void mc_testbench_capture_IN( ac_fixed<32, 18, true, AC_RND_CONV, AC_WRAP > A[32][32],  ac_fixed<32, 18, true, AC_RND_CONV, AC_WRAP > B[32][32],  ac_fixed<32, 18, true, AC_RND_CONV, AC_WRAP > C[32][32]) { mc_testbench::capture_IN(A,B,C); }
void mc_testbench_capture_OUT( ac_fixed<32, 18, true, AC_RND_CONV, AC_WRAP > A[32][32],  ac_fixed<32, 18, true, AC_RND_CONV, AC_WRAP > B[32][32],  ac_fixed<32, 18, true, AC_RND_CONV, AC_WRAP > C[32][32]) { mc_testbench::capture_OUT(A,B,C); }
void mc_testbench_wait_for_idle_sync() {mc_testbench::wait_for_idle_sync(); }

