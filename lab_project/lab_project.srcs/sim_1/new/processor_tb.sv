`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2022 09:55:02 AM
// Design Name: 
// Module Name: processor_tb
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


module processor_tb();

    logic clk, left_btn, mid_btn, right_btn, up_btn, low_btn;
    logic[15:0] sw;
    logic[6:0] segments;
    logic dp;
    logic[3:0] disp;
    
    always begin
        clk <= 0; #5;    
        clk <= 1; #5;
    end
    
    processor pc(clk, left_btn, mid_btn, right_btn, up_btn, low_btn, sw, segments, dp, disp);
    
    initial begin
        sw = 16'b0000_0110_0000_0000;
        left_btn = 0;
        mid_btn = 0;
        right_btn = 0;
        up_btn = 0;
        low_btn = 1;#10;
        low_btn = 0; #5;
        sw = 16'b0011_0110_0000_0000;
        up_btn = 1; #10;
        up_btn = 0; #10;
        sw = 16'b0001_1000_0000_0000;
        up_btn = 1; #10;
        up_btn = 0; #10;
        sw = 16'b1111_001_000_100_011;
        right_btn = 1; #10;
        right_btn = 0; #10;
    end
endmodule
