//-----------------------------------------------------------------------------
// AES Encrypt Module
//  
//-----------------------------------------------------------------------------
`define WAIT_STATE 0
`define INIT_STATE 1
`define ENCRYPT_STATE 2
`define FINAL_STATE 3
`define SUBBYTES 0
`define SHIFTROWS 1
`define MIXCOLUMNS 2
`define ADDROUNDKEY 3

//`default_nettype none
module AESEncryptPipe
(
  input  wire [   0:0] clk,
  input  wire [   0:0] rst_n,
  input  wire [   0:0] ready,
  input  wire [ 127:0] data_in,
  input  wire [ 127:0] key [14:0],

  output wire [ 127:0] data_out,
  output wire [   0:0] valid
);

  //---------
  // INPUT OUTPUT 
  // - this is for storing input and output data 
  //---------
  reg [ 127: 0] temp_data  [14:0];
  reg [   0: 0] temp_valid [14:0];
  reg [ 127: 0] data_final;
  reg valid_final;
  reg [ 255:0] orig_key;  //must save original key
  reg [ 255:0] next_key;  //must save next key 
  reg [ 255:0] input_key;  //must save original key


  EncryptInitRound    Round0 (.clk(clk), .rst_n(rst_n), .data_in(data_in), 
                       .ready(ready), .key(key[0]), .data_out(temp_data[0]), 
                       .valid(temp_valid[0])); 

  genvar i;
  generate
      for (i=0; i<13; i+=1) begin : EncryptRounds 
      EncryptRound EncryptRound (
                      .clk(clk), .rst_n(rst_n), .data_in(temp_data[i]), 
                      .ready(temp_valid[i]), .key(key[i+1]), 
                      .data_out(temp_data[i+1]), .valid(temp_valid[i+1])
      );
  end 
  endgenerate

  EncryptFinalRound   Round14(.clk(clk), .rst_n(rst_n), .data_in(temp_data[13]), 
                       .ready(temp_valid[13]), .key(key[14]), 
                       .data_out(temp_data[14]), .valid(temp_valid[14]));



  //---------
  // FSM
  //---------
  assign data_out = temp_data[14];
  assign valid = temp_valid[14];


endmodule // mainUnit
`default_nettype wire

