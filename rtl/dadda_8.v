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

module dadda_8(input [7:0]in1,input [7:0]in2, output [15:0]prod);

    wire [7:0] a0_p,a1_p,a2_p,a3_p,a4_p,a5_p,a6_p,a7_p;
    
    //stage 0 intermediate wires (6 rows)
    wire [14:0] s0_0;
    wire [12:0] s0_1;
    wire [10:0] s0_2;
    wire [8:0]  s0_3;
    wire [6:0]  s0_4;
    wire [5:0]  s0_5;

    //stage 1 intermediate wires (4 rows)
    wire [14:0] s1_0;
    wire [12:0] s1_1;
    wire [10:0] s1_2;
    wire [9:0] s1_3;

    //stage 2 intermediate wires (3 rows)
    wire [14:0] s2_0;
    wire [12:0] s2_1;
    wire [11:0] s2_2;
    //stage 3 intermediate wires (2 rows)
    wire [14:0] s3_0;
    wire [13:0] s3_1;

    //generate products
    assign a0_p= {in1[0]&in2[7],in1[0]&in2[6],in1[0]&in2[5],in1[0]&in2[4],in1[0]&in2[3],in1[0]&in2[2],in1[0]&in2[1],in1[0]&in2[0]};
    assign a1_p= {in1[1]&in2[7],in1[1]&in2[6],in1[1]&in2[5],in1[1]&in2[4],in1[1]&in2[3],in1[1]&in2[2],in1[1]&in2[1],in1[1]&in2[0]};
    assign a2_p= {in1[2]&in2[7],in1[2]&in2[6],in1[2]&in2[5],in1[2]&in2[4],in1[2]&in2[3],in1[2]&in2[2],in1[2]&in2[1],in1[2]&in2[0]};
    assign a3_p= {in1[3]&in2[7],in1[3]&in2[6],in1[3]&in2[5],in1[3]&in2[4],in1[3]&in2[3],in1[3]&in2[2],in1[3]&in2[1],in1[3]&in2[0]};
    assign a4_p= {in1[4]&in2[7],in1[4]&in2[6],in1[4]&in2[5],in1[4]&in2[4],in1[4]&in2[3],in1[4]&in2[2],in1[4]&in2[1],in1[4]&in2[0]};
    assign a5_p= {in1[5]&in2[7],in1[5]&in2[6],in1[5]&in2[5],in1[5]&in2[4],in1[5]&in2[3],in1[5]&in2[2],in1[5]&in2[1],in1[5]&in2[0]};
    assign a6_p= {in1[6]&in2[7],in1[6]&in2[6],in1[6]&in2[5],in1[6]&in2[4],in1[6]&in2[3],in1[6]&in2[2],in1[6]&in2[1],in1[6]&in2[0]};
    assign a7_p= {in1[7]&in2[7],in1[7]&in2[6],in1[7]&in2[5],in1[7]&in2[4],in1[7]&in2[3],in1[7]&in2[2],in1[7]&in2[1],in1[7]&in2[0]};
    
    //s0
    wire h00_c,h00_s, h01_c,h01_s, f00_c, f00_s, f01_c, f01_s, f02_c, f02_s;
    half_adder h00(.a(a0_p[6]),.b(a1_p[5]),.c(h00_c),.s(h00_s));
    half_adder h01(.a(a0_p[7]),.b(a1_p[6]),.c(h01_c),.s(h01_s));
    half_adder h02(.a(a4_p[4]),.b(a5_p[3]),.c(h02_c),.s(h02_s));

    full_adder f00(.a(a1_p[7]),.b(a2_p[6]),.c(a3_p[5]),.carry(f00_c),.sum(f00_s));
    full_adder f01(.a(a2_p[7]),.b(a3_p[6]),.c(a4_p[5]),.carry(f01_c),.sum(f01_s));
    full_adder f02(.a(a2_p[5]),.b(a3_p[4]),.c(a4_p[3]),.carry(f02_c),.sum(f02_s));

    assign s0_0= {a7_p[7],a6_p[7],a5_p[7],a4_p[7],a3_p[7],f01_s,f00_s,h01_s,h00_s,a0_p[5:0]};
    assign s0_1= {a7_p[6],a6_p[6],a5_p[6],f01_c,f00_c,h01_c,h00_c,a2_p[4],a1_p[4:0]};
    assign s0_2= {a7_p[5],a6_p[5],a4_p[6],a5_p[4],h02_s,f02_s,a3_p[3],a2_p[3:0]};
    assign s0_3= {a7_p[4],a5_p[5],h02_c,f02_c,a5_p[2],a4_p[2],a3_p[2:0]};
    assign s0_4= {a6_p[4:1],a5_p[1],a4_p[1:0]};
    assign s0_5= {a7_p[3:0],a6_p[0],a5_p[0]};

    //s1
    wire h10_c,h10_s,h11_c,h11_s,f10_c,f10_s,f11_c,f11_s,f12_c,f12_s,f13_c,f13_s,f14_c,f14_s,f15_c,f15_s,f16_c,f16_s;
    wire f17_c,f17_s,f18_c,f18_s,f19_c,f19_s,f1_10_c,f1_10_s,f1_11_c,f1_11_s;

    half_adder h10(.a(s0_0[4]),.b(s0_1[3]),.c(h10_c),.s(h10_s));
    half_adder h11(.a(s0_3[2]),.b(s0_4[1]),.c(h11_c),.s(h11_s));

    full_adder f10(.a(s0_0[5]),  .b(s0_1[4]), .c(s0_2[3]),.carry(f10_c),  .sum(f10_s));
    full_adder f11(.a(s0_0[6]),  .b(s0_1[5]), .c(s0_2[4]),.carry(f11_c),  .sum(f11_s));
    full_adder f12(.a(s0_0[7]),  .b(s0_1[6]), .c(s0_2[5]),.carry(f12_c),  .sum(f12_s));
    full_adder f13(.a(s0_0[8]),  .b(s0_1[7]), .c(s0_2[6]),.carry(f13_c),  .sum(f13_s));
    full_adder f14(.a(s0_0[9]),  .b(s0_1[8]), .c(s0_2[7]),.carry(f14_c),  .sum(f14_s));
    full_adder f15(.a(s0_0[10]), .b(s0_1[9]), .c(s0_2[8]),.carry(f15_c),  .sum(f15_s));
    full_adder f16(.a(s0_0[11]), .b(s0_1[10]),.c(s0_2[9]),.carry(f16_c),  .sum(f16_s));
    full_adder f17(.a(s0_3[3]),  .b(s0_4[2]), .c(s0_5[1]),.carry(f17_c),  .sum(f17_s));
    full_adder f18(.a(s0_3[4]),  .b(s0_4[3]), .c(s0_5[2]),.carry(f18_c),  .sum(f18_s));
    full_adder f19(.a(s0_3[5]),  .b(s0_4[4]), .c(s0_5[3]),.carry(f19_c),  .sum(f19_s));
    full_adder f1_10(.a(s0_3[6]),.b(s0_4[5]), .c(s0_5[4]),.carry(f1_10_c),.sum(f1_10_s));
    full_adder f1_11(.a(s0_3[7]),.b(s0_4[6]), .c(s0_5[5]),.carry(f1_11_c),.sum(f1_11_s));

    assign s1_0= {s0_0[14:12],f16_s,f15_s,f14_s,f13_s,f12_s,f11_s,f10_s,h10_s,s0_0[3:0]};
    assign s1_1= {s0_1[12],f16_c,f15_c,f14_c,f13_c,f12_c,f11_c,f10_c,h10_c,s0_2[2],s0_1[2:0]};
    assign s1_2= {s0_1[11],s0_3[8],f1_11_s,f1_10_s,f19_s,f18_s,f17_s,h11_s,s0_3[1],s0_2[1:0]};
    assign s1_3= {s0_2[10],f1_11_c,f1_10_c,f19_c,f18_c,f17_c,h11_c,s0_5[0],s0_4[0],s0_3[0]};
    
    //s2
    wire h20_c,h20_s,f20_c,f20_s,f21_c,f21_s,f22_c,f22_s,f23_c,f23_s,f24_c,f24_s,f25_c,f25_s,f26_c,f26_s;
    wire f27_c,f27_s,f28_c,f28_s;
    half_adder h20(.a(s1_0[3]),.b(s1_1[2]),.c(h20_c),.s(h20_s));

    full_adder f20(.a(s1_0[4]), .b(s1_1[3]), .c(s1_2[2]),.carry(f20_c),.sum(f20_s));
    full_adder f21(.a(s1_0[5]), .b(s1_1[4]), .c(s1_2[3]),.carry(f21_c),.sum(f21_s));
    full_adder f22(.a(s1_0[6]), .b(s1_1[5]), .c(s1_2[4]),.carry(f22_c),.sum(f22_s));
    full_adder f23(.a(s1_0[7]), .b(s1_1[6]), .c(s1_2[5]),.carry(f23_c),.sum(f23_s));
    full_adder f24(.a(s1_0[8]), .b(s1_1[7]), .c(s1_2[6]),.carry(f24_c),.sum(f24_s));
    full_adder f25(.a(s1_0[9]), .b(s1_1[8]), .c(s1_2[7]),.carry(f25_c),.sum(f25_s));
    full_adder f26(.a(s1_0[10]),.b(s1_1[9]), .c(s1_2[8]),.carry(f26_c),.sum(f26_s));
    full_adder f27(.a(s1_0[11]),.b(s1_1[10]),.c(s1_2[9]),.carry(f27_c),.sum(f27_s));
    full_adder f28(.a(s1_0[12]),.b(s1_1[11]),.c(s1_2[10]),.carry(f28_c),.sum(f28_s));

    assign s2_0={s1_0[14:13],f28_s,f27_s,f26_s,f25_s,f24_s,f23_s,f22_s,f21_s,f20_s,h20_s,s1_0[2:0]};
    assign s2_1={f28_c,f27_c,f26_c,f25_c,f24_c,f23_c,f22_c,f21_c,f20_c,h20_c,s1_2[1],s1_1[1:0]};
    assign s2_2={s1_1[12],s1_3[9:0],s1_2[0]};
    
    //s3
    wire h30_c,h30_s,f30_c,f30_s,f31_c,f31_s,f32_c,f32_s,f33_c,f33_s;
    wire f34_c,f34_s,f35_c,f35_s,f36_c,f36_s,f37_c,f37_s,f38_c,f38_s,f39_c,f39_s,f3_10_c,f3_10_s;
    half_adder h30(.a(s2_0[2]),.b(s2_1[1]),.c(h30_c),.s(h30_s));

    full_adder f30  (.a(s2_0[3]),  .b(s2_1[2]),  .c(s2_2[1]),.carry(f30_c),.sum(f30_s));
    full_adder f31  (.a(s2_0[4]),  .b(s2_1[3]),  .c(s2_2[2]),.carry(f31_c),.sum(f31_s));
    full_adder f32  (.a(s2_0[5]),  .b(s2_1[4]),  .c(s2_2[3]),.carry(f32_c),.sum(f32_s));
    full_adder f33  (.a(s2_0[6]),  .b(s2_1[5]),  .c(s2_2[4]),.carry(f33_c),.sum(f33_s));
    full_adder f34  (.a(s2_0[7]),  .b(s2_1[6]),  .c(s2_2[5]),.carry(f34_c),.sum(f34_s));
    full_adder f35  (.a(s2_0[8]),  .b(s2_1[7]),  .c(s2_2[6]),.carry(f35_c),.sum(f35_s));
    full_adder f36  (.a(s2_0[9]),  .b(s2_1[8]),  .c(s2_2[7]),.carry(f36_c),.sum(f36_s));
    full_adder f37  (.a(s2_0[10]), .b(s2_1[9]),  .c(s2_2[8]),.carry(f37_c),.sum(f37_s));
    full_adder f38  (.a(s2_0[11]), .b(s2_1[10]), .c(s2_2[9]),.carry(f38_c),.sum(f38_s));
    full_adder f39  (.a(s2_0[12]), .b(s2_1[11]), .c(s2_2[10]),.carry(f39_c),.sum(f39_s));
    full_adder f3_10(.a(s2_0[13]), .b(s2_1[12]), .c(s2_2[11]),.carry(f3_10_c),.sum(f3_10_s));
    
    assign s3_0={s2_0[14],f3_10_s,f39_s,f38_s,f37_s,f36_s,f35_s,f34_s,f33_s,f32_s,f31_s,f30_s,h30_s,s2_0[1:0]};
    assign s3_1={f3_10_c,f39_c,f38_c,f37_c,f36_c,f35_c,f34_c,f33_c,f32_c,f31_c,f30_c,h30_c,s2_2[0],s2_1[0]};

    //14 bit carry propogate adder
    
    wire rca_cin, cout_rca_1,cout_rca_2,cout_rca_3,cout_rca_4,cout_rca_5,cout_rca_6,cout_rca_7,cout_rca_8,cout_rca_9;
    wire cout_rca_10,cout_rca_11,cout_rca_12,cout_rca_13,sum_rca_0,sum_rca_1,sum_rca_2,sum_rca_3,sum_rca_4;
    wire sum_rca_10,sum_rca_11,sum_rca_12,sum_rca_13;
    wire [13:0] rca_inp1, rca_inp2;
    assign rca_inp1= s3_0[14:1];
    assign rca_inp2= s3_1;
    assign rca_cin=0;

    full_adder rca_0  (rca_inp1[0],  rca_inp2[0],   rca_cin,cout_rca_0,sum_rca_0);
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
    
 
    assign prod = {cout_rca_13,sum_rca_13,sum_rca_12,sum_rca_11,sum_rca_10,sum_rca_9,sum_rca_8,sum_rca_7,sum_rca_6,sum_rca_5,sum_rca_4,sum_rca_3,sum_rca_2,sum_rca_1,sum_rca_0,s3_0[0]};
endmodule