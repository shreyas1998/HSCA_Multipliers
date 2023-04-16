`timescale 1ns/1ns
`include "booth8b.v"

module booth_8_tb;
    reg [7:0] in1_,in2_;
    wire[15:0] prod_;
    booth1 booth(.multiplier(in1_),.multiplicand(in2_),.product(prod_));

    initial 
    begin
        #2
        in1_ <= 8'd7;
        in2_ <= 8'd6;
        #15
        in1_ <= 8'b10001000;
        in2_ <= 8'b01010100;
        #15
        in1_ <= 8'd166;
        in2_ <= 8'd201;
        #15
        in1_ <= 8'd252;
        in2_ <= 8'd255;
        #15
        $finish;
    end

    initial 
    begin
        $dumpfile("booth_8_tb.vcd");
        $dumpvars(0,booth_8_tb); //dumps all the vars
    end
endmodule