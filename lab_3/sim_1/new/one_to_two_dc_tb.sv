`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2022 05:55:20 PM
// Design Name: 
// Module Name: one_to_two_dc_tb
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


module one_to_two_dc_tb();
    
    logic i, e, y1, y0;
    
    one_to_two_dc dc1(i, e, y1, y0);
    
    initial begin
    
        assign e = 0;
        assign i = 0; #30;
        
        assign i = 1; #30;
        
        assign e = 1;
        assign i = 0; #30;
                
        assign i = 1; #30;
    
    end
    
endmodule
