`define CLK_PERIOD 50
`define ASSIGNMENT_DELAY 5
`define FINISH_TIME 2000000
`define NUM_TEST_VECTORS 100

module EncryptTb;
 
  reg clk, rst;
  reg [127 : 0] data_in;
  wire [127 : 0] data_out;
  reg [255 : 0] key;
  wire [  127:0] key_out [14:0];
  reg key_ready, key_valid, encrypt_ready, encrypt_valid;

  always #(`CLK_PERIOD/2) clk =~clk;
  
  AESEncrypt AESEncrypt_inst
    (
      .clk(clk),
      .rst(rst),
      .ready(encrypt_ready),
      .data_in(data_in),
      .key(key_out),
      .data_out(data_out),
      .valid(encrypt_valid)
    );

  ExpandKey ExpandKey_inst
    (
      .clk(clk),
      .rst(rst),
      .ready(key_ready),
      .key_in(key),
      .key_out(key_out),
      .valid(key_valid)
    );

  initial begin
    clk <= 0;
    rst <= 0;
    #20 rst <= 1;
    #20 rst <= 0;
    key_ready<= 1;
    key <= 256'h1212121269696969343434343434343456565656565656567878787878787878;
    data_in <= 128'h1212121234343434ababababcdcdcdcd; 
    #200
    #20 encrypt_ready <= 1;
    #20 encrypt_ready <= 0;
    if(data_out != 128'ha52422117500d3e82c96d0dafc491931) begin
      $display("FAIL");
    end else begin 
      $display("PASS");
    end
    #20 

    #3000
    $finish;
  end


  initial begin
    $vcdplusfile("dump.vcd");
    $vcdplusmemon();
    $vcdpluson(0, EncryptTb);
    #(`FINISH_TIME);
    #20000000;
    $finish(2);
  end

endmodule 
