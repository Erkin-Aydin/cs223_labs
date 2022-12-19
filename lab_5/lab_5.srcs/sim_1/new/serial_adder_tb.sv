`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2022 08:51:12 AM
// Design Name: 
// Module Name: serial_adder_tb
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


module serial_adder_tb();

    logic shift, p_load, reset, clk;
    logic[7:0] load_a;
    logic[7:0] load_b;
    logic[7:0] reg_out_val;
    logic cout;
    
    serial_adder sa(shift, p_load, reset, clk, load_a, load_b, reg_out_val, cout);
    
    always begin
    
        assign clk = 0; #10;
        assign clk = 1; #10;
    
    end
    
    initial begin
    
        assign shift = 0;
        assign p_load = 0;
        assign reset = 0;
        assign reset = 1; #10;
        assign reset = 0; #10;
        assign load_a = 8'b0000_0001; 
        assign load_b = 8'b0000_0001; #5;
        assign p_load = 1; #10;
        assign p_load = 0; #10;
        assign shift = 1; #300;
        assign shift = 0; #20;    
    end

endmodule
