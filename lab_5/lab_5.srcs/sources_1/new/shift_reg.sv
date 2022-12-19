`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2022 03:28:56 PM
// Design Name: 
// Module Name: shift_reg
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


module shift_reg(
    input logic shift, p_load, reset, clk,
    input logic s_bit,
    input logic[7:0] val_next,
    output logic[7:0] val);
    
    logic out_7_1, out_6_1, out_5_1, out_4_1, out_3_1, out_2_1, out_1_1, out_0_1;
    logic out_7_2, out_6_2, out_5_2, out_4_2, out_3_2, out_2_2, out_1_2, out_0_2;
    logic d_7, d_6, d_5, d_4, d_3, d_2, d_1, d_0;
    
    mux2 mux7_1(s_bit,d_7,shift, out_7_1);
    mux2 mux7_2(val_next[7], out_7_1, p_load, out_7_2);
    DFF reg7(out_7_2, clk, reset, d_7);
    
    mux2 mux6_1(d_7, d_6, shift, out_6_1);
    mux2 mux6_2(val_next[6], out_6_1, p_load, out_6_2);
    DFF reg6(out_6_2, clk, reset, d_6);
    
    mux2 mux5_1(d_6, d_5, shift, out_5_1);
    mux2 mux5_2(val_next[5], out_5_1, p_load, out_5_2);
    DFF reg5(out_5_2, clk, reset, d_5);
    
    mux2 mux4_1(d_5, d_4, shift, out_4_1);
    mux2 mux4_2(val_next[4], out_4_1, p_load, out_4_2);
    DFF reg4(out_4_2, clk, reset, d_4);
    
    mux2 mux3_1(d_4, d_3, shift, out_3_1);
    mux2 mux3_2(val_next[3], out_3_1, p_load, out_3_2);
    DFF reg3(out_3_2, clk, reset, d_3);
    
    mux2 mux2_1(d_3, d_2, shift, out_2_1);
    mux2 mux2_2(val_next[2], out_2_1, p_load, out_2_2);
    DFF reg2(out_2_2, clk, reset, d_2);
    
    mux2 mux1_1(d_2, d_1, shift, out_1_1);
    mux2 mux1_2(val_next[1], out_1_1, p_load, out_1_2);
    DFF reg1(out_1_2, clk, reset, d_1);
    
    mux2 mux0_1(d_1, d_0, shift, out_0_1);
    mux2 mux0_2(val_next[0], out_0_1, p_load, out_0_2);
    DFF reg0(out_0_2, clk, reset, d_0);
    
    assign val[7] = d_7;
    assign val[6] = d_6;
    assign val[5] = d_5;
    assign val[4] = d_4;
    assign val[3] = d_3;
    assign val[2] = d_2;
    assign val[1] = d_1;
    assign val[0] = d_0;
    
endmodule

module mux2 (i1, i0, s, d);
    input i1, i0, s;
    output d;
    assign d = ~s&i0 | s&i1;
endmodule