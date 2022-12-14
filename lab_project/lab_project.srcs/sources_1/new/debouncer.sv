`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2022 05:01:44 PM
// Design Name: 
// Module Name: debouncer
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

//Taken/modified from https://www.fpga4fun.com/Debouncer2.html
module debouncer(
    input clk,
    input PB,  // "PB" is the glitchy, asynchronous to clk, active low push-button signal

    // from which we make three outputs, all synchronous to the clock
    output PB_up   // 1 for one clock cycle when the push-button goes up (i.e. just released)
);
    reg PB_state;
    // First use two flip-flops to synchronize the PB signal the "clk" clock domain
    reg PB_sync_0;  
    always @(posedge clk) PB_sync_0 <= ~PB;  // invert PB to make PB_sync_0 active high
    reg PB_sync_1;  
    always @(posedge clk) PB_sync_1 <= PB_sync_0;
    
    
    initial begin
        PB_state <= 1'b0;
        PB_sync_0 <= 1'b0;
        PB_sync_1 <= 1'b0;
    end
    
    // Next declare a 16-bits counter
    reg [15:0] PB_cnt = 16'b0000_0000_0000_0000;
    
    // When the push-button is pushed or released, we increment the counter
    // The counter has to be maxed out before we decide that the push-button state has changed
    
    wire PB_idle = (PB_state==PB_sync_1);
    wire PB_cnt_max = &PB_cnt;	// true when all bits of PB_cnt are 1's
    
    always @(posedge clk)
        if(PB_idle) begin
            PB_cnt <= 0;  // nothing's going on
        end
        else begin
            PB_cnt <= PB_cnt + 16'd1;  // something's going on, increment the counter
            if(PB_cnt_max) PB_state <= ~PB_state;  // if the counter is maxed out, PB changed!
        end
        
        assign PB_up = ~PB_idle & PB_cnt_max & PB_state; 
    
endmodule
