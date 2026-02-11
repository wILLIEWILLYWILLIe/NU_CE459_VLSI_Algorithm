
# Loop constraints
directive set /test_orig/core/core:rlp CSTEPS_FROM {{. == 1}}
directive set /test_orig/core/core:rlp/main CSTEPS_FROM {{. == 10} {.. == 1}}

# IO operation constraints
directive set /test_orig/core/core:rlp/main/io_read(a_in) CSTEPS_FROM {{.. == 0}}
directive set /test_orig/core/core:rlp/main/io_read(b_in) CSTEPS_FROM {{.. == 0}}
directive set /test_orig/core/core:rlp/main/io_read(valid_in.data:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/io_write(result) CSTEPS_FROM {{.. == 9}}

# Sync operation constraints

# Real operation constraints
directive set /test_orig/core/core:rlp/main/MAC-1:if:mul CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/MAC:MAC:and CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/MAC-2:if:mul CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/MAC-2:if:acc CSTEPS_FROM {{.. == 2}}
directive set /test_orig/core/core:rlp/main/MAC:mux#1 CSTEPS_FROM {{.. == 2}}
directive set /test_orig/core/core:rlp/main/MAC-3:if:mul CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/MAC-3:if:acc CSTEPS_FROM {{.. == 2}}
directive set /test_orig/core/core:rlp/main/MAC:mux#2 CSTEPS_FROM {{.. == 2}}
directive set /test_orig/core/core:rlp/main/MAC-4:if:mul CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/MAC-4:if:acc CSTEPS_FROM {{.. == 3}}
directive set /test_orig/core/core:rlp/main/MAC:mux#3 CSTEPS_FROM {{.. == 3}}
directive set /test_orig/core/core:rlp/main/MAC-5:if:mul CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/MAC-5:if:acc CSTEPS_FROM {{.. == 3}}
directive set /test_orig/core/core:rlp/main/MAC:mux#4 CSTEPS_FROM {{.. == 3}}
directive set /test_orig/core/core:rlp/main/MAC-6:if:mul CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/MAC-6:if:acc CSTEPS_FROM {{.. == 4}}
directive set /test_orig/core/core:rlp/main/MAC:mux#5 CSTEPS_FROM {{.. == 4}}
directive set /test_orig/core/core:rlp/main/MAC-7:if:mul CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/MAC-7:if:acc CSTEPS_FROM {{.. == 4}}
directive set /test_orig/core/core:rlp/main/MAC:mux#6 CSTEPS_FROM {{.. == 4}}
directive set /test_orig/core/core:rlp/main/MAC-8:if:mul CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/MAC-8:if:acc CSTEPS_FROM {{.. == 5}}
directive set /test_orig/core/core:rlp/main/MAC:mux#7 CSTEPS_FROM {{.. == 5}}
directive set /test_orig/core/core:rlp/main/MAC-9:if:mul CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/MAC-9:if:acc CSTEPS_FROM {{.. == 5}}
directive set /test_orig/core/core:rlp/main/MAC:mux#8 CSTEPS_FROM {{.. == 5}}
directive set /test_orig/core/core:rlp/main/MAC-10:if:mul CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/MAC-10:if:acc CSTEPS_FROM {{.. == 6}}
directive set /test_orig/core/core:rlp/main/MAC:mux#9 CSTEPS_FROM {{.. == 6}}
directive set /test_orig/core/core:rlp/main/MAC-11:if:mul CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/MAC-11:if:acc CSTEPS_FROM {{.. == 6}}
directive set /test_orig/core/core:rlp/main/MAC:mux#10 CSTEPS_FROM {{.. == 6}}
directive set /test_orig/core/core:rlp/main/MAC-12:if:mul CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/MAC-12:if:acc CSTEPS_FROM {{.. == 7}}
directive set /test_orig/core/core:rlp/main/MAC:mux#11 CSTEPS_FROM {{.. == 7}}
directive set /test_orig/core/core:rlp/main/MAC-13:if:mul CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/MAC-13:if:acc CSTEPS_FROM {{.. == 7}}
directive set /test_orig/core/core:rlp/main/MAC:mux#12 CSTEPS_FROM {{.. == 7}}
directive set /test_orig/core/core:rlp/main/MAC-14:if:mul CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/MAC-14:if:acc CSTEPS_FROM {{.. == 8}}
directive set /test_orig/core/core:rlp/main/MAC:mux#13 CSTEPS_FROM {{.. == 8}}
directive set /test_orig/core/core:rlp/main/MAC-15:if:mul CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/MAC-15:if:acc CSTEPS_FROM {{.. == 8}}
directive set /test_orig/core/core:rlp/main/MAC:mux#14 CSTEPS_FROM {{.. == 8}}
directive set /test_orig/core/core:rlp/main/MAC-16:if:mul CSTEPS_FROM {{.. == 1}}
directive set /test_orig/core/core:rlp/main/MAC-16:if:acc CSTEPS_FROM {{.. == 9}}
directive set /test_orig/core/core:rlp/main/MAC:mux#15 CSTEPS_FROM {{.. == 9}}

# Probe constraints
