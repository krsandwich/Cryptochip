//-----------------------------------------------------------------------------
// SubBytes Module
// 
//-----------------------------------------------------------------------------

`default_nettype none
module SubBytes
(
  input  wire [  127:0] in,
  output  wire [  127:0] out
);
    
  genvar i;
  generate
      for (i=0; i<=120; i=i+8) begin : sub_all_bytes 
      SBox SBox (
          .in(in[i + 7:i]),
          .out(out[i + 7:i])
      );
  end 
  endgenerate

endmodule
`default_nettype wire