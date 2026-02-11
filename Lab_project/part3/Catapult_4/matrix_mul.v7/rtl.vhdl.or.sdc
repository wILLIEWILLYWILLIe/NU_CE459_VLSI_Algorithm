# written for flow package OasysRTL 
set sdc_version 1.7 

set_operating_conditions typical
set_load 2.0 [all_outputs]
## driver/slew constraints on inputs
set data_inputs [list {A_rsc_q[*]} {B_rsc_q[*]} {C_rsc_q[*]}]
set_driving_cell -no_design_rule -library NangateOpenCellLibrary -lib_cell BUF_X2 -pin Z $data_inputs
set_units -time ns
# time_factor: 1.0

create_clock -name clk -period 10.0 -waveform { 0.0 5.0 } [get_ports {clk}]
set_clock_uncertainty 0.0 [get_clocks {clk}]

create_clock -name virtual_io_clk -period 10.0
## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {rst}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {A_rsc_adr[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {A_rsc_d[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {A_rsc_we}]
set_input_delay -clock [get_clocks {clk}] 0.5 [get_ports {A_rsc_q[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {A_rsc_triosy_lz}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {B_rsc_adr[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {B_rsc_d[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {B_rsc_we}]
set_input_delay -clock [get_clocks {clk}] 0.5 [get_ports {B_rsc_q[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {B_rsc_triosy_lz}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {C_rsc_adr[*]}]
set_max_delay 10.0 -from [all_inputs] -to [all_outputs]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {C_rsc_d[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {C_rsc_we}]
set_input_delay -clock [get_clocks {clk}] 0.5 [get_ports {C_rsc_q[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {C_rsc_triosy_lz}]

