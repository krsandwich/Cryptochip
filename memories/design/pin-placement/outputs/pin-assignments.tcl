#=========================================================================
# pin-assignments.tcl
#=========================================================================
# The ports of this design become physical pins along the perimeter of the
# design. The commands below will spread the pins along the left and right
# perimeters of the core area. This will work for most designs, but a
# detail-oriented project should customize or replace this section.
#
# Author : George Klimiashvili
# Date   : April 4, 2021

#-------------------------------------------------------------------------
# Pin Assignments
#-------------------------------------------------------------------------

# Here pin assignments are done keeping in mind the location of the SRAM pins
# If you update pin assignments below you should rerun the pin-placement step 
# before re-running init step

# We are assigning pins clockwise here, starting from the top side we go left
# to right, then on the right side we go top to bottom, then on the bottom
# side, we go right to left, then on the left side we go bottom to top.

# Pins on the top side. The first pin in this list (here jtag_TCK) is on the
# top left and the last pin is on the top right.

set pins_top {\
}

# Pins on the right side. In this example we are not placing pins on the right
# side, since we haven't routed out the pins on the right side of the SRAM. In
# your design, you can use the right side as well.

# set pins_right {\
#   Do[63] Do[62] Do[61] Do[60] Do[59] Do[58] Do[57] Do[56] Do[55] Do[54] Do[53] \
#   Do[52] Do[51] Do[50] Do[49] Do[48] Do[47] Do[46] Do[45] Do[44] Do[43] Do[42] \
#   Do[41] Do[40] Do[39] Do[38] Do[37] Do[36] Do[35] Do[34] Do[33] Do[32] \
#   Do[31] Do[30] Do[29] Do[28] Do[27] Do[26] Do[25] Do[24] Do[23] Do[22] Do[21] \
#   Do[20] Do[19] Do[18] Do[17] Do[16] Do[15] Do[14] Do[13] Do[12] Do[11] Do[10] \
#   Do[9] Do[8] Do[7] Do[6] Do[5] Do[4] Do[3] Do[2] Do[1] Do[0]
# }

# # Pins on the bottom side from right (dout0[0]) to left (din0[31]). I list pins
# # out explicitly here because the dout0 and din0 pins on the SRAM macro are
# # interleaved somewhat randomly, but if in your case the pins of the same bus
# # are to be kept together then you can generate this pin list using a tcl for
# # loop.

# set pins_bottom {\
# }

# # Pins on the left side from bottom (rst_n) to top (addr0[0]).

# set pins_left {\
#   Di[63] Di[62] Di[61] Di[60] Di[59] Di[58] Di[57] Di[56] Di[55] Di[54] Di[53] \
#   Di[52] Di[51] Di[50] Di[49] Di[48] Di[47] Di[46] Di[45] Di[44] Di[43] Di[42] \
#   Di[41] Di[40] Di[39] Di[38] Di[37] Di[36] Di[35] Di[34] Di[33] Di[32] CLK    \
#   Di[31] Di[30] Di[29] Di[28] Di[27] Di[26] Di[25] Di[24] Di[23] Di[22] Di[21] \
#   Di[20] Di[19] Di[18] Di[17] Di[16] Di[15] Di[14] Di[13] Di[12] Di[11] Di[10] \
#   Di[9] Di[8] Di[7] Di[6] Di[5] Di[4] Di[3] Di[2] Di[1] Di[0] WE[7] WE[6] WE[5]\
#   WE[4] WE[3] WE[2] WE[1] WE[0] EN A[7] A[6] A[5] A[4] A[3] A[2] A[1] A[0]
# }
set pins_right {\
  Do[63] Do[62] Do[61] Do[60] Do[59] Do[58] Do[57] Do[56] Do[55] Do[54] Do[53] \
  Do[52] Do[51] Do[50] Do[49] Do[48] Do[47] Do[46] Do[45] Do[44] Do[43] Do[42] \
  Do[41] Do[40] Do[39] Do[38] Do[37] Do[36] Do[35] Do[34] Do[33] Do[32] \
  Do[31] Do[30] Do[29] Do[28] Do[27] Do[26] Do[25] Do[24] Do[23] Do[22] Do[21] \
  Do[20] Do[19] Do[18] Do[17] Do[16] Do[15] Do[14] Do[13] Do[12] Do[11] Do[10] \
  Do[9] Do[8] Do[7] Do[6] Do[5] Do[4] Do[3] Do[2] Do[1] Do[0]
}

# Pins on the bottom side from right (dout0[0]) to left (din0[31]). I list pins
# out explicitly here because the dout0 and din0 pins on the SRAM macro are
# interleaved somewhat randomly, but if in your case the pins of the same bus
# are to be kept together then you can generate this pin list using a tcl for
# loop.

set pins_bottom {\
  WE[7] WE[6] WE[5] WE[4] WE[3] WE[2] WE[1] WE[0] CLK  \
  EN A[7] A[6] A[5] A[4] A[3] A[2] A[1] A[0]
}

# Pins on the left side from bottom (rst_n) to top (addr0[0]).

set pins_left {\
  Di[63] Di[62] Di[61] Di[60] Di[59] Di[58] Di[57] Di[56] Di[55] Di[54] Di[53] \
  Di[52] Di[51] Di[50] Di[49] Di[48] Di[47] Di[46] Di[45] Di[44] Di[43] Di[42] \
  Di[41] Di[40] Di[39] Di[38] Di[37] Di[36] Di[35] Di[34] Di[33] Di[32]   \
  Di[31] Di[30] Di[29] Di[28] Di[27] Di[26] Di[25] Di[24] Di[23] Di[22] Di[21] \
  Di[20] Di[19] Di[18] Di[17] Di[16] Di[15] Di[14] Di[13] Di[12] Di[11] Di[10] \
  Di[9] Di[8] Di[7] Di[6] Di[5] Di[4] Di[3] Di[2] Di[1] Di[0] 
}


# Spread the pins evenly along the sides of the block

set ports_layer M4

editPin -layer $ports_layer -pin $pins_right  -side RIGHT  -spreadType SIDE
editPin -layer $ports_layer -pin $pins_left   -side LEFT   -spreadType SIDE
editPin -layer $ports_layer -pin $pins_bottom -side BOTTOM -spreadType SIDE
# editPin -layer $ports_layer -pin $pins_top    -side TOP    -spreadType SIDE

