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
  reg [ 127: 0] temp_data  [15:0];
  reg [   0: 0] temp_ready;
  reg [   0: 0] valid_final;
  reg [ 127: 0] data_final;


  EncryptInitRound  Round0 (.data_in(temp_data[0]), .key(key[0]),
                            .data_out(temp_data[1]));

  genvar i;
  generate
    for (i=0; i<13; i+=1) begin : EncryptRounds 
      EncryptRound  EncryptRound (.data_in(temp_data[i+1]), .key(key[i+1]),
                                  .data_out(temp_data[i+2]));

  end 
  endgenerate

  EncryptLastRound  Round14 (.data_in(temp_data[14]), .key(key[14]),
                             .data_out(temp_data[15]));


  //---------
  // FSM
  //---------
  assign data_out = data_final;
  assign valid = valid_final;

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      data_final <= 0;
      valid_final <= 0; 
    end
    else begin
      if (ready) begin
        temp_ready <= 1;
        temp_data[0] <= data_in;
      end else begin 
        temp_ready <= 0;
        temp_data[0] <= temp_data[0]; 
      end

      if(temp_ready) begin
        data_final <= temp_data[15];
        valid_final <= 1;
      end else begin 
        data_final <= data_final;
        valid_final <= 0;
      end
    end
  end


endmodule // mainUnit
`default_nettype wire

