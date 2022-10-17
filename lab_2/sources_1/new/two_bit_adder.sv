`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2022 02:40:17 PM
// Design Name: 
// Module Name: two_bit_adder
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

//Implementation of two_bit_adder
module two_bit_adder(input logic [1:0]a,
                    input logic [1:0]b,
                    input logic cin,
                    output logic [1:0]s, 
                    output logic cout);
                
    logic sum_1, sum_2, carry_1, carry_2;
    
    full_adder fa_1(a[0], b[0], cin, sum_1, carry_1);
    full_adder fa_2(a[1], b[1], carry_1, sum_2, carry_2);
    
    assign s[0] = sum_1;
    assign s[1] = sum_2;
    assign cout = carry_2;

endmodule
