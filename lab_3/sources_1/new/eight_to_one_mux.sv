`timescale 1ns / 1ps



module eight_to_one_mux(
            input logic i7, i6, i5, i4, i3, i2, i1, i0, 
            input logic s2, s1, s0, 
            output logic y);
    
    logic d1, d0;
    logic and_out1, and_out2;
    logic s2_inv;
    four_to_one_mux mux4_1(i3, i2, i1, i0, s1, s0, d0);
    four_to_one_mux mux4_2(i7, i6, i5, i4, s1, s0, d1);
    not n1(s2_inv, s2);
    and a1(and_out1, d0, s2_inv);
    and a2(and_out2, d1, s2);
    or o1(y, and_out1, and_out2);
    
endmodule