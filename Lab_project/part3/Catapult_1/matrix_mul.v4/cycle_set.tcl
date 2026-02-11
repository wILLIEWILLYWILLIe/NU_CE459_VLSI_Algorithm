
# Loop constraints
directive set /matrix_mul/core/core:rlp CSTEPS_FROM {{. == 1}}
directive set /matrix_mul/core/core:rlp/main CSTEPS_FROM {{. == 3} {.. == 1}}

# IO operation constraints

# Sync operation constraints

# Real operation constraints
directive set /matrix_mul/core/core:rlp/main/for:for:and#3 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:and#4 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:and#5 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:for:and#1 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:read_mem(A:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:read_mem(B:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/main-1:for:for:for:mul CSTEPS_FROM {{.. == 2}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:for:and CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/main-1:for:for:for:acc#7 CSTEPS_FROM {{.. == 2}}
directive set /matrix_mul/core/core:rlp/main/main-1:for:for:for:acc#3 CSTEPS_FROM {{.. == 2}}
directive set /matrix_mul/core/core:rlp/main/main-1:for:for:for:acc#4 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:write_mem(C:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /matrix_mul/core/core:rlp/main/main-1:for:for:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:for:for:for:and CSTEPS_FROM {{.. == 2}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:for:for:for:and#1 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:mux CSTEPS_FROM {{.. == 2}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:mux#3 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:mux#4 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/main-1:for:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:for:and#2 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:mux#6 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:and#7 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:and#8 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:for:and#5 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:read_mem(A:rsc.@)#1 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:read_mem(B:rsc.@)#1 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/main-2:for:for:for:mul CSTEPS_FROM {{.. == 2}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:for:and#4 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/main-2:for:for:for:acc#7 CSTEPS_FROM {{.. == 2}}
directive set /matrix_mul/core/core:rlp/main/main-2:for:for:for:acc#3 CSTEPS_FROM {{.. == 2}}
directive set /matrix_mul/core/core:rlp/main/main-2:for:for:for:acc#4 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:write_mem(C:rsc.@)#1 CSTEPS_FROM {{.. == 2}}
directive set /matrix_mul/core/core:rlp/main/main-2:for:for:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:for:for:for:and#3 CSTEPS_FROM {{.. == 2}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:for:for:for:and#4 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:mux#10 CSTEPS_FROM {{.. == 2}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:mux#11 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:mux#12 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/main-2:for:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:for:for:and#6 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:mux#14 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:and#10 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:mux1h#16 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:mux#16 CSTEPS_FROM {{.. == 2}}
directive set /matrix_mul/core/core:rlp/main/for:mux1h#3 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:mux1h#4 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:mux#19 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:mux#20 CSTEPS_FROM {{.. == 2}}
directive set /matrix_mul/core/core:rlp/main/for:for:mux#23 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:mux#24 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:mux#25 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:mux1h#17 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mul/core/core:rlp/main/for:for:mux#30 CSTEPS_FROM {{.. == 1}}

# Probe constraints
