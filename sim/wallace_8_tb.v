`timescale 1ns/1ns
`include "./rtl/multiplier_wallace_8by8.v"

module wallace_8_tb;
    reg [7:0] in1_,in2_;
    wire[15:0] prod_;
    wallace_multiplier_8bit_by_8bit w_8(.a(in1_),.b(in2_),.product(prod_));

    initial 
    begin
        #2
        in1_ <= 16'd5;
        in2_ <= 16'd3;
        #15
        
        in1_ <= 16'd91;
        in2_ <= 16'd44;
      
        #15
        
        in1_ <= 16'hCD;
        in2_ <= 16'hBA;
        #15

        in1_ <= 16'hFF;
        in2_ <= 16'hFE;
        #15
        $finish;
    end


    initial 
    begin
        $dumpfile("wallace_8_tb.vcd");
        $dumpvars(0,wallace_8_tb); //dumps all the vars
    end
endmodule