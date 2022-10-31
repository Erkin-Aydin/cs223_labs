`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2022 06:27:22 PM
// Design Name: 
// Module Name: two_to_four_dc
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


module two_to_four_dc(
                    input logic i1, i0, e,
                    output logic y3, y2, y1, y0);
    
    logic d1, d0;
    
    one_to_two_dc dc1(i1, e, d1, d0);
    one_to_two_dc dc2(i0, d0, y1, y0);
    one_to_two_dc dc3(i0, d1, y3, y2);
    
endmodule
