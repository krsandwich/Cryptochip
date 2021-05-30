#=========================================================================
# Design Constraints File
#=========================================================================
########################################################
##== Parameter Definition
########################################################
set all_clock_setup_uncertainty  0.30
set all_clock_hold_uncertainty   0.20
set all_clock_latency            0.400
set all_clock_transition         0.400
set all_data_transition          0.800
# Main clock
set clock_net  CLK
set clock_name main_clock
# Virtual clocks
set clock_virtual virtual_clk
# clock frequency
set main_clock_freq 50
# clock period
set main_clock_per [expr 1000./${main_clock_freq}]
########################################################
##== Clock Definition
########################################################
# Main clock
create_clock -name ${clock_name} \
    -period ${main_clock_per} \
    [get_ports ${clock_net}]
# Create virtual clock
create_clock -name ${clock_virtual} \
    -period ${main_clock_per}
########################################################
##== Clock Constrainsts
########################################################
set_clock_uncertainty -setup $all_clock_setup_uncertainty [get_clocks ${clock_name}]
set_clock_uncertainty -hold $all_clock_hold_uncertainty   [get_clocks ${clock_name}]
set_clock_latency     $all_clock_latency [get_clocks ${clock_name}]
set_clock_transition  $all_clock_transition [get_clocks ${clock_name}]
set_clock_uncertainty -setup $all_clock_setup_uncertainty [get_clocks ${clock_virtual}]
set_clock_uncertainty -hold $all_clock_hold_uncertainty   [get_clocks ${clock_virtual}]
set_clock_latency     $all_clock_latency [get_clocks ${clock_virtual}]
set_clock_groups -asynchronous  \
    -group [list [get_clocks ${clock_name}] [get_clocks ${clock_virtual}]]
set virtual_clocks [list ${clock_virtual}]
#######################################################
##== Cycle definition
#######################################################
set cycle50         [expr 0.50 * ${main_clock_per}]
set cycle20         [expr 0.20 * ${main_clock_per}]
set cycle10         [expr 0.10 * ${main_clock_per}]
########################################################
##== Input/Output Delays
########################################################
set_input_delay  $cycle20 -clock ${clock_virtual} [remove_from_collection [all_inputs] [get_ports "${clock_net}"] ]
set_output_delay $cycle20 -clock ${clock_virtual} [all_outputs]
# Make all signals meet good slew
set_max_transition $all_data_transition [current_design]


set_load -pin_load $ADK_TYPICAL_ON_CHIP_LOAD [all_outputs]


set_driving_cell -no_design_rule \
  -lib_cell $ADK_DRIVING_CELL [all_inputs]