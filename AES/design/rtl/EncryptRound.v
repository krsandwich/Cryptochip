//-----------------------------------------------------------------------------
// Round definitions
//  
//-----------------------------------------------------------------------------

`default_nettype none
module EncryptRound
(
  input  wire [   0:0] clk,
  input  wire [   0:0] rst_n,
  input  wire [ 127:0] data_in,
  input  wire [   0:0] ready,
  input  wire [ 127:0] key,
  output wire [ 127:0] data_out,
  output wire [   0:0] valid
);

  //---------
  // INPUT OUTPUT 
  // - this is for storing input and output data 
  //---------
  reg [ 127: 0] temp_data  [4:0];
  reg [ 127: 0] data_final;
  reg valid_final;

  SubBytes SubBytes(.in(data_in), .out(temp_data[1]));
  ShiftRows ShiftRows(.in(temp_data[1]), .out(temp_data[2]));
  MixColumns MixColumns(.in(temp_data[2]), .out(temp_data[3]));
  AddRoundKey AddRoundKey(.in(temp_data[3]),.key(key), .out(temp_data[4]));

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
      if(ready) begin
        data_final <= temp_data[4];
        valid_final <= 1; 
      end else begin 
        valid_final <= 0; 
        data_final <= data_final;
      end
    end
  end

endmodule // mainUnit
`default_nettype wire


`default_nettype none
module EncryptInitRound
(
  input  wire [   0:0] clk,
  input  wire [   0:0] rst_n,
  input  wire [ 127:0] data_in,
  input  wire [   0:0] ready,
  input  wire [ 127:0] key,
  output wire [ 127:0] data_out,
  output wire [   0:0] valid
);

  //---------
  // INPUT OUTPUT 
  // - this is for storing input and output data 
  //---------
  reg [ 127: 0] temp_data;
  reg [ 127: 0] data_final;
  reg valid_final;

  AddRoundKey AddRoundKey(.in(data_in),.key(key), .out(temp_data));

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
      if(ready) begin
        data_final <= temp_data;
        valid_final <= 1; 
      end else begin 
        valid_final <= 0; 
        data_final <= data_final;
      end
    end
  end

endmodule // mainUnit
`default_nettype wire

`default_nettype none
module EncryptFinalRound
(
  input  wire [   0:0] clk,
  input  wire [   0:0] rst_n,
  input  wire [ 127:0] data_in,
  input  wire [   0:0] ready,
  input  wire [ 127:0] key,
  output wire [ 127:0] data_out,
  output wire [   0:0] valid
);

  //---------
  // INPUT OUTPUT 
  // - this is for storing input and output data 
  //---------
  reg [ 127: 0] temp_data  [4:0];
  reg [ 127: 0] data_final;
  reg valid_final;

  SubBytes SubBytes(.in(data_in), .out(temp_data[1]));
  ShiftRows ShiftRows(.in(temp_data[1]), .out(temp_data[2]));
  AddRoundKey AddRoundKey(.in(temp_data[2]),.key(key), .out(temp_data[3]));

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
      if(ready) begin
        data_final <= temp_data[3];
        valid_final <= 1; 
      end else begin 
        valid_final <= 0; 
        data_final <= data_final;
      end
    end
  end

endmodule // mainUnit
`default_nettype wire

