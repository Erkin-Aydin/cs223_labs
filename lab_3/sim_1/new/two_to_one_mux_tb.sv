`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2022 04:10:11 PM
// Design Name: 
// Module Name: two_to_one_mux_tb
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


module two_to_one_mux_tb();

    logic i1, i0, s, d;
    two_to_one_mux mux2(i1, i0, s, d);
    initial begin
        
        assign i1 = 0;
        assign i0 = 0;
        assign s = 0;   #100;
        
        assign i0 = 1;  #100;
        
        assign i1 = 1;
        assign i0 = 0;  #100
        
        assign i0 = 1;  #100        
        
        assign i1 = 0;
        assign i0 = 0;
        assign s = 1;   #100;
        
        assign i0 = 1;  #100;
        
        assign i1 = 1;
        assign i0 = 0;  #100;
        
        assign i0 = 1;  #100;      
    end;

endmodule
