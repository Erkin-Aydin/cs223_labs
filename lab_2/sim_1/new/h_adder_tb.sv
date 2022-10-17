`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2022 02:48:24 PM
// Design Name: 
// Module Name: h_adder_tb
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


module h_adder_tb();
logic a, b, c, d;
module half_adder(a, b, c, d);
initial begin
assign a = 0;
assign b = 0; #10;

assign b = 1; #10;

assign a = 1;
assign b = 0; #10;

assign b = 1; #10;
end
endmodule
