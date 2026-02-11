solution new -state initial
solution options defaults

# Add source files
solution file add ./conv_fixed.h -type CHEADER
solution file add ./conv_fixed.cpp -type C++

go analyze
directive set -DESIGN_HIERARCHY conv_fixed
go compile

# Add library
solution library add nangate-45nm_beh -file {$MGC_HOME/pkgs/siflibs/nangate/nangate-45nm_beh.lib} -- -rtlsyntool OasysRTL
go libraries

# Set Clock to 400 MHz (Period = 2.5 ns)
directive set -CLOCKS {clk {-CLOCK_PERIOD 2.5 -CLOCK_EDGE rising -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n}}

go assembly

# ---------------------------------------------------------
# Part 1 (Fixed Point) - Run 1: No Optimizations
# ---------------------------------------------------------
# (Keep optimization directives commented out for the first run)

# ---------------------------------------------------------
# Part 2 (Fixed Point) - Run 2: Pipeline
# ---------------------------------------------------------
# directive set /conv_fixed/core -PIPELINE_INIT_INTERVAL 1

# ---------------------------------------------------------
# Part 2 (Fixed Point) - Run 3: Pipeline + Unroll
# ---------------------------------------------------------
directive set /conv_fixed/core -PIPELINE_INIT_INTERVAL 1
directive set /conv_fixed/core/sum -UNROLL yes

go extract

