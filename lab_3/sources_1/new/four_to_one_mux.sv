`timescale 1ns / 1ps



module four_to_one_mux(i3, i2, i1, i0, s1, s0, z);

    input i3, i2, i1, i0, s1, s0;
    output z;
    wire d1, d0;
    two_to_one_mux m1(i3, i2, s0, d1); // instance1
    two_to_one_mux m2(i1, i0, s0, d0); // instance2
    two_to_one_mux m3(d1, d0, s1, z); // instance3
    
endmodule