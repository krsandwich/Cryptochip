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
module AESEncrypt
(
  input  wire [   0:0] clk,
  input  wire [   0:0] rst_n,
  input  wire [   0:0] ready,
  input  wire [ 127:0] data_in,
  input  wire [ 255:0] key,

  output wire [ 127:0] data_out,
  output wire [   0:0] valid
);

  //---------
  // INPUT OUTPUT 
  // - this is for storing input and output data 
  //---------
  reg [ 127: 0] temp_data_in  [13:0];
  reg [ 127: 0] temp_data_out [13:0];
  reg [ 127: 0] data_final;
  reg valid_final;
  reg [ 255:0] orig_key;  //must save original key
  reg [ 255:0] next_key;  //must save next key 
  reg [ 255:0] input_key;  //must save original key
  reg [ 127:0] temp_key[1:0];
  reg [1:0] state;
  reg [ 3: 0] round;
  reg [1:0] encrypt_state; // there are 4

  AddRoundKey AddRoundKey(.in(temp_data_in[0]),.key(temp_key[0]), .out(temp_data_out[0]));
  SubBytes SubBytes(.in(temp_data_in[1]), .out(temp_data_out[1]));
  ShiftRows ShiftRows(.in(temp_data_in[2]), .out(temp_data_out[2]));
  MixColumns MixColumns(.in(temp_data_in[3]), .out(temp_data_out[3]));
  ExpandKey ExpandKey(.in(input_key), .round(round), .next(next_key), .out(temp_key[1]));

  //---------
  // FSM
  //---------
  assign data_out = data_final;
  assign valid = valid_final;

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      state <= `WAIT_STATE;
      encrypt_state <= `SUBBYTES;
      valid_final <= 0;
      round <= 0;
      data_final <= 0;
    end
    else begin
      case (state)
        `WAIT_STATE: begin
          valid_final <= 0;
          if (ready) begin 
            state <= `INIT_STATE;
            temp_key[0] <= key[255:128]; 
            temp_data_in [0] <= data_in; 
            orig_key <= key;
          end else begin 
            state <= `WAIT_STATE;
            temp_key[0] <= 128'd0;
          end
        end
        `INIT_STATE: begin
          valid_final <= 0;
          round <= 4'd1;
          state <= `ENCRYPT_STATE;
          encrypt_state <= `SUBBYTES;    
          temp_data_in[1] <= temp_data_out[0];       
        end
        `ENCRYPT_STATE: begin
          case (encrypt_state)
            `SUBBYTES: begin
              encrypt_state <= `SHIFTROWS;
              temp_data_in[2] <= temp_data_out[1];
            end
            `SHIFTROWS: begin
              encrypt_state <= `MIXCOLUMNS;
              temp_data_in[3] <= temp_data_out[2];
            end
            `MIXCOLUMNS: begin
              encrypt_state <= `ADDROUNDKEY;
              temp_data_in[0] <= temp_data_out[3];
              if (round == 1)begin 
                temp_key[0] <= key[127:0];  
              end else begin 
                temp_key[0] <= temp_key[1];
              end
            end
            `ADDROUNDKEY: begin 
              temp_data_in[1] <= temp_data_out[0];
              encrypt_state <= `SUBBYTES;
              if (round == 1)begin 
                input_key <= orig_key; 
              end else begin 
                input_key <= next_key;
              end
              round <= round + 4'd1;
              if (round == 4'd13) begin //SHA256 has 14 total encrypt round 
                state <= `FINAL_STATE; 
              end
              else begin
                state <= `ENCRYPT_STATE;
              end
            end
            default: begin
              encrypt_state <= `SUBBYTES; 
            end
          endcase
        end
        `FINAL_STATE: begin
          case (encrypt_state)
            `SUBBYTES: begin
              encrypt_state <= `SHIFTROWS;
              temp_data_in[2] <= temp_data_out[1];
            end
            `SHIFTROWS: begin
              encrypt_state <= `ADDROUNDKEY;
              temp_data_in[0] <= temp_data_out[2];
              temp_key[0] <= temp_key[1];
            end
            `ADDROUNDKEY: begin 
              temp_data_in[1] <= temp_data_out[0];
              encrypt_state <= `SUBBYTES;
              valid_final <= 1;
              data_final <= temp_data_out[0];
              if (ready) begin 
                state <= `INIT_STATE; 
              end
              else begin
                state <= `WAIT_STATE;
              end
            end
            default: begin
              encrypt_state <= `SUBBYTES; 
            end
          endcase
        end
        default: begin
          state <= `WAIT_STATE;
        end
      endcase
    end
  end

endmodule // mainUnit
`default_nettype wire

