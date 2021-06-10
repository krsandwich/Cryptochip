#=========================================================================
# pin-assignments.tcl
#=========================================================================
# The ports of this design become physical pins along the perimeter of the
# design. The commands below will spread the pins along the left and right
# perimeters of the core area. This will work for most designs but a
# detail-oriented project should customize or replace this section.
#
# Author : Kylee Krzanich
# Date   : April 4 2021

#-------------------------------------------------------------------------
# Pin Assignments
#-------------------------------------------------------------------------

         

set pins_top {\
  jtag_TCK  jtag_TMS   jtag_TDI  jtag_TDO_data  jtag_TDO_driven\
  qspi_0_sck qspi_0_dq_0_i qspi_0_dq_0_o qspi_0_dq_0_ie qspi_0_dq_0_oe qspi_0_cs_0 \
  qspi_0_dq_1_i qspi_0_dq_1_o qspi_0_dq_1_ie qspi_0_dq_1_oe \
  qspi_0_dq_2_i qspi_0_dq_2_o qspi_0_dq_2_ie qspi_0_dq_2_oe \
  qspi_0_dq_3_i qspi_0_dq_3_o qspi_0_dq_3_ie qspi_0_dq_3_oe \
}

# Pins on the right side. In this example we are not placing pins on the right
# side since we haven't routed out the pins on the right side of the SRAM. In
# your design you can use the right side as well.

set pins_right {\
	spi_0_sck spi_0_dq_0_i spi_0_dq_0_o spi_0_dq_0_ie spi_0_dq_0_oe spi_0_cs_0 \
	spi_0_dq_1_i spi_0_dq_1_o spi_0_dq_1_ie spi_0_dq_1_oe spi_0_cs_1 \
    spi_0_dq_2_i spi_0_dq_2_o spi_0_dq_2_ie spi_0_dq_2_oe spi_0_cs_2 \
    spi_0_dq_3_i spi_0_dq_3_o spi_0_dq_3_ie spi_0_dq_3_oe spi_0_cs_3 \
    i2c_0_scl_in i2c_0_scl_out i2c_0_scl_oe i2c_0_sda_in i2c_0_sda_out i2c_0_sda_oe \
}

# Pins on the bottom side from right (dout0[0]) to left (din0[31]). I list pins
# out explicitly here because the dout0 and din0 pins on the SRAM macro are
# interleaved somewhat randomly but if in your case the pins of the same bus
# are to be kept together then you can generate this pin list using a tcl for
# loop.

set pins_bottom {\
  custom_gpio_input_pins[0] custom_gpio_input_pins[1]custom_gpio_input_pins[2]custom_gpio_input_pins[3]\
  custom_gpio_input_pins[4]custom_gpio_input_pins[5]custom_gpio_input_pins[6]custom_gpio_input_pins[7]\
  custom_gpio_output_pins[0] custom_gpio_output_pins[1]custom_gpio_output_pins[2]custom_gpio_output_pins[3]\
  custom_gpio_output_pins[4]custom_gpio_output_pins[5]custom_gpio_output_pins[6]custom_gpio_output_pins[7]\
  pwm_0_gpio_0 pwm_0_gpio_1 pwm_0_gpio_2 pwm_0_gpio_3 \
  uart_0_txd    uart_0_rxd\
}

# Pins on the left side from bottom (rst_n) to top (addr0[0]).

set pins_left {\
  reset_wire_reset    clock\
}

# Spread the pins evenly along the sides of the block

set ports_layer M4

editPin -layer $ports_layer -pin $pins_right  -side RIGHT  -spreadType SIDE
editPin -layer $ports_layer -pin $pins_left   -side LEFT   -spreadType SIDE
editPin -layer $ports_layer -pin $pins_bottom -side BOTTOM -spreadType SIDE
editPin -layer $ports_layer -pin $pins_top    -side TOP    -spreadType SIDE

