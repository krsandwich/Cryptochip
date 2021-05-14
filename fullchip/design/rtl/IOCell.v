// See LICENSE for license details

`timescale 1ns/1ps

module GenericAnalogIOCell(
    inout wire pad,
    inout wire core
);

    assign core = 1'bz;
    assign pad = core;

endmodule

module GenericDigitalGPIOCell(
    inout wire pad,
    output wire i,
    input wire ie,
    input wire o,
    input wire oe
);

    assign pad = oe ? o : 1'bz;
    assign i = ie ? pad : 1'b0;

endmodule

module GenericDigitalInIOCell(
    input wire pad,
    output wire i,
    input wire ie
);

    assign i = ie ? pad : 1'b0;

endmodule

module GenericDigitalOutIOCell(
    output wire pad,
    input wire o,
    input wire oe
);

    assign pad = oe ? o : 1'bz;

endmodule
