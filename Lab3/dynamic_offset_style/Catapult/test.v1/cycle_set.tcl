
# Loop constraints
directive set /test/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /test/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}

# IO operation constraints
directive set /test/core/core:rlp/main/for:for:io_read(offset:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#40 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#79 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#117 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#154 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#190 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#225 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#259 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#292 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#324 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#355 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#385 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#414 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#442 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#469 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#495 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#520 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#544 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#567 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#589 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#610 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#630 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#649 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#667 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#684 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#700 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#715 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#729 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#742 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#754 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#765 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#775 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#784 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#792 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#799 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#805 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#810 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#814 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#817 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:if:io_read(din:rsc.@)#819 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for#1:io_write(dout:rsc.@)#39 CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /test/core/core:rlp/main/for:for:for:for:mux CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#1 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#2 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#3 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#4 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#5 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#6 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#7 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#8 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#9 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#10 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#11 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#12 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#13 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#14 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#15 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#16 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#17 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#18 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#19 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#20 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#21 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#22 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#23 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#24 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#25 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#26 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#27 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#28 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#29 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#30 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#31 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#32 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#33 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#34 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#35 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#36 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#37 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#38 CSTEPS_FROM {{.. == 1}}
directive set /test/core/core:rlp/main/for:for:mux1h#39 CSTEPS_FROM {{.. == 1}}

# Probe constraints
