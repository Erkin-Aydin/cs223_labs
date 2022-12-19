`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2022 05:08:17 PM
// Design Name: 
// Module Name: buttoncheck
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


module buttoncheck(input logic btn, clk,
    output logic dp,
    output logic [6:0] segments,
    output logic[3:0] disp);

    logic[3:0] num;
    reg pb_d;
    logic p_up;
    logic p_down;
    sevenseg s(num, 4'b0101, dp, segments, disp);
    debouncer debounce(clk, btn, p_up);
    always begin@(posedge clk)
        if(p_up) begin
            num <= num + 4'b0001;
        end
    end
endmodule
