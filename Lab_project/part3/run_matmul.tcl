# directives.tcl -- Matrix Multiplication (32x32) baseline

# Reset solution to initial state
solution new -state initial
solution options defaults

# Add source files
# Header file is included in cpp, so we only need to add the cpp file
solution file add "matmul.cpp" -type C++

# Analyze the design
go analyze

# Set top-level hierarchy
directive set -DESIGN_HIERARCHY "matrix_mul"

# Compile (Generate Synthesis Internal Form)
go compile

# Add and Load Library
solution library add nangate-45nm_beh -file {$MGC_HOME/pkgs/siflibs/nangate/nangate-45nm_beh.lib} -- -rtlsyntool OasysRTL
go libraries

# Set Clock
# Using the detailed clock definition style from Lab2/Lab3 examples
# Clock Period 5.0ns = 200MHz
directive set -CLOCKS {clk {-CLOCK_PERIOD 5.0 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND sync -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_ACTIVE high}}

# Map arrays to memory or increase register threshold
directive set -REGISTER_THRESHOLD 2048

# Run Synthesis Flow
go assembly
go architect
go allocate
go extract
