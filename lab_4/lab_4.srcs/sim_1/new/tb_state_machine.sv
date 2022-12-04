`timescale 1s / 1s

module tb_state_machine();
    logic Sa, Sb, reset;
    logic La2, La1, La0, Lb2, Lb1, Lb0;
    
    state_machine states(Sa, Sb, reset, La2, La1, La0, Lb2, Lb1, Lb0);
    
    initial begin
        assign reset = 0;
        
        assign Sa = 0;
        assign Sb = 0; #5;
        
        assign Sb = 1; #18;
        assign Sa = 1; #21;
        
        assign Sa = 1;
        assign Sb = 0; 
    end
    
endmodule
