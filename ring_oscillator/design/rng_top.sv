`define RING_OSC_FREQ_HZ 20e6
`define INVERTER_DELAY_NS 0.1
`timescale 1ns/1ps

module rng_top #(
		 parameter NUM_INV = 32
)(
  input 	       clk,
  input 	       rst,
  input 	       en_i,
  output [NUM_INV-1:0] out_random_num
);

   genvar i;
   logic [NUM_INV-1:0] clk_o;

   generate
      for (i = 0; i < NUM_INV; i++) begin
	 ring_oscillator #(
			   .NO_STAGES(3+i*2),
                           .INV_DELAY_ns(`INVERTER_DELAY_NS)
			   ) DUT (
				  .en(en_i),
				  .clk_out(clk_o[i])
				  );

      end
   endgenerate

   lhca #(.WIDTH(NUM_INV)) lhca(.clk(clk), .rst(rst), .source(clk_o), .state(out_random_num));
endmodule
