`timescale 1ns/1ps

module ring_oscillator#(
                        parameter NO_STAGES=3, // No of inverter stage
			parameter INV_DELAY_ns=2       // Delay of single inverter in ns
                        )(
                          input wire  en,
                          output wire clk_out
                          );

   wire [NO_STAGES:0] 			wi;
   assign wi[0] = en ? wi[NO_STAGES] : 0;
   assign clk_out = en ? wi[NO_STAGES] : 0;

   genvar 				i;
    generate
       for(i = 0; i < NO_STAGES; i = i+1) begin
            if(i==0) begin
                `ifndef R_OSC_SYNTHESIS
               not #(INV_DELAY_ns) (wi[i+1], wi[0]);

                `else
               not (wi[i+1], wi[0]);

                `endif
            end
            else if(i>= NO_STAGES) begin
                `ifndef R_OSC_SYNTHESIS
               not #(INV_DELAY_ns) (wi[i+1], wi[i]);

                `else
               not (wi[i+1], wi[i]);

                `endif
            end
            else begin
                `ifndef R_OSC_SYNTHESIS
               not #(INV_DELAY_ns) (wi[i+1], wi[i]);

                `else
               not (wi[i+1], wi[i]);

                `endif
            end
        end
    endgenerate
endmodule
