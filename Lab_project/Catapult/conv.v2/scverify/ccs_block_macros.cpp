void mc_testbench_capture_IN( signed short input[9],  signed short *output,  signed short filter[9]) { mc_testbench::capture_IN(input,output,filter); }
void mc_testbench_capture_OUT( signed short input[9],  signed short *output,  signed short filter[9]) { mc_testbench::capture_OUT(input,output,filter); }
void mc_testbench_wait_for_idle_sync() {mc_testbench::wait_for_idle_sync(); }

