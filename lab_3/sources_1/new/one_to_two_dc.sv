`timescale 1ns / 1ps



module one_to_two_dc(
                input logic i, e,
                output logic y1, y0);
    
    assign y0 = (~i) && e;
    assign y1 = i && e;
    
endmodule