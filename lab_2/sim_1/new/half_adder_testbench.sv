`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2022 02:54:07 PM
// Design Name: 
// Module Name: half_adder_testbench
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


module half_adder_testbench();
    logic a, b, s, c;
    half_adder ha(a,b,s,c);
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
