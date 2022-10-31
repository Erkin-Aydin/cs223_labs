`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2022 04:12:32 PM
// Design Name: 
// Module Name: eight_to_one_mux_tb
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


module eight_to_one_mux_tb();
    
    reg[7:0] i;
    reg[2:0] s;
    logic d;
    
    eight_to_one_mux mux8(i[7], i[6], i[5], i[4], i[3], i[2], i[1], i[0], s[2], s[1], s[0], d);
    
    initial begin
    
         //i2 = 0; i3 = 0;
        assign s = 3'b000;
        assign i = 8'b00000000; #1;
        for(int j = 0; j < 255; j++) begin
            
            assign i = i + 8'b00000001; #1;
            
        end
        
        assign s = 3'b001;
        assign i = 8'b00000000; #1;
        for(int j = 0; j < 256; j++) begin
            
            assign i = i + 8'b00000001; #1;
            
        end
        
        assign s = 3'b010;
        assign i = 8'b00000000; #1;
        for(int j = 0; j < 256; j++) begin
            
            assign i = i + 8'b00000001; #1;
            
        end
        
        assign s = 3'b011;
        assign i = 8'b00000000; #1;
        for(int j = 0; j < 256; j++) begin
            
            assign i = i + 8'b00000001; #1;
            
        end
        
        assign s = 3'b100;
        assign i = 8'b00000000; #1;
        for(int j = 0; j < 256; j++) begin
            
            assign i = i + 8'b00000001; #1;
            
        end
        
        assign s = 3'b101;
        assign i = 8'b00000000; #1;
        for(int j = 0; j < 256; j++) begin
            
            assign i = i + 8'b00000001; #1;
            
        end
        
        assign s = 3'b110;
        assign i = 8'b00000000; #1;
        for(int j = 0; j < 256; j++) begin
            
            assign i = i + 8'b00000001; #1;
            
        end
        
        assign s = 3'b111;
        assign i = 8'b00000000; #1;
        for(int j = 0; j < 256; j++) begin
            
            assign i = i + 8'b00000001; #1;
            
        end
    end
    
endmodule
