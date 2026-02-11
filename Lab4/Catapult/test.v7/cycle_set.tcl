
# Loop constraints
directive set /test/core/core:rlp CSTEPS_FROM {{. == 1}}
directive set /test/core/core:rlp/main CSTEPS_FROM {{. == 3} {.. == 1}}

# IO operation constraints
directive set /test/core/core:rlp/main/addr:io_read(coeff_addr) CSTEPS_FROM {{.. == 0}}
directive set /test/core/core:rlp/main/SHIFT-4:if:io_read(data_in) CSTEPS_FROM {{.. == 0}}
directive set /test/core/core:rlp/main/io_write(result) CSTEPS_FROM {{.. == 2}}

# Sync operation constraints

# Real operation constraints
directive set /test/core/core:rlp/main/MAC:read_mem(coeffs:rsc(0)(2).@) CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC-3:mul CSTEPS_FROM {{.. == 2}}
directive set /test/core/core:rlp/main/MAC:read_mem(coeffs:rsc(0)(3).@)#1 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC-4:mul CSTEPS_FROM {{.. == 2}}
directive set /test/core/core:rlp/main/MAC:acc#4 CSTEPS_FROM {{.. == 2}}
directive set /test/core/core:rlp/main/MAC:read_mem(coeffs:rsc(0)(0).@)#2 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC-1:mul CSTEPS_FROM {{.. == 2}}
directive set /test/core/core:rlp/main/MAC:read_mem(coeffs:rsc(0)(1).@)#3 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/MAC-2:mul CSTEPS_FROM {{.. == 2}}
directive set /test/core/core:rlp/main/MAC:acc CSTEPS_FROM {{.. == 2}}
directive set /test/core/core:rlp/main/MAC-4:acc#2 CSTEPS_FROM {{.. == 2}}

# Probe constraints
