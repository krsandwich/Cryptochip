//-----------------------------------------------------------------------------
// MixColumns Module
// 
//-----------------------------------------------------------------------------

`default_nettype none
MixColumns
(
  input  wire [  127:0] in,
  output  wire [  127:0] out
);

	assign out[127:120]= mixcolumnshelper (in[127:120],in[119:112],in[111:104],in[103:96]);
	assign out[119:112]= mixcolumnshelper (in[119:112],in[111:104],in[103:96],in[127:120]);
	assign out[111:104]= mixcolumnshelper (in[111:104],in[103:96],in[127:120],in[119:112]);
	assign out[103:96]= mixcolumnshelper (in[103:96],in[127:120],in[119:112],in[111:104]);

	assign out[95:88]= mixcolumnshelper (in[95:88],in[87:80],in[79:72],in[71:64]);
	assign out[87:80]= mixcolumnshelper (in[87:80],in[79:72],in[71:64],in[95:88]);
	assign out[79:72]= mixcolumnshelper (in[79:72],in[71:64],in[95:88],in[87:80]);
	assign out[71:64]= mixcolumnshelper (in[71:64],in[95:88],in[87:80],in[79:72]);

	assign out[63:56]= mixcolumnshelper (in[63:56],in[55:48],in[47:40],in[39:32]);
	assign out[55:48]= mixcolumnshelper (in[55:48],in[47:40],in[39:32],in[63:56]);
	assign out[47:40]= mixcolumnshelper (in[47:40],in[39:32],in[63:56],in[55:48]);
	assign out[39:32]= mixcolumnshelper (in[39:32],in[63:56],in[55:48],in[47:40]);

	assign out[31:24]= mixcolumnshelper (in[31:24],in[23:16],in[15:8],in[7:0]);
	assign out[23:16]= mixcolumnshelper (in[23:16],in[15:8],in[7:0],in[31:24]);
	assign out[15:8]= mixcolumnshelper (in[15:8],in[7:0],in[31:24],in[23:16]);
	assign out[7:0]= mixcolumnshelper (in[7:0],in[31:24],in[23:16],in[15:8]);


	function [7:0] mixcolumnshelper(input [7:0] in1, input [7:0] in2, input [7:0] in3, 
								 input [7:0] in4);
		begin
			mixcolumnshelper[7]=in1[6] ^ in2[6] ^ in2[7] ^ in3[7] ^ in4[7];
			mixcolumnshelper[6]=in1[5] ^ in2[5] ^ in2[6] ^ in3[6] ^ in4[6];
			mixcolumnshelper[5]=in1[4] ^ in2[4] ^ in2[5] ^ in3[5] ^ in4[5];
			mixcolumnshelper[4]=in1[3] ^ in1[7] ^ in2[3] ^ in2[4] ^ in2[7] ^ in3[4] ^ in4[4];
			mixcolumnshelper[3]=in1[2] ^ in1[7] ^ in2[2] ^ in2[3] ^ in2[7] ^ in3[3] ^ in4[3];
			mixcolumnshelper[2]=in1[1] ^ in2[1] ^ in2[2] ^ in3[2] ^ in4[2];
			mixcolumnshelper[1]=in1[0] ^ in1[7] ^ in2[0] ^ in2[1] ^ in2[7] ^ in3[1] ^ in4[1];
			mixcolumnshelper[0]=in1[7] ^ in2[7] ^ in2[0] ^ in3[0] ^ in4[0];
		end
	endfunction
endmodule