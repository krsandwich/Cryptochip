//-----------------------------------------------------------------------------
// SubBytes Module
// 
//-----------------------------------------------------------------------------

`default_nettype none
SubBytes
(
  input  wire [  127:0] in,
  output  wire [  127:0] out
);
    
  genvar i;
  generate
      for (i=0; i<127; i=i+8) begin : sub_all_bytes 
      S_Box S_Box (
          .in(in[(i + 1) * 8 - 1:i * 8]),
          .out(out[i])
      );
  end 
  endgenerate

endmodule
`default_nettype wire