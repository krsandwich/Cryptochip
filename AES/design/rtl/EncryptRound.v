//-----------------------------------------------------------------------------
// Round definitions
//  
//-----------------------------------------------------------------------------

`default_nettype none
module EncryptRound
(
  input  wire [ 127:0] data_in,
  input  wire [ 127:0] key,
  output wire [ 127:0] data_out
);

  reg [ 127: 0] temp_data  [3:0];

  SubBytes SubBytes(.in(data_in), .out(temp_data[1]));
  ShiftRows ShiftRows(.in(temp_data[1]), .out(temp_data[2]));
  MixColumns MixColumns(.in(temp_data[2]), .out(temp_data[3]));
  AddRoundKey AddRoundKey(.in(temp_data[3]),.key(key), .out(data_out));


endmodule // encrypt
`default_nettype wire


`default_nettype none
module EncryptInitRound
(
  input  wire [ 127:0] data_in,
  input  wire [ 127:0] key,
  output wire [ 127:0] data_out
);

  AddRoundKey AddRoundKey(.in(data_in),.key(key), .out(data_out));

endmodule // init
`default_nettype wire

`default_nettype none
module EncryptLastRound
(
  input  wire [ 127:0] data_in,
  input  wire [ 127:0] key,
  output wire [ 127:0] data_out
);

  reg [ 127: 0] temp_data  [2:0];

  SubBytes SubBytes(.in(data_in), .out(temp_data[1]));
  ShiftRows ShiftRows(.in(temp_data[1]), .out(temp_data[2]));
  AddRoundKey AddRoundKey(.in(temp_data[2]),.key(key), .out(data_out));


endmodule // final
`default_nettype wire

