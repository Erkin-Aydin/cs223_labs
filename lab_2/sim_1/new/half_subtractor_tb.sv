`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2022 02:54:07 PM
// Design Name: 
// Module Name: half_subtractor_t
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

module half_subtractor_tb();
    logic a, b, d, bout;
    half_subtractor hs(a,b,d,bout);
    initial begin
        assign a = 0;
        assign b = 0;
        #100;
        
        assign b= 1; #100;
        
        assign a = 1;
        assign b = 0; #100;
        
        assign b = 1; #100;
        
    end
endmodule