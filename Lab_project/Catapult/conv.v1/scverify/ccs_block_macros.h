// ccs_block_macros.h
#include "ccs_testbench.h"

#ifndef EXCLUDE_CCS_BLOCK_INTERCEPT
#ifndef INCLUDE_CCS_BLOCK_INTERCEPT
#define INCLUDE_CCS_BLOCK_INTERCEPT
#ifdef  CCS_DESIGN_FUNC_conv
extern void mc_testbench_capture_IN( signed short input[9],  signed short *output,  signed short filter[9]);
extern void mc_testbench_capture_OUT( signed short input[9],  signed short *output,  signed short filter[9]);
extern void mc_testbench_wait_for_idle_sync();

#define ccs_intercept_conv_2 \
  ccs_real_conv(signed short input[9],signed short *output,signed short filter[9]);\
  void conv(signed short input[9],signed short *output,signed short filter[9])\
{\
    static bool ccs_intercept_flag = false;\
    if (!ccs_intercept_flag) {\
      std::cout << "SCVerify intercepting C++ function 'conv' for RTL block 'conv'" << std::endl;\
      ccs_intercept_flag=true;\
    }\
    mc_testbench_capture_IN(input,output,filter);\
    ccs_real_conv(input,output,filter);\
    mc_testbench_capture_OUT(input,output,filter);\
}\
  void ccs_real_conv
#else
#define ccs_intercept_conv_2 conv
#endif //CCS_DESIGN_FUNC_conv
#endif //INCLUDE_CCS_BLOCK_INTERCEPT
#endif //EXCLUDE_CCS_BLOCK_INTERCEPT

