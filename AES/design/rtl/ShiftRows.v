//-----------------------------------------------------------------------------
// ShiftRows Module
// 
//-----------------------------------------------------------------------------

`default_nettype none
module ShiftRows
(
  input  wire [  127:0] in,
  output  wire [  127:0] out
);
	assign         in[127:120] = out[127:120];  
	assign         in[119:112] = out[87:80];
	assign         in[111:104] = out[47:40];
	assign         in[103:96] = out[7:0];
	   
	assign          in[95:88] = out[95:88];
	assign          in[87:80] = out[55:48];
	assign          in[79:72] = out[15:8];
	assign          in[71:64] = out[103:96];
	   
	assign          in[63:56] = out[63:56];
	assign          in[55:48] = out[23:16];
	assign          in[47:40] = out[111:104];
	assign          in[39:32] = out[71:64];
	   
	assign          in[31:24] = out[31:24];
	assign          in[23:16] = out[119:112];
	assign          in[15:8] = out[79:72];
	assign          in[7:0] = out[39:32]; 

endmodule