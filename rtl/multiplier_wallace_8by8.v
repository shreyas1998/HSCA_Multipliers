`timescale 1ns / 1ns
module fa (a, b, cin, sum, cout);
    input a;
    input b;
    input cin;
    output sum;
    output cout;

    // Implement 9-gate Full Adder
    wire a_or_b, a_and_b, not_a_and_b, stage_1_op;
    wire cin_and_first, cin_or_first, not_cin_and_first;

    or (a_or_b, a, b);
    and (a_and_b, a, b);
    not (not_a_and_b, a_and_b);
    and (stage_1_op, not_a_and_b, a_or_b);

    or (cin_or_first, stage_1_op, cin);
    and (cin_and_first, stage_1_op, cin);
    not (not_cin_and_first, cin_and_first);
    and (sum, not_cin_and_first, cin_or_first);

    or (cout, a_and_b, cin_and_first);

endmodule

module ha (a, b, sum, cout);
    input a;
    input b;
    output sum;
    output cout; 

    wire a_and_b, a_or_b, not_a_and_b;

    or (a_or_b, a, b);
    and (a_and_b, a, b);
    not (not_a_and_b, a_and_b);
    and (sum, not_a_and_b, a_or_b);

    and (cout, a, b);

endmodule

module wallace_multiplier_8bit_by_8bit (a, b, product);

    input wire [7:0] a;
    input wire [7:0] b;
    output [15:0] product;

    reg [7:0] pp [7:0];

    // Generate partial products
    integer i,j,loop = 0;

    always @(*) begin
        for (i = 0; i < 8; i = i+1) begin
            for (j = 0; j < 8; j = j+1) begin
                pp[i][j] = a[j] & b[i];
                loop = loop + 1;
            end
        end
    end

    // Stage by stage Wallace reduction
    // Stage 1
    wire s_s1_17_26, s_s1_07_16_25, s_s1_06_15_24, s_s1_05_14_23, s_s1_04_13_22, s_s1_03_12_21, s_s1_02_11_20, s_s1_01_10;
    wire c_s1_17_26, c_s1_07_16_25, c_s1_06_15_24, c_s1_05_14_23, c_s1_04_13_22, c_s1_03_12_21, c_s1_02_11_20, c_s1_01_10;

    wire s_s1_47_56, s_s1_37_46_55, s_s1_36_45_54, s_s1_35_44_53, s_s1_34_43_52, s_s1_33_42_51, s_s1_32_41_50, s_s1_31_40;
    wire c_s1_47_56, c_s1_37_46_55, c_s1_36_45_54, c_s1_35_44_53, c_s1_34_43_52, c_s1_33_42_51, c_s1_32_41_50, c_s1_31_40;

    // Half Adders
    ha u_s1_ha1 (pp[0][1], pp[1][0], s_s1_01_10, c_s1_01_10);
    ha u_s1_ha2 (pp[3][1], pp[4][0], s_s1_31_40, c_s1_31_40);
    ha u_s1_ha3 (pp[1][7], pp[2][6], s_s1_17_26, c_s1_17_26);
    ha u_s1_ha4 (pp[4][7], pp[5][6], s_s1_47_56, c_s1_47_56);

    // Full Adders
    fa u_s1_fa1 (pp[0][2], pp[1][1], pp[2][0], s_s1_02_11_20, c_s1_02_11_20);
    fa u_s1_fa2 (pp[0][3], pp[1][2], pp[2][1], s_s1_03_12_21, c_s1_03_12_21);
    fa u_s1_fa3 (pp[0][4], pp[1][3], pp[2][2], s_s1_04_13_22, c_s1_04_13_22);
    fa u_s1_fa4 (pp[0][5], pp[1][4], pp[2][3], s_s1_05_14_23, c_s1_05_14_23);
    fa u_s1_fa5 (pp[0][6], pp[1][5], pp[2][4], s_s1_06_15_24, c_s1_06_15_24);
    fa u_s1_fa6 (pp[0][7], pp[1][6], pp[2][5], s_s1_07_16_25, c_s1_07_16_25);

    fa u_s1_fa7 (pp[3][2], pp[4][1], pp[5][0], s_s1_32_41_50, c_s1_32_41_50);
    fa u_s1_fa8 (pp[3][3], pp[4][2], pp[5][1], s_s1_33_42_51, c_s1_33_42_51);
    fa u_s1_fa9 (pp[3][4], pp[4][3], pp[5][2], s_s1_34_43_52, c_s1_34_43_52);
    fa u_s1_fa10 (pp[3][5], pp[4][4], pp[5][3], s_s1_35_44_53, c_s1_35_44_53);
    fa u_s1_fa11 (pp[3][6], pp[4][5], pp[5][4], s_s1_36_45_54, c_s1_36_45_54);
    fa u_s1_fa12 (pp[3][7], pp[4][6], pp[5][5], s_s1_37_46_55, c_s1_37_46_55);

    // Stage 2
    wire s_s2_fa7, s_s2_fa6, s_s2_fa5, s_s2_fa4, s_s2_fa3, s_s2_fa2, s_s2_fa1, s_s2_ha1;
    wire c_s2_fa7, c_s2_fa6, c_s2_fa5, c_s2_fa4, c_s2_fa3, c_s2_fa2, c_s2_fa1, c_s2_ha1;

    wire s_s2_ha3, s_s2_fa13, s_s2_fa12, s_s2_fa11, s_s2_fa10, s_s2_fa9, s_s2_fa8, s_s2_ha2;
    wire c_s2_ha3, c_s2_fa13, c_s2_fa12, c_s2_fa11, c_s2_fa10, c_s2_fa9, c_s2_fa8, c_s2_ha2;

    // Half Adders
    ha u_s2_ha1 (s_s1_02_11_20, c_s1_01_10, s_s2_ha1, c_s2_ha1);
    ha u_s2_ha2 (c_s1_32_41_50, pp[6][0], s_s2_ha2, c_s2_ha2);
    ha u_s2_ha3 (pp[6][7], pp[7][6], s_s2_ha3, c_s2_ha3);
    
    // Full Adders
    fa u_s2_fa1 (s_s1_03_12_21, c_s1_02_11_20, pp[3][0], s_s2_fa1, c_s2_fa1);
    fa u_s2_fa2 (s_s1_04_13_22, c_s1_03_12_21, s_s1_31_40, s_s2_fa2, c_s2_fa2);
    fa u_s2_fa3 (s_s1_05_14_23, c_s1_04_13_22, s_s1_32_41_50, s_s2_fa3, c_s2_fa3);
    fa u_s2_fa4 (s_s1_06_15_24, c_s1_05_14_23, s_s1_33_42_51, s_s2_fa4, c_s2_fa4);
    fa u_s2_fa5 (s_s1_07_16_25, c_s1_06_15_24, s_s1_34_43_52, s_s2_fa5, c_s2_fa5);
    fa u_s2_fa6 (s_s1_17_26, c_s1_07_16_25, s_s1_35_44_53, s_s2_fa6, c_s2_fa6);
    fa u_s2_fa7 (pp[2][7], c_s1_17_26, s_s1_36_45_54, s_s2_fa7, c_s2_fa7);

    fa u_s2_fa8 (c_s1_33_42_51, pp[6][1], pp[7][0], s_s2_fa8, c_s2_fa8);
    fa u_s2_fa9 (c_s1_34_43_52, pp[6][2], pp[7][1], s_s2_fa9, c_s2_fa9);
    fa u_s2_fa10 (c_s1_35_44_53, pp[6][3], pp[7][2], s_s2_fa10, c_s2_fa10);
    fa u_s2_fa11 (c_s1_36_45_54, pp[6][4], pp[7][3], s_s2_fa11, c_s2_fa11);
    fa u_s2_fa12 (c_s1_37_46_55, pp[6][5], pp[7][4], s_s2_fa12, c_s2_fa12);
    fa u_s2_fa13 (c_s1_47_56, pp[6][6], pp[7][5], s_s2_fa13, c_s2_fa13);

    // Stage 3
    wire s_s3_fa6, s_s3_fa5, s_s3_fa4, s_s3_fa3, s_s3_fa2, s_s3_fa1;
    wire c_s3_fa6, c_s3_fa5, c_s3_fa4, c_s3_fa3, c_s3_fa2, c_s3_fa1;

    wire s_s3_ha4, s_s3_ha3, s_s3_ha2, s_s3_ha1;
    wire c_s3_ha4, c_s3_ha3, c_s3_ha2, c_s3_ha1;

    // Half Adders
    ha u_s3_ha1 (s_s2_fa1, c_s2_ha1, s_s3_ha1, c_s3_ha1);
    ha u_s3_ha2 (s_s2_fa2, c_s2_fa1, s_s3_ha2, c_s3_ha2);
    ha u_s3_ha3 (s_s1_47_56, s_s2_fa12, s_s3_ha3, c_s3_ha3);
    ha u_s3_ha4 (pp[5][7], s_s2_fa13, s_s3_ha4, c_s3_ha4);

    // Full Adders
    fa u_s3_fa1 (s_s2_fa3, c_s2_fa2, c_s1_31_40, s_s3_fa1, c_s3_fa1);
    fa u_s3_fa2 (s_s2_fa4, c_s2_fa3, s_s2_ha2, s_s3_fa2, c_s3_fa2);
    fa u_s3_fa3 (s_s2_fa5, c_s2_fa4, s_s2_fa8, s_s3_fa3, c_s3_fa3);
    fa u_s3_fa4 (s_s2_fa6, c_s2_fa5, s_s2_fa9, s_s3_fa4, c_s3_fa4);
    fa u_s3_fa5 (s_s2_fa7, c_s2_fa6, s_s2_fa10, s_s3_fa5, c_s3_fa5);
    fa u_s3_fa6 (s_s1_37_46_55, c_s2_fa7, s_s2_fa11, s_s3_fa6, c_s3_fa6);

    // Stage 4
    wire s_s4_fa7, s_s4_fa6, s_s4_fa5, s_s4_fa4, s_s4_fa3, s_s4_fa2, s_s4_fa1;
    wire c_s4_fa7, c_s4_fa6, c_s4_fa5, c_s4_fa4, c_s4_fa3, c_s4_fa2, c_s4_fa1;

    wire s_s4_ha4, s_s4_ha3, s_s4_ha2, s_s4_ha1;
    wire c_s4_ha4, c_s4_ha3, c_s4_ha2, c_s4_ha1;

    // Half Adders
    ha u_s4_ha1 (s_s3_ha2, c_s3_ha1, s_s4_ha1, c_s4_ha1);
    ha u_s4_ha2 (s_s3_fa1, c_s3_ha2, s_s4_ha2, c_s4_ha2);
    ha u_s4_ha3 (s_s3_fa2, c_s3_fa1, s_s4_ha3, c_s4_ha3);
    ha u_s4_ha4 (pp[7][7], c_s2_ha3, s_s4_ha4, c_s4_ha4);

    // Full Adders
    fa u_s4_fa1 (s_s3_fa3, c_s3_fa2, c_s2_ha2, s_s4_fa1, c_s4_fa1);
    fa u_s4_fa2 (s_s3_fa4, c_s3_fa3, c_s2_fa8, s_s4_fa2, c_s4_fa2);
    fa u_s4_fa3 (s_s3_fa5, c_s3_fa4, c_s2_fa9, s_s4_fa3, c_s4_fa3);
    fa u_s4_fa4 (s_s3_fa6, c_s3_fa5, c_s2_fa10, s_s4_fa4, c_s4_fa4);
    fa u_s4_fa5 (s_s3_ha3, c_s3_fa6, c_s2_fa11, s_s4_fa5, c_s4_fa5);
    fa u_s4_fa6 (s_s3_ha4, c_s3_ha3, c_s2_fa12, s_s4_fa6, c_s4_fa6);
    fa u_s4_fa7 (s_s2_ha3, c_s3_ha4, c_s2_fa13, s_s4_fa7, c_s4_fa7);  

    // Ripple Carry Adder
    wire [10:0] rca_inp1; 
    wire [10:0] rca_inp2;
    wire rca_cin;
    wire cout_rca_10, cout_rca_9, cout_rca_8, cout_rca_7, cout_rca_6, cout_rca_5, cout_rca_4, cout_rca_3, cout_rca_2, cout_rca_1, cout_rca_0;
    
    assign rca_inp1 = {1'b0, s_s4_ha4, s_s4_fa7, s_s4_fa6, s_s4_fa5, s_s4_fa4, s_s4_fa3, s_s4_fa2, s_s4_fa1, s_s4_ha3, s_s4_ha2};
    assign rca_inp2 = {c_s4_ha4, c_s4_fa7, c_s4_fa6, c_s4_fa5, c_s4_fa4, c_s4_fa3, c_s4_fa2, c_s4_fa1, c_s4_ha3, c_s4_ha2, c_s4_ha1};
    assign rca_cin = 0;

    // 11 bit RCA
    fa u_fa_rca_0  (rca_inp1[0], rca_inp2[0], rca_cin, sum_rca_0, cout_rca_0);
    fa u_fa_rca_1  (rca_inp1[1], rca_inp2[1], cout_rca_0, sum_rca_1, cout_rca_1);
    fa u_fa_rca_2  (rca_inp1[2], rca_inp2[2], cout_rca_1, sum_rca_2, cout_rca_2);
    fa u_fa_rca_3  (rca_inp1[3], rca_inp2[3], cout_rca_2, sum_rca_3, cout_rca_3);
    fa u_fa_rca_4  (rca_inp1[4], rca_inp2[4], cout_rca_3, sum_rca_4, cout_rca_4);
    fa u_fa_rca_5  (rca_inp1[5], rca_inp2[5], cout_rca_4, sum_rca_5, cout_rca_5);
    fa u_fa_rca_6  (rca_inp1[6], rca_inp2[6], cout_rca_5, sum_rca_6, cout_rca_6);
    fa u_fa_rca_7  (rca_inp1[7], rca_inp2[7], cout_rca_6, sum_rca_7, cout_rca_7);
    fa u_fa_rca_8  (rca_inp1[8], rca_inp2[8], cout_rca_7, sum_rca_8, cout_rca_8);
    fa u_fa_rca_9  (rca_inp1[9], rca_inp2[9], cout_rca_8, sum_rca_9, cout_rca_9);
    fa u_fa_rca_10 (rca_inp1[10], rca_inp2[10], cout_rca_9, sum_rca_10, cout_rca_10);
    
    assign product = {sum_rca_10,sum_rca_9,sum_rca_8,sum_rca_7,sum_rca_6,sum_rca_5,sum_rca_4,sum_rca_3,sum_rca_2,sum_rca_1,sum_rca_0,s_s4_ha1,s_s3_ha1,s_s2_ha1,s_s1_01_10,pp[0][0]};

endmodule


    

