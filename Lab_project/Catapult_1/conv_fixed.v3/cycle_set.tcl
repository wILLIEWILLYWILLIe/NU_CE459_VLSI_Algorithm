
# Loop constraints
directive set /conv_fixed/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /conv_fixed/core/core:rlp/main CSTEPS_FROM {{. == 3} {.. == 0}}

# IO operation constraints
directive set /conv_fixed/core/core:rlp/main/sum:io_read(filter:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/sum:io_read(input:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/io_write(output:rsc.@) CSTEPS_FROM {{.. == 2}}

# Sync operation constraints

# Real operation constraints
directive set /conv_fixed/core/core:rlp/main/sum-8:mul CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/sum-9:mul CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/acc#8 CSTEPS_FROM {{.. == 2}}
directive set /conv_fixed/core/core:rlp/main/sum-1:mul CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/acc#12 CSTEPS_FROM {{.. == 2}}
directive set /conv_fixed/core/core:rlp/main/sum-2:mul CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/sum-3:mul CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/acc#11 CSTEPS_FROM {{.. == 2}}
directive set /conv_fixed/core/core:rlp/main/acc#14 CSTEPS_FROM {{.. == 2}}
directive set /conv_fixed/core/core:rlp/main/sum-4:mul CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/sum-5:mul CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/acc#10 CSTEPS_FROM {{.. == 2}}
directive set /conv_fixed/core/core:rlp/main/sum-6:mul CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/sum-7:mul CSTEPS_FROM {{.. == 1}}
directive set /conv_fixed/core/core:rlp/main/acc#9 CSTEPS_FROM {{.. == 2}}
directive set /conv_fixed/core/core:rlp/main/acc#13 CSTEPS_FROM {{.. == 2}}
directive set /conv_fixed/core/core:rlp/main/acc CSTEPS_FROM {{.. == 2}}

# Probe constraints
