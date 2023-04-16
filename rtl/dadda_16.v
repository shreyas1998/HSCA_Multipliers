`timescale 1ns/1ns

module full_adder (a, b, c,carry,sum);
    input a;
    input b;
    input c;
    output sum;
    output carry;

    // Implement 9-gate Full Adder
    wire a_or_b, a_and_b, not_a_and_b, stage_1_op;
    wire cin_and_first, cin_or_first, not_cin_and_first;

    or (a_or_b, a, b);
    and (a_and_b, a, b);
    not (not_a_and_b, a_and_b);
    and (stage_1_op, not_a_and_b, a_or_b);

    or (cin_or_first, stage_1_op, c);
    and (cin_and_first, stage_1_op, c);
    not (not_cin_and_first, cin_and_first);
    and (sum, not_cin_and_first, cin_or_first);

    or (carry, a_and_b, cin_and_first);

endmodule

module half_adder (a, b, c, s);
    input a;
    input b;
    output s;
    output c; 

    wire a_and_b, a_or_b, not_a_and_b;

    or (a_or_b, a, b);
    and (a_and_b, a, b);
    not (not_a_and_b, a_and_b);
    and (s, not_a_and_b, a_or_b);

    and (c, a, b);

endmodule

module dadda_16(input [15:0]in1,input [15:0]in2, output [31:0]prod);

	wire [15:0] a0_p,a1_p,a2_p,a3_p,a4_p,a5_p,a6_p,a7_p;
	wire [15:0] a8_p,a9_p,a10_p,a11_p,a12_p,a13_p,a14_p,a15_p;

    //generate products
    assign a0_p=  {in1[0] &in2[15],in1[0] &in2[14],in1[0] &in2[13],in1[0] &in2[12],in1[0] &in2[11],in1[0] &in2[10],in1[0] &in2[9],in1[0] &in2[8],in1[0] &in2[7],in1[0] &in2[6],in1[0] &in2[5],in1[0] &in2[4],in1[0] &in2[3],in1[0] &in2[2],in1[0] &in2[1],in1[0] &in2[0]};
    assign a1_p=  {in1[1] &in2[15],in1[1] &in2[14],in1[1] &in2[13],in1[1] &in2[12],in1[1] &in2[11],in1[1] &in2[10],in1[1] &in2[9],in1[1] &in2[8],in1[1] &in2[7],in1[1] &in2[6],in1[1] &in2[5],in1[1] &in2[4],in1[1] &in2[3],in1[1] &in2[2],in1[1] &in2[1],in1[1] &in2[0]};
    assign a2_p=  {in1[2] &in2[15],in1[2] &in2[14],in1[2] &in2[13],in1[2] &in2[12],in1[2] &in2[11],in1[2] &in2[10],in1[2] &in2[9],in1[2] &in2[8],in1[2] &in2[7],in1[2] &in2[6],in1[2] &in2[5],in1[2] &in2[4],in1[2] &in2[3],in1[2] &in2[2],in1[2] &in2[1],in1[2] &in2[0]};
    assign a3_p=  {in1[3] &in2[15],in1[3] &in2[14],in1[3] &in2[13],in1[3] &in2[12],in1[3] &in2[11],in1[3] &in2[10],in1[3] &in2[9],in1[3] &in2[8],in1[3] &in2[7],in1[3] &in2[6],in1[3] &in2[5],in1[3] &in2[4],in1[3] &in2[3],in1[3] &in2[2],in1[3] &in2[1],in1[3] &in2[0]};
    assign a4_p=  {in1[4] &in2[15],in1[4] &in2[14],in1[4] &in2[13],in1[4] &in2[12],in1[4] &in2[11],in1[4] &in2[10],in1[4] &in2[9],in1[4] &in2[8],in1[4] &in2[7],in1[4] &in2[6],in1[4] &in2[5],in1[4] &in2[4],in1[4] &in2[3],in1[4] &in2[2],in1[4] &in2[1],in1[4] &in2[0]};
    assign a5_p=  {in1[5] &in2[15],in1[5] &in2[14],in1[5] &in2[13],in1[5] &in2[12],in1[5] &in2[11],in1[5] &in2[10],in1[5] &in2[9],in1[5] &in2[8],in1[5] &in2[7],in1[5] &in2[6],in1[5] &in2[5],in1[5] &in2[4],in1[5] &in2[3],in1[5] &in2[2],in1[5] &in2[1],in1[5] &in2[0]};
    assign a6_p=  {in1[6] &in2[15],in1[6] &in2[14],in1[6] &in2[13],in1[6] &in2[12],in1[6] &in2[11],in1[6] &in2[10],in1[6] &in2[9],in1[6] &in2[8],in1[6] &in2[7],in1[6] &in2[6],in1[6] &in2[5],in1[6] &in2[4],in1[6] &in2[3],in1[6] &in2[2],in1[6] &in2[1],in1[6] &in2[0]};
    assign a7_p=  {in1[7] &in2[15],in1[7] &in2[14],in1[7] &in2[13],in1[7] &in2[12],in1[7] &in2[11],in1[7] &in2[10],in1[7] &in2[9],in1[7] &in2[8],in1[7] &in2[7],in1[7] &in2[6],in1[7] &in2[5],in1[7] &in2[4],in1[7] &in2[3],in1[7] &in2[2],in1[7] &in2[1],in1[7] &in2[0]};
    assign a8_p=  {in1[8] &in2[15],in1[8] &in2[14],in1[8] &in2[13],in1[8] &in2[12],in1[8] &in2[11],in1[8] &in2[10],in1[8] &in2[9],in1[8] &in2[8],in1[8] &in2[7],in1[8] &in2[6],in1[8] &in2[5],in1[8] &in2[4],in1[8] &in2[3],in1[8] &in2[2],in1[8] &in2[1],in1[8] &in2[0]};
    assign a9_p=  {in1[9] &in2[15],in1[9] &in2[14],in1[9] &in2[13],in1[9] &in2[12],in1[9] &in2[11],in1[9] &in2[10],in1[9] &in2[9],in1[9] &in2[8],in1[9] &in2[7],in1[9] &in2[6],in1[9] &in2[5],in1[9] &in2[4],in1[9] &in2[3],in1[9] &in2[2],in1[9] &in2[1],in1[9] &in2[0]};
    assign a10_p= {in1[10]&in2[15],in1[10]&in2[14],in1[10]&in2[13],in1[10]&in2[12],in1[10]&in2[11],in1[10]&in2[10],in1[10]&in2[9],in1[10]&in2[8],in1[10]&in2[7],in1[10]&in2[6],in1[10]&in2[5],in1[10]&in2[4],in1[10]&in2[3],in1[10]&in2[2],in1[10]&in2[1],in1[10]&in2[0]};
    assign a11_p= {in1[11]&in2[15],in1[11]&in2[14],in1[11]&in2[13],in1[11]&in2[12],in1[11]&in2[11],in1[11]&in2[10],in1[11]&in2[9],in1[11]&in2[8],in1[11]&in2[7],in1[11]&in2[6],in1[11]&in2[5],in1[11]&in2[4],in1[11]&in2[3],in1[11]&in2[2],in1[11]&in2[1],in1[11]&in2[0]};
    assign a12_p= {in1[12]&in2[15],in1[12]&in2[14],in1[12]&in2[13],in1[12]&in2[12],in1[12]&in2[11],in1[12]&in2[10],in1[12]&in2[9],in1[12]&in2[8],in1[12]&in2[7],in1[12]&in2[6],in1[12]&in2[5],in1[12]&in2[4],in1[12]&in2[3],in1[12]&in2[2],in1[12]&in2[1],in1[12]&in2[0]};
    assign a13_p= {in1[13]&in2[15],in1[13]&in2[14],in1[13]&in2[13],in1[13]&in2[12],in1[13]&in2[11],in1[13]&in2[10],in1[13]&in2[9],in1[13]&in2[8],in1[13]&in2[7],in1[13]&in2[6],in1[13]&in2[5],in1[13]&in2[4],in1[13]&in2[3],in1[13]&in2[2],in1[13]&in2[1],in1[13]&in2[0]};
    assign a14_p= {in1[14]&in2[15],in1[14]&in2[14],in1[14]&in2[13],in1[14]&in2[12],in1[14]&in2[11],in1[14]&in2[10],in1[14]&in2[9],in1[14]&in2[8],in1[14]&in2[7],in1[14]&in2[6],in1[14]&in2[5],in1[14]&in2[4],in1[14]&in2[3],in1[14]&in2[2],in1[14]&in2[1],in1[14]&in2[0]};
    assign a15_p= {in1[15]&in2[15],in1[15]&in2[14],in1[15]&in2[13],in1[15]&in2[12],in1[15]&in2[11],in1[15]&in2[10],in1[15]&in2[9],in1[15]&in2[8],in1[15]&in2[7],in1[15]&in2[6],in1[15]&in2[5],in1[15]&in2[4],in1[15]&in2[3],in1[15]&in2[2],in1[15]&in2[1],in1[15]&in2[0]};
    
	//stage 0

    wire h01_c,h01_s,h02_c,h02_s,h03_c,h03_s,h04_c,h04_s,f01_c,f01_s,f02_c,f02_s;
    wire f03_c,f03_s,f04_c,f04_s,f05_c,f05_s,f06_c,f06_s,f07_c,f07_s,f08_c,f08_s;

    half_adder h01(.a(a0_p[13]),.b(a1_p[12]),.c(h01_c),.s(h01_s));
	half_adder h02(.a(a3_p[11]),.b(a4_p[10]),.c(h02_c),.s(h02_s));
	half_adder h03(.a(a6_p[9]),.b(a7_p[8]),.c(h03_c),.s(h03_s));
    half_adder h04(.a(a7_p[9]),.b(a8_p[8]),.c(h04_c),.s(h04_s));

	full_adder f01(.a(a0_p[14]),.b(a1_p[13]),.c(a2_p[12]),.carry(f01_c),.sum(f01_s));
    full_adder f02(.a(a0_p[15]),.b(a1_p[14]),.c(a2_p[13]),.carry(f02_c),.sum(f02_s));
    full_adder f03(.a(a1_p[15]),.b(a2_p[14]),.c(a3_p[13]),.carry(f03_c),.sum(f03_s));
    full_adder f04(.a(a2_p[15]),.b(a3_p[14]),.c(a4_p[13]),.carry(f04_c),.sum(f04_s));
    full_adder f05(.a(a3_p[15]),.b(a4_p[14]),.c(a5_p[13]),.carry(f05_c),.sum(f05_s));
    full_adder f06(.a(a3_p[12]),.b(a4_p[11]),.c(a5_p[10]),.carry(f06_c),.sum(f06_s));
    full_adder f07(.a(a4_p[12]),.b(a5_p[11]),.c(a6_p[10]),.carry(f07_c),.sum(f07_s));
    full_adder f08(.a(a5_p[12]),.b(a5_p[11]),.c(a7_p[10]),.carry(f08_c),.sum(f08_s));
    
    wire [30:0] s0_0;
    wire [28:0] s0_1;
    wire [26:0] s0_2;
    wire [24:0] s0_3;
    wire [22:0] s0_4;
    wire [20:0] s0_5;
    wire [18:0] s0_6;
    wire [16:0] s0_7;
    wire [14:0] s0_8;
    wire [12:0] s0_9;
    wire [10:0] s0_10;
    wire [8:0]  s0_11;
    wire [7:0]  s0_12;

    assign s0_0= {a15_p[15],a14_p[15],a13_p[15],a12_p[15],a11_p[15],a10_p[15],a9_p[15],a8_p[15],a7_p[15],a6_p[15],a5_p[15],a4_p[15],f05_s,f04_s,f03_s,f02_s,f01_s,h01_s,a0_p[12:0]};
    assign s0_1= {a15_p[14],a14_p[14],a13_p[14],a12_p[14],a11_p[14],a10_p[14],a9_p[14],a8_p[14],a7_p[14],a6_p[14],f05_c,f04_c,f03_c,f02_c,f01_c,h01_c,a2_p[11],a1_p[11:0]};
    assign s0_2= {a15_p[13],a14_p[13],a13_p[13],a12_p[13],a11_p[13],a10_p[13],a9_p[13],a8_p[13],a7_p[13],a5_p[14],a6_p[12],f08_s,f07_s,f06_s,h02_s,a3_p[10],a2_p[10:0]};
    assign s0_3= {a15_p[12],a14_p[12],a13_p[12],a12_p[12],a11_p[12],a10_p[12],a9_p[12],a8_p[12],a6_p[13],f08_c,f07_c,f06_c,h02_c,a5_p[9],a4_p[9],a3_p[9:0]};
    assign s0_4= {a15_p[11],a14_p[11],a13_p[11],a12_p[11],a11_p[11],a10_p[11],a9_p[11],a7_p[12],a7_p[11],a8_p[9],h04_s,h03_s,a6_p[8],a5_p[8],a4_p[8:0]};
    assign s0_5= {a15_p[10],a14_p[10],a13_p[10],a12_p[10],a11_p[10],a10_p[10],a8_p[11],a8_p[10],h04_c,h03_c,a8_p[7],a7_p[7],a6_p[7],a5_p[7:0]};
    assign s0_6= {a15_p[9],a14_p[9],a13_p[9],a12_p[9],a11_p[9],a9_p[10:6],a8_p[6],a7_p[6],a6_p[6:0]};
    assign s0_7= {a15_p[8],a14_p[8],a13_p[8],a12_p[8],a10_p[9:5],a9_p[5],a8_p[5],a7_p[5:0]};
    assign s0_8= {a15_p[7],a14_p[7],a13_p[7],a11_p[8:4],a10_p[4],a9_p[4],a8_p[4:0]};
    assign s0_9= {a15_p[6],a14_p[6],a12_p[7:3],a11_p[3],a10_p[3],a9_p[3],a9_p[3:0]};
    assign s0_10= {a15_p[5],a13_p[6:2],a12_p[2],a11_p[2],a10_p[2:0]};
    assign s0_11= {a14_p[5:1],a13_p[1],a12_p[1],a11_p[1:0]};
    assign s0_12= {a15_p[4:0],a14_p[0],a13_p[0],a12_p[0]};
    
    //-------------------------------------------------------------------------------------------
    //stage 1
    wire h11_c,h11_s,h12_c,h12_s,h13_c,h13_s,h14_c,h14_s,f11_c,f11_s,f12_c,f12_s;
    wire f13_c,f13_s,f14_c,f14_s,f15_c,f15_s,f16_c,f16_s,f17_c,f17_s,f18_c,f18_s;
    wire f19_c,f19_s,f1_10_c,f1_10_s,f1_11_c,f1_11_s,f1_12_c,f1_12_s,f1_13_c,f1_13_s;
    wire f1_14_c,f1_14_s,f1_15_c,f1_15_s,f1_16_c,f1_16_s,f1_17_c,f1_17_s;
    wire f1_18_c,f1_18_s,f1_19_c,f1_19_s,f1_20_c,f1_20_s,f1_21_c,f1_21_s;
    wire f1_22_c,f1_22_s,f1_23_c,f1_23_s,f1_24_c,f1_24_s,f1_25_c,f1_25_s;
    wire f1_26_c,f1_26_s,f1_27_c,f1_27_s,f1_28_c,f1_28_s,f1_29_c,f1_29_s;
    wire f1_30_c,f1_30_s,f1_31_c,f1_31_s,f1_32_c,f1_32_s,f1_33_c,f1_33_s;
    wire f1_34_c,f1_34_s,f1_35_c,f1_35_s,f1_36_c,f1_36_s,f1_37_c,f1_37_s;
    wire f1_38_c,f1_38_s,f1_39_c,f1_39_s,f1_40_c,f1_40_s;

    wire [30:0] s1_0;
    wire [28:0] s1_1;
    wire [26:0] s1_2;
    wire [24:0] s1_3;
    wire [22:0] s1_4;
    wire [20:0] s1_5;
    wire [18:0] s1_6;
    wire [16:0] s1_7;
    wire [15:0] s1_8;

    half_adder h11(.a(s0_0[9]),.b(s0_1[8]),.c(h11_c) ,.s(h11_s));
    half_adder h12(.a(s0_3[7]),.b(s0_4[6]),.c(h12_c) ,.s(h12_s));
    half_adder h13(.a(s0_6[5]),.b(s0_7[4]),.c(h13_c) ,.s(h13_s));
    half_adder h14(.a(s0_9[3]),.b(s0_10[2]),.c(h14_c),.s(h14_s));

    full_adder f11  (.a(s0_0[10]) ,.b(s0_1[9]),  .c(s0_2[8]), .carry(f11_c),.sum(f11_s));
    full_adder f12  (.a(s0_0[11]) ,.b(s0_1[10]), .c(s0_2[9]), .carry(f12_c),.sum(f12_s));
    full_adder f13  (.a(s0_0[12]) ,.b(s0_1[11]), .c(s0_2[10]),.carry(f13_c),.sum(f13_s));
    full_adder f14  (.a(s0_0[13]) ,.b(s0_1[12]), .c(s0_2[11]),.carry(f14_c),.sum(f14_s));
    full_adder f15  (.a(s0_0[14]) ,.b(s0_1[13]), .c(s0_2[12]),.carry(f15_c),.sum(f15_s));
    full_adder f16  (.a(s0_0[15]) ,.b(s0_1[14]), .c(s0_2[13]),.carry(f16_c),.sum(f16_s));
    full_adder f17  (.a(s0_0[16]) ,.b(s0_1[15]), .c(s0_2[14]),.carry(f17_c),.sum(f17_s));
    full_adder f18  (.a(s0_0[17]) ,.b(s0_1[16]), .c(s0_2[15]),.carry(f18_c),.sum(f18_s));
    full_adder f19  (.a(s0_0[18]) ,.b(s0_1[17]), .c(s0_2[16]),.carry(f19_c),.sum(f19_s));
    full_adder f1_10(.a(s0_0[19]) ,.b(s0_1[18]), .c(s0_2[17]),.carry(f1_10_c),.sum(f1_10_s));
    full_adder f1_11(.a(s0_0[20]) ,.b(s0_1[19]), .c(s0_2[18]),.carry(f1_11_c),.sum(f1_11_s));
    full_adder f1_12(.a(s0_0[21]) ,.b(s0_1[20]), .c(s0_2[19]),.carry(f1_12_c),.sum(f1_12_s));
    full_adder f1_13(.a(s0_0[22]) ,.b(s0_1[21]), .c(s0_2[20]),.carry(f1_13_c),.sum(f1_13_s));
    full_adder f1_14(.a(s0_3[8])  ,.b(s0_4[7]) , .c(s0_5[6]), .carry(f1_14_c),.sum(f1_14_s));
    full_adder f1_15(.a(s0_3[9])  ,.b(s0_4[8]) , .c(s0_5[7]), .carry(f1_15_c),.sum(f1_15_s));
    full_adder f1_16(.a(s0_3[10]) ,.b(s0_4[9]) , .c(s0_5[8]), .carry(f1_16_c),.sum(f1_16_s));
    full_adder f1_17(.a(s0_3[11]) ,.b(s0_4[10]), .c(s0_5[9]), .carry(f1_17_c),.sum(f1_17_s));
    full_adder f1_18(.a(s0_3[12]) ,.b(s0_4[11]), .c(s0_5[10]),.carry(f1_18_c),.sum(f1_18_s));
    full_adder f1_19(.a(s0_3[13]) ,.b(s0_4[12]), .c(s0_5[11]),.carry(f1_19_c),.sum(f1_19_s));
    full_adder f1_20(.a(s0_3[14]) ,.b(s0_4[13]), .c(s0_5[12]),.carry(f1_20_c),.sum(f1_20_s));
    full_adder f1_21(.a(s0_3[15]) ,.b(s0_4[14]), .c(s0_5[13]),.carry(f1_21_c),.sum(f1_21_s));
    full_adder f1_22(.a(s0_3[16]) ,.b(s0_4[15]), .c(s0_5[14]),.carry(f1_22_c),.sum(f1_22_s));
    full_adder f1_23(.a(s0_3[17]) ,.b(s0_4[16]), .c(s0_5[15]),.carry(f1_23_c),.sum(f1_23_s));
    full_adder f1_24(.a(s0_3[18]) ,.b(s0_4[17]), .c(s0_5[16]),.carry(f1_24_c),.sum(f1_24_s));
    full_adder f1_25(.a(s0_6[6])  ,.b(s0_7[5]),  .c(s0_8[4]) ,.carry(f1_25_c),.sum(f1_25_s));
    full_adder f1_26(.a(s0_6[7])  ,.b(s0_7[6]),  .c(s0_8[5]) ,.carry(f1_26_c),.sum(f1_26_s));
    full_adder f1_27(.a(s0_6[8])  ,.b(s0_7[7]),  .c(s0_8[6]) ,.carry(f1_27_c),.sum(f1_27_s));
    full_adder f1_28(.a(s0_6[9])  ,.b(s0_7[8]),  .c(s0_8[7]) ,.carry(f1_28_c),.sum(f1_28_s));
    full_adder f1_29(.a(s0_6[10]) ,.b(s0_7[9]),  .c(s0_8[8]) ,.carry(f1_29_c),.sum(f1_29_s));
    full_adder f1_30(.a(s0_6[11]) ,.b(s0_7[10]), .c(s0_8[9]) ,.carry(f1_30_c),.sum(f1_30_s));
    full_adder f1_31(.a(s0_6[12]) ,.b(s0_7[11]), .c(s0_8[10]),.carry(f1_31_c),.sum(f1_31_s));
    full_adder f1_32(.a(s0_6[13]) ,.b(s0_7[12]), .c(s0_8[11]),.carry(f1_32_c),.sum(f1_32_s));
    full_adder f1_33(.a(s0_6[14]) ,.b(s0_7[13]), .c(s0_8[12]),.carry(f1_33_c),.sum(f1_33_s));
    full_adder f1_34(.a(s0_9[4]) , .b(s0_10[3]), .c(s0_11[2]),.carry(f1_34_c),.sum(f1_34_s));
    full_adder f1_35(.a(s0_9[5]) , .b(s0_10[4]), .c(s0_11[3]),.carry(f1_35_c),.sum(f1_35_s));
    full_adder f1_36(.a(s0_9[6]) , .b(s0_10[5]), .c(s0_11[4]),.carry(f1_36_c),.sum(f1_36_s));
    full_adder f1_37(.a(s0_9[7]) , .b(s0_10[6]), .c(s0_11[5]),.carry(f1_37_c),.sum(f1_37_s));
    full_adder f1_38(.a(s0_9[8]) , .b(s0_10[7]), .c(s0_11[6]),.carry(f1_38_c),.sum(f1_38_s));
    full_adder f1_39(.a(s0_9[9]) , .b(s0_10[8]), .c(s0_11[7]),.carry(f1_39_c),.sum(f1_39_s));
    full_adder f1_40(.a(s0_9[10]) ,.b(s0_10[9]), .c(s0_11[8]),.carry(f1_40_c),.sum(f1_40_s));


    assign s1_0={s0_0[30:23],f1_13_s,f1_12_s,f1_11_s,f1_10_s,f19_s,f18_s,f17_s,f16_s,f15_s,f14_s,f13_s,f12_s,f11_s,h11_s,s0_0[8:0]};
    assign s1_1={s0_1[28:23],f1_13_c,f1_12_c,f1_11_c,f1_10_c,f19_c,f18_c,f17_c,f16_c,f15_c,f14_c,f13_c,f12_c,f11_c,h11_c,s0_2[7],s0_1[7:0]};
    assign s1_2={s0_2[26:22],s0_1[22],s0_3[19],f1_24_s,f1_23_s,f1_22_s,f1_21_s,f1_20_s,f1_19_s,f1_18_s,f1_17_s,f1_16_s,f1_15_s,f1_14_s,h12_s,s0_3[6],s0_2[6:0]};
    assign s1_3={s0_3[24:21],s0_2[21],f1_24_c,f1_23_c,f1_22_c,f1_21_c,f1_20_c,f1_19_c,f1_18_c,f1_17_c,f1_16_c,f1_15_c,f1_14_c,h12_c,s0_5[5],s0_4[5],s0_3[5:0]};
    assign s1_4={s0_4[22:20],s0_3[20],s0_4[18],s0_6[15],f1_33_s,f1_32_s,f1_31_s,f1_30_s,f1_29_s,f1_28_s,f1_27_s,f1_26_s,f1_25_s,h13_s,s0_6[4],s0_5[4],s0_4[4:0]};
    assign s1_5={s0_5[20:19],s0_4[19],s0_5[17],f1_33_c,f1_32_c,f1_31_c,f1_30_c,f1_29_c,f1_28_c,f1_27_c,f1_26_c,f1_25_c,h13_c,s0_8[3],s0_7[3],s0_6[3],s0_5[3:0]};
    assign s1_6={s0_6[18],s0_5[18],s0_6[16],s0_7[14],s0_9[11],f1_40_s,f1_39_s,f1_38_s,f1_37_s,f1_36_s,f1_35_s,f1_34_s,h14_s,s0_9[2],s0_8[2],s0_7[2],s0_6[2:0]};
    assign s1_7={s0_6[17],s0_7[15],s0_8[13],f1_40_c,f1_39_c,f1_38_c,f1_37_c,f1_36_c,f1_35_c,f1_34_c,h14_c,s0_11[1],s0_10[1],s0_9[1],s0_8[1],s0_7[1:0]};
    assign s1_8={s0_7[16],s0_8[14],s0_9[12],s0_10[10],s0_12[7:0],s0_11[0],s0_10[0],s0_9[0],s0_8[0]};
    //-------------------------------------------------------------------------------------------
    //stage 2
    wire h21_c,h21_s,h22_c,h22_s,h23_c,h23_s,f21_c,f21_s,f22_c,f22_s;
    wire f23_c,f23_s,f24_c,f24_s,f25_c,f25_s,f26_c,f26_s,f27_c,f27_s,f28_c,f28_s;
    wire f29_c,f29_s,f2_10_c,f2_10_s,f2_11_c,f2_11_s,f2_12_c,f2_12_s,f2_13_c,f2_13_s;
    wire f2_14_c,f2_14_s,f2_15_c,f2_15_s,f2_16_c,f2_16_s,f2_17_c,f2_17_s;
    wire f2_18_c,f2_18_s,f2_19_c,f2_19_s,f2_20_c,f2_20_s,f2_21_c,f2_21_s;
    wire f2_22_c,f2_22_s,f2_23_c,f2_23_s,f2_24_c,f2_24_s,f2_25_c,f2_25_s;
    wire f2_26_c,f2_26_s,f2_27_c,f2_27_s,f2_28_c,f2_28_s,f2_29_c,f2_29_s;
    wire f2_30_c,f2_30_s,f2_31_c,f2_31_s,f2_32_c,f2_32_s,f2_33_c,f2_33_s;
    wire f2_34_c,f2_34_s,f2_35_c,f2_35_s,f2_36_c,f2_36_s,f2_37_c,f2_37_s;
    wire f2_38_c,f2_38_s,f2_39_c,f2_39_s,f2_40_c,f2_40_s,f2_41_c,f2_41_s;
    wire f2_42_c,f2_42_s,f2_43_c,f2_43_s,f2_44_c,f2_44_s,f2_45_c,f2_45_s;
    wire f2_46_c,f2_46_s,f2_47_c,f2_47_s,f2_48_c,f2_48_s,f2_49_c,f2_49_s,f2_50_c,f2_50_s,f2_51_c,f2_51_s;

    wire [30:0] s2_0;
    wire [28:0] s2_1;
    wire [26:0] s2_2;
    wire [24:0] s2_3;
    wire [22:0] s2_4;
    wire [21:0] s2_5;

    half_adder h21(.a(s1_0[6]),.b(s1_1[5]),.c(h21_c),.s(h21_s));
	half_adder h22(.a(s1_3[4]),.b(s1_4[3]),.c(h22_c),.s(h22_s));
	half_adder h23(.a(s1_6[2]),.b(s1_7[1]),.c(h23_c),.s(h23_s));

	full_adder f21  (.a(s1_0[7]) ,.b(s1_1[6]), .c(s1_2[5]), .carry(f21_c),.sum(f21_s));
    full_adder f22  (.a(s1_0[8]) ,.b(s1_1[7]), .c(s1_2[6]), .carry(f22_c),.sum(f22_s));
    full_adder f23  (.a(s1_0[9]) ,.b(s1_1[8]), .c(s1_2[7]), .carry(f23_c),.sum(f23_s));
    full_adder f24  (.a(s1_0[10]),.b(s1_1[9]), .c(s1_2[8]), .carry(f24_c),.sum(f24_s));
    full_adder f25  (.a(s1_0[11]),.b(s1_1[10]),.c(s1_2[9]), .carry(f25_c),.sum(f25_s));
    full_adder f26  (.a(s1_0[12]),.b(s1_1[11]),.c(s1_2[10]),.carry(f26_c),.sum(f26_s));
    full_adder f27  (.a(s1_0[13]),.b(s1_1[12]),.c(s1_2[11]),.carry(f27_c),.sum(f27_s));
    full_adder f28  (.a(s1_0[14]),.b(s1_1[13]),.c(s1_2[12]),.carry(f28_c),.sum(f28_s));
    full_adder f29  (.a(s1_0[15]),.b(s1_1[14]),.c(s1_2[13]),.carry(f29_c),.sum(f29_s));
    full_adder f2_10(.a(s1_0[16]),.b(s1_1[15]),.c(s1_2[14]),.carry(f2_10_c),.sum(f2_10_s));
    full_adder f2_11(.a(s1_0[17]),.b(s1_1[16]),.c(s1_2[15]),.carry(f2_11_c),.sum(f2_11_s));
    full_adder f2_12(.a(s1_0[18]),.b(s1_1[17]),.c(s1_2[16]),.carry(f2_12_c),.sum(f2_12_s));
    full_adder f2_13(.a(s1_0[19]),.b(s1_1[18]),.c(s1_2[17]),.carry(f2_13_c),.sum(f2_13_s));
    full_adder f2_14(.a(s1_0[20]),.b(s1_1[19]),.c(s1_2[18]),.carry(f2_14_c),.sum(f2_14_s));
    full_adder f2_15(.a(s1_0[21]),.b(s1_1[20]),.c(s1_2[19]),.carry(f2_15_c),.sum(f2_15_s));
    full_adder f2_16(.a(s1_0[22]),.b(s1_1[21]),.c(s1_2[20]),.carry(f2_16_c),.sum(f2_16_s));
    full_adder f2_17(.a(s1_0[23]),.b(s1_1[22]),.c(s1_2[21]),.carry(f2_17_c),.sum(f2_17_s));
    full_adder f2_18(.a(s1_0[24]),.b(s1_1[23]),.c(s1_2[22]),.carry(f2_18_c),.sum(f2_18_s));
    full_adder f2_19(.a(s1_0[25]),.b(s1_1[24]),.c(s1_2[23]),.carry(f2_19_c),.sum(f2_19_s));
    full_adder f2_20(.a(s1_3[5]) ,.b(s1_4[4]) ,.c(s1_5[3]), .carry(f2_20_c),.sum(f2_20_s));
    full_adder f2_21(.a(s1_3[6]) ,.b(s1_4[5]) ,.c(s1_5[4]), .carry(f2_21_c),.sum(f2_21_s));
    full_adder f2_22(.a(s1_3[7]) ,.b(s1_4[6]) ,.c(s1_5[5]), .carry(f2_22_c),.sum(f2_22_s));
    full_adder f2_23(.a(s1_3[8]) ,.b(s1_4[7]) ,.c(s1_5[6]), .carry(f2_23_c),.sum(f2_23_s));
    full_adder f2_24(.a(s1_3[9]) ,.b(s1_4[8]) ,.c(s1_5[7]), .carry(f2_24_c),.sum(f2_24_s));
    full_adder f2_25(.a(s1_3[10]),.b(s1_4[9]) ,.c(s1_5[8]), .carry(f2_25_c),.sum(f2_25_s));
    full_adder f2_26(.a(s1_3[11]),.b(s1_4[10]),.c(s1_5[9]), .carry(f2_26_c),.sum(f2_26_s));
    full_adder f2_27(.a(s1_3[12]),.b(s1_4[11]),.c(s1_5[10]),.carry(f2_27_c),.sum(f2_27_s));
    full_adder f2_28(.a(s1_3[13]),.b(s1_4[12]),.c(s1_5[11]),.carry(f2_28_c),.sum(f2_28_s));
    full_adder f2_29(.a(s1_3[14]),.b(s1_4[13]),.c(s1_5[12]),.carry(f2_29_c),.sum(f2_29_s));
    full_adder f2_30(.a(s1_3[15]),.b(s1_4[14]),.c(s1_5[13]),.carry(f2_30_c),.sum(f2_30_s));
    full_adder f2_31(.a(s1_3[16]),.b(s1_4[15]),.c(s1_5[14]),.carry(f2_31_c),.sum(f2_31_s));
    full_adder f2_32(.a(s1_3[17]),.b(s1_4[16]),.c(s1_5[15]),.carry(f2_32_c),.sum(f2_32_s));
    full_adder f2_33(.a(s1_3[18]),.b(s1_4[17]),.c(s1_5[16]),.carry(f2_33_c),.sum(f2_33_s));
    full_adder f2_34(.a(s1_3[19]),.b(s1_4[18]),.c(s1_5[17]),.carry(f2_34_c),.sum(f2_34_s));
    full_adder f2_35(.a(s1_3[20]),.b(s1_4[19]),.c(s1_5[18]),.carry(f2_35_c),.sum(f2_35_s));
    full_adder f2_36(.a(s1_3[21]),.b(s1_4[20]),.c(s1_5[19]),.carry(f2_36_c),.sum(f2_36_s));
    full_adder f2_37(.a(s1_6[3]) ,.b(s1_7[2]) ,.c(s1_8[1]), .carry(f2_37_c),.sum(f2_37_s));
    full_adder f2_38(.a(s1_6[4]) ,.b(s1_7[3]) ,.c(s1_8[2]), .carry(f2_38_c),.sum(f2_38_s));
    full_adder f2_39(.a(s1_6[5]) ,.b(s1_7[4]) ,.c(s1_8[3]), .carry(f2_39_c),.sum(f2_39_s));
    full_adder f2_40(.a(s1_6[6]) ,.b(s1_7[5]) ,.c(s1_8[4]), .carry(f2_40_c),.sum(f2_40_s));
    full_adder f2_41(.a(s1_6[7]) ,.b(s1_7[6]) ,.c(s1_8[5]), .carry(f2_41_c),.sum(f2_41_s));
    full_adder f2_42(.a(s1_6[8]) ,.b(s1_7[7]) ,.c(s1_8[6]), .carry(f2_42_c),.sum(f2_42_s));
    full_adder f2_43(.a(s1_6[9]) ,.b(s1_7[8]) ,.c(s1_8[7]), .carry(f2_43_c),.sum(f2_43_s));
    full_adder f2_44(.a(s1_6[10]),.b(s1_7[9]) ,.c(s1_8[8]), .carry(f2_44_c),.sum(f2_44_s));
    full_adder f2_45(.a(s1_6[11]),.b(s1_7[10]),.c(s1_8[9]), .carry(f2_45_c),.sum(f2_45_s));
    full_adder f2_46(.a(s1_6[12]),.b(s1_7[11]),.c(s1_8[10]), .carry(f2_46_c),.sum(f2_46_s));
    full_adder f2_47(.a(s1_6[13]),.b(s1_7[12]),.c(s1_8[11]),.carry(f2_47_c),.sum(f2_47_s));
    full_adder f2_48(.a(s1_6[14]),.b(s1_7[13]),.c(s1_8[12]),.carry(f2_48_c),.sum(f2_48_s));
    full_adder f2_49(.a(s1_6[15]),.b(s1_7[14]),.c(s1_8[13]),.carry(f2_49_c),.sum(f2_49_s));
    full_adder f2_50(.a(s1_6[16]),.b(s1_7[15]),.c(s1_8[14]),.carry(f2_50_c),.sum(f2_50_s));
    full_adder f2_51(.a(s1_6[17]),.b(s1_7[16]),.c(s1_8[15]),.carry(f2_51_c),.sum(f2_51_s));
    
    assign s2_0= {s1_0[30:26],f2_19_s,f2_18_s,f2_17_s,f2_16_s,f2_15_s,f2_14_s,f2_13_s,f2_12_s,f2_11_s,f2_10_s,f29_s,f28_s,f27_s,f26_s,f25_s,f24_s,f23_s,f22_s,f21_s,h21_s,s1_0[5:0]};
    assign s2_1= {s1_1[28:26],f2_19_c,f2_18_c,f2_17_c,f2_16_c,f2_15_c,f2_14_c,f2_13_c,f2_12_c,f2_11_c,f2_10_c,f29_c,f28_c,f27_c,f26_c,f25_c,f24_c,f23_c,f22_c,f21_c,h21_c,s1_2[4],s1_1[4:0]};
    assign s2_2= {s1_2[26:25],s1_1[25],s1_3[22],f2_36_s,f2_35_s,f2_34_s,f2_33_s,f2_32_s,f2_31_s,f2_30_s,f2_29_s,f2_28_s,f2_27_s,f2_26_s,f2_25_s,f2_24_s,f2_23_s,f2_22_s,f2_21_s,f2_20_s,h22_s,s1_3[3],s1_2[3:0]};
    assign s2_3= {s1_3[24],s1_2[24],f2_36_c,f2_35_c,f2_34_c,f2_33_c,f2_32_c,f2_31_c,f2_30_c,f2_29_c,f2_28_c,f2_27_c,f2_26_c,f2_25_c,f2_24_c,f2_23_c,f2_22_c,f2_21_c,f2_20_c,h22_c,s1_5[2],s1_4[2],s1_3[2:0]};
    assign s2_4= {s1_3[23],s1_4[21],s1_6[18],f2_51_s,f2_50_s,f2_49_s,f2_48_s,f2_47_s,f2_46_s,f2_45_s,f2_44_s,f2_43_s,f2_42_s,f2_41_s,f2_40_s,f2_39_s,f2_38_s,f2_37_s,h23_s,s1_6[1],s1_5[1],s1_4[1:0]};
    assign s2_5= {s1_4[22],s1_5[20],f2_51_c,f2_50_c,f2_49_c,f2_48_c,f2_47_c,f2_46_c,f2_45_c,f2_44_c,f2_43_c,f2_42_c,f2_41_c,f2_40_c,f2_39_c,f2_38_c,f2_37_c,h23_c,s1_8[0],s1_7[0],s1_6[0],s1_5[0]};

    //-------------------------------------------------------------------------------------------
    //stage 3
    wire h31_c,h31_s,h32_c,h32_s,f31_c,f31_s,f32_c,f32_s,f33_c,f33_s;
    wire f34_c,f34_s,f35_c,f35_s,f36_c,f36_s,f37_c,f37_s,f38_c,f38_s;
    wire f39_c,f39_s,f3_10_c,f3_10_s,f3_11_c,f3_11_s,f3_12_c,f3_12_s,f3_13_c,f3_13_s;
    wire f3_14_c,f3_14_s,f3_15_c,f3_15_s,f3_16_c,f3_16_s,f3_17_c,f3_17_s;
    wire f3_18_c,f3_18_s,f3_19_c,f3_19_s,f3_20_c,f3_20_s,f3_21_c,f3_21_s;
    wire f3_22_c,f3_22_s,f3_23_c,f3_23_s,f3_24_c,f3_24_s,f3_25_c,f3_25_s;
    wire f3_26_c,f3_26_s,f3_27_c,f3_27_s,f3_28_c,f3_28_s,f3_29_c,f3_29_s;
    wire f3_30_c,f3_30_s,f3_31_c,f3_31_s,f3_32_c,f3_32_s,f3_33_c,f3_33_s;
    wire f3_34_c,f3_34_s,f3_35_c,f3_35_s,f3_36_c,f3_36_s,f3_37_c,f3_37_s;
    wire f3_38_c,f3_38_s,f3_39_c,f3_39_s,f3_40_c,f3_40_s,f3_41_c,f3_41_s;
    wire f3_42_c,f3_42_s,f3_43_c,f3_43_s,f3_44_c,f3_44_s;

    wire [30:0] s3_0;
    wire [28:0] s3_1;
    wire [27:0] s3_2;
    wire [26:0] s3_3;

    half_adder h31(.a(s2_0[4]),.b(s2_1[3]),.c(h31_c),.s(h31_s));
    half_adder h32(.a(s2_3[2]),.b(s2_4[1]),.c(h32_c),.s(h32_s));
	
    full_adder f31  (.a(s2_0[5])  ,.b(s2_1[4]),  .c(s2_2[3]),  .carry(f31_c),.sum(f31_s));
    full_adder f32  (.a(s2_0[6])  ,.b(s2_1[5]),  .c(s2_2[4]),  .carry(f32_c),.sum(f32_s));
    full_adder f33  (.a(s2_0[7])  ,.b(s2_1[6]),  .c(s2_2[5]),  .carry(f33_c),.sum(f33_s));
    full_adder f34  (.a(s2_0[8])  ,.b(s2_1[7]),  .c(s2_2[6]),  .carry(f34_c),.sum(f34_s));
    full_adder f35  (.a(s2_0[9])  ,.b(s2_1[8]),  .c(s2_2[7]),  .carry(f35_c),.sum(f35_s));
    full_adder f36  (.a(s2_0[10]) ,.b(s2_1[9]),  .c(s2_2[8]),  .carry(f36_c),.sum(f36_s));
    full_adder f37  (.a(s2_0[11]) ,.b(s2_1[10]), .c(s2_2[9]),  .carry(f37_c),.sum(f37_s));
    full_adder f38  (.a(s2_0[12]) ,.b(s2_1[11]), .c(s2_2[10]), .carry(f38_c),.sum(f38_s));
    full_adder f39  (.a(s2_0[13]) ,.b(s2_1[12]), .c(s2_2[11]), .carry(f39_c),.sum(f39_s));
    full_adder f3_10(.a(s2_0[14]) ,.b(s2_1[13]), .c(s2_2[12]), .carry(f3_10_c),.sum(f3_10_s));
    full_adder f3_11(.a(s2_0[15]) ,.b(s2_1[14]), .c(s2_2[13]), .carry(f3_11_c),.sum(f3_11_s));
    full_adder f3_12(.a(s2_0[16]) ,.b(s2_1[15]), .c(s2_2[14]), .carry(f3_12_c),.sum(f3_12_s));
    full_adder f3_13(.a(s2_0[17]) ,.b(s2_1[16]), .c(s2_2[15]), .carry(f3_13_c),.sum(f3_13_s));
    full_adder f3_14(.a(s2_0[18]) ,.b(s2_1[17]), .c(s2_2[16]), .carry(f3_14_c),.sum(f3_14_s));
    full_adder f3_15(.a(s2_0[19]) ,.b(s2_1[18]), .c(s2_2[17]), .carry(f3_15_c),.sum(f3_15_s));
    full_adder f3_16(.a(s2_0[20]) ,.b(s2_1[19]), .c(s2_2[18]), .carry(f3_16_c),.sum(f3_16_s));
    full_adder f3_17(.a(s2_0[21]) ,.b(s2_1[20]), .c(s2_2[19]), .carry(f3_17_c),.sum(f3_17_s));
    full_adder f3_18(.a(s2_0[22]) ,.b(s2_1[21]), .c(s2_2[20]), .carry(f3_18_c),.sum(f3_18_s));
    full_adder f3_19(.a(s2_0[23]) ,.b(s2_1[22]), .c(s2_2[21]), .carry(f3_19_c),.sum(f3_19_s));
    full_adder f3_20(.a(s2_0[24]) ,.b(s2_1[23]), .c(s2_2[22]), .carry(f3_20_c),.sum(f3_20_s));
    full_adder f3_21(.a(s2_0[25]) ,.b(s2_1[24]), .c(s2_2[23]), .carry(f3_21_c),.sum(f3_21_s));
    full_adder f3_22(.a(s2_0[26]) ,.b(s2_1[25]), .c(s2_2[24]), .carry(f3_22_c),.sum(f3_22_s));
    full_adder f3_23(.a(s2_0[27]) ,.b(s2_1[26]), .c(s2_2[25]), .carry(f3_23_c),.sum(f3_23_s));
    full_adder f3_24(.a(s2_3[3])  ,.b(s2_4[2]),  .c(s2_5[1]),  .carry(f3_24_c),.sum(f3_24_s));
    full_adder f3_25(.a(s2_3[4])  ,.b(s2_4[3]),  .c(s2_5[2]),  .carry(f3_25_c),.sum(f3_25_s));
    full_adder f3_26(.a(s2_3[5])  ,.b(s2_4[4]),  .c(s2_5[3]),  .carry(f3_26_c),.sum(f3_26_s));
    full_adder f3_27(.a(s2_3[6])  ,.b(s2_4[5]),  .c(s2_5[4]),  .carry(f3_27_c),.sum(f3_27_s));
    full_adder f3_28(.a(s2_3[7])  ,.b(s2_4[6]),  .c(s2_5[5]),  .carry(f3_28_c),.sum(f3_28_s));
    full_adder f3_29(.a(s2_3[8])  ,.b(s2_4[7]),  .c(s2_5[6]),  .carry(f3_29_c),.sum(f3_29_s));
    full_adder f3_30(.a(s2_3[9])  ,.b(s2_4[8]),  .c(s2_5[7]),  .carry(f3_30_c),.sum(f3_30_s));
    full_adder f3_31(.a(s2_3[10]) ,.b(s2_4[9]),  .c(s2_5[8]),  .carry(f3_31_c),.sum(f3_31_s));
    full_adder f3_32(.a(s2_3[11]) ,.b(s2_4[10]), .c(s2_5[9]),  .carry(f3_32_c),.sum(f3_32_s));
    full_adder f3_33(.a(s2_3[12]) ,.b(s2_4[11]), .c(s2_5[10]), .carry(f3_33_c),.sum(f3_33_s));
    full_adder f3_34(.a(s2_3[13]) ,.b(s2_4[12]), .c(s2_5[11]), .carry(f3_34_c),.sum(f3_34_s));
    full_adder f3_35(.a(s2_3[14]) ,.b(s2_4[13]), .c(s2_5[12]), .carry(f3_35_c),.sum(f3_35_s));
    full_adder f3_36(.a(s2_3[15]) ,.b(s2_4[14]), .c(s2_5[13]), .carry(f3_36_c),.sum(f3_36_s));
    full_adder f3_37(.a(s2_3[16]) ,.b(s2_4[15]), .c(s2_5[14]), .carry(f3_37_c),.sum(f3_37_s));
    full_adder f3_38(.a(s2_3[17]) ,.b(s2_4[16]), .c(s2_5[15]), .carry(f3_38_c),.sum(f3_38_s));
    full_adder f3_39(.a(s2_3[18]) ,.b(s2_4[17]), .c(s2_5[16]), .carry(f3_39_c),.sum(f3_39_s));
    full_adder f3_40(.a(s2_3[19]) ,.b(s2_4[18]), .c(s2_5[17]), .carry(f3_40_c),.sum(f3_40_s));
    full_adder f3_41(.a(s2_3[20]) ,.b(s2_4[19]), .c(s2_5[18]), .carry(f3_41_c),.sum(f3_41_s));
    full_adder f3_42(.a(s2_3[21]) ,.b(s2_4[20]), .c(s2_5[19]), .carry(f3_42_c),.sum(f3_42_s));
    full_adder f3_43(.a(s2_3[22]) ,.b(s2_4[21]), .c(s2_5[20]), .carry(f3_43_c),.sum(f3_43_s));
    full_adder f3_44(.a(s2_3[23]) ,.b(s2_4[22]), .c(s2_5[21]), .carry(f3_44_c),.sum(f3_44_s));

    assign s3_0={s2_0[30:28],f3_23_s,f3_22_s,f3_21_s,f3_20_s,f3_19_s,f3_18_s,f3_17_s,f3_16_s,f3_15_s,f3_14_s,f3_13_s,f3_12_s,f3_11_s,f3_10_s,f39_s,f38_s,f37_s,f36_s,f35_s,f34_s,f33_s,f32_s,f31_s,h31_s,s2_0[3:0]};
    assign s3_1={s2_1[28],f3_23_c,f3_22_c,f3_21_c,f3_20_c,f3_19_c,f3_18_c,f3_17_c,f3_16_c,f3_15_c,f3_14_c,f3_13_c,f3_12_c,f3_11_c,f3_10_c,f39_c,f38_c,f37_c,f36_c,f35_c,f34_c,f33_c,f32_c,f31_c,h31_c,s2_2[2],s2_1[2:0]};
    assign s3_2={s2_1[27],s2_3[24],f3_44_s,f3_43_s,f3_42_s,f3_41_s,f3_40_s,f3_39_s,f3_38_s,f3_37_s,f3_36_s,f3_35_s,f3_34_s,f3_33_s,f3_32_s,f3_31_s,f3_30_s,f3_29_s,f3_28_s,f3_27_s,f3_26_s,f3_25_s,f3_24_s,h32_s,s2_3[1],s2_2[1:0]};
    assign s3_3={s2_2[26],f3_44_c,f3_43_c,f3_42_c,f3_41_c,f3_40_c,f3_39_c,f3_38_c,f3_37_c,f3_36_c,f3_35_c,f3_34_c,f3_33_c,f3_32_c,f3_31_c,f3_30_c,f3_29_c,f3_28_c,f3_27_c,f3_26_c,f3_25_c,f3_24_c,h32_c,s2_5[0],s2_4[0],s2_3[0]};

    //-------------------------------------------------------------------------------------------
    //stage 4
    wire h41_c,h41_s,f41_c,f41_s,f42_c,f42_s;
    wire f43_c,f43_s,f44_c,f44_s,f45_c,f45_s,f46_c,f46_s,f47_c,f47_s,f48_c,f48_s;
    wire f49_c,f49_s,f4_10_c,f4_10_s,f4_11_c,f4_11_s,f4_12_c,f4_12_s,f4_13_c,f4_13_s;
    wire f4_14_c,f4_14_s,f4_15_c,f4_15_s,f4_16_c,f4_16_s,f4_17_c,f4_17_s;
    wire f4_18_c,f4_18_s,f4_19_c,f4_19_s,f4_20_c,f4_20_s,f4_21_c,f4_21_s;
    wire f4_22_c,f4_22_s,f4_23_c,f4_23_s,f4_24_c,f4_24_s,f4_25_c,f4_25_s;
    wire[30:0] s4_0;
    wire[28:0] s4_1;
    wire[27:0] s4_2;

    half_adder h41(.a(s3_0[3]),.b(s3_1[2]),.c(h41_c),.s(h41_s));
 
    full_adder f41  (.a(s3_0[4])   ,.b(s3_1[3]),   .c(s3_2[2]),   .carry(f41_c),.sum(f41_s));
    full_adder f42  (.a(s3_0[5])   ,.b(s3_1[4]),   .c(s3_2[3]),   .carry(f42_c),.sum(f42_s));
    full_adder f43  (.a(s3_0[6])   ,.b(s3_1[5]),   .c(s3_2[4]),   .carry(f43_c),.sum(f43_s));
    full_adder f44  (.a(s3_0[7])   ,.b(s3_1[6]),   .c(s3_2[5]),   .carry(f44_c),.sum(f44_s));
    full_adder f45  (.a(s3_0[8])   ,.b(s3_1[7]),   .c(s3_2[6]),   .carry(f45_c),.sum(f45_s));
    full_adder f46  (.a(s3_0[9])   ,.b(s3_1[8]),   .c(s3_2[7]),   .carry(f46_c),.sum(f46_s));
    full_adder f47  (.a(s3_0[10])  ,.b(s3_1[9]),   .c(s3_2[8]),   .carry(f47_c),.sum(f47_s));
    full_adder f48  (.a(s3_0[11])  ,.b(s3_1[10]),  .c(s3_2[9]),   .carry(f48_c),.sum(f48_s));
    full_adder f49  (.a(s3_0[12])  ,.b(s3_1[11]),  .c(s3_2[10]),  .carry(f49_c),.sum(f49_s));
    full_adder f4_10(.a(s3_0[13])  ,.b(s3_1[12]),  .c(s3_2[11]),  .carry(f4_10_c),.sum(f4_10_s));
    full_adder f4_11(.a(s3_0[14])  ,.b(s3_1[13]),  .c(s3_2[12]),  .carry(f4_11_c),.sum(f4_11_s));
    full_adder f4_12(.a(s3_0[15])  ,.b(s3_1[14]),  .c(s3_2[13]),  .carry(f4_12_c),.sum(f4_12_s));
    full_adder f4_13(.a(s3_0[16])  ,.b(s3_1[15]),  .c(s3_2[14]),  .carry(f4_13_c),.sum(f4_13_s));
    full_adder f4_14(.a(s3_0[17])  ,.b(s3_1[16]),  .c(s3_2[15]),  .carry(f4_14_c),.sum(f4_14_s));
    full_adder f4_15(.a(s3_0[18])  ,.b(s3_1[17]),  .c(s3_2[16]),  .carry(f4_15_c),.sum(f4_15_s));
    full_adder f4_16(.a(s3_0[19])  ,.b(s3_1[18]),  .c(s3_2[17]),  .carry(f4_16_c),.sum(f4_16_s));
    full_adder f4_17(.a(s3_0[20])  ,.b(s3_1[19]),  .c(s3_2[18]),  .carry(f4_17_c),.sum(f4_17_s));
    full_adder f4_18(.a(s3_0[21])  ,.b(s3_1[20]),  .c(s3_2[19]),  .carry(f4_18_c),.sum(f4_18_s));
    full_adder f4_19(.a(s3_0[22])  ,.b(s3_1[21]),  .c(s3_2[20]),  .carry(f4_19_c),.sum(f4_19_s));
    full_adder f4_20(.a(s3_0[23])  ,.b(s3_1[22]),  .c(s3_2[21]),  .carry(f4_20_c),.sum(f4_20_s));
    full_adder f4_21(.a(s3_0[24])  ,.b(s3_1[23]),  .c(s3_2[22]),  .carry(f4_21_c),.sum(f4_21_s));
    full_adder f4_22(.a(s3_0[25])  ,.b(s3_1[24]),  .c(s3_2[23]),  .carry(f4_22_c),.sum(f4_22_s));
    full_adder f4_23(.a(s3_0[26])  ,.b(s3_1[25]),  .c(s3_2[24]),  .carry(f4_23_c),.sum(f4_23_s));
    full_adder f4_24(.a(s3_0[27])  ,.b(s3_1[26]),  .c(s3_2[25]),  .carry(f4_24_c),.sum(f4_24_s));
    full_adder f4_25(.a(s3_0[28])  ,.b(s3_1[27]),  .c(s3_2[26]),  .carry(f4_25_c),.sum(f4_25_s));

    assign s4_0={s3_0[30:29],f4_25_s,f4_24_s,f4_23_s,f4_22_s,f4_21_s,f4_20_s,f4_19_s,f4_18_s,f4_17_s,f4_16_s,f4_15_s,f4_14_s,f4_13_s,f4_12_s,f4_11_s,f4_10_s,f49_s,f48_s,f47_s,f46_s,f45_s,f44_s,f43_s,f42_s,f41_s,h41_s,s3_0[2:0]};
    assign s4_1={f4_25_c,f4_24_c,f4_23_c,f4_22_c,f4_21_c,f4_20_c,f4_19_c,f4_18_c,f4_17_c,f4_16_c,f4_15_c,f4_14_c,f4_13_c,f4_12_c,f4_11_c,f4_10_c,f49_c,f48_c,f47_c,f46_c,f45_c,f44_c,f43_c,f42_c,f41_c,h41_c,s3_2[1],s3_1[1:0]};
    assign s4_2={s3_1[28],s3_3[25:0],s3_2[0]};

    //-------------------------------------------------------------------------------------------
    //stage 5
    wire [30:0] s5_0;
    wire [29:0] s5_1;
    wire h51_c,h51_s,f51_c,f51_s,f52_c,f52_s;
    wire f53_c,f53_s,f54_c,f54_s,f55_c,f55_s,f56_c,f56_s,f57_c,f57_s,f58_c,f58_s;
    wire f59_c,f59_s,f5_10_c,f5_10_s,f5_11_c,f5_11_s,f5_12_c,f5_12_s,f5_13_c,f5_13_s;
    wire f5_14_c,f5_14_s,f5_15_c,f5_15_s,f5_16_c,f5_16_s,f5_17_c,f5_17_s;
    wire f5_18_c,f5_18_s,f5_19_c,f5_19_s,f5_20_c,f5_20_s,f5_21_c,f5_21_s;
    wire f5_22_c,f5_22_s,f5_23_c,f5_23_s,f5_24_c,f5_24_s,f5_25_c,f5_25_s;

    half_adder h51(.a(s4_0[2]),.b(s4_1[1]),.c(h51_c),.s(h51_s));

    full_adder f51  (.a(s4_1[2])   ,.b(s4_0[3]),   .c(s4_2[1]),  .carry(f51_c),  .sum(f51_s));
    full_adder f52  (.a(s4_1[3])   ,.b(s4_0[4]),   .c(s4_2[2]),  .carry(f52_c),  .sum(f52_s));
    full_adder f53  (.a(s4_1[4])   ,.b(s4_0[5]),   .c(s4_2[3]),  .carry(f53_c),  .sum(f53_s));
    full_adder f54  (.a(s4_1[5])   ,.b(s4_0[6]),   .c(s4_2[4]),  .carry(f54_c),  .sum(f54_s));
    full_adder f55  (.a(s4_1[6])   ,.b(s4_0[7]),   .c(s4_2[5]),  .carry(f55_c),  .sum(f55_s));
    full_adder f56  (.a(s4_1[7])   ,.b(s4_0[8]),   .c(s4_2[6]),  .carry(f56_c),  .sum(f56_s));
    full_adder f57  (.a(s4_1[8])   ,.b(s4_0[9]),   .c(s4_2[7]),  .carry(f57_c),  .sum(f57_s));
    full_adder f58  (.a(s4_1[9])   ,.b(s4_0[10]),  .c(s4_2[8]),  .carry(f58_c),  .sum(f58_s));
    full_adder f59  (.a(s4_1[10])  ,.b(s4_0[11]),  .c(s4_2[9]),  .carry(f59_c),  .sum(f59_s));
    full_adder f5_10(.a(s4_1[11])  ,.b(s4_0[12]),  .c(s4_2[10]), .carry(f5_10_c),.sum(f5_10_s));
    full_adder f5_11(.a(s4_1[12])  ,.b(s4_0[13]),  .c(s4_2[11]), .carry(f5_11_c),.sum(f5_11_s));
    full_adder f5_12(.a(s4_1[13])  ,.b(s4_0[14]),  .c(s4_2[12]), .carry(f5_12_c),.sum(f5_12_s));
    full_adder f5_13(.a(s4_1[14])  ,.b(s4_0[15]),  .c(s4_2[13]), .carry(f5_13_c),.sum(f5_13_s));
    full_adder f5_14(.a(s4_1[15])  ,.b(s4_0[16]),  .c(s4_2[14]), .carry(f5_14_c),.sum(f5_14_s));
    full_adder f5_15(.a(s4_1[16])  ,.b(s4_0[17]),  .c(s4_2[15]), .carry(f5_15_c),.sum(f5_15_s));
    full_adder f5_16(.a(s4_1[17])  ,.b(s4_0[18]),  .c(s4_2[16]), .carry(f5_16_c),.sum(f5_16_s));
    full_adder f5_17(.a(s4_1[18])  ,.b(s4_0[19]),  .c(s4_2[17]), .carry(f5_17_c),.sum(f5_17_s));
    full_adder f5_18(.a(s4_1[19])  ,.b(s4_0[20]),  .c(s4_2[18]), .carry(f5_18_c),.sum(f5_18_s));
    full_adder f5_19(.a(s4_1[20])  ,.b(s4_0[21]),  .c(s4_2[19]), .carry(f5_19_c),.sum(f5_19_s));
    full_adder f5_20(.a(s4_1[21])  ,.b(s4_0[22]),  .c(s4_2[20]), .carry(f5_20_c),.sum(f5_20_s));
    full_adder f5_21(.a(s4_1[22])  ,.b(s4_0[23]),  .c(s4_2[21]), .carry(f5_21_c),.sum(f5_21_s));
    full_adder f5_22(.a(s4_1[23])  ,.b(s4_0[24]),  .c(s4_2[22]), .carry(f5_22_c),.sum(f5_22_s));
    full_adder f5_23(.a(s4_1[24])  ,.b(s4_0[25]),  .c(s4_2[23]), .carry(f5_23_c),.sum(f5_23_s));
    full_adder f5_24(.a(s4_1[25])  ,.b(s4_0[26]),  .c(s4_2[24]), .carry(f5_24_c),.sum(f5_24_s));
    full_adder f5_25(.a(s4_1[26])  ,.b(s4_0[27]),  .c(s4_2[25]), .carry(f5_25_c),.sum(f5_25_s));
    full_adder f5_26(.a(s4_1[27])  ,.b(s4_0[28]),  .c(s4_2[26]), .carry(f5_26_c),.sum(f5_26_s));
    full_adder f5_27(.a(s4_1[28])  ,.b(s4_0[29]),  .c(s4_2[27]), .carry(f5_27_c),.sum(f5_27_s));

    assign s5_0={s4_0[30],f5_27_s,f5_26_s,f5_25_s,f5_24_s,f5_23_s,f5_22_s,f5_21_s,f5_20_s,f5_19_s,f5_18_s,f5_17_s,f5_16_s,f5_15_s,f5_14_s,f5_13_s,f5_12_s,f5_11_s,f5_10_s,f59_s,f58_s,f57_s,f56_s,f55_s,f54_s,f53_s,f52_s,f51_s,h41_s,s4_0[1:0]};
    assign s5_1={f5_27_c,f5_26_c,f5_25_c,f5_24_c,f5_23_c,f5_22_c,f5_21_c,f5_20_c,f5_19_c,f5_18_c,f5_17_c,f5_16_c,f5_15_c,f5_14_c,f5_13_c,f5_12_c,f5_11_c,f5_10_c,f59_c,f58_c,f57_c,f56_c,f55_c,f54_c,f53_c,f52_c,f51_c,h41_c,s4_2[0],s4_1[0]};


    //30 bit carry propogate adder
    wire rca_cin, cout_rca_1,cout_rca_2,cout_rca_3,cout_rca_4,cout_rca_5,cout_rca_6,cout_rca_7,cout_rca_8,cout_rca_9;
    wire cout_rca_10,cout_rca_11,cout_rca_12,cout_rca_13,cout_rca_14,cout_rca_15,cout_rca_16,cout_rca_17,cout_rca_18;
    wire cout_rca_19,cout_rca_20,cout_rca_21,cout_rca_22,cout_rca_23,cout_rca_24,cout_rca_25,cout_rca_26,cout_rca_27;
    wire cout_rca_28,cout_rca_29,cout_rca_30,sum_rca_0,sum_rca_1,sum_rca_2,sum_rca_3,sum_rca_4,sum_rca_8,sum_rca_9;
    wire sum_rca_10, sum_rca_11,sum_rca_12,sum_rca_13,sum_rca_14,sum_rca_15,sum_rca_16,sum_rca_17,sum_rca_18;
    wire sum_rca_19,sum_rca_20, sum_rca_21,sum_rca_22,sum_rca_23,sum_rca_24,sum_rca_25,sum_rca_26,sum_rca_27;
    wire sum_rca_28,sum_rca_29, sum_rca_30;

    wire [29:0] rca_inp1, rca_inp2;
    assign rca_inp1= s5_0[30:1];
    assign rca_inp2= s5_1;
    assign rca_cin=0;
    
    
    full_adder rca_0  (rca_inp1[0],  rca_inp2[0],  rca_cin,cout_rca_0,sum_rca_0);
    full_adder rca_1  (rca_inp1[1],  rca_inp2[1],  cout_rca_0,cout_rca_1,sum_rca_1);
    full_adder rca_2  (rca_inp1[2],  rca_inp2[2],  cout_rca_1,cout_rca_2,sum_rca_2);
    full_adder rca_3  (rca_inp1[3],  rca_inp2[3],  cout_rca_2,cout_rca_3,sum_rca_3);
    full_adder rca_4  (rca_inp1[4],  rca_inp2[4],  cout_rca_3,cout_rca_4,sum_rca_4);
    full_adder rca_5  (rca_inp1[5],  rca_inp2[5],  cout_rca_4,cout_rca_5,sum_rca_5);
    full_adder rca_6  (rca_inp1[6],  rca_inp2[6],  cout_rca_5,cout_rca_6,sum_rca_6);
    full_adder rca_7  (rca_inp1[7],  rca_inp2[7],  cout_rca_6,cout_rca_7,sum_rca_7);
    full_adder rca_8  (rca_inp1[8],  rca_inp2[8],  cout_rca_7,cout_rca_8,sum_rca_8);
    full_adder rca_9  (rca_inp1[9],  rca_inp2[9],  cout_rca_8,cout_rca_9,sum_rca_9);
    full_adder rca_10 (rca_inp1[10], rca_inp2[10], cout_rca_9,  cout_rca_10, sum_rca_10);
    full_adder rca_11 (rca_inp1[11], rca_inp2[11], cout_rca_10, cout_rca_11, sum_rca_11);
    full_adder rca_12 (rca_inp1[12], rca_inp2[12], cout_rca_11, cout_rca_12, sum_rca_12);
    full_adder rca_13 (rca_inp1[13], rca_inp2[13], cout_rca_12, cout_rca_13, sum_rca_13);
    full_adder rca_14 (rca_inp1[14], rca_inp2[14], cout_rca_13, cout_rca_14, sum_rca_14);
    full_adder rca_15 (rca_inp1[15], rca_inp2[15], cout_rca_14, cout_rca_15, sum_rca_15);
    full_adder rca_16 (rca_inp1[16], rca_inp2[16], cout_rca_15, cout_rca_16, sum_rca_16);
    full_adder rca_17 (rca_inp1[17], rca_inp2[17], cout_rca_16, cout_rca_17, sum_rca_17);
    full_adder rca_18 (rca_inp1[18], rca_inp2[18], cout_rca_17, cout_rca_18, sum_rca_18);
    full_adder rca_19 (rca_inp1[19], rca_inp2[19], cout_rca_18, cout_rca_19, sum_rca_19);
    full_adder rca_20 (rca_inp1[20], rca_inp2[20], cout_rca_19, cout_rca_20, sum_rca_20);
    full_adder rca_21 (rca_inp1[21], rca_inp2[21], cout_rca_20, cout_rca_21, sum_rca_21);
    full_adder rca_22 (rca_inp1[22], rca_inp2[22], cout_rca_21, cout_rca_22, sum_rca_22);
    full_adder rca_23 (rca_inp1[23], rca_inp2[23], cout_rca_22, cout_rca_23, sum_rca_23);
    full_adder rca_24 (rca_inp1[24], rca_inp2[24], cout_rca_23, cout_rca_24, sum_rca_24);
    full_adder rca_25 (rca_inp1[25], rca_inp2[25], cout_rca_24, cout_rca_25, sum_rca_25);
    full_adder rca_26 (rca_inp1[26], rca_inp2[26], cout_rca_25, cout_rca_26, sum_rca_26);
    full_adder rca_27 (rca_inp1[27], rca_inp2[27], cout_rca_26, cout_rca_27, sum_rca_27);
    full_adder rca_28 (rca_inp1[28], rca_inp2[28], cout_rca_27, cout_rca_28, sum_rca_28);
    full_adder rca_29 (rca_inp1[29], rca_inp2[29], cout_rca_28, cout_rca_29, sum_rca_29);

    assign prod = {cout_rca_29,sum_rca_29,sum_rca_28,sum_rca_27,sum_rca_26,sum_rca_25,sum_rca_24,
                    sum_rca_23,sum_rca_22,sum_rca_21,sum_rca_20,sum_rca_19,sum_rca_18,sum_rca_17,sum_rca_16,
                    sum_rca_15,sum_rca_14,sum_rca_13,sum_rca_12,sum_rca_11,sum_rca_10,sum_rca_9,sum_rca_8,
                    sum_rca_7,sum_rca_6,sum_rca_5,sum_rca_4,sum_rca_3,sum_rca_2,sum_rca_1,sum_rca_0,s5_0[0]};
endmodule

