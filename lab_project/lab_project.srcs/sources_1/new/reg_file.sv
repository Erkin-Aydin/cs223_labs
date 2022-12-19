`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2022 07:14:07 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file(input logic clk, clr,
                input logic[2:0] RF_ad1, RF_ad2, RF_wa,
                input logic[3:0] RF_wd,
                input logic RF_we,
                output logic[3:0] RF_d1, RF_d2);

    reg[3:0] registers[7:0];
    initial begin
        registers[0] = 4'b0100;   
        registers[1] = 4'b0001;
        registers[2] = 4'b0010;
        registers[3] = 4'b0011;
        registers[4] = 4'b0100;
        registers[5] = 4'b0101;
        registers[6] = 4'b0110;
        registers[7] = 4'b0111;
    end
    always_ff@(posedge clk) begin
        if(clr) begin
            registers[0] <= 4'b0000;
            registers[1] <= 4'b0000;
            registers[2] <= 4'b0000;
            registers[3] <= 4'b0000;
            registers[4] <= 4'b0000;
            registers[5] <= 4'b0000;
            registers[6] <= 4'b0000;
            registers[7] <= 4'b0000;
                             
        end
        else if (RF_we) begin
            case(RF_wa)
                3'b000: registers[0] <= RF_wd;
                3'b001: registers[1] <= RF_wd;
                3'b010: registers[2] <= RF_wd;
                3'b011: registers[3] <= RF_wd;
                3'b100: registers[4] <= RF_wd;
                3'b101: registers[5] <= RF_wd;
                3'b110: registers[6] <= RF_wd;
                3'b111: registers[7] <= RF_wd;
            endcase        
        end
        case(RF_ad1)
            3'b000: RF_d1 = registers[0];
            3'b001: RF_d1 = registers[1];
            3'b010: RF_d1 = registers[2];
            3'b011: RF_d1 = registers[3];
            3'b100: RF_d1 = registers[4];
            3'b101: RF_d1 = registers[5];
            3'b110: RF_d1 = registers[6];
            3'b111: RF_d1 = registers[7];
        endcase
        case(RF_ad2)
            3'b000: RF_d2 = registers[0];
            3'b001: RF_d2 = registers[1];
            3'b010: RF_d2 = registers[2];
            3'b011: RF_d2 = registers[3];
            3'b100: RF_d2 = registers[4];
            3'b101: RF_d2 = registers[5];
            3'b110: RF_d2 = registers[6];
            3'b111: RF_d2 = registers[7];
        endcase
    end
endmodule
