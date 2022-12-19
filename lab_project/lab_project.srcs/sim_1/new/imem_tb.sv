`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2022 07:01:54 PM
// Design Name: 
// Module Name: imem_tb
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


module imem_tb();

    logic clk, we, clr;
    logic[2:0] addr;
    logic[11:0] wd;
    logic[3:0] out;
    
    imem mem(clk, we, clr, addr, wd, out);
    always begin
        clk <= 0; #5;    
        clk <= 1; #5;
    end
    
    initial begin
        
        addr = 3'b000;
        wd = 11'b010_1010_1010;
        we = 0; 
        clr = 0; #5
        
        we = 1; #10;
        we = 0; #10;
        
        addr = 3'b111;
        we = 1; #5;
        we = 0;
        
    end
endmodule
