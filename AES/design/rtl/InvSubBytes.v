//-----------------------------------------------------------------------------
// InvSubBytes Module
// 
//-----------------------------------------------------------------------------

`default_nettype none
module InvSubBytes
(
  input  wire [  127:0] in,
  output  wire [  127:0] out
);
    
  genvar i;
  generate
      for (i=0; i<=120; i=i+8) begin : inv_sub_all_bytes 
      InvSBox InvSBox (
          .in(in[i + 7:i]),
          .out(out[i + 7:i])
      );
  end 
  endgenerate

endmodule
`default_nettype wire