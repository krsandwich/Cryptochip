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
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[0]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[1]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[2]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[3]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[4]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[5]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[6]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[7]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[8]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[9]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[10]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[11]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[12]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[13]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[14]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[15]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[16]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[17]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[18]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[19]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[20]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[21]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[22]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[23]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[24]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[25]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[26]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[27]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[28]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[29]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[30]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports Di[31]]


set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports EN] 
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports EN] 

set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports WE[0]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports WE[1]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports WE[2]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports WE[3]]

set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports A[0]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports A[1]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports A[2]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports A[3]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports A[4]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports A[5]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports A[6]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports A[7]]
set_input_delay  $cycle20 -clock ${clock_virtual} [get_ports A[8]]

set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[0]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[1]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[2]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[3]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[4]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[5]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[6]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[7]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[8]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[9]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[10]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[11]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[12]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[13]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[14]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[15]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[16]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[17]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[18]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[19]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[20]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[21]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[22]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[23]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[24]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[25]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[26]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[27]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[28]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[29]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[30]]
set_output_delay  $cycle20 -clock ${clock_virtual} [get_ports Do[31]]


# Make all signals meet good slew
set_max_transition $all_data_transition [current_design]


set_load -pin_load 17.65  [get_ports Do[1]]
set_load -pin_load 17.65  [get_ports Do[2]]
set_load -pin_load 17.65  [get_ports Do[3]]
set_load -pin_load 17.65  [get_ports Do[4]]
set_load -pin_load 17.65  [get_ports Do[5]]
set_load -pin_load 17.65  [get_ports Do[6]]
set_load -pin_load 17.65  [get_ports Do[7]]
set_load -pin_load 17.65  [get_ports Do[8]]
set_load -pin_load 17.65  [get_ports Do[9]]
set_load -pin_load 17.65  [get_ports Do[10]]
set_load -pin_load 17.65  [get_ports Do[11]]
set_load -pin_load 17.65  [get_ports Do[12]]
set_load -pin_load 17.65  [get_ports Do[13]]
set_load -pin_load 17.65  [get_ports Do[14]]
set_load -pin_load 17.65  [get_ports Do[15]]
set_load -pin_load 17.65  [get_ports Do[16]]
set_load -pin_load 17.65  [get_ports Do[17]]
set_load -pin_load 17.65  [get_ports Do[18]]
set_load -pin_load 17.65  [get_ports Do[19]]
set_load -pin_load 17.65  [get_ports Do[20]]
set_load -pin_load 17.65  [get_ports Do[21]]
set_load -pin_load 17.65  [get_ports Do[22]]
set_load -pin_load 17.65  [get_ports Do[23]]
set_load -pin_load 17.65  [get_ports Do[24]]
set_load -pin_load 17.65  [get_ports Do[25]]
set_load -pin_load 17.65  [get_ports Do[26]]
set_load -pin_load 17.65  [get_ports Do[27]]
set_load -pin_load 17.65  [get_ports Do[28]]
set_load -pin_load 17.65  [get_ports Do[29]]
set_load -pin_load 17.65  [get_ports Do[30]]
set_load -pin_load 17.65  [get_ports Do[31]]

set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[0]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[1]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[2]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[3]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[4]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[5]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[6]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[7]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[8]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[9]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[10]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[11]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[12]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[13]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[14]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[15]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[16]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[17]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[18]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[19]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[20]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[21]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[22]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[23]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[24]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[25]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[26]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[27]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[28]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[29]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[30]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports Di[31]]


set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports EN] 
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports EN] 

set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports WE[0]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports WE[1]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports WE[2]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports WE[3]]

set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports A[0]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports A[1]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports A[2]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports A[3]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports A[4]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports A[5]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports A[6]]
  set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports A[7]]
set_driving_cell -no_design_rule \
  -lib_cell sky130_fd_sc_hd__inv_8 [get_ports A[8]]

