#Lab4
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
# Increase threshold to allow arrays to be mapped to registers for unrolling
directive set -REGISTER_THRESHOLD 4096
directive set -MEM_MAP_THRESHOLD 4096
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

# =============================================================================
#  Optimization Strategy Selection
#  Uncomment ONE block below to run that version.
# =============================================================================

# -----------------------------------------------------------------------------
#  Version 1: Baseline (No Unroll, No Pipeline)
#  - Uses Single-port RAMs (if threshold allows, but we set it high so likely Regs)
#  - Sequential execution. Very slow.
# -----------------------------------------------------------------------------
# directive set /matrix_mul/core/main -PIPELINE_INIT_INTERVAL 0
# directive set /matrix_mul/core/for:for:for -UNROLL no
# # Force mapping to RAM to demonstrate baseline constraints (optional)
directive set -REGISTER_THRESHOLD 256
directive set /matrix_mul/A:rsc -MAP_TO_MODULE ccs_sample_mem.ccs_ram_sync_singleport
directive set /matrix_mul/B:rsc -MAP_TO_MODULE ccs_sample_mem.ccs_ram_sync_singleport
directive set /matrix_mul/C:rsc -MAP_TO_MODULE ccs_sample_mem.ccs_ram_sync_singleport

# -----------------------------------------------------------------------------
#  Version 2: Loop Unrolling Only (No Pipeline)
#  - Unrolls inner loop 'k'.
#  - Arrays mapped to Registers (due to high threshold) to allow parallel access.
#  - Multipliers work in parallel, but outer loops are still sequential.
# -----------------------------------------------------------------------------
# directive set /matrix_mul/core/main -PIPELINE_INIT_INTERVAL 0
# directive set /matrix_mul/core/for:for:for -UNROLL yes

# -----------------------------------------------------------------------------
#  Version 3: Loop Unrolling + Pipeline (Optimal)
#  - Unrolls inner loop 'k'.
#  - Pipelines the outer loop execution (II=1).
#  - Fastest throughput.
# -----------------------------------------------------------------------------
# directive set /matrix_mul/core/main -PIPELINE_INIT_INTERVAL 1
# directive set /matrix_mul/core/for:for:for -UNROLL no
directive set /matrix_mul/core/main -PIPELINE_INIT_INTERVAL 0
directive set /matrix_mul/core/for:for:for -UNROLL no
directive set /matrix_mul/core/for:for -PIPELINE_INIT_INTERVAL 1


go extract
