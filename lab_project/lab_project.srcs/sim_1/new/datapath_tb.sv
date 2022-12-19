`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2022 07:36:24 PM
// Design Name: 
// Module Name: datapath_tb
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

module datapath_tb();

    logic clk, pc_we, pc_clr;
    logic IM_we, IM_clr;
    logic isexternal, load, store;
    logic[15:0] out_instruction;
    logic up_btn_debounced;
    logic RF_clr, RF_we;
    logic ALU_sel;
    logic M_clr, M_we, M_re;
    logic[11:0] ins;
    logic[6:0] seg1, seg2, seg3;
    
    datapath dp(clk, pc_we, pc_clr, 
                IM_we, IM_clr,
                isexternal, load, store,
                out_instruction,
                up_btn_debounced,
                RF_clr, RF_we,
                ALU_sel,
                M_clr, M_we, M_re,
                ins,
                seg1, seg2, seg3);
    
    always begin
        clk <= 0; #5;    
        clk <= 1; #5;
    end

    initial begin
    
            pc_we = 0;
            pc_clr = 0;
            IM_we = 0;
            IM_clr = 0;
            isexternal = 0;
            load = 0;
            store = 0;
            out_instruction = 16'b0000_0000_0000_0000;
            up_btn_debounced = 0;
            RF_clr = 0;
            RF_we = 0;
            ALU_sel = 0;
            M_clr = 0;
            M_we = 0;
            M_re = 0; #10;
            up_btn_debounced = 1;
            RF_we = 1;
            out_instruction = 16'b1111_1111_1111_1111; #10;    
    end
endmodule
