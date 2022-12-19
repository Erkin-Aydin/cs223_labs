`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2022 09:30:18 AM
// Design Name: 
// Module Name: controller
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


module controller(  input logic clk ,input logic[2:0] ins,
                    output logic load, store, RF_we, M_we, M_re, ALU_sel);
    reg[5:0] controls;
    assign { load, store, RF_we, M_we, M_re, ALU_sel} = controls;
    initial begin
        controls <= 6'b000000;
    end
    always_comb
        case(ins)
            3'b000: controls <= 6'b101010;
            3'b001: controls <= 6'b010100;
            3'b010: controls <= 6'b001000;
            3'b011: controls <= 6'b001001;
            3'b100: controls <= 6'b001000;
            3'b101: controls <= 6'b001000;
            3'b110: controls <= 6'b000000;
            default: controls <= 6'b000000;
        endcase
    
endmodule