`timescale 1ns/1ns
`include "dadda_8.v"

module dadda_8_tb;
    reg [7:0] in1_,in2_;
    wire[15:0] prod_;
    dadda_8 d_8(.in1(in1_),.in2(in2_),.prod(prod_));

    initial 
    begin
        #2
        in1_ <= 8'd1;
        in2_ <= 8'd2;
        #15
        in1_ <= 8'b10000000;
        in2_ <= 8'b01000000;
        #15
        in1_ <= 8'd200;
        in2_ <= 8'd38;
        #15
        in1_ <= 8'd255;
        in2_ <= 8'd255;
        #15
        $finish;
    end

    initial 
    begin
        $dumpfile("dadda_8_tb.vcd");
        $dumpvars(0,dadda_8_tb); //dumps all the vars
    end
endmodule