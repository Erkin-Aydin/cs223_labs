`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2022 07:15:26 PM
// Design Name: 
// Module Name: two_to_four_dc_tb
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


module two_to_four_dc_tb();
    
    logic i1, i0, e;
    logic y3, y2, y1, y0;
    
    two_to_four_dc dc(i1, i0, e, y3, y2, y1, y0);
    
    initial begin
        
        assign e = 0;
        
        assign i1 = 0;
        assign i0 = 0; #90;
        
        assign i0 = 1; #90;
        
        assign i1 = 1;
        assign i0 = 0; #90;
        
        assign i0 = 1; #90;
        
        
        assign e = 1;
        
        assign i1 = 0;
        assign i0 = 0; #90;
        
        assign i0 = 1; #90;
        
        assign i1 = 1;
        assign i0 = 0; #90;
        
        assign i0 = 1; #90;
    end
    
endmodule
