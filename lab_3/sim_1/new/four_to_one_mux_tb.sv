`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2022 04:11:53 PM
// Design Name: 
// Module Name: four_to_one_mux_tb
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


module four_to_one_mux_tb();
    
    reg[3:0] i;
    reg[1:0] s;
    logic d;
    four_to_one_mux m4(i[3], i[2], i[1], i[0], s[1], s[0], d);
    
    initial begin
    
        //s0 = s1 = 0;
        
        //i2 = 0; i3 = 0;
        assign s = 2'b00;
        
        assign i = 4'b0000; #10;
        assign i = 4'b0001; #10;
        assign i = 4'b0010; #10;
        assign i = 4'b0011; #10;
        assign i = 4'b0100; #10;
        assign i = 4'b0101; #10;
        assign i = 4'b0110; #10;
        assign i = 4'b0111; #10;
        assign i = 4'b1000; #10
        assign i = 4'b1001; #10;
        assign i = 4'b1010; #10;
        assign i = 4'b1011; #10;
        assign i = 4'b1100; #10;
        assign i = 4'b1101; #10;
        assign i = 4'b1110; #10;
        assign i = 4'b1111; #10;
        
        
        
        assign s = 2'b01;
        
        assign i = 4'b0000; #10;
        assign i = 4'b0001; #10;
        assign i = 4'b0010; #10;
        assign i = 4'b0011; #10;
        assign i = 4'b0100; #10;
        assign i = 4'b0101; #10;
        assign i = 4'b0110; #10;
        assign i = 4'b0111; #10;
        assign i = 4'b1000; #10
        assign i = 4'b1001; #10;
        assign i = 4'b1010; #10;
        assign i = 4'b1011; #10;
        assign i = 4'b1100; #10;
        assign i = 4'b1101; #10;
        assign i = 4'b1110; #10;
        assign i = 4'b1111; #10;
        
        
        
        
        assign s = 2'b10;
        
        assign i = 4'b0000; #10;
        assign i = 4'b0001; #10;
        assign i = 4'b0010; #10;
        assign i = 4'b0011; #10;
        assign i = 4'b0100; #10;
        assign i = 4'b0101; #10;
        assign i = 4'b0110; #10;
        assign i = 4'b0111; #10;
        assign i = 4'b1000; #10
        assign i = 4'b1001; #10;
        assign i = 4'b1010; #10;
        assign i = 4'b1011; #10;
        assign i = 4'b1100; #10;
        assign i = 4'b1101; #10;
        assign i = 4'b1110; #10;
        assign i = 4'b1111; #10;
        
        
        
        
        assign s = 2'b11;
        
        assign i = 4'b0000; #10;
        assign i = 4'b0001; #10;
        assign i = 4'b0010; #10;
        assign i = 4'b0011; #10;
        assign i = 4'b0100; #10;
        assign i = 4'b0101; #10;
        assign i = 4'b0110; #10;
        assign i = 4'b0111; #10;
        assign i = 4'b1000; #10
        assign i = 4'b1001; #10;
        assign i = 4'b1010; #10;
        assign i = 4'b1011; #10;
        assign i = 4'b1100; #10;
        assign i = 4'b1101; #10;
        assign i = 4'b1110; #10;
        assign i = 4'b1111; #10;
        
    
        assign s= 2'b00;
        assign i = 2'b0000;
    end
    
endmodule
