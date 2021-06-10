
`default_nettype wire
module dffram_wrapper
#(
  parameter DATA_WIDTH = 8,
  parameter ADDR_WIDTH = 7,
  parameter DEPTH = 128
)(
  input CLK,
  input [( (DATA_WIDTH + 8 - 1) / 8) - 1 : 0]WE,
  input EN,
  input [ADDR_WIDTH - 1 : 0] A,
  input [DATA_WIDTH - 1 : 0] Di,
  output [DATA_WIDTH - 1 : 0] Do
);
  
  /*
  // synopsys translate_off
  reg [DATA_WIDTH - 1 : 0] rdata_reg;
  
  reg [DATA_WIDTH - 1 : 0] mem [DEPTH - 1 : 0];
  
  always @(posedge CLK) begin
    if (wen) begin
      mem[wadr] <= wdata; // write port
    end
    if (ren) begin
      rdata_reg <= mem[radr]; // read port
    end
  end
  assign Do = rdata_reg;
  
  // synopsys translate_on
  */
  
  genvar x, y; 
  
  generate
    if (DEPTH == 8) begin

      wire [DATA_WIDTH : 0] rdata_w;

      for (x = 0; x < DATA_WIDTH/32; x = x + 1) begin: width_macro
          wire [3:0] bank_WE;
          assign bank_WE = WE[4*(x+1)-1 : 4*x];
          RAM8x32 dffram (
            .CLK(CLK),
            .WE(bank_WE),
            .EN(EN),
            .Di(Di[32*(x+1)-1 : 32*x]),
            .Do(rdata_w[32*(x+1)-1 : 32*x]),
            .A(A[ 2:0 ])
          );
      end

      assign Do = rdata_w;

    end else if (DEPTH < 32) begin

      wire [DATA_WIDTH : 0] rdata_w [DEPTH/8 - 1 : 0];
      reg  [ADDR_WIDTH - 1 : 0] radr_r;

      always @ (posedge CLK) begin
        radr_r <= A;
      end

      for (x = 0; x < DATA_WIDTH/32; x = x + 1) begin: width_macro
        for (y = 0; y < DEPTH/8; y = y + 1) begin: depth_macro
          RAM8x32 dffram (
            .CLK(CLK),
            .WE(WE[4*(x+1)-1 : 4*x] & {4{(A[ ADDR_WIDTH-1 : 3 ] == y)}}),
            .EN(EN),
            .Di(Di[32*(x+1)-1 : 32*x]),
            .Do(rdata_w[y][32*(x+1)-1 : 32*x]),
            .A(A[ 2:0 ])
          );
        end
      end

      assign Do = rdata_w[radr_r[ADDR_WIDTH - 1 : 3]];

    end else if  (DEPTH == 32) begin
      
      wire [DATA_WIDTH : 0] rdata_w;

      for (x = 0; x < DATA_WIDTH/32; x = x + 1) begin: width_macro
        RAM32x32 dffram (
          .CLK(CLK),
          .WE(WE[4*(x+1)-1 : 4*x]),
          .EN(EN),
          .Di(Di[32*(x+1)-1 : 32*x]),
          .Do(rdata_w[32*(x+1)-1 : 32*x]),
          .A(A[ 4:0 ])
        );
      end

      assign Do = rdata_w;

    end else if (DEPTH < 128) begin

      wire [DATA_WIDTH : 0] rdata_w [DEPTH/32 - 1 : 0];
      reg  [ADDR_WIDTH - 1 : 0] radr_r;

      always @ (posedge CLK) begin
        radr_r <= A;
      end

      for (x = 0; x < DATA_WIDTH/32; x = x + 1) begin: width_macro
        for (y = 0; y < DEPTH/32; y = y + 1) begin: depth_macro
          RAM32x32 dffram (
            .CLK(CLK),
            .WE(WE[4*(x+1)-1 : 4*x] & {4{(A[ ADDR_WIDTH-1 : 5 ] == y)}}),
            .EN(EN),
            .Di(Di[32*(x+1)-1 : 32*x]),
            .Do(rdata_w[y][32*(x+1)-1 : 32*x]),
            .A(A[ 4:0 ])
          );
        end
      end

      assign Do = rdata_w[radr_r[ADDR_WIDTH - 1 : 5]];
      
    end else if (DEPTH == 128) begin

      wire [DATA_WIDTH : 0] rdata_w ;

      for (x = 0; x < DATA_WIDTH/32; x = x + 1) begin: width_macro
        RAM128x32 dffram (
          .CLK(CLK),
          .WE(WE[4*(x+1)-1 : 4*x]),
          .EN(EN),
          .Di(Di[32*(x+1)-1 : 32*x]),
          .Do(rdata_w[32*(x+1)-1 : 32*x]),
          .A(A[ 6:0 ])
        );
      end

      assign Do = rdata_w;
      
    end else if (DEPTH < 512) begin

      wire [DATA_WIDTH : 0] rdata_w [DEPTH/128 - 1 : 0];
      reg  [ADDR_WIDTH - 1 : 0] radr_r;

      always @ (posedge CLK) begin
        radr_r <= A;
      end

      for (x = 0; x < DATA_WIDTH/32; x = x + 1) begin: width_macro
        for (y = 0; y < DEPTH/128; y = y + 1) begin: depth_macro
          RAM128x32 dffram (
            .CLK(CLK),
            .WE(WE[4*(x+1)-1 : 4*x] & {4{(A[ ADDR_WIDTH-1 : 7 ] == y)}}),
            .EN(EN),
            .Di(Di[32*(x+1)-1 : 32*x]),
            .Do(rdata_w[y][32*(x+1)-1 : 32*x]),
            .A(A[ 6:0 ])
          );
        end
      end

      assign Do = rdata_w[radr_r[ADDR_WIDTH - 1 : 7]];

  
    end else if (DEPTH == 512) begin

      wire [DATA_WIDTH : 0] rdata_w;

      for (x = 0; x < DATA_WIDTH/32; x = x + 1) begin: width_macro
        RAM512x32 dffram (
          .CLK(CLK),
          .WE(WE[4*(x+1)-1 : 4*x]),
          .EN(EN),
          .Di(Di[32*(x+1)-1 : 32*x]),
          .Do(rdata_w[32*(x+1)-1 : 32*x]),
          .A(A[ 8:0 ])
        );
      end

      assign Do = rdata_w;

    end else begin

      wire [DATA_WIDTH : 0] rdata_w [DEPTH/512 - 1 : 0];
      reg  [ADDR_WIDTH - 1 : 0] radr_r;

      always @ (posedge CLK) begin
        radr_r <= A;
      end

      for (x = 0; x < DATA_WIDTH/32; x = x + 1) begin: width_macro
        for (y = 0; y < DEPTH/512; y = y + 1) begin: depth_macro
          RAM512x32 dffram (
            .CLK(CLK),
            .WE(WE[4*(x+1)-1 : 4*x] & {4{(A[ ADDR_WIDTH-1 : 9 ] == y)}}),
            .EN(EN),
            .Di(Di[32*(x+1)-1 : 32*x]),
            .Do(rdata_w[y][32*(x+1)-1 : 32*x]),
            .A(A[ 8:0 ])
          );
        end
      end

      assign Do = rdata_w[radr_r[ADDR_WIDTH - 1 : 9]];
      
    end
      
  endgenerate
  
endmodule



module data_arrays_0_ext( // @[anonymous source 2:2]
  input  [5:0]  RW0_addr, // @[anonymous source 3:4]
  input         RW0_clk, // @[anonymous source 4:4]
  input  [63:0] RW0_wdata, // @[anonymous source 5:4]
  output [63:0] RW0_rdata, // @[anonymous source 6:4]
  input         RW0_en, // @[anonymous source 7:4]
  input         RW0_wmode, // @[anonymous source 8:4]
  input  [7:0]  RW0_wmask // @[anonymous source 9:4]
);
 dffram_wrapper
#(
  .DATA_WIDTH(64),
  .ADDR_WIDTH(6),
  .DEPTH(64) // 2^width
) dffram (
  .CLK(RW0_clk),
  .WE({8{RW0_wmode}} & RW0_wmask),
  .EN(RW0_en),
  .A(RW0_addr),
  .Di(RW0_wdata),
  .Do(RW0_rdata)
);
endmodule
module tag_array_ext( // @[anonymous source 78:2]
  input  [2:0]  RW0_addr, // @[anonymous source 79:4]
  input         RW0_clk, // @[anonymous source 80:4]
  input  [24:0] RW0_wdata, // @[anonymous source 81:4]
  output [24:0] RW0_rdata, // @[anonymous source 82:4]
  input         RW0_en, // @[anonymous source 83:4]
  input         RW0_wmode // @[anonymous source 84:4]
);
wire [6:0] temp;
dffram_wrapper
#(
  .DATA_WIDTH(32),
  .ADDR_WIDTH(3), // bits in addr 
  .DEPTH(8)
) dffram (
  .CLK(RW0_clk),
  .WE({4{RW0_wmode}}),
  .EN(RW0_en),
  .A(RW0_addr),
  .Di({7'b0, RW0_wdata}),
  .Do({temp, RW0_rdata})
);
endmodule
module tag_array_0_ext( // @[anonymous source 96:2]
  input  [2:0]  RW0_addr, // @[anonymous source 97:4]
  input         RW0_clk, // @[anonymous source 98:4]
  input  [23:0] RW0_wdata, // @[anonymous source 99:4]
  output [23:0] RW0_rdata, // @[anonymous source 100:4]
  input         RW0_en, // @[anonymous source 101:4]
  input         RW0_wmode, // @[anonymous source 102:4]
  input         RW0_wmask // @[anonymous source 103:4]
);
wire [7:0] temp;
dffram_wrapper
#(
  .DATA_WIDTH(32),
  .ADDR_WIDTH(3), // bits in addr 
  .DEPTH(8)
) dffram (
  .CLK(RW0_clk),
  .WE({4{RW0_wmode}} & {4{RW0_wmask}}),
  .EN(RW0_en),
  .A(RW0_addr),
  .Di({8'b0, RW0_wdata}),
  .Do({temp, RW0_rdata})
);
endmodule
module data_arrays_0_0_ext( // @[anonymous source 116:2]
  input  [5:0]  RW0_addr, // @[anonymous source 117:4]
  input         RW0_clk, // @[anonymous source 118:4]
  input  [31:0] RW0_wdata, // @[anonymous source 119:4]
  output [31:0] RW0_rdata, // @[anonymous source 120:4]
  input         RW0_en, // @[anonymous source 121:4]
  input         RW0_wmode, // @[anonymous source 122:4]
  input         RW0_wmask // @[anonymous source 123:4]
);
dffram_wrapper
#(
  .DATA_WIDTH(32), //rwdata 
  .ADDR_WIDTH(6),
  .DEPTH(64) // 2^width
) dffram (
  .CLK(RW0_clk),
  .WE({4{RW0_wmode & RW0_wmask}}),
  .EN(RW0_en),
  .A(RW0_addr),
  .Di(RW0_wdata),
  .Do(RW0_rdata)
);
endmodule
module mem_ext( // @[anonymous source 136:2]
  input  [8:0]  RW0_addr, // @[anonymous source 137:4]
  input         RW0_clk, // @[anonymous source 138:4]
  input  [63:0] RW0_wdata, // @[anonymous source 139:4]
  output [63:0] RW0_rdata, // @[anonymous source 140:4]
  input         RW0_en, // @[anonymous source 141:4]
  input         RW0_wmode, // @[anonymous source 142:4]
  input  [7:0]  RW0_wmask // @[anonymous source 143:4]
);
dffram_wrapper
#(
  .DATA_WIDTH(64), //rwdata 
  .ADDR_WIDTH(9),
  .DEPTH(512) // 2^width
) dffram (
  .CLK(RW0_clk),
  .WE({8{RW0_wmode}} & RW0_wmask),
  .EN(RW0_en),
  .A(RW0_addr),
  .Di(RW0_wdata),
  .Do(RW0_rdata)
);

endmodule
module split_data_arrays_0_ext( // @[anonymous source 212:2]
  input  [5:0] RW0_addr, // @[anonymous source 213:4]
  input        RW0_clk, // @[anonymous source 214:4]
  input  [7:0] RW0_wdata, // @[anonymous source 215:4]
  output [7:0] RW0_rdata, // @[anonymous source 216:4]
  input        RW0_en, // @[anonymous source 217:4]
  input        RW0_wmode, // @[anonymous source 218:4]
  input        RW0_wmask // @[anonymous source 219:4]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] ram [0:63]; // @[anonymous source 221:4]
  wire [7:0] ram_RW_0_r_data; // @[anonymous source 221:4]
  wire [5:0] ram_RW_0_r_addr; // @[anonymous source 221:4]
  wire [7:0] ram_RW_0_w_data; // @[anonymous source 221:4]
  wire [5:0] ram_RW_0_w_addr; // @[anonymous source 221:4]
  wire  ram_RW_0_w_mask; // @[anonymous source 221:4]
  wire  ram_RW_0_w_en; // @[anonymous source 221:4]
  reg  ram_RW_0_r_en_pipe_0;
  reg [5:0] ram_RW_0_r_addr_pipe_0;
  wire  _GEN_0 = ~RW0_wmode;
  wire  _GEN_1 = ~RW0_wmode;
  assign ram_RW_0_r_addr = ram_RW_0_r_addr_pipe_0;
  assign ram_RW_0_r_data = ram[ram_RW_0_r_addr]; // @[anonymous source 221:4]
  assign ram_RW_0_w_data = RW0_wdata;
  assign ram_RW_0_w_addr = RW0_addr;
  assign ram_RW_0_w_mask = RW0_wmask;
  assign ram_RW_0_w_en = RW0_en & RW0_wmode;
  assign RW0_rdata = ram_RW_0_r_data; // @[anonymous source 233:4]
  always @(posedge RW0_clk) begin
    if(ram_RW_0_w_en & ram_RW_0_w_mask) begin
      ram[ram_RW_0_w_addr] <= ram_RW_0_w_data; // @[anonymous source 221:4]
    end
    ram_RW_0_r_en_pipe_0 <= RW0_en & ~RW0_wmode;
    if (RW0_en & ~RW0_wmode) begin
      ram_RW_0_r_addr_pipe_0 <= RW0_addr;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ram_RW_0_r_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ram_RW_0_r_addr_pipe_0 = _RAND_2[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module split_tag_array_ext( // @[anonymous source 236:2]
  input  [2:0]  RW0_addr, // @[anonymous source 237:4]
  input         RW0_clk, // @[anonymous source 238:4]
  input  [24:0] RW0_wdata, // @[anonymous source 239:4]
  output [24:0] RW0_rdata, // @[anonymous source 240:4]
  input         RW0_en, // @[anonymous source 241:4]
  input         RW0_wmode // @[anonymous source 242:4]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [24:0] ram [0:7]; // @[anonymous source 244:4]
  wire [24:0] ram_RW_0_r_data; // @[anonymous source 244:4]
  wire [2:0] ram_RW_0_r_addr; // @[anonymous source 244:4]
  wire [24:0] ram_RW_0_w_data; // @[anonymous source 244:4]
  wire [2:0] ram_RW_0_w_addr; // @[anonymous source 244:4]
  wire  ram_RW_0_w_mask; // @[anonymous source 244:4]
  wire  ram_RW_0_w_en; // @[anonymous source 244:4]
  reg  ram_RW_0_r_en_pipe_0;
  reg [2:0] ram_RW_0_r_addr_pipe_0;
  wire  _GEN_0 = ~RW0_wmode;
  wire  _GEN_1 = ~RW0_wmode;
  assign ram_RW_0_r_addr = ram_RW_0_r_addr_pipe_0;
  assign ram_RW_0_r_data = ram[ram_RW_0_r_addr]; // @[anonymous source 244:4]
  assign ram_RW_0_w_data = RW0_wdata;
  assign ram_RW_0_w_addr = RW0_addr;
  assign ram_RW_0_w_mask = 1'h1;
  assign ram_RW_0_w_en = RW0_en & RW0_wmode;
  assign RW0_rdata = ram_RW_0_r_data; // @[anonymous source 256:4]
  always @(posedge RW0_clk) begin
    if(ram_RW_0_w_en & ram_RW_0_w_mask) begin
      ram[ram_RW_0_w_addr] <= ram_RW_0_w_data; // @[anonymous source 244:4]
    end
    ram_RW_0_r_en_pipe_0 <= RW0_en & ~RW0_wmode;
    if (RW0_en & ~RW0_wmode) begin
      ram_RW_0_r_addr_pipe_0 <= RW0_addr;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    ram[initvar] = _RAND_0[24:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ram_RW_0_r_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ram_RW_0_r_addr_pipe_0 = _RAND_2[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module split_tag_array_0_ext( // @[anonymous source 259:2]
  input  [2:0]  RW0_addr, // @[anonymous source 260:4]
  input         RW0_clk, // @[anonymous source 261:4]
  input  [23:0] RW0_wdata, // @[anonymous source 262:4]
  output [23:0] RW0_rdata, // @[anonymous source 263:4]
  input         RW0_en, // @[anonymous source 264:4]
  input         RW0_wmode, // @[anonymous source 265:4]
  input         RW0_wmask // @[anonymous source 266:4]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [23:0] ram [0:7]; // @[anonymous source 268:4]
  wire [23:0] ram_RW_0_r_data; // @[anonymous source 268:4]
  wire [2:0] ram_RW_0_r_addr; // @[anonymous source 268:4]
  wire [23:0] ram_RW_0_w_data; // @[anonymous source 268:4]
  wire [2:0] ram_RW_0_w_addr; // @[anonymous source 268:4]
  wire  ram_RW_0_w_mask; // @[anonymous source 268:4]
  wire  ram_RW_0_w_en; // @[anonymous source 268:4]
  reg  ram_RW_0_r_en_pipe_0;
  reg [2:0] ram_RW_0_r_addr_pipe_0;
  wire  _GEN_0 = ~RW0_wmode;
  wire  _GEN_1 = ~RW0_wmode;
  assign ram_RW_0_r_addr = ram_RW_0_r_addr_pipe_0;
  assign ram_RW_0_r_data = ram[ram_RW_0_r_addr]; // @[anonymous source 268:4]
  assign ram_RW_0_w_data = RW0_wdata;
  assign ram_RW_0_w_addr = RW0_addr;
  assign ram_RW_0_w_mask = RW0_wmask;
  assign ram_RW_0_w_en = RW0_en & RW0_wmode;
  assign RW0_rdata = ram_RW_0_r_data; // @[anonymous source 280:4]
  always @(posedge RW0_clk) begin
    if(ram_RW_0_w_en & ram_RW_0_w_mask) begin
      ram[ram_RW_0_w_addr] <= ram_RW_0_w_data; // @[anonymous source 268:4]
    end
    ram_RW_0_r_en_pipe_0 <= RW0_en & ~RW0_wmode;
    if (RW0_en & ~RW0_wmode) begin
      ram_RW_0_r_addr_pipe_0 <= RW0_addr;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    ram[initvar] = _RAND_0[23:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ram_RW_0_r_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ram_RW_0_r_addr_pipe_0 = _RAND_2[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module split_data_arrays_0_0_ext( // @[anonymous source 283:2]
  input  [5:0]  RW0_addr, // @[anonymous source 284:4]
  input         RW0_clk, // @[anonymous source 285:4]
  input  [31:0] RW0_wdata, // @[anonymous source 286:4]
  output [31:0] RW0_rdata, // @[anonymous source 287:4]
  input         RW0_en, // @[anonymous source 288:4]
  input         RW0_wmode, // @[anonymous source 289:4]
  input         RW0_wmask // @[anonymous source 290:4]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram [0:63]; // @[anonymous source 292:4]
  wire [31:0] ram_RW_0_r_data; // @[anonymous source 292:4]
  wire [5:0] ram_RW_0_r_addr; // @[anonymous source 292:4]
  wire [31:0] ram_RW_0_w_data; // @[anonymous source 292:4]
  wire [5:0] ram_RW_0_w_addr; // @[anonymous source 292:4]
  wire  ram_RW_0_w_mask; // @[anonymous source 292:4]
  wire  ram_RW_0_w_en; // @[anonymous source 292:4]
  reg  ram_RW_0_r_en_pipe_0;
  reg [5:0] ram_RW_0_r_addr_pipe_0;
  wire  _GEN_0 = ~RW0_wmode;
  wire  _GEN_1 = ~RW0_wmode;
  assign ram_RW_0_r_addr = ram_RW_0_r_addr_pipe_0;
  assign ram_RW_0_r_data = ram[ram_RW_0_r_addr]; // @[anonymous source 292:4]
  assign ram_RW_0_w_data = RW0_wdata;
  assign ram_RW_0_w_addr = RW0_addr;
  assign ram_RW_0_w_mask = RW0_wmask;
  assign ram_RW_0_w_en = RW0_en & RW0_wmode;
  assign RW0_rdata = ram_RW_0_r_data; // @[anonymous source 304:4]
  always @(posedge RW0_clk) begin
    if(ram_RW_0_w_en & ram_RW_0_w_mask) begin
      ram[ram_RW_0_w_addr] <= ram_RW_0_w_data; // @[anonymous source 292:4]
    end
    ram_RW_0_r_en_pipe_0 <= RW0_en & ~RW0_wmode;
    if (RW0_en & ~RW0_wmode) begin
      ram_RW_0_r_addr_pipe_0 <= RW0_addr;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ram_RW_0_r_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ram_RW_0_r_addr_pipe_0 = _RAND_2[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module split_mem_ext( // @[anonymous source 307:2]
  input  [8:0] RW0_addr, // @[anonymous source 308:4]
  input        RW0_clk, // @[anonymous source 309:4]
  input  [7:0] RW0_wdata, // @[anonymous source 310:4]
  output [7:0] RW0_rdata, // @[anonymous source 311:4]
  input        RW0_en, // @[anonymous source 312:4]
  input        RW0_wmode, // @[anonymous source 313:4]
  input        RW0_wmask // @[anonymous source 314:4]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] ram [0:511]; // @[anonymous source 316:4]
  wire [7:0] ram_RW_0_r_data; // @[anonymous source 316:4]
  wire [8:0] ram_RW_0_r_addr; // @[anonymous source 316:4]
  wire [7:0] ram_RW_0_w_data; // @[anonymous source 316:4]
  wire [8:0] ram_RW_0_w_addr; // @[anonymous source 316:4]
  wire  ram_RW_0_w_mask; // @[anonymous source 316:4]
  wire  ram_RW_0_w_en; // @[anonymous source 316:4]
  reg  ram_RW_0_r_en_pipe_0;
  reg [8:0] ram_RW_0_r_addr_pipe_0;
  wire  _GEN_0 = ~RW0_wmode;
  wire  _GEN_1 = ~RW0_wmode;
  assign ram_RW_0_r_addr = ram_RW_0_r_addr_pipe_0;
  assign ram_RW_0_r_data = ram[ram_RW_0_r_addr]; // @[anonymous source 316:4]
  assign ram_RW_0_w_data = RW0_wdata;
  assign ram_RW_0_w_addr = RW0_addr;
  assign ram_RW_0_w_mask = RW0_wmask;
  assign ram_RW_0_w_en = RW0_en & RW0_wmode;
  assign RW0_rdata = ram_RW_0_r_data; // @[anonymous source 328:4]
  always @(posedge RW0_clk) begin
    if(ram_RW_0_w_en & ram_RW_0_w_mask) begin
      ram[ram_RW_0_w_addr] <= ram_RW_0_w_data; // @[anonymous source 316:4]
    end
    ram_RW_0_r_en_pipe_0 <= RW0_en & ~RW0_wmode;
    if (RW0_en & ~RW0_wmode) begin
      ram_RW_0_r_addr_pipe_0 <= RW0_addr;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    ram[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ram_RW_0_r_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ram_RW_0_r_addr_pipe_0 = _RAND_2[8:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
