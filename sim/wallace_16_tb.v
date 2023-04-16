`timescale 1ns / 1ns
`include "./rtl/multiplier_wallace_16by16.v"

module wallace_16_tb;
    reg [15:0] in1_,in2_;
    wire[31:0] prod_;
    wallace_multiplier_16bit_by_16bit w_16(.a(in1_),.b(in2_),.product(prod_));

    initial 
    begin
        #2
        in1_ <= 16'd5;
        in2_ <= 16'd3;
        #15
        
        in1_ <= 16'd91;
        in2_ <= 16'd44;
      
        #15
        
        in1_ <= 16'hCDCD;
        in2_ <= 16'hBABA;
        #15

        in1_ <= 16'hFFFF;
        in2_ <= 16'hFBFB;
        #15
        $finish;
    end


    initial 
    begin
        $dumpfile("wallace_16_tb.vcd");
        $dumpvars(0,wallace_16_tb); //dumps all the vars
    end
endmodule