`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2022 02:37:19 PM
// Design Name: 
// Module Name: full_adder
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

//Implementation of full_adder
module full_adder(input a, b, cin, output s, cout);

    logic s_1, cout_1, s_2, cout_2;
    
    half_adder ha_1(a, b, s_1, cout_1);
    half_adder ha_2(cin, s_1, s_2, cout_2);
    
    assign s = s_2;
    or o( cout, cout_1, cout_2);

endmodule