#Lab4 - Unrolled
solution new -state initial
solution options defaults
flow package require /SCVerify
flow package option set /SCVerify/USE_CCS_BLOCK true
flow package option set /SCVerify/USE_NCSIM true
flow package option set /SCVerify/USE_VCS true
solution options set /Output/GenerateCycleNetlist false
solution file add ./matmul.cpp -type C++
directive set -DESIGN_GOAL area
directive set -SPECULATE true
directive set -MERGEABLE true
directive set -REGISTER_THRESHOLD 256
directive set -MEM_MAP_THRESHOLD 32
directive set -LOGIC_OPT false
directive set -FSM_ENCODING none
directive set -FSM_BINARY_ENCODING_THRESHOLD 64
directive set -REG_MAX_FANOUT 0
directive set -NO_X_ASSIGNMENTS true
directive set -SAFE_FSM false
directive set -REGISTER_SHARING_MAX_WIDTH_DIFFERENCE 8
directive set -REGISTER_SHARING_LIMIT 0
directive set -ASSIGN_OVERHEAD 0
directive set -TIMING_CHECKS true
directive set -MUXPATH true
directive set -REALLOC true
directive set -UNROLL no
directive set -IO_MODE super
directive set -CHAN_IO_PROTOCOL standard
directive set -ARRAY_SIZE 1024
directive set -REGISTER_IDLE_SIGNAL false
directive set -IDLE_SIGNAL {}
directive set -STALL_FLAG false
directive set -TRANSACTION_DONE_SIGNAL true
directive set -DONE_FLAG {}
directive set -READY_FLAG {}
directive set -START_FLAG {}
directive set -BLOCK_SYNC none
directive set -TRANSACTION_SYNC ready
directive set -DATA_SYNC none
directive set -RESET_CLEARS_ALL_REGS true
directive set -CLOCK_OVERHEAD 20.000000
directive set -OPT_CONST_MULTS use_library
directive set -CHARACTERIZE_ROM false
directive set -PROTOTYPE_ROM true
directive set -ROM_THRESHOLD 64
directive set -CLUSTER_ADDTREE_IN_COUNT_THRESHOLD 0
directive set -CLUSTER_OPT_CONSTANT_INPUTS true
directive set -CLUSTER_RTL_SYN false
directive set -CLUSTER_FAST_MODE false
directive set -CLUSTER_TYPE combinational
directive set -COMPGRADE fast
directive set -PIPELINE_RAMP_UP true
go new
directive set -DESIGN_HIERARCHY matrix_mul
go compile
solution library add nangate-45nm_beh -file {$MGC_HOME/pkgs/siflibs/nangate/nangate-45nm_beh.lib} -- -rtlsyntool OasysRTL
solution library add ccs_sample_mem -file {$MGC_HOME/pkgs/siflibs/ccs_sample_mem.lib}
go libraries
directive set -CLOCKS {clk {-CLOCK_PERIOD 5.0 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 2.5 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND sync -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_ACTIVE high}}
go assembly

# Map arrays to memory
directive set /matrix_mul/A:rsc -MAP_TO_MODULE ccs_sample_mem.ccs_ram_sync_singleport
directive set /matrix_mul/B:rsc -MAP_TO_MODULE ccs_sample_mem.ccs_ram_sync_singleport
directive set /matrix_mul/C:rsc -MAP_TO_MODULE ccs_sample_mem.ccs_ram_sync_singleport

# --- Optimization Strategy: Loop Unrolling ---
# Unrolling the innermost loop (k) fully allows parallel MAC operations.
# However, fully unrolling k=32 requires 32 reads from A and 32 reads from B per cycle.
# Standard single-port RAMs only allow 1 read per cycle.
# So we must be careful.
#
# Strategy 1: Partial Unroll + Pipeline
# We will pipeline the outer loops to II=1 and unroll the inner loop (k)
# To support unrolling, we might need array partitioning or banking, 
# but here we will try unrolling 'k' to see if Catapult can schedule it.
# 
# Actually, the most common high-performance strategy for Matrix Mul is:
# Pipeline the 'main' loop (which covers i and j) and unroll 'k'.
# Let's try unrolling the k-loop.
# The loops are:
#   i-loop
#     j-loop
#       k-loop (inner)
#
# Path to loops: /matrix_mul/core/for:for:for (the k loop)
# Actually in C++:
# for (int i...) -> /matrix_mul/core/for
#   for (int j...) -> /matrix_mul/core/for:for
#     for (int k...) -> /matrix_mul/core/for:for:for

directive set /matrix_mul/core/for:for:for -UNROLL yes
directive set /matrix_mul/core/main -PIPELINE_INIT_INTERVAL 1

go extract

