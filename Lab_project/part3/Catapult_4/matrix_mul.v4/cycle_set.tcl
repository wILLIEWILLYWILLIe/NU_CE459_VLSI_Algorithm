
# Loop constraints
directive set /matrix_mul/core/core:rlp CSTEPS_FROM {{. == 1}}
directive set /matrix_mul/core/core:rlp/main CSTEPS_FROM {{. == 4} {.. == 1}}

# IO operation constraints

# Sync operation constraints

# Real operation constraints
directive set /matrix_mul/core/core:rlp/main/for:for:and CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:and#2 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:for:and#1 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:read_mem(A:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:read_mem(B:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:mul CSTEPS_FROM {{.. == 2}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:for:and CSTEPS_FROM {{.. == 2}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:acc#7 CSTEPS_FROM {{.. == 3}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:acc#3 CSTEPS_FROM {{.. == 3}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:acc#4 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:write_mem(C:rsc.@) CSTEPS_FROM {{.. == 3}}
directive set /matrix_mul/core/core:rlp/main/for:for:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:for:for:for:and CSTEPS_FROM {{.. == 3}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:for:for:for:and#1 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:mux CSTEPS_FROM {{.. == 3}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:mux#3 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:mux#4 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:for:and#2 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:mux#5 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:mux#6 CSTEPS_FROM {{.. == 1}}

# Probe constraints
