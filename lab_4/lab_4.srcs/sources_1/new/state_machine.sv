`timescale 1ns / 1ps

module state_machine(
    input logic Sa, Sb, reset, clk,
    output logic La2, La1, La0, Lb2, Lb1, Lb0);

    logic CLK;
    Clock_divider div(clk, CLK);
    // Note: Procedure repeats
    logic c;
    logic s2;
    logic s1;
    logic s0;
    logic c_next, s2_next, s1_next, s0_next;
    
    logic c_1, c_2, c_3;
    logic s2_1, s2_2, s2_3, s2_4, s2_5, s2_6;
    logic s1_1, s1_2, s1_3, s1_4;
    logic s0_1, s0_2, s0_3, s0_4, s0_5, s0_6, s0_7;
    
    logic l1, l2, l3;
    
    DFF d_c(c, c_next, CLK);
    DFF d_s2(s2, s2_next, CLK);
    DFF d_s1(s1, s1_next, CLK);
    DFF c_s0(s0, s0_next, CLK);
    
    and ac1(c_1, ~s2, ~s1, ~s0);
    and ac2(c_2, ~s2, c);
    and ac3(c_3, s0, c);
    
    or o1(c_next, c_1, c_2, c_3);
    
    and a1(s2_1, s2, ~s1, ~s0, ~Sa, Sb);
    and a2(s2_2, ~s2, s1, s0, c);
    and a3(s2_3, s2, ~s1, s0, c);
    and a4(s2_4, s2, ~s1, ~s0, Sa, Sb);
    and a5(s2_5, s2, ~s1, ~s0, ~Sa, ~Sb);
    and a6(s2_6, ~s2, ~s1, ~s0, Sa, Sb);
    
    or o2(s2_next, s2_1, s2_2, s2_3, s2_4, s2_5, s2_6);
    
    and a7(s1_1, s2, ~s1, ~s0, Sa, ~Sb);
    and a8(s1_2, ~s2, s1, ~s0, c);
    and a9(s1_3, ~s2, s1, s0, ~c);
    and a10(s1_4, ~s2, ~s1, s0, c);
    
    or o3(s1_next, s1_1, s1_2, s1_3, s1_4);
    
    and a11(s0_1, s2, ~s1, ~s0, Sa, Sb);
    and a12(s0_2, s2, ~s1, ~s0, ~Sa, ~Sb);
    and a13(s0_3, ~s2, ~s1, ~s0, Sa, Sb);
    and a14(s0_4, ~s2, ~s1, ~s0, ~Sa, Sb);
    and a15(s0_5, ~s2, s1, ~s0, ~c);
    and a16(s0_6, s2, ~s1, ~s0, Sa, ~Sb);
    and a17(s0_7, ~s2, s1, ~s0, c);
    
    or o4(s0_next, s0_1, s0_2, s0_3, s0_4, s0_5, s0_6, s0_7);
        
    and aout_1(l1, s2, ~s0);
    or oout_1(La2, l1, s1);
    
    or oout_2(La1, s0, s1, s2);
    
    assign La0 = 1;
    
    and aout_2(l2, ~s2, ~s1);
    and aout_3(l3, ~s2, ~s0);
    or oout_3(Lb2, l2, l3);
    
    or oout_4(Lb1, ~s2, s1, s0);
    
    assign Lb0 = 1;
    
endmodule

module DFF(Q,D,Clk);
    input D,Clk;
    output Q;
    reg Q;
    
    always @(posedge Clk)
    Q<=D;
endmodule

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