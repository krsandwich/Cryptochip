`define CLK_PERIOD 20
`define ASSIGNMENT_DELAY 5
`define FINISH_TIME 2000000
`define NUM_TEST_VECTORS 100

module ExampleTb;
  
  localparam ADDR_WIDTH = $clog2(`NUM_TEST_VECTORS);
 
  reg clk;
  reg reset;
  reg [ADDR_WIDTH - 1 : 0] a_b_addr_r;
  reg [ADDR_WIDTH - 1 : 0] c_addr_r;
  wire final_out;
  supply0 VSS;
  supply1 VDD;

  reg [16 + 16 + 16 - 1 : 0] test_vectors [`NUM_TEST_VECTORS - 1 : 0];

  always #(`CLK_PERIOD/2) clk =~clk;
  
  Example Example_inst
  (
    .clk(clk),
    .msg(test_vectors[a_b_addr_r][31:0]),
    .reset(reset),
    .out(final_out)
    `ifdef USE_POWER_PINS
    ,
    .VSS(VSS),
    .VDD(VDD)
    `endif
  );

  initial begin
    $readmemh("inputs/test_vectors.txt", test_vectors);
    clk <= 0;
    reset <= 1;
    a_b_addr_r <= 0;
    c_addr_r <= 0;
    #(10*`CLK_PERIOD) reset <= 0;

  end

  always @ (posedge clk) begin
    if (!reset) begin
      a_b_addr_r <= # `ASSIGNMENT_DELAY (a_b_addr_r + 1); 
      // Don't change the inputs right after the clock edge because that will cause problems in gate level simulation
    end

    if (final_out) begin
      $display("clock high");
      c_addr_r <= c_addr_r + 1;
      if (c_addr_r == `NUM_TEST_VECTORS - 1) $finish;
    end
  end

  initial begin
    $vcdplusfile("dump.vcd");
    $vcdplusmemon();
    $vcdpluson(0, ExampleTb);
    #(`FINISH_TIME);
    $finish(2);
  end

endmodule 
