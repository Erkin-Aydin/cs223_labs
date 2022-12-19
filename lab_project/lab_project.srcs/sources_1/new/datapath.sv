`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2022 09:29:58 AM
// Design Name: 
// Module Name: datapath
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


module datapath(input logic clk,
                input logic pc_we, pc_clr,
                input logic IM_we, IM_clr,
                input logic isexternal, load, store, input logic[15:0] out_instruction,
                input logic up_btn_debounced,
                input logic RF_clr, RF_we,
                input logic ALU_sel,
                input logic M_clr, M_we, M_re,
                output logic[11:0] ins,
                output logic[6:0] seg1, seg2, seg3);
    
    logic[2:0] pc, pc_next;
    logic[11:0] IM_rd;
    logic[2:0] RF_addr2, RF_wa1, RF_wa;
    logic[3:0] RF_wd1, RF_wd, RF_d1, RF_d2, RF_disp1, RF_disp2, ALU_disp;
    
    logic[3:0] ALU_result;
    logic[3:0] M_add, M_rd;
    logic RF_we_real;
    DFF PC(pc_next, clk, pc_we, pc_clr, pc);
    imem instructions(clk, IM_we, IM_clr, pc, out_instruction[11:0], IM_rd);
    
    mux2_11_0 instruction_selection(clk, out_instruction[11:0], IM_rd, isexternal, ins);
    mux2_2_0 reg_file_addr2(clk, ins[6:4], ins[5:3], store, RF_addr2);
    
    mux2_2_0 reg_file_waddr1(clk, ins[6:4], ins[8:6], load, RF_wa1);
    mux2_2_0 reg_file_waddr(clk, out_instruction[11:9], RF_wa1, up_btn_debounced, RF_wa);
    
    mux2_3_0 reg_file_wdata1(clk, M_rd, ALU_result, load, RF_wd1);
    mux2_3_0 reg_file_wdata(clk, out_instruction[15:12], RF_wd1, up_btn_debounced, RF_wd);
    
    or o(RF_we_real, RF_we, up_btn_debounced);
    
    reg_file register_file(clk, RF_clr, ins[2:0], RF_addr2, RF_wa, RF_wd, RF_we_real, RF_d1, RF_d2);
    alu alu(RF_d1, RF_d2, ALU_sel, ALU_result);
    
    DFF3 d1(RF_d1, clk, pc_we, pc_clr, RF_disp1);
    DFF3 d2(RF_d2, clk, pc_we, pc_clr, RF_disp2);
    DFF3 d3(ALU_result, clk, pc_we, pc_clr, ALU_disp);
    mux2_3_0 mem_add_selection(ins[3:0], out_instruction[3:0], (load | store), M_add);
    
    dmem dmem(clk, M_clr, M_add, RF_d2, M_we, M_re, M_rd);
    initial begin
        pc <= 3'b000;
        seg1 <= 4'b0000;
        seg2 <= 4'b0000;
        seg3 <= 4'b0000;
    end
    always_comb begin
        pc_next <= pc + 3'b001;
        seg1 <= RF_disp1;
        seg2 <= RF_disp2;
        seg3 <= ALU_disp;
    end
endmodule

module DFF( input logic[2:0]D,
            input logic Clk,
            input logic we, clr,
            output logic[2:0] Q);
    initial begin
        Q <= 3'b000;
    end
    always @(posedge Clk)
        if(~clr) begin
            if(we) begin
                Q<=D;
            end
            else begin
                Q <= Q;
            end
        end
        else begin
            Q <= 3'b000;
        end
endmodule

module DFF3( input logic[3:0]D,
            input logic Clk,
            input logic we, clr,
            output logic[3:0] Q);
    initial begin
        Q <= 4'b000;
    end
    always @(posedge Clk)
        if(~clr) begin
            if(we) begin
                Q<=D;
            end
            else begin
                Q <= Q;
            end
        end
        else begin
            Q <= 4'b000;
        end
endmodule

module mux2_11_0(   input logic clk,
                    input logic[11:0] i1, i0, 
                    input logic s, 
                    output logic[11:0]d);
    
    always @(posedge clk) begin
        if(~s) begin
            d <= i0;
        end
        else begin 
            d <= i1;
        end
    end
endmodule

module mux2_2_0(    input logic clk,
                    input logic[2:0]i1, i0,
                    input logic s, 
                    output logic[2:0] d);
    
    always @(posedge clk) begin
        if(~s) begin
            d <= i0;
        end
        else begin 
            d <= i1;
        end
    end
endmodule

module mux2_3_0(    input logic clk,
                    input logic[3:0]i1, i0, 
                    input logic s, 
                    output logic[3:0] d);
    
    always @(posedge clk) begin
        if(~s) begin
            d <= i0;
        end
        else begin 
            d <= i1;
        end
    end
endmodule
