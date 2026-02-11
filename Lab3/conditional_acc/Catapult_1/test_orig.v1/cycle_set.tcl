
# Loop constraints
directive set /test_orig/core/core:rlp CSTEPS_FROM {{. == 1}}
directive set /test_orig/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 1}}
directive set /test_orig/core/core:rlp/main/MAC CSTEPS_FROM {{. == 2} {.. == 1}}

# IO operation constraints
directive set /test_orig/core/core:rlp/main/io_read(a_in) CSTEPS_FROM {{.. == 0}}
directive set /test_orig/core/core:rlp/main/io_read(b_in) CSTEPS_FROM {{.. == 0}}
directive set /test_orig/core/core:rlp/main/io_read(valid_in.data:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/io_write(result) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /test_orig/core/core:rlp/main/MAC/MAC:if:mux CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/MAC/MAC:if:mux#1 CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/MAC/MAC:if:mux#2 CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/MAC/MAC:if:mul CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/MAC/MAC:if:acc CSTEPS_FROM {{.. == 2}}
directive set /test_orig/core/core:rlp/main/MAC/MAC:mux CSTEPS_FROM {{.. == 2}}
directive set /test_orig/core/core:rlp/main/MAC/MAC:acc#1 CSTEPS_FROM {{.. == 1}}

# Probe constraints
