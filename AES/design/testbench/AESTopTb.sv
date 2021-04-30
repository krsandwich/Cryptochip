`define CLK_PERIOD 50
`define ASSIGNMENT_DELAY 5
`define FINISH_TIME 2000000
`define NUM_TEST_VECTORS 100

module AESTb;
 
  reg clk;
  reg reset;
  reg output_ready , input_valid;
  wire input_ready , output_valid;
  reg  [255 : 0] data_in;
  wire [127 : 0] data_out;
  wire busy;
  reg  [4:0] opcode; 

  always #(`CLK_PERIOD/2) clk =~clk;
  
  AESTop AESTop_inst
  (
    .clk(clk),
    .rst_n(reset),
    .input_valid(input_valid),
    .output_ready(output_ready),
    .opcode(opcode),
    .data_in(data_in), //end of input 
    .data_out(data_out),
    .input_ready(input_ready),
    .output_valid(output_valid),
    .busy(busy)
  );

  initial begin
    $display("starting");
    clk <= 0;
    reset <= 1;
    data_in <= 0;
    output_ready <= 1; 
    #(`CLK_PERIOD) reset <= 0;
    #(`CLK_PERIOD) reset <= 1;
    if(!input_ready)
      $display("INCORRECT: input ready");
    input_valid <= 1;
    opcode <= 5'd0;
    data_in <= 256'd1;
    #(`CLK_PERIOD) input_valid <= 0;
    if(!busy)
      $display("INCORRECT: busy");
    #(`CLK_PERIOD)
    #(`CLK_PERIOD)
    $display("Output = %h", data_out);
    input_valid <= 1;
    opcode <= 5'd1;
    data_in <= 256'd69;
    #(`CLK_PERIOD)
    input_valid <= 0;
    $display("Output = %h", data_out);
    #(`CLK_PERIOD)
    $display("Output = %h", data_out);

    //#(`CLK_PERIOD) data_ready <= 0;

    //#(`CLK_PERIOD) data_ready <= 1;
    //data_in <= 128'h69; 
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
    #(`FINISH_TIME);
    #20000000;
    $finish(2);
  end

endmodule 
