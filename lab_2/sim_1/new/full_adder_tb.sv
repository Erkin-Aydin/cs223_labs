`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2022 03:21:40 PM
// Design Name: 
// Module Name: full_adder_tb
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


module full_adder_tb();

    logic a, b, cin, s, cout;
    full_adder fa(a, b, cin, s, cout);
    
    initial begin
        assign a = 0;
        assign b = 0;
        assign cin = 0; #100;
        
        assign cin = 1; #100;
        
        assign b = 1;
        assign cin = 0; #100;
        
        assign cin = 1; #100;
        
        assign a = 1;
        assign b = 0; 
        assign cin = 0; #100
        
        assign cin = 1; #100;
        
        assign b = 1;
        assign cin = 0; #100;
        
        assign cin = 1; #100;
    
    end
endmodule
