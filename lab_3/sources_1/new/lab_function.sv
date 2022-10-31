`timescale 1ns / 1ps



module lab_function(
                input logic a, b, c, d,
                output logic y);
    
        eight_to_one_mux mux8(0, 1, 0, 1, 1, 0, 1, 0, a, b, c, y);
    
endmodule