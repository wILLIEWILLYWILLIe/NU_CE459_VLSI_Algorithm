
# Loop constraints
directive set /conv_fixed/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /conv_fixed/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}

# IO operation constraints
directive set /conv_fixed/core/core:rlp/main/sum:io_read(filter:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/sum:io_read(input:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/io_write(output:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /conv_fixed/core/core:rlp/main/sum:sum:and#1 CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/sum:mux#19 CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/sum:mux#20 CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/sum:mul CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/sum:mux CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/sum:mux#1 CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/sum:mux#2 CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/sum:mux#3 CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/sum:mux#4 CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/sum:mux#5 CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/sum:mux#6 CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/sum:mux#7 CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/sum:acc CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/acc#8 CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/acc#12 CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/acc#11 CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/acc#14 CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/acc#10 CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/acc#9 CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/acc#13 CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/acc CSTEPS_FROM {{.. == 1}}

# Probe constraints
