`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2022 06:37:01 PM
// Design Name: 
// Module Name: reg_file_tb
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


module reg_file_tb();

    logic clk, RF_clr, RF_we;
    logic[2:0] RF_ad1, RF_ad2, RF_wa;
    logic[3:0] RF_wd, RF_d1, RF_d2;
    always begin
        clk <= 0; #5;    
        clk <= 1; #5;
    end
    reg_file rf(clk, RF_clr, RF_ad1, RF_ad2, RF_wa, RF_wd, RF_we, RF_d1, RF_d2);

    initial begin
    
        RF_clr = 0;
        RF_we = 0;
        RF_ad1 = 3'b000;
        RF_ad2 = 3'b001;
        RF_wa = 3'b001;
        RF_wd = 4'b1010;#5;
        RF_we = 1; #10;
        RF_we = 0; #10;
        RF_clr = 1; #10;
        RF_clr = 0;
    
    
    end
endmodule
