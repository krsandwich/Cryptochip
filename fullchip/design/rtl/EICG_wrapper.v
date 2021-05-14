/* verilator lint_off UNOPTFLAT */

module EICG_wrapper(
  output wire out,
  input  wire en,
  input  wire test_en,
  input  wire in
);
  
  /*
  reg en_latched //verilator clock_enable;

  always @(*) begin
     if (!in) begin
        en_latched = en || test_en;
     end
  end

  */
  sky130_fd_sc_hd__dlclkp clk_gate (.GCLK(out), .GATE(en), .CLK(in));

endmodule
