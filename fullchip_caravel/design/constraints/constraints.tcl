#=========================================================================
# Design Constraints File
#=========================================================================

# This constraint sets the target clock period for the chip in
# nanoseconds. Note that the first parameter is the name of the clock
# signal in your verilog design. If you called it something different than
# clk you will need to change this. You should set this constraint
# carefully. If the period is unrealistically small then the tools will
# spend forever trying to meet timing and ultimately fail. If the period
# is too large the tools will have no trouble but you will get a very
# conservative implementation.

set clock_net  wb_clk_i
set clock_name ideal_clock

create_clock -name ${clock_name} \
             -period ${dc_clock_period} \
             [get_ports ${clock_net}]

set jtag_clock_net io_in[0]
set jtag_clock_name jtag_clock
set jtag_clock_period [expr ${dc_clock_period}*20]

create_clock -name ${jtag_clock_name} \
             -period [expr ${jtag_clock_period}] \
             [get_ports ${jtag_clock_net}]

# Make clocks asynchronous
set_clock_groups -asynchronous -group [get_clocks ${clock_name}] \
		 -group [get_clocks ${jtag_clock_name}]

# This constraint sets the load capacitance in picofarads of the
# output pins of your design.

set_load -pin_load $ADK_TYPICAL_ON_CHIP_LOAD [all_outputs]

# This constraint sets the input drive strength of the input pins of
# your design. We specifiy a specific standard cell which models what
# would be driving the inputs. This should usually be a small inverter
# which is reasonable if another block of on-chip logic is driving
# your inputs.

set_driving_cell -no_design_rule \
  -lib_cell $ADK_DRIVING_CELL [all_inputs]

# set_input_delay constraints for input ports
#
# - make this non-zero to avoid hold buffers on input-registered designs

set_input_delay -clock ${clock_name} [expr ${dc_clock_period}/2.0] \
			[get_ports "io_in[3] \ 
                  io_in[4] \ 
                  io_in[5] \ 
                  io_in[6] \ 
                  io_in[7] \ 
                  io_in[8] \ 
                  io_in[10] \ 
                  io_in[11] \ 
                  io_in[12] \ 
                  io_in[13] \ 
                  io_in[14] \ 
                  io_in[15] \ 
                  io_in[16] \ 
                  io_in[17] \ 
                  io_in[18] \ 
                  io_in[19] \ 
                  io_in[20] \ 
                  io_in[21] \ 
                  io_in[22] \ 
                  io_in[23] \ 
                  io_in[24] \ 
                  io_in[25] \ 
                  io_in[26] \ 
                  io_in[27] \ 
                  io_in[28] \ 
                  io_in[29] \ 
                  io_in[30] \ 
                  io_in[31] \ 
                  io_in[32] \ 
                  io_in[33] \ 
                  io_in[34] \ 
                  io_in[35] \ 
                  io_in[36] \ 
                  io_in[37]"] 
      # serial_tl_bits_in_valid serial_tl_bits_in_bits serial_tl_bits_out_ready"]
set_input_delay -clock ${jtag_clock_name} [expr ${jtag_clock_period}/2.0] \
			[get_ports "io_in[1] io_in[2] io_in[9]"]


# set_output_delay constraints for output ports

set_output_delay -clock ${clock_name} 0 \
			[get_ports "io_out[3] \ 
                  io_out[4] \ 
                  io_out[5] \ 
                  io_out[6] \ 
                  io_out[7] \ 
                  io_out[8] \ 
                  io_out[10] \ 
                  io_out[11] \ 
                  io_out[12] \ 
                  io_out[13] \ 
                  io_out[14] \ 
                  io_out[15] \ 
                  io_out[16] \ 
                  io_out[17] \ 
                  io_out[18] \ 
                  io_out[19] \ 
                  io_out[20] \ 
                  io_out[21] \ 
                  io_out[22] \ 
                  io_out[23] \ 
                  io_out[24] \ 
                  io_out[25] \ 
                  io_out[26] \ 
                  io_out[27] \ 
                  io_out[28] \ 
                  io_out[29] \ 
                  io_out[30] \ 
                  io_out[31] \ 
                  io_out[32] \ 
                  io_out[33] \ 
                  io_out[34] \ 
                  io_out[35] \ 
                  io_out[36] \ 
                  io_out[37] \
                  io_oeb[3] \ 
                  io_oeb[4] \ 
                  io_oeb[5] \ 
                  io_oeb[6] \ 
                  io_oeb[7] \ 
                  io_oeb[8] \ 
                  io_oeb[10] \ 
                  io_oeb[11] \ 
                  io_oeb[12] \ 
                  io_oeb[13] \ 
                  io_oeb[14] \ 
                  io_oeb[15] \ 
                  io_oeb[16] \ 
                  io_oeb[17] \ 
                  io_oeb[18] \ 
                  io_oeb[19] \ 
                  io_oeb[20] \ 
                  io_oeb[21] \ 
                  io_oeb[22] \ 
                  io_oeb[23] \ 
                  io_oeb[24] \ 
                  io_oeb[25] \ 
                  io_oeb[26] \ 
                  io_oeb[27] \ 
                  io_oeb[28] \ 
                  io_oeb[29] \ 
                  io_oeb[30] \ 
                  io_oeb[31] \ 
                  io_oeb[32] \ 
                  io_oeb[33] \ 
                  io_oeb[34] \ 
                  io_oeb[35] \ 
                  io_oeb[36] \ 
                  io_oeb[37]"]
set_output_delay -clock ${jtag_clock_name} 0 \
			[get_ports "io_out[1] io_out[2] io_out[9] \
                  io_oeb[1] \ 
                  io_oeb[2] \ 
                  io_oeb[9]"]
    

# Make all signals limit their fanout

set_max_fanout 20 $dc_design_name

# Make all signals meet good slew

set_max_transition [expr 0.25*${dc_clock_period}] $dc_design_name

#set_input_transition 1 [all_inputs]
#set_max_transition 10 [all_outputs]