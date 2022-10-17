`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2022 03:57:43 PM
// Design Name: 
// Module Name: two_bit_adder_tb
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


module two_bit_adder_tb();

    reg [1:0]a;
    reg [1:0]b; 
    logic cin;
    reg [1:0]s;
    logic cout;
    
    two_bit_adder two_add(a, b, cin, s, cout);
    
    initial begin
        
        assign a = 2'b00;
        assign b = 2'b00;
        assign cin = 0; #20;
        
        assign cin = 1; #20;
        
        assign b = 2'b01;
        assign cin = 0; #20;
        
        assign cin = 1; #20;
        
        assign b = 2'b10;
        assign cin = 0; #20;
        
        assign cin = 1; #20;
        
        assign b = 2'b11;
        assign cin = 0; #20;
        
        assign cin = 1; #20;
        
        //
        
        assign a = 2'b01;
        assign b = 2'b00;
        assign cin = 0; #20;
        
        assign cin = 1; #20;
        
        assign b = 2'b01;
        assign cin = 0; #20;
        
        assign cin = 1; #20;
        
        assign b = 2'b10;
        assign cin = 0; #20;
        
        assign cin = 1; #20;
        
        assign b = 2'b11;
        assign cin = 0; #20;
        
        assign cin = 1; #20;
        
        //
        
        assign a = 2'b10;
        assign b = 2'b00;
        assign cin = 0; #20;
        
        assign cin = 1; #20;
        
        assign b = 2'b01;
        assign cin = 0; #20;
        
        assign cin = 1; #20;
        
        assign b = 2'b10;
        assign cin = 0; #20;
        
        assign cin = 1; #20;
        
        assign b = 2'b11;
        assign cin = 0; #20;
        
        assign cin = 1; #20;
        
        //
        
        assign a = 2'b11;
        assign b = 2'b00;
        assign cin = 0; #20;
        
        assign cin = 1; #20;
        
        assign b = 2'b01;
        assign cin = 0; #20;
        
        assign cin = 1; #20;
        
        assign b = 2'b10;
        assign cin = 0; #20;
        
        assign cin = 1; #20;
        
        assign b = 2'b11;
        assign cin = 0; #20;
        
        assign cin = 1; #20;
    end

endmodule
