`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2022 09:29:35 AM
// Design Name: 
// Module Name: processor
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

module processor(   input logic clk, left_btn, mid_btn, right_btn, up_btn, low_btn,
                    input logic[15:0] sw,
                    output logic[6:0] segments,
                    output logic dp,
                    output logic[3:0] disp);

    logic[11:0] ins;
    logic load, store, RF_we, M_we, M_re, ALU_sel;
    logic left_btn_debounced, mid_btn_debounced, right_btn_debounced, up_btn_debounced, low_btn_debounced;
    logic[6:0] seg1, seg2, seg3;
    logic[3:0] seg_data;
    logic[3:0] di;
    logic clk_slow;
    controller controller( clk, ins[11:9], load, store, RF_we, M_we, M_re, ALU_sel);
    
    debouncer d1(clk, left_btn, left_btn_debounced);
    debouncer d2(clk, right_btn, right_btn_debounced);
    debouncer d3(clk, mid_btn, mid_btn_debounced);
    debouncer d4(clk, up_btn, up_btn_debounced);
    debouncer d5(clk, low_btn, low_btn_debounced);
    
    datapath datapath(  clk, left_btn_debounced, low_btn_debounced, 
                        mid_btn_debounced, low_btn_debounced,
                        right_btn_debounced, load, store, sw,
                        up_btn_debounced,
                        low_btn_debounced, RF_we,
                        ALU_sel,
                        low_btn_debounced, M_we, M_re,
                        ins,
                        seg1, seg2, seg3);
                        
    sevenseg sevenseg(seg_data, di, dp, segments, disp);
    Clock_divider cdiv(clk, clk_slow);
    always @(posedge clk_slow) begin 
        if(di == 4'b0000) begin
            di = 4'b0001;
        end
        if(di == 4'b0001) begin
            di = 4'b0100;
            seg_data = seg2;
        end
        else if(di == 4'b0100) begin
            di = 4'b1000;
            seg_data = seg1;
        end
        else if(di == 4'b1000) begin
            di = 4'b0001;
            seg_data = seg3;
        end
    end 
endmodule

//Taken/modified from https://www.fpga4student.com/2017/08/verilog-code-for-clock-divider-on-fpga.html
module Clock_divider(clock_in,clock_out
    );
    input clock_in; // input clock on FPGA
    output reg clock_out; // output clock after dividing the input clock by divisor
    reg[27:0] counter=28'd0;
    parameter DIVISOR = 28'd1_000;
    always @(posedge clock_in)
    begin
     counter <= counter + 28'd1;
     if(counter>=(DIVISOR-1))
      counter <= 28'd0;
    
     clock_out <= (counter<DIVISOR/2)?1'b1:1'b0;
    
    end
endmodule