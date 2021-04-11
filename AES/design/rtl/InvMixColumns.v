//---------------------------------------------------------------------------------------
//
//	Mix Columns 
//
//	Description:
//		This file includes all functions implemented in the mix_columns.v original file 
//		but implemented as modules. 
//
//  Author(s):
//      - Moti Litochevski
//
//---------------------------------------------------------------------------------------
module xtimes (
	in, out
);
 
input	[7:0]	in;
output	[7:0]	out;
 
wire [3:0] xt;

assign xt[3] = in[7];
assign xt[2] = in[7];
assign xt[1] = 1'b0;
assign xt[0] = in[7];

assign out[7:5] = in[6:4];
assign out[4:1] = xt[3:0] ^ in[3:0];
assign out[0]   = in[7];

endmodule

module MUL3 (
	in, out
);
 
input	[7:0]	in;
output	[7:0]	out;
 
wire [7:0] xt;

xtimes xt_u (.in(in), .out(xt));

assign out = xt ^ in;

endmodule

module MULE (
	in, out
);
 
input	[7:0]	in;
output	[7:0]	out;
 
wire [7:0] xt1, xt2, xt3;

xtimes xt_u1 (.in(in), .out(xt1));
xtimes xt_u2 (.in(xt1), .out(xt2));
xtimes xt_u3 (.in(xt2), .out(xt3));

assign out = xt3 ^ xt2 ^ xt1;

endmodule

module MULB (
	in, out
);
 
input	[7:0]	in;
output	[7:0]	out;
 
wire [7:0] xt1, xt2, xt3;

xtimes xt_u1 (.in(in), .out(xt1));
xtimes xt_u2 (.in(xt1), .out(xt2));
xtimes xt_u3 (.in(xt2), .out(xt3));

assign out = xt3 ^ xt1 ^ in;

endmodule

module MULD (
	in, out
);
 
input	[7:0]	in;
output	[7:0]	out;
 
wire [7:0] xt1, xt2, xt3;

xtimes xt_u1 (.in(in), .out(xt1));
xtimes xt_u2 (.in(xt1), .out(xt2));
xtimes xt_u3 (.in(xt2), .out(xt3));

assign out = xt3 ^ xt2 ^ in;

endmodule

module MUL9 (
	in, out
);
 
input	[7:0]	in;
output	[7:0]	out;
 
wire [7:0] xt1, xt2, xt3;

xtimes xt_u1 (.in(in), .out(xt1));
xtimes xt_u2 (.in(xt1), .out(xt2));
xtimes xt_u3 (.in(xt2), .out(xt3));

assign out = xt3 ^ in;

endmodule

module InvByteMixColumns (
	a, b, c, d, out
);
 
input	[7:0]	a, b, c, d;
output	[7:0]	out;
 
wire [7:0] mule, mulb, muld, mul9;

MULE mule_u (.in(a), .out(mule));
MULB mulb_u (.in(b), .out(mulb));
MULD muld_u (.in(c), .out(muld));
MUL9 mul9_u (.in(d), .out(mul9));

assign out = mule ^ mulb ^ muld ^ mul9;

endmodule

module InvWordMixColumns (
	in, out
);
 
input	[31:0]	in;
output	[31:0]	out;
 
wire [7:0] si0,si1,si2,si3;
wire [7:0] so0,so1,so2,so3;

assign si0 = in[31:24];
assign si1 = in[23:16];
assign si2 = in[15:8];
assign si3 = in[7:0];
	
InvByteMixColumns so0_u (.a(si0), .b(si1), .c(si2), .d(si3), .out(so0));
InvByteMixColumns so1_u (.a(si1), .b(si2), .c(si3), .d(si0), .out(so1));
InvByteMixColumns so2_u (.a(si2), .b(si3), .c(si0), .d(si1), .out(so2));
InvByteMixColumns so3_u (.a(si3), .b(si0), .c(si1), .d(si2), .out(so3));
	
assign out = {so0, so1, so2, so3};

endmodule

module InvMixColumns 
(
  input  wire [  127:0] in,
  output  wire [  127:0] out
);
 

wire [31:0] so0,so1,so2,so3;

InvWordMixColumns so0_u (.in(in[127:96]), .out(so0));
InvWordMixColumns so1_u (.in(in[95:64]),  .out(so1));
InvWordMixColumns so2_u (.in(in[63:32]),  .out(so2));
InvWordMixColumns so3_u (.in(in[31:0]),   .out(so3));

assign out = {so0, so1, so2, so3};

endmodule
//---------------------------------------------------------------------------------------
