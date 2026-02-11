
# Loop constraints
directive set /matrix_mul/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /matrix_mul/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /matrix_mul/core/core:rlp/main/for CSTEPS_FROM {{. == 1} {.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for/for:for CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /matrix_mul/core/core:rlp/main/for/for:for/for:for:for CSTEPS_FROM {{. == 2} {.. == 0}}

# IO operation constraints
directive set /matrix_mul/core/core:rlp/main/for/for:for/for:for:for/for:for:for:io_read(A:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for/for:for/for:for:for/for:for:for:io_read(B:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /matrix_mul/core/core:rlp/main/for/for:for/for:for:for/for:for:for:mux CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for/for:for/for:for:for/for:for:for:mux#1 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for/for:for/for:for:for/for:for:for:mul CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for/for:for/for:for:for/for:for:for:acc#7 CSTEPS_FROM {{.. == 2}}
directive set /matrix_mul/core/core:rlp/main/for/for:for/for:for:for/for:for:for:acc#3 CSTEPS_FROM {{.. == 2}}
directive set /matrix_mul/core/core:rlp/main/for/for:for/for:for:for/for:for:for:acc#4 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for/for:for/for:for:write_mem(C:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for/for:for/for:for:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for/for:acc#1 CSTEPS_FROM {{.. == 1}}

# Probe constraints
