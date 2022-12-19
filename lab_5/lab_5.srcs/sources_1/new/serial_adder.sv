`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2022 08:33:56 AM
// Design Name: 
// Module Name: serial_adder
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


module serial_adder(input logic shift, p_load, reset, clk,
                    input logic[7:0] load_a, 
                    input logic [7:0] load_b,
                    output logic[7:0] reg_out_val,
                    output logic cout);
                    
                    logic s, cout_next;
                    logic[7:0] reg_a_val;
                    logic[7:0] reg_b_val;
                    logic shift_out, p_load_out, reset_out;
                    logic Clk;
                    logic zero = 0;
                    shift_reg reg_a(shift, p_load, reset, Clk, zero, load_a, reg_a_val);
                    shift_reg reg_b(shift, p_load, reset, Clk, zero, load_b, reg_b_val);
                    shift_reg reg_out(shift, p_load, reset, Clk, s, 8'b0000_0000, reg_out_val);
                    
                    full_adder fa(reg_a_val[0], reg_b_val[0], cout, s, cout_next);
                    
                    DFF df(cout_next, Clk, reset, cout);
                    Clock_divider clk_div(clk, Clk);
                    
endmodule

//Directly taken from lab_4, see for more information: https://www.fpga4student.com/2017/08/verilog-code-for-clock-divider-on-fpga.html
module Clock_divider(clock_in,clock_out
    );
    input clock_in; // input clock on FPGA
    output reg clock_out; // output clock after dividing the input clock by divisor
    reg[27:0] counter=28'd0;
    parameter DIVISOR = 28'd1_500_00000;
    always @(posedge clock_in)
    begin
     counter <= counter + 28'd1;
     if(counter>=(DIVISOR-1))
      counter <= 28'd0;
    
     clock_out <= (counter<DIVISOR/2)?1'b1:1'b0;
    
    end
endmodule
