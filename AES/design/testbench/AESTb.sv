`define CLK_PERIOD 50
`define ASSIGNMENT_DELAY 5
`define FINISH_TIME 2000000
`define NUM_TEST_VECTORS 100

module AESTb;
 
  reg clk;
  reg reset;
  reg key_ready;
  reg data_ready;
  reg [127 : 0] data_in;
  wire [127 : 0] data_out, decrypt_data_out;
  wire final_out;
  wire valid, decrypt_valid;
  wire key_valid;
  reg data_set;
  wire [  127:0] key_out [14:0];

  always #(`CLK_PERIOD/2) clk =~clk;
  
  AESEncryptPipe AESEncrypt_inst
  (
    .clk(clk),
    .rst_n(reset),
    .ready(data_ready),
    .data_in(data_in),
    .key(key_out),
    .data_out(data_out),
    .valid(valid)
  );

  AESDecrypt AESDecrypt_inst
  (
    .clk(clk),
    .rst_n(reset),
    .ready(valid),
    .data_in(data_out),
    .key(key_out),
    .data_out(decrypt_data_out),
    .valid(decrypt_valid)
  );

  ExpandKey ExpandKey_inst
  (
    .clk(clk),
    .rst_n(reset),
    .ready(key_ready),
    .key_in(256'd1),
    .key_out(key_out),
    .valid(key_valid)
  );

  initial begin
    $display("starting");
    clk <= 0;
    reset <= 1;
    data_in <= 0;
    data_ready <= 0;
    data_set <=0;
    #(`CLK_PERIOD) reset <= 0;
    #(`CLK_PERIOD) reset <= 1;
    key_ready <= 1;
    #(`CLK_PERIOD) key_ready <= 0;
    #(`CLK_PERIOD) data_ready <= 1;
    data_in <= 128'h69; 
    //#(`CLK_PERIOD) data_ready <= 0;

    //#(`CLK_PERIOD) data_ready <= 1;
    //data_in <= 128'h69; 
    #(`CLK_PERIOD) data_ready <= 0;

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
