`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2022 09:30:55 AM
// Design Name: 
// Module Name: alu
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


module alu( input logic[3:0] RF_d1, RF_d2,
            input logic ALU_sel,
            output logic[3:0] ALU_result);
            
            always_comb
                case(ALU_sel)
                
                    1'b1: ALU_result <= RF_d1 + RF_d2;
                    1'b0: ALU_result <= RF_d1 - RF_d2; 
            endcase
endmodule
