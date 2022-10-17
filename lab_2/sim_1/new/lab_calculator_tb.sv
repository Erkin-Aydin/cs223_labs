`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2022 04:37:47 PM
// Design Name: 
// Module Name: lab_calculator_tb
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


module lab_calculator_tb();

    logic a, b, c, d, y, z;
    
    lab_calculator lb(a, b, c, d, y, z);
    
    initial begin
        
        assign a = 0;
        assign b = 0;
        assign c = 0;
        assign d = 0; #20
        
        assign d = 1; #20;
        
        assign c = 1;
        assign d = 0; #20;
        
        assign d = 1; #20;
        
        //
        assign a = 0;
        assign b = 1;
        assign c = 0;
        assign d = 0; #20
        
        assign d = 1; #20;
        
        assign c = 1;
        assign d = 0; #20;
        
        assign d = 1; #20;
        
        //
        assign a = 1;
        assign b = 0;
        assign c = 0;
        assign d = 0; #20
        
        assign d = 1; #20;
        
        assign c = 1;
        assign d = 0; #20;
        
        assign d = 1; #20;
        
        //
        assign a = 1;
        assign b = 1;
        assign c = 0;
        assign d = 0; #20
        
        assign d = 1; #20;
        
        assign c = 1;
        assign d = 0; #20;
        
        assign d = 1; #20;
    end
    
endmodule
