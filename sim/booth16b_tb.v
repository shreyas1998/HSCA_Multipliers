`timescale 1ns / 1ns
`include "booth16b.v"

module booth_16_tb;
    reg [15:0] in1_,in2_;
    wire[31:0] prod_;
    booth16b b_16(.multiplier(in1_),.multiplicand(in2_),.product(prod_));

    initial 
    begin
        #2
        in1_ <= 16'd3;
        in2_ <= 16'd4;
        #15
        
        in1_ <= 16'd77;
        in2_ <= 16'd63;
      
        #15
        
        in1_ <= 16'hDEAD;
        in2_ <= 16'hBEEF;
        #15

        in1_ <= 16'hFFFF;
        in2_ <= 16'hFEEF;
        #15
        $finish;
    end

    initial 
    begin
        $dumpfile("booth_16_tb.vcd");
        $dumpvars(0,booth_16_tb); //dumps all the vars
    end
endmodule