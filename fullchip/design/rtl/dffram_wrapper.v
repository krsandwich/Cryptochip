


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
          RAM8 dffram (
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
          RAM8 dffram (
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
        RAM32 dffram (
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
          RAM32 dffram (
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
        RAM512 dffram (
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
          RAM512 dffram (
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



