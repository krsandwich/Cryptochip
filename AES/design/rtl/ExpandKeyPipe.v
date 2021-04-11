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
  reg   [7:0] rcon;
  reg [255:0] temp_key_in; 
  reg [255:0] next_even; 
  reg [255:0] next_odd;
  reg [127:0] out_even;
  reg [127:0] out_odd;
  reg [  0:0] state; 
  reg [  0:0] temp_valid;
  reg [  3:0] round; 

  assign key_out = temp_key;
  assign valid = temp_valid; 

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      temp_key <= '{128'd0,128'd0,128'd0,128'd0,128'd0,128'd0,128'd0,128'd0,
                    128'd0,128'd0,128'd0,128'd0,128'd0,128'd0,128'd0};
      temp_valid <= 0;
      round <= 0;
      state <= 0; 
    end
    else begin
      case (state)
        `WAIT_STATE: begin
          if (ready) begin 
            state <= `GENERATE_STATE;
            temp_key[0] <= key_in[255:128];
            temp_key[1] <= key_in[128:0];  
            temp_key_in <= key_in; 
            temp_valid <= 0; 
            round <= 4'd2;
          end else begin 
            state <= `WAIT_STATE;
          end
        end
        `GENERATE_STATE: begin   
          if(round[0]) begin 
            temp_key[round] <= out_odd;
            temp_key_in <= next_odd; 
          end else begin 
            temp_key[round] <= out_even;
            temp_key_in <= next_even; 
          end

          if (round == 4'd14) begin
            state <= `WAIT_STATE;
            temp_valid <= 1; 
            round <= 0; 
          end else begin 
            state <= `GENERATE_STATE;
            temp_valid <= 0;
            round <= round + 1;
          end
        end
        default: begin
          state <= `WAIT_STATE;
          temp_valid <= 0; 
        end
      endcase
    end
  end


  ExpandKeyEvenHelper ExpandKeyEvenHelper(.in(temp_key_in),.rcon(rcon), .next(next_even), .out(out_even));
  ExpandKeyOddHelper  ExpandKeyOddHelper (.in(temp_key_in), .next(next_odd), .out(out_odd));
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