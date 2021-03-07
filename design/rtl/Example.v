//-----------------------------------------------------------------------------
// [Insert name of rtl file]
//-----------------------------------------------------------------------------

`default_nettype none
module yourmodule
(
  input  wire [   0:0] clk,
  input  wire [   0:0] reset,
  input  wire [  31:0] msg,
  output wire [   0:0] out,
);

 
  assign out        = clk;



endmodule // mainUnit
`default_nettype wire

//-----------------------------------------------------------------------------
// ZeroComparator_0x422b1f52edd46a85
//-----------------------------------------------------------------------------
// nbits: 16
// dump-vcd: False
// verilator-xinit: zeros
`default_nettype none
module ZeroComparator_0x422b1f52edd46a85
(
  input  wire [   0:0] clk,
  input  wire [  15:0] in_,
  output reg  [   0:0] out,
  input  wire [   0:0] reset
);



  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //       s.out.value = s.in_ == 0

  // logic for comb_logic()
  always @ (*) begin
    out = (in_ == 0);
  end


endmodule // ZeroComparator_0x422b1f52edd46a85
`default_nettype wire
