solution new -state initial
solution options defaults

# Add source files
solution file add ./conv.h -type CHEADER
solution file add ./conv.cpp -type C++

go analyze
directive set -DESIGN_HIERARCHY conv
go compile

# Add library
solution library add nangate-45nm_beh -file {$MGC_HOME/pkgs/siflibs/nangate/nangate-45nm_beh.lib} -- -rtlsyntool OasysRTL
go libraries

# Set Clock to 400 MHz (Period = 2.5 ns)
directive set -CLOCKS {clk {-CLOCK_PERIOD 2.5 -CLOCK_EDGE rising -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n}}

go assembly


# ---------------------------------------------------------
# Part 2: Pipeline Optimization
# ---------------------------------------------------------
# directive set /conv/core -PIPELINE_INIT_INTERVAL 1

# ---------------------------------------------------------
# Part 3: Combined Optimization (Pipeline + Unroll)
# ---------------------------------------------------------
directive set /conv/core -PIPELINE_INIT_INTERVAL 1
directive set /conv/core/sum -UNROLL yes

go extract
