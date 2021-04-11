//-----------------------------------------------------------------------------
// SubWord Module
// 
//-----------------------------------------------------------------------------

`default_nettype none
module SubWord
(
  input  wire  [  31:0] in,
  output  wire [  31:0] out
);

	SBox SBox1 (in[31:24], out[31:24]);
	SBox SBox2 (in[23:16], out[23:16]);
	SBox SBox3 (in[15:8],  out[15:8] );
	SBox SBox4 (in[7:0],   out[7:0]  );
endmodule 

