//-----------------------------------------------------------------------------
// ExpandKey Module
// 
// the first round 
//-----------------------------------------------------------------------------

`default_nettype none
module ExpandKey
(
  input  wire [  255:0] in,
  input  wire [    3:0] round,
  output wire [  127:0] out
);
			// reg [31 : 0] w0, w1, w2, w3, w4, w5, w6, w7;
   //    reg [31 : 0] k0, k1, k2, k3;
   //    reg [31 : 0] rconw, rotstw, tw, trw;

   //    // Default assignments.
   //    key_mem_new   = 128'h0;
   //    key_mem_we    = 1'b0;
   //    prev_key0_new = 128'h0;
   //    prev_key0_we  = 1'b0;
   //    prev_key1_new = 128'h0;
   //    prev_key1_we  = 1'b0;

   //    k0 = 32'h0;
   //    k1 = 32'h0;
   //    k2 = 32'h0;
   //    k3 = 32'h0;

   //    rcon_set   = 1'b1;
   //    rcon_next  = 1'b0;

   //    // Extract words and calculate intermediate values.
   //    // Perform rotation of sbox word etc.
   //    w0 = prev_key0_reg[127 : 096];
   //    w1 = prev_key0_reg[095 : 064];
   //    w2 = prev_key0_reg[063 : 032];
   //    w3 = prev_key0_reg[031 : 000];

   //    w4 = prev_key1_reg[127 : 096];
   //    w5 = prev_key1_reg[095 : 064];
   //    w6 = prev_key1_reg[063 : 032];
   //    w7 = prev_key1_reg[031 : 000];

   //    rconw = {rcon_reg, 24'h0};
   //    tmp_sboxw = w7;
   //    rotstw = {new_sboxw[23 : 00], new_sboxw[31 : 24]};
   //    trw = rotstw ^ rconw;
   //    tw = new_sboxw;
  reg [127:0] temp_out;
  always @(*) begin
    if (round == 4'd0) begin
      temp_out <= 128'd0;
    end
    else if (round == 4'd1) begin
      temp_out <= 128'd1;
    end
    else begin
    	temp_out <= 128'd2;
    end
  end
  assign out = temp_out;
	 //  always @(*) begin
  //   if (round == 4'd0) begin
  //     out <= in[255:128];
  //   end
  //   else if (round == 4'd1) begin
  //     out <= in[127:0];
  //   end
  //   else begin
  //   	if (round_ctr_reg[0] == 0)begin
  //       k0 = w0 ^ trw;
  //       k1 = w1 ^ w0 ^ trw;
  //       k2 = w2 ^ w1 ^ w0 ^ trw;
  //       k3 = w3 ^ w2 ^ w1 ^ w0 ^ trw;
  //     end else begin
  //       k0 = w0 ^ tw;
  //       k1 = w1 ^ w0 ^ tw;
  //       k2 = w2 ^ w1 ^ w0 ^ tw;
  //       k3 = w3 ^ w2 ^ w1 ^ w0 ^ tw;
  //       rcon_next = 1'b1;
  //     end

  //   end
    
  // end
endmodule