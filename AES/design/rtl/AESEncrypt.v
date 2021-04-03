//-----------------------------------------------------------------------------
// AES Encrypt Module
//  
//-----------------------------------------------------------------------------

`default_nettype none
module AESEncrypt
(
  input  wire [   0:0] clk,
  input  wire [   0:0] rst_n,
  input  wire [   0:0] ready,
  input  wire [ 127:0] data_in,
  input  wire [ 255:0] key,

  output wire [ 127:0] data_out,
  output wire [   0:0] valid,
);

  //---------
  // INPUT OUTPUT 
  // - this is for storing input and output data 
  //---------
  reg [ 127: 0] temp_data_in  [13:0];
  reg [ 127: 0] temp_data_out [13:0];
  reg [ 255:0] orig_key;  //must save original key
  reg [ 127:0] temp_key[1:0];

  AddRoundKey AddRoundKey(.in(temp_data_in[0],.key(temp_key[1]) .out(temp_data_out[0]));
  SubBytes SubBytes(.in(temp_data_in[1], .out(temp_data_out[1]));
  ShiftRows ShiftRows(.in(temp_data_in[2], .out(temp_data_out[2]));
  MixColumns MixColumns(.in(temp_data_in[3], .out(temp_data_out[3]));
  ExpandKey ExpandKey(.in(orig_key), .round(round), .out(temp_key[0]));

  //---------
  // FSM
  //---------
  reg state [1:0];
  reg [ 3: 0] round;
  reg encrypt_state [1:0]; // there are 4
  always_ff @(posedge clk) begin
    if (ready) begin
      temp_data_in [0] <= data_in;
      orig_key <= key;
    end
    if (state == FINAL_STATE && encrypt_state == ADDROUNDKEY) begin 
      data_final <= temp_data_out[0];
    end
  end
  assign data_out = data_final;

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      state <= WAIT_STATE;
      encrypt_state <= SUBBYTES;
      valid <= 0;
      round <= 0;
    end
    case (state)
      WAIT_STATE: begin
        valid <= 0;
        if (ready) begin 
          state <= INIT_STATE;
          temp_key[1] <= key[255:128];  
        end else begin 
          state <= WAIT_STATE;
          temp_key[1] <= 128'd0;
        end
      end
      INIT_STATE: begin
        valid <= 0;
        round <= 4'd1;
        state <= ENCRYPT_STATE;
        encrypt_state <= SUBBYTES;    
        temp_key[1] <= temp_key[0];
        temp_data_in[1] <= temp_data_out[0];       
      end
      ENCRYPT_STATE: begin
        case (encrypt_state)
          SUBBYTES: begin
            encrypt_state <= SHIFTROWS;
            temp_data_in[2] <= temp_data_out[1];
          end
          SHIFTROWS: begin
            encrypt_state <= MIXCOLUMNS;
            temp_data_in[3] <= temp_data_out[2];
          end
          MIXCOLUMNS: begin
            encrypt_state <= ADDROUNDKEY;
            temp_data_in[0] <= temp_data_out[3];
            temp_key[1] <= temp_key[0];
          end
          ADDROUNDKEY: begin 
            temp_data_in[1] <= temp_data_out[0];
            encrypt_state <= SUBBYTES;
            round <= round + 4'd1;
            if (round == 4'd13) begin //SHA256 has 14 total encrypt round 
              state <= FINAL_STATE; 
            end
            else begin
              state <= ENCRYPT_STATE;
            end
          end
        endcase
      end
      FINAL_STATE: begin
        case (encrypt_state)
          SUBBYTES: begin
            encrypt_state <= SHIFTROWS;
            temp_data_in[2] <= temp_data_out[1];
          end
          SHIFTROWS: begin
            encrypt_state <= ADDROUNDKEY;
            temp_data_in[3] <= temp_data_out[2];
            temp_key[1] <= temp_key[0];
          end
          ADDROUNDKEY: begin 
            temp_data_in[1] <= temp_data_out[0];
            encrypt_state <= SUBBYTES;
            valid <= 1;
            if (ready) begin 
              state <= INIT_STATE; 
            end
            else begin
              state <= WAIT_STATE;
            end
          end
        endcase
      end
      default: begin
        state <= WAIT_STATE;
      end
  end

endmodule // mainUnit
`default_nettype wire

// //-----------------------------------------------------------------------------
// // ZeroComparator_0x422b1f52edd46a85
// //-----------------------------------------------------------------------------
// // nbits: 16
// // dump-vcd: False
// // verilator-xinit: zeros
// `default_nettype none
// module ZeroComparator_0x422b1f52edd46a85
// (
//   input  wire [   0:0] clk,
//   input  wire [  15:0] in_,
//   output reg  [   0:0] out,
//   input  wire [   0:0] reset
// );



//   // PYMTL SOURCE:
//   //
//   // @s.combinational
//   // def comb_logic():
//   //       s.out.value = s.in_ == 0

//   // logic for comb_logic()
//   always @ (*) begin
//     out = (in_ == 0);
//   end


// endmodule // ZeroComparator_0x422b1f52edd46a85
// `default_nettype wire