
# Loop constraints
directive set /conv/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /conv/core/core:rlp/main CSTEPS_FROM {{. == 6} {.. == 0}}
directive set /conv/core/core:rlp/main/sum CSTEPS_FROM {{. == 1} {.. == 1}}

# IO operation constraints
directive set /conv/core/core:rlp/main/sum/sum:io_read(filter:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /conv/core/core:rlp/main/sum/sum:io_read(input:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /conv/core/core:rlp/main/io_write(output:rsc.@) CSTEPS_FROM {{.. == 5}}

# Sync operation constraints

# Real operation constraints
directive set /conv/core/core:rlp/main/sum/sum:mux#9 CSTEPS_FROM {{.. == 1}}
directive set /conv/core/core:rlp/main/sum/sum:mux#10 CSTEPS_FROM {{.. == 1}}
directive set /conv/core/core:rlp/main/sum/sum:sum:mul#1 CSTEPS_FROM {{.. == 1}}
directive set /conv/core/core:rlp/main/sum/sum:mux CSTEPS_FROM {{.. == 1}}
directive set /conv/core/core:rlp/main/sum/sum:mux#1 CSTEPS_FROM {{.. == 1}}
directive set /conv/core/core:rlp/main/sum/sum:mux#2 CSTEPS_FROM {{.. == 1}}
directive set /conv/core/core:rlp/main/sum/sum:mux#3 CSTEPS_FROM {{.. == 1}}
directive set /conv/core/core:rlp/main/sum/sum:mux#4 CSTEPS_FROM {{.. == 1}}
directive set /conv/core/core:rlp/main/sum/sum:mux#5 CSTEPS_FROM {{.. == 1}}
directive set /conv/core/core:rlp/main/sum/sum:mux#6 CSTEPS_FROM {{.. == 1}}
directive set /conv/core/core:rlp/main/sum/sum:mux#7 CSTEPS_FROM {{.. == 1}}
directive set /conv/core/core:rlp/main/sum/sum:acc CSTEPS_FROM {{.. == 1}}
directive set /conv/core/core:rlp/main/acc#9 CSTEPS_FROM {{.. == 2}}
directive set /conv/core/core:rlp/main/acc#13 CSTEPS_FROM {{.. == 3}}
directive set /conv/core/core:rlp/main/acc#12 CSTEPS_FROM {{.. == 2}}
directive set /conv/core/core:rlp/main/acc#15 CSTEPS_FROM {{.. == 4}}
directive set /conv/core/core:rlp/main/acc#11 CSTEPS_FROM {{.. == 2}}
directive set /conv/core/core:rlp/main/acc#10 CSTEPS_FROM {{.. == 2}}
directive set /conv/core/core:rlp/main/acc#14 CSTEPS_FROM {{.. == 3}}
directive set /conv/core/core:rlp/main/acc CSTEPS_FROM {{.. == 5}}

# Probe constraints
