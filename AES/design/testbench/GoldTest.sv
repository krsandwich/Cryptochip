`define CLK_PERIOD 50
`define ASSIGNMENT_DELAY 5
`define FINISH_TIME 2000000
`define NUM_TEST_VECTORS 100

module AESTb;
 
  reg clk;
  reg rst;
  reg output_ready , input_valid;
  wire input_ready , output_valid;
  wire  [255 : 0] data_in;
  wire [127 : 0] data_out;
  reg [127 : 0]  saved_out;
  wire busy;
  reg  [6:0] opcode; 

  always #(`CLK_PERIOD/2) clk =~clk;
  
  AESTop AESTop_inst
  (
    .clk(clk),
    .rst(rst),
    .input_valid(input_valid),
    .output_ready(output_ready),
    .opcode(opcode),
    .data_in(data_in), //end of input 
    .data_out(data_out),
    .input_ready(input_ready),
    .output_valid(output_valid),
    .busy(busy)
  );

    reg [127:0] encrypt_mem [1:0];
    reg [127:0] decrypt_mem [1:0];
    reg [255:0] key_mem [1:0];
    reg [$clog2(1)-1:0] data_idx;
    reg [$clog2(1)-1:0] key_idx;
    integer  f;
    
    initial begin
        $readmemh("inputs.mem", encrypt_mem);
    end

    initial begin
        $readmemh("key.mem", key_mem);
    end

  assign data_in = (opcode == 0) ? key_mem[key_idx] : ((opcode == 1) ? {encrypt_mem[data_idx], 128'd0} : {decrypt_mem[data_idx], 128'd0}); 

  always_ff @(posedge clk, posedge rst) begin
      if(rst) begin
        output_ready <= 1; 
        opcode = 0; 
        data_idx <= 0;
      end
      else begin
          input_valid <= 1'b1; 
          
          if(output_valid) begin
            if(opcode == 0) begin
              opcode <= 1; 
              key_idx <= key_idx + 1;
            end else if(opcode == 1) begin 
              decrypt_mem[data_idx] <= data_out; 
              $fmonitor(f, "%h\n", data_out[127:120]);
              opcode <= 2;  
            end else if(opcode == 2) begin 
              opcode <= 0;
              if (encrypt_mem[data_idx] != data_out) begin
                $display("FAIL");
              end else begin
                $display("PASS");
              end
              data_idx <= data_idx + 1; 
            end
          end
      end
  end
  initial begin
    f = $fopen("output.txt");
    $display("starting");
    clk <= 0;
    rst <= 0;
    #20 rst <= 1;
    #20 rst <= 0; 

    #3000
    $finish;
  end


  initial begin
    $vcdplusfile("dump.vcd");
    $vcdplusmemon();
    $vcdpluson(0, AESTb);
    #(`FINISH_TIME);
    #20000000;
    $finish(2);
  end

endmodule 
