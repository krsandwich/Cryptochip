//-----------------------------------------------------------------------------
// ExpandKey Module
// 
// the first round 
//-----------------------------------------------------------------------------
`define WAIT_STATE 0
`define GENERATE_STATE 1

`default_nettype none
module ExpandKey
(
  input  wire [    0:0] clk,
  input  wire [    0:0] rst_n,
  input  wire [    0:0] ready,
  input  wire [  255:0] key_in,

  output wire [  127:0] key_out [14:0],
  output wire [    0:0] valid
);

  reg [127:0] temp_key [14:0];
  reg [127:0] key_out  [14:0];
  reg   [7:0] rcon;
  reg [255:0] temp_key_in; 
  reg [255:0] next_even; 
  reg [255:0] next_odd;
  reg [127:0] out_even;
  reg [127:0] out_odd;
  reg [  0:0] state; 
  reg [  0:0] valid_out;
  reg [  0:0] temp_ready;
  reg [  3:0] round; 

  assign key_out = temp_key;
  assign valid = temp_valid; 

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      temp_key <= '{128'd0,128'd0,128'd0,128'd0,128'd0,128'd0,128'd0,128'd0,
                    128'd0,128'd0,128'd0,128'd0,128'd0,128'd0,128'd0};
      temp_valid <= 0;
    end
    else begin
      if (ready) begin
        temp_ready <= 1;
      end else begin 
        temp_ready <= 0;
      end

      if(temp_ready) begin
        key_out <= temp_key;
        valid_out <= 1;
      end else begin 
        key_out <= key_out;
        valid_out <= 0;
      end
    end
  end
  reg [255:0] next_key [14:0]; 
  
  always @(*) begin
    temp_key[0] = key_in[255:128];
    temp_key[1] = key_in[128:0]; 
  end

  ExpandKeyEvenHelper round2  (.in(key_in),.rcon(8'h1), .next(next_key[0]), .out(temp_key[2]));
  ExpandKeyOddHelper  round3  (.in(next_key[0]), .next(next_key[1]), .out(temp_key[3]));
  ExpandKeyEvenHelper round4  (.in(next_key[1]),.rcon(8'h2), .next(next_key[2]), .out(temp_key[4]));
  ExpandKeyOddHelper  round5  (.in(next_key[2]), .next(next_key[3]), .out(temp_key[5]));
  ExpandKeyEvenHelper round6  (.in(next_key[3]),.rcon(8'h4), .next(next_key[4]), .out(temp_key[6]));
  ExpandKeyOddHelper  round7  (.in(next_key[4]), .next(next_key[5]), .out(temp_key[7]));
  ExpandKeyEvenHelper round8  (.in(next_key[5]),.rcon(8'h8), .next(next_key[6]), .out(temp_key[8]));
  ExpandKeyOddHelper  round9  (.in(next_key[6]), .next(next_key[7]), .out(temp_key[9]));
  ExpandKeyEvenHelper round10 (.in(next_key[7]),.rcon(8'h10), .next(next_key[8]), .out(temp_key[10]));
  ExpandKeyOddHelper  round11 (.in(next_key[8]), .next(next_key[9]), .out(temp_key[11]));
  ExpandKeyEvenHelper round12 (.in(next_key[9]),.rcon(8'h20), .next(next_key[10]), .out(temp_key[12]));
  ExpandKeyOddHelper  round13 (.in(next_key[10]), .next(next_key[11]), .out(temp_key[13]));
  ExpandKeyEvenHelper round14 (.in(next_key[11]),.rcon(8'h40), .next(next_key[12]), .out(temp_key[14]));

endmodule


module ExpandKeyEvenHelper
(
  input  wire [  255:0] in,
  input  wire     [7:0] rcon,
  output wire [  255:0] next,
  output wire [  127:0] out
);

    wire       [31:0]  k0, k1, k2, k3, k4, k5, k6, k7,
                       v0, v1, v2, v3;
    reg        [31:0]  k0a, k1a, k2a, k3a, k4a, k5a, k6a, k7a;
    wire       [31:0]  k0b, k1b, k2b, k3b, k4b, k5b, k6b, k7b, k8a;

    assign {k0, k1, k2, k3, k4, k5, k6, k7} = in;
    
    assign v0 = {k0[31:24] ^ rcon, k0[23:0]};
    assign v1 = v0 ^ k1;
    assign v2 = v1 ^ k2;
    assign v3 = v2 ^ k3;

    assign {k0a, k1a, k2a, k3a, k4a, k5a, k6a, k7a} = {v0, v1, v2, v3, k4, k5, k6, k7};
    SubWord SubWord ({k7[23:0], k7[31:24]}, k8a);

    assign k0b = k0a ^ k8a;
    assign k1b = k1a ^ k8a;
    assign k2b = k2a ^ k8a;
    assign k3b = k3a ^ k8a;
    assign {k4b, k5b, k6b, k7b} = {k4a, k5a, k6a, k7a};

    assign next = {k0b, k1b, k2b, k3b, k4b, k5b, k6b, k7b};

    assign out = {k0b, k1b, k2b, k3b};
endmodule

module ExpandKeyOddHelper
(
  input  wire [  255:0] in,
  output wire [  255:0] next,
  output wire [  127:0] out
);
  wire       [31:0]  k0, k1, k2, k3, k4, k5, k6, k7,
                     v5, v6, v7;
  reg        [31:0]  k0a, k1a, k2a, k3a, k4a, k5a, k6a, k7a;
  wire       [31:0]  k0b, k1b, k2b, k3b, k4b, k5b, k6b, k7b, k8a;

  assign {k0, k1, k2, k3, k4, k5, k6, k7} = in;
  
  assign v5 = k4 ^ k5;
  assign v6 = v5 ^ k6;
  assign v7 = v6 ^ k7;

  assign {k0a, k1a, k2a, k3a, k4a, k5a, k6a, k7a} = {k0, k1, k2, k3, k4, v5, v6, v7};

  SubWord SubWord (k3, k8a);

  assign {k0b, k1b, k2b, k3b} = {k0a, k1a, k2a, k3a};
  assign k4b = k4a ^ k8a;
  assign k5b = k5a ^ k8a;
  assign k6b = k6a ^ k8a;
  assign k7b = k7a ^ k8a;

  assign next = {k0b, k1b, k2b, k3b, k4b, k5b, k6b, k7b};
  assign out = {k4b, k5b, k6b, k7b};

endmodule