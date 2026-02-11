//  Catapult Ultra Synthesis 10.4a/835166 (Production Release) Thu Sep  5 21:35:46 PDT 2019
//  
//  Copyright (c) Mentor Graphics Corporation, 1996-2019, All Rights Reserved.
//                        UNPUBLISHED, LICENSED SOFTWARE.
//             CONFIDENTIAL AND PROPRIETARY INFORMATION WHICH IS THE
//                 PROPERTY OF MENTOR GRAPHICS OR ITS LICENSORS
//  
//  Running on Linux gel8580@finagle.wot.ece.northwestern.edu 4.18.0-553.78.1.el8_10.x86_64 x86_64 aol
//  
//  Package information: SIFLIBS v23.4_1.0, HLS_PKGS v23.4_1.0, 
//                       SIF_TOOLKITS v23.4_1.0, SIF_XILINX v23.4_1.0, 
//                       SIF_ALTERA v23.4_1.0, CCS_LIBS v23.4_1.0, 
//                       CDS_PPRO v10.3a_3, CDS_DesigChecker v10.4a, 
//                       CDS_OASYS v19.1_2.4, CDS_PSR v19.1_1.16, 
//                       DesignPad v2.78_1.0
//  
solution new -state initial
solution options defaults
solution options set /Output/GenerateCycleNetlist false
solution options set /Flows/SCVerify/USE_NCSIM true
solution options set /Flows/SCVerify/USE_VCS true
solution options set /Flows/SCVerify/USE_CCS_BLOCK true
solution file add ./test.cpp -type C++
solution file add ./tb.cpp -type C++ -exclude true
directive set -PIPELINE_RAMP_UP true
directive set -CLUSTER_TYPE combinational
directive set -CLUSTER_FAST_MODE false
directive set -CLUSTER_RTL_SYN false
directive set -CLUSTER_OPT_CONSTANT_INPUTS true
directive set -CLUSTER_ADDTREE_IN_COUNT_THRESHOLD 0
directive set -ROM_THRESHOLD 64
directive set -PROTOTYPE_ROM true
directive set -CHARACTERIZE_ROM false
directive set -OPT_CONST_MULTS use_library
directive set -CLOCK_OVERHEAD 20.000000
directive set -START_FLAG {}
directive set -READY_FLAG {}
directive set -DONE_FLAG {}
directive set -TRANSACTION_DONE_SIGNAL true
directive set -STALL_FLAG false
directive set -IDLE_SIGNAL {}
directive set -REGISTER_IDLE_SIGNAL false
directive set -ARRAY_SIZE 1024
directive set -IO_MODE super
directive set -UNROLL no
directive set -REALLOC true
directive set -MUXPATH true
directive set -TIMING_CHECKS true
directive set -ASSIGN_OVERHEAD 0
directive set -REGISTER_SHARING_LIMIT 0
directive set -REGISTER_SHARING_MAX_WIDTH_DIFFERENCE 8
directive set -SAFE_FSM false
directive set -NO_X_ASSIGNMENTS true
directive set -REG_MAX_FANOUT 0
directive set -FSM_BINARY_ENCODING_THRESHOLD 64
directive set -FSM_ENCODING none
directive set -LOGIC_OPT false
directive set -MEM_MAP_THRESHOLD 32
directive set -REGISTER_THRESHOLD 256
directive set -MERGEABLE true
directive set -SPECULATE true
directive set -DESIGN_GOAL area
directive set -CLUSTER_ADDTREE_IN_WIDTH_THRESHOLD 0
go new
directive set -DESIGN_HIERARCHY test
directive set -RESET_CLEARS_ALL_REGS yes
directive set -CHAN_IO_PROTOCOL standard
go analyze
solution library add nangate-45nm_beh -file {$MGC_HOME/pkgs/siflibs/nangate/nangate-45nm_beh.lib} -- -rtlsyntool OasysRTL
solution library add ccs_sample_mem -file {$MGC_HOME/pkgs/siflibs/ccs_sample_mem.lib}
go libraries
directive set -CLOCKS {clk {-CLOCK_PERIOD 3.33 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 1.665 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND sync -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_ACTIVE high}}
go assembly
directive set /test/core/MAC -UNROLL yes
directive set /test/coeffs:rsc -MAP_TO_MODULE ccs_sample_mem.ccs_ram_sync_singleport
directive set /test/core/main -PIPELINE_INIT_INTERVAL 1
go architect
go allocate
