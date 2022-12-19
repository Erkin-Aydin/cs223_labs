`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2022 01:48:50 PM
// Design Name: 
// Module Name: sevenseg
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


module sevenseg(input logic [3:0] data,
input logic[3:0] di,
output logic dp,
output logic [6:0] segments,
output logic[3:0] disp);
    assign dp = 0;
    assign disp = ~di;
    always_comb
        //always @ (*) can also be used
        case (data)
        //                  abc_defg
        0: segments =    7'b000_0001;
        1: segments =    7'b100_1111;
        2: segments =    7'b001_0010;
        3: segments =    7'b000_0110;
        4: segments =    7'b100_1100;
        5: segments =    7'b010_0100;
        6: segments =    7'b010_0000;
        7: segments =    7'b000_1111;
        8: segments =    7'b000_0000;
        9: segments =    7'b000_1100;
        10:segments =    7'b000_1000;
        11:segments =    7'b110_0000;
        12:segments =    7'b011_0001;
        13:segments =    7'b100_0010;
        14:segments =    7'b011_0000;
        15:segments =    7'b011_1000;
        default:
           segments =    7'b111_1111; // required
    endcase
endmodule
