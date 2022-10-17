`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2022 02:37:19 PM
// Design Name: 
// Module Name: lab_calculator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//Implementation of lab calculator
module lab_calculator(input logic a,
                        input logic b,
                        input logic c,
                        input logic d,
                        output logic y,
                        output logic z);
                        
    logic out_1, out_2, out_3, out_4;
    logic carry_1, bout_1;
    
    xor in_1(out_1, a, b);
    nand in_2(out_2, a, b);
    half_adder in_3(a, b, out_3, carry_1);
    half_subtractor in_4(a, b, out_4, bout_1);
    
    mux4 mux_1(out_4, out_3, out_2, out_1, c, d, y);
    mux2 mux_2(bout_1, carry_1, d, z);
    
endmodule
