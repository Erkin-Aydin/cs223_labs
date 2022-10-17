`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2022 04:27:15 PM
// Design Name: 
// Module Name: mux4
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


module mux4 (i3, i2, i1, i0, s1, s0, z);
    input i3, i2, i1, i0, s1, s0;
    output z;
    wire d1, d0;
    mux2 m1(i3, i2, s0, d1); // instance1
    mux2 m2(i1, i0, s0, d0); // instance2
    mux2 m3(d1, d0, s1, z); // instance3
endmodule
