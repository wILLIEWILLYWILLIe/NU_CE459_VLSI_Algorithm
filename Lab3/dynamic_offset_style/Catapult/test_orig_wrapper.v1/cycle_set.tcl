
# Loop constraints
directive set /test_orig_wrapper/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /test_orig_wrapper/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}

# IO operation constraints
directive set /test_orig_wrapper/core/core:rlp/main/offset:io_read(offset:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/for:io_read(din_in:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for#1:io_write(dout:rsc.@)#39 CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for-1:operator<<33,true>:acc CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#50 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator+<6,false>#1:acc CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#51 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#52 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator+<6,false>#1:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#53 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#54 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator+<6,false>#1:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#55 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#395 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#396 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#397 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#398 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#399 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#400 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#401 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#124 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#10 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#414 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#12 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator+<6,false>#1:acc#4 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#156 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#13 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#402 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#15 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator+<6,false>#1:acc#5 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#186 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#16 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#410 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#18 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator+<6,false>#1:acc#6 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#214 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#19 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#403 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator+<6,false>:acc#5 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#240 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#56 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#416 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#57 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator+<6,false>#1:acc#8 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#264 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#58 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#404 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#59 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator+<6,false>#1:acc#9 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#286 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#60 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#411 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#61 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator+<6,false>#1:acc#10 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#306 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#62 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#405 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#324 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#30 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#415 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#32 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator+<6,false>#1:acc#12 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#340 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#33 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#406 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#35 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#354 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#36 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#412 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#38 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator+<6,false>#1:acc#14 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#366 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#39 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#407 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator+<6,false>:acc#15 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#40 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#42 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#43 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#2 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#408 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#409 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#45 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#389 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#46 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#392 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#413 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#48 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#393 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/operator<<33,true>:acc#49 CSTEPS_FROM {{.. == 1}}
directive set /test_orig_wrapper/core/core:rlp/main/test_orig:for:test_orig:for:mux1h#394 CSTEPS_FROM {{.. == 1}}

# Probe constraints
