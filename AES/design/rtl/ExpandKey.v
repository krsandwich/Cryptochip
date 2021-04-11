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
  output wire [  127:0] out,
  output wire [  255:0] next
);

  reg [127:0] temp_out;
  reg   [7:0] rcon;
  reg [255:0] next_even; 
  reg [255:0] next_odd;
  reg [127:0] out_even;
  reg [127:0] out_odd;
  ExpandKeyEvenHelper ExpandKeyEvenHelper(.in(in),.rcon(rcon), .next(next_even), .out(out_even));
  ExpandKeyOddHelper  ExpandKeyOddHelper (.in(in), .next(next_odd), .out(out_odd));
  always @(*) begin 
    case (round)
      4'd2: begin
        rcon = 8'h1;
      end
      4'd4: begin
        rcon = 8'h2;
      end
      4'd6: begin
        rcon = 8'h4;
      end
      4'd8: begin
        rcon = 8'h8;
      end
      4'd10: begin
        rcon = 8'h10;
      end
      4'd12: begin
        rcon = 8'h20;
      end
      4'd14: begin
        rcon = 8'h40;
      end
      default: begin 
        rcon = 8'hx; // we have an issue
      end
    endcase 
  end
  assign out = round[0] ? out_odd : out_even;
  assign next = round[0] ? next_odd : next_even;
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