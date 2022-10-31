`timescale 1ns / 1ps



module two_to_one_mux(i1, i0, s, d);
    
    input i1, i0, s;
    output d;
    assign d= ~s&i0 | s&i1;
    
endmodule