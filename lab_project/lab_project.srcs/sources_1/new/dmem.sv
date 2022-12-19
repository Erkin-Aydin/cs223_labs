`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2022 08:21:25 AM
// Design Name: 
// Module Name: dmem
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


module dmem(input logic clk, clr,
            input logic[3:0] M_add,
            input logic[3:0] M_wd,
            input logic M_we, M_re,
            output logic[3:0] M_rd);

    reg[3:0] mem[15:0];
    initial begin
            mem[0] = 4'b0000;
            mem[1] <= 4'b0000;
            mem[2] <= 4'b0000;
            mem[3] <= 4'b0000;
            mem[4] <= 4'b0000;
            mem[5] <= 4'b0000;
            mem[6] <= 4'b0000;
            mem[7] <= 4'b0000;
            mem[8] <= 4'b0000;
            mem[9] <= 4'b0000;
            mem[10] <= 4'b0000;
            mem[11] <= 4'b0000;
            mem[12] <= 4'b0000;
            mem[13] <= 4'b0000;
            mem[14] <= 4'b0000;
            mem[15] <= 4'b0000;
    end
    always_ff@(posedge clk) begin
        if(clr) begin
            mem[0] <= 4'b0000;
            mem[1] <= 4'b0000;
            mem[2] <= 4'b0000;
            mem[3] <= 4'b0000;
            mem[4] <= 4'b0000;
            mem[5] <= 4'b0000;
            mem[6] <= 4'b0000;
            mem[7] <= 4'b0000;
            mem[8] <= 4'b0000;
            mem[9] <= 4'b0000;
            mem[10] <= 4'b0000;
            mem[11] <= 4'b0000;
            mem[12] <= 4'b0000;
            mem[13] <= 4'b0000;
            mem[14] <= 4'b0000;
            mem[15] <= 4'b0000;
        end
        else begin
            if (M_we) begin
                mem[M_add[3:0]] <= M_wd;	
            end
            if(M_re) begin
                M_rd <= mem[M_add[3:0]];
            end
        end
    end

endmodule