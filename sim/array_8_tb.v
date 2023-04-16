`timescale 1ns/1ns
`include "./rtl/array_multiplier.v"

module array_8_tb;
    reg [7:0] in1_,in2_;
    wire[15:0] prod_;
    array_multiplier array_8(.a(in1_),.b(in2_),.sum(prod_));

    initial 
    begin
        #2
        in1_ <= 8'd9;
        in2_ <= 8'd8;
        #15
        
        in1_ <= 8'd32;
        in2_ <= 8'd32;
      
        #15
        
        in1_ <= 8'hDA;
        in2_ <= 8'hAD;
        #15

        in1_ <= 8'hBE;
        in2_ <= 8'hEF;
        #15
        $finish;
    end

    initial 
    begin
        $dumpfile("array_8_tb.vcd");
        $dumpvars(0,array_8_tb); //dumps all the vars
    end
endmodule