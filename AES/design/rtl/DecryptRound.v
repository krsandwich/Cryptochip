//-----------------------------------------------------------------------------
// Round definitions
//  
//-----------------------------------------------------------------------------

`default_nettype none
module DecryptRound
(
  input  wire [ 127:0] data_in,
  input  wire [ 127:0] key,
  output wire [ 127:0] data_out
);

  reg [ 127: 0] temp_data  [3:0];

  InvShiftRows InvShiftRows(.in(data_in), .out(temp_data[1]));
  InvSubBytes InvSubBytes(.in(temp_data[1]), .out(temp_data[2]));
  AddRoundKey AddRoundKey(.in(temp_data[2]),.key(key), .out(temp_data[3]));
  InvMixColumns InvMixColumns(.in(temp_data[3]), .out(data_out));

endmodule // mainUnit
`default_nettype wire


`default_nettype none
module DecryptInitRound
(
  input  wire [ 127:0] data_in,
  input  wire [ 127:0] key,
  output wire [ 127:0] data_out
);

  AddRoundKey AddRoundKey(.in(data_in),.key(key), .out(data_out));


endmodule // mainUnit
`default_nettype wire

`default_nettype none
module DecryptLastRound
(
  input  wire [ 127:0] data_in,
  input  wire [ 127:0] key,
  output wire [ 127:0] data_out
);

  reg [ 127: 0] temp_data  [2:0];

  InvShiftRows InvShiftRows(.in(data_in), .out(temp_data[1]));
  InvSubBytes InvSubBytes(.in(temp_data[1]), .out(temp_data[2]));
  AddRoundKey AddRoundKey(.in(temp_data[2]), .key(key), .out(data_out));


endmodule // mainUnit
`default_nettype wire

