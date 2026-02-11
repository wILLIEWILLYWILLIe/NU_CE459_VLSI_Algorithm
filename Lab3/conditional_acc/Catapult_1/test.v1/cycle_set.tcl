
# Loop constraints
directive set /test/core/core:rlp CSTEPS_FROM {{. == 1}}
directive set /test/core/core:rlp/main CSTEPS_FROM {{. == 4} {.. == 1}}

# IO operation constraints
directive set /test/core/core:rlp/main/io_read(a_in) CSTEPS_FROM {{.. == 0}}
directive set /test/core/core:rlp/main/io_read(b_in) CSTEPS_FROM {{.. == 0}}
directive set /test/core/core:rlp/main/io_read(valid_in.data:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/io_write(result) CSTEPS_FROM {{.. == 3}}

# Sync operation constraints

# Real operation constraints
directive set /test/core/core:rlp/main/MAC-1:qif:mul CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC-2:qif:mul CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC-3:qif:mul CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC-4:qif:mul CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC-5:qif:mul CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC-6:qif:mul CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC-7:qif:mul CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC-8:qif:mul CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC-9:qif:mul CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC-10:qif:mul CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC-11:qif:mul CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC-12:qif:mul CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC-13:qif:mul CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC-14:qif:mul CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC-15:qif:mul CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC-16:qif:mul CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC:MAC:and#14 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC:MAC:and#15 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC:acc#16 CSTEPS_FROM {{.. == 2}}
directive set /test/core/core:rlp/main/MAC:MAC:and#12 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC:MAC:and#13 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC:acc#15 CSTEPS_FROM {{.. == 2}}
directive set /test/core/core:rlp/main/MAC:acc#20 CSTEPS_FROM {{.. == 2}}
directive set /test/core/core:rlp/main/MAC:MAC:and#10 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC:MAC:and#11 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC:acc#14 CSTEPS_FROM {{.. == 2}}
directive set /test/core/core:rlp/main/MAC:MAC:and#8 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC:MAC:and#9 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC:acc#13 CSTEPS_FROM {{.. == 2}}
directive set /test/core/core:rlp/main/MAC:acc#19 CSTEPS_FROM {{.. == 2}}
directive set /test/core/core:rlp/main/MAC:acc#22 CSTEPS_FROM {{.. == 3}}
directive set /test/core/core:rlp/main/MAC:MAC:and#6 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC:MAC:and#7 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC:acc#12 CSTEPS_FROM {{.. == 2}}
directive set /test/core/core:rlp/main/MAC:MAC:and#4 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC:MAC:and#5 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC:acc#11 CSTEPS_FROM {{.. == 2}}
directive set /test/core/core:rlp/main/MAC:acc#18 CSTEPS_FROM {{.. == 2}}
directive set /test/core/core:rlp/main/MAC:MAC:and#2 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC:MAC:and#3 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC:acc#10 CSTEPS_FROM {{.. == 2}}
directive set /test/core/core:rlp/main/MAC:MAC:and CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC:MAC:and#1 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC:acc#17 CSTEPS_FROM {{.. == 2}}
directive set /test/core/core:rlp/main/MAC:acc#21 CSTEPS_FROM {{.. == 2}}
directive set /test/core/core:rlp/main/MAC:acc CSTEPS_FROM {{.. == 3}}
directive set /test/core/core:rlp/main/MAC-16:acc#1 CSTEPS_FROM {{.. == 3}}

# Probe constraints
