`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2022 06:17:11 PM
// Design Name: 
// Module Name: imem
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


module imem(input logic clk, IM_we, clr,
            input logic[2:0] addr,
            input logic[11:0] IM_wd,
            output logic[11:0] IM_rd);
    
    reg[11:0] instructions[7:0];
    initial begin
        instructions[0] = 12'b010_000_000_001; 
        instructions[1] = 12'b010_000_000_010;   
        instructions[2] = 12'b010_000_000_011; 
        instructions[3] = 12'b010_000_000_011; 
        instructions[4] = 12'b010_000_000_100; 
        instructions[5] = 12'b010_000_000_101; 
        instructions[6] = 12'b010_000_000_110; 
        instructions[7] = 12'b010_000_000_100; 
    end
    always_ff@(posedge clk) begin
        if(clr) begin
            instructions[0] = 12'b000_000_000_000; 
            instructions[1] = 12'b000_000_000_000;   
            instructions[2] = 12'b000_000_000_000; 
            instructions[3] = 12'b000_000_000_000; 
            instructions[4] = 12'b000_000_000_000; 
            instructions[5] = 12'b000_000_000_000; 
            instructions[6] = 12'b000_000_000_000; 
            instructions[7] = 12'b000_000_000_000; 
        end
        else if(IM_we) begin
            instructions[addr[2:0]] = IM_wd[11:0];
        end
        IM_rd[11:0] <= instructions[addr[2:0]];
    end
endmodule
