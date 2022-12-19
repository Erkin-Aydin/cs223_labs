`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2022 07:12:28 PM
// Design Name: 
// Module Name: dmem_tb
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


module dmem_tb();

    logic clk, M_clr, M_we, M_re;
    logic[3:0] M_add, M_wd, M_rd;

    always begin
        clk <= 0; #5;    
        clk <= 1; #5;
    end
    dmem dmem(clk, M_clr, M_add, M_wd, M_we, M_re, M_rd);
    initial begin
        
        M_clr = 0;
        M_we = 0;
        M_re = 0;
        M_wd = 4'b0000; #10;
        M_add = 4'b0001;
        M_wd = 4'b1010; #5;
        M_we = 1; #5;
        M_we = 0; #5;
        M_re = 1; #5;
        M_re = 0;
        M_clr = 1; #20; 
        M_clr = 0; #10;
        M_re = 1;

    end
endmodule
