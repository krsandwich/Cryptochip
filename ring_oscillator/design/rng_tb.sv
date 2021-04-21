// Code your testbench here
// or browse Examples
`define RING_OSC_FREQ_HZ 20e6
`define INVERTER_DELAY_NS 0.1
`define NUM_INV 32
`timescale 1ns/1ps

module ring_osc_tb();

   logic en_i;

   logic rst;

   logic [`NUM_INV-1:0] clk_o;

   logic 		clk = 0;

   always begin
      clk <= ~clk;

      #10;

   end

   // local variables
   real prev_time = 0;
   // store previous clk posedge
   real curr_time = 0;
   // store current clk posedge
   bit 	first_sample;
   // Update measurement flag
   real clk_freq;
   // clk freq (measured)
   real exp_clk_freq;
   // expected clk freq (calculated from equation)

   genvar i;

   generate
      for (i = 0; i < `NUM_INV; i++) begin
	 ring_oscillator #(
			   .NO_STAGES(3+i*2),
                           .INV_DELAY_ns(`INVERTER_DELAY_NS)
			   ) DUT (
				  .en(en_i),
				  .clk_out(clk_o[i])
				  );

      end
   endgenerate

   logic [31:0] state;

   lhca #(.WIDTH(32)) lhca(.clk(clk), .rst(rst), .source(clk_o), .state(state));


   integer 	f;

       initial begin
	  f = $fopen("output.txt");

	  en_i = 0;

	  rst = 1;

	  #10ns;

	  rst = 0;

	  en_i = 1;

	  #20ns;

          //$monitor("@:%t rand number:%d", $time, state);
          $fmonitor(f, "%d", state);

	  #200000ns;

	  $finish();

       end

endmodule
