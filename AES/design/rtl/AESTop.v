//-----------------------------------------------------------------------------
// AES Encrypt Module
//  
//-----------------------------------------------------------------------------
//`default_nettype none
module AESTop
(
  input  wire [   0:0] clk,
  input  wire [   0:0] rst_n,
  input  wire [   0:0] input_valid,
  input  wire [   0:0] output_ready,
  input  wire [   4:0] opcode,
  input  wire [ 255:0] data_in,

  output wire [ 127:0] data_out,
  output wire [   0:0] input_ready,
  output wire [   0:0] output_valid,
  output wire [   0:0] busy
);

  reg  [   0: 0] encrypt_ready, decrypt_ready, key_ready;
  wire [   0: 0] encrypt_valid, decrypt_valid, key_valid;
  reg  [  127:0] encrypt_in, decrypt_in; 
  reg  [  255:0] key_in; 
  wire [  127:0] encrypt_out, decrypt_out; 
  reg  [  127:0] data_temp; 
  wire [  127:0] key_out [14:0];


  AESEncryptPipe AESEncrypt_inst
    (
      .clk(clk),
      .rst_n(rst_n),
      .ready(encrypt_ready),
      .data_in(encrypt_in),
      .key(key_out),
      .data_out(encrypt_out),
      .valid(encrypt_valid)
    );

    AESDecrypt AESDecrypt_inst
    (
      .clk(clk),
      .rst_n(rst_n),
      .ready(decrypt_ready),
      .data_in(decrypt_in),
      .key(key_out),
      .data_out(decrypt_out),
      .valid(decrypt_valid)
    );

    ExpandKey ExpandKey_inst
    (
      .clk(clk),
      .rst_n(rst_n),
      .ready(key_ready),
      .key_in(key_in),
      .key_out(key_out),
      .valid(key_valid)
    );


   reg [1:0]               state;   

   localparam WAIT = 2'b00, RUN = 2'b01, FINAL = 2'b10;

   assign input_ready = state == WAIT;
   assign output_valid = state == FINAL;
   assign busy = state != WAIT;


   always @(posedge clk) begin
      if (!rst_n)
        state <= WAIT;
      else if (state == WAIT && input_valid)
        state <= RUN;
      else if (state == RUN) begin
        if ((opcode == 4'd0 && key_valid) || 
            (opcode == 4'd1 && encrypt_valid)|| 
            (opcode == 4'd2 && decrypt_valid))
          state <= FINAL;
        else 
          state <= RUN;
      end else if (state == FINAL && output_ready)
        state <= WAIT;
   end

  assign data_out = data_temp;
  always @(posedge clk) begin
    if (state == WAIT && input_valid) begin
      if (opcode == 4'd0) begin
        key_in <= data_in;
        key_ready <= input_valid; 
      end else if (opcode == 4'd1) begin
        encrypt_in <= data_in[255:128];
        encrypt_ready <= input_valid; 
      end else if (opcode == 4'd2) begin
        decrypt_in <= data_in[255:128];
        encrypt_ready <= input_valid;
      end 
    end else if (state == RUN) begin 
      key_ready <= 0;
      encrypt_ready <= 0;
      decrypt_ready <= 0; 
      if (!rst_n)
        data_temp <= 128'd0;
      else if (opcode == 4'd0 && key_valid)
        data_temp <= 128'd0;
      else if (opcode == 4'd1 && encrypt_valid)
        data_temp <= encrypt_out;
      else if (opcode == 4'd2 && decrypt_valid)
        data_temp <= decrypt_out;
    end
  end


endmodule // mainUnit
`default_nettype wire

