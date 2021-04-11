`define CLK_PERIOD 20
`define ASSIGNMENT_DELAY 5
`define FINISH_TIME 2000000
`define NUM_TEST_VECTORS 100

module AESTb;
 
  reg clk;
  reg reset;
  reg ready;
  reg [127 : 0] data_in;
  wire [127 : 0] data_out;
  wire final_out;
  wire valid;
  reg data_set;

  always #(`CLK_PERIOD/2) clk =~clk;
  
  AESEncrypt AESEncrypt_inst
  (
    .clk(clk),
    .rst_n(reset),
    .ready(ready),
    .data_in(data_in),
    .key(256'd1),
    .data_out(data_out),
    .valid(valid)
  );

  initial begin
    $display("starting");
    clk <= 0;
    reset <= 1;
    data_in <= 0;
    ready <= 0;
    data_set <=0;
    //#(10*`CLK_PERIOD) reset <= 0;
    #20 reset <= 0;
    #20 reset <= 1;
    data_in <= 128'd0; 
    ready <= 1;
    #20 ready <= 0;
    #3000
    $finish;
  end

  // always @ (posedge clk) begin
  //   if (!reset) begin
  //     if(!data_set) begin
  //       $display("data set");
  //       data_in <= # `ASSIGNMENT_DELAY (128'd1); 
  //       data_set <= 1;
  //       ready <= 1;
  //     end else begin 
  //       ready <= 0;
  //       $finish;
  //     end
  //     // Don't change the inputs right after the clock edge because that will cause problems in gate level simulation
  //   end

  //   if (valid) begin
  //     $display("valid set");
  //     $display("Output = %d", data_out);
  //     $finish;
  //   end
  // end

  initial begin
    $vcdplusfile("dump.vcd");
    $vcdplusmemon();
    $vcdpluson(0, AESTb);
    // #(`FINISH_TIME);
    #20000000;
    $finish(2);
  end

endmodule 