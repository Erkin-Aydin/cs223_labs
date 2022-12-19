`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2022 11:32:19 AM
// Design Name: 
// Module Name: shift_reg_tb
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


module shift_reg_tb();

    logic shift, p_load, reset, clk;
    logic[7:0] val_next;
    logic[7:0] out;
    logic zero = 0;
    always begin
        clk <= 0; #10;
        clk <= 1; #10;
    end
    
    shift_reg rh_reg(shift, p_load, reset, clk, zero, val_next, out);
    
    initial begin
        assign shift = 0;
        assign p_load = 0;
        assign reset = 0;
        
        assign val_next = 8'b0000_0000;
        assign p_load = 1; #30;
        assign p_load = 0; #30;
        
        assign val_next = 8'b1101_0010; #5;
        assign p_load = 1; #60;
        
        assign p_load = 0; #60;
        
        assign shift = 1; #80;
        
        assign shift = 0;
        assign val_next = 8'b1111_1111; #5;
        assign p_load = 1; #20;
        assign p_load = 0; #15;
        assign reset = 1;
        
    end

endmodule
