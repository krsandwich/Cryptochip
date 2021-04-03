//-----------------------------------------------------------------------------
// AddRoundKey Module
// 
//-----------------------------------------------------------------------------

`default_nettype none
module ddRoundKey
(
  input  wire [  127:0] in,
  input  wire [  127:0] key,
  output  wire [  127:0] out
);

	assign out = in ^ key;
endmodule