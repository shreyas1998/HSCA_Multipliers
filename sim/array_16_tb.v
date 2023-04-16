`timescale 1ns/1ns
`include "array_multiplier.v"

module array_16_tb;
    reg [15:0] in1_,in2_;
    wire[31:0] prod_;
    array_multiplier array_16(.a(in1_),.b(in2_),.sum(prod_));

    initial 
    begin
        #2
        in1_ <= 16'd1;
        in2_ <= 16'd2;
        #15
        
        in1_ <= 16'd27;
        in2_ <= 16'd35;
      
        #15
        
        in1_ <= 16'hEF79;
        in2_ <= 16'hABCD;
        #15

        in1_ <= 16'hFFFF;
        in2_ <= 16'hFFFF;
        #15
        $finish;
    end

    initial 
    begin
        $dumpfile("array_16_tb.vcd");
        $dumpvars(0,array_16_tb); //dumps all the vars
    end
endmodule