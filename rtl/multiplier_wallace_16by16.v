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

module wallace_multiplier_16bit_by_16bit (a, b, product);

    input wire [15:0] a;
    input wire [15:0] b;
    output [31:0] product;

    reg [15:0] pp [15:0];

    // Generate partial products
    integer i,j,loop = 0;

    always @(*) begin
        for (i = 0; i < 16; i = i+1) begin
            for (j = 0; j < 16; j = j+1) begin
                pp[i][j] = a[j] & b[i];
                loop = loop + 1;
            end
        end
    end

    // Wallace reduction
    // Stage 1
    wire s_s1_fa14, s_s1_fa13, s_s1_fa12, s_s1_fa11, s_s1_fa10, s_s1_fa9, s_s1_fa8, s_s1_fa7, s_s1_fa6, s_s1_fa5, s_s1_fa4, s_s1_fa3, s_s1_fa2, s_s1_fa1;
    wire s_s1_fa28, s_s1_fa27, s_s1_fa26, s_s1_fa25, s_s1_fa24, s_s1_fa23, s_s1_fa22, s_s1_fa21, s_s1_fa20, s_s1_fa19, s_s1_fa18, s_s1_fa17, s_s1_fa16, s_s1_fa15;
    wire s_s1_fa42, s_s1_fa41, s_s1_fa40, s_s1_fa39, s_s1_fa38, s_s1_fa37, s_s1_fa36, s_s1_fa35, s_s1_fa34, s_s1_fa33, s_s1_fa32, s_s1_fa31, s_s1_fa30, s_s1_fa29;
    wire s_s1_fa56, s_s1_fa55, s_s1_fa54, s_s1_fa53, s_s1_fa52, s_s1_fa51, s_s1_fa50, s_s1_fa49, s_s1_fa48, s_s1_fa47, s_s1_fa46, s_s1_fa45, s_s1_fa44, s_s1_fa43;
    wire s_s1_fa70, s_s1_fa69, s_s1_fa68, s_s1_fa67, s_s1_fa66, s_s1_fa65, s_s1_fa64, s_s1_fa63, s_s1_fa62, s_s1_fa61, s_s1_fa60, s_s1_fa59, s_s1_fa58, s_s1_fa57;

    wire c_s1_fa14, c_s1_fa13, c_s1_fa12, c_s1_fa11, c_s1_fa10, c_s1_fa9, c_s1_fa8, c_s1_fa7, c_s1_fa6, c_s1_fa5, c_s1_fa4, c_s1_fa3, c_s1_fa2, c_s1_fa1;
    wire c_s1_fa28, c_s1_fa27, c_s1_fa26, c_s1_fa25, c_s1_fa24, c_s1_fa23, c_s1_fa22, c_s1_fa21, c_s1_fa20, c_s1_fa19, c_s1_fa18, c_s1_fa17, c_s1_fa16, c_s1_fa15;
    wire c_s1_fa42, c_s1_fa41, c_s1_fa40, c_s1_fa39, c_s1_fa38, c_s1_fa37, c_s1_fa36, c_s1_fa35, c_s1_fa34, c_s1_fa33, c_s1_fa32, c_s1_fa31, c_s1_fa30, c_s1_fa29;
    wire c_s1_fa56, c_s1_fa55, c_s1_fa54, c_s1_fa53, c_s1_fa52, c_s1_fa51, c_s1_fa50, c_s1_fa49, c_s1_fa48, c_s1_fa47, c_s1_fa46, c_s1_fa45, c_s1_fa44, c_s1_fa43;
    wire c_s1_fa70, c_s1_fa69, c_s1_fa68, c_s1_fa67, c_s1_fa66, c_s1_fa65, c_s1_fa64, c_s1_fa63, c_s1_fa62, c_s1_fa61, c_s1_fa60, c_s1_fa59, c_s1_fa58, c_s1_fa57;

    wire s_s1_ha10, s_s1_ha9, s_s1_ha8, s_s1_ha7, s_s1_ha6, s_s1_ha5, s_s1_ha4, s_s1_ha3, s_s1_ha2, s_s1_ha1;
    wire c_s1_ha10, c_s1_ha9, c_s1_ha8, c_s1_ha7, c_s1_ha6, c_s1_ha5, c_s1_ha4, c_s1_ha3, c_s1_ha2, c_s1_ha1;

    // Half Adders
    ha u_s1_ha1 (pp[0][1], pp[1][0], s_s1_ha1, c_s1_ha1);
    ha u_s1_ha2 (pp[1][15], pp[2][14], s_s1_ha2, c_s1_ha2);
    ha u_s1_ha3 (pp[3][1], pp[4][0], s_s1_ha3, c_s1_ha3);
    ha u_s1_ha4 (pp[4][15], pp[5][14], s_s1_ha4, c_s1_ha4);
    ha u_s1_ha5 (pp[6][1], pp[7][0], s_s1_ha5, c_s1_ha5);
    ha u_s1_ha6 (pp[7][15], pp[8][14], s_s1_ha6, c_s1_ha6);
    ha u_s1_ha7 (pp[9][1], pp[10][0], s_s1_ha7, c_s1_ha7);
    ha u_s1_ha8 (pp[10][15], pp[11][14], s_s1_ha8, c_s1_ha8);
    ha u_s1_ha9 (pp[12][1], pp[13][0], s_s1_ha9, c_s1_ha9);
    ha u_s1_ha10 (pp[13][15], pp[14][14], s_s1_ha10, c_s1_ha10);

    // Full Adders
    fa u_s1_fa1 (pp[0][2],pp[1][1],pp[2][0], s_s1_fa1, c_s1_fa1);
    fa u_s1_fa2 (pp[0][3],pp[1][2],pp[2][1], s_s1_fa2, c_s1_fa2);
    fa u_s1_fa3 (pp[0][4],pp[1][3],pp[2][2], s_s1_fa3, c_s1_fa3);
    fa u_s1_fa4 (pp[0][5],pp[1][4],pp[2][3], s_s1_fa4, c_s1_fa4);
    fa u_s1_fa5 (pp[0][6],pp[1][5],pp[2][4], s_s1_fa5, c_s1_fa5);
    fa u_s1_fa6 (pp[0][7],pp[1][6],pp[2][5], s_s1_fa6, c_s1_fa6);
    fa u_s1_fa7 (pp[0][8],pp[1][7],pp[2][6], s_s1_fa7, c_s1_fa7);
    fa u_s1_fa8 (pp[0][9],pp[1][8],pp[2][7], s_s1_fa8, c_s1_fa8);
    fa u_s1_fa9 (pp[0][10],pp[1][9],pp[2][8], s_s1_fa9, c_s1_fa9);
    fa u_s1_fa10 (pp[0][11],pp[1][10],pp[2][9], s_s1_fa10, c_s1_fa10);
    fa u_s1_fa11 (pp[0][12],pp[1][11],pp[2][10], s_s1_fa11, c_s1_fa11);
    fa u_s1_fa12 (pp[0][13],pp[1][12],pp[2][11], s_s1_fa12, c_s1_fa12);
    fa u_s1_fa13 (pp[0][14],pp[1][13],pp[2][12], s_s1_fa13, c_s1_fa13);
    fa u_s1_fa14 (pp[0][15],pp[1][14],pp[2][13], s_s1_fa14, c_s1_fa14);

    fa u_s1_fa15 (pp[3][2],pp[4][1],pp[5][0], s_s1_fa15, c_s1_fa15);
    fa u_s1_fa16 (pp[3][3],pp[4][2],pp[5][1], s_s1_fa16, c_s1_fa16);
    fa u_s1_fa17 (pp[3][4],pp[4][3],pp[5][2], s_s1_fa17, c_s1_fa17);
    fa u_s1_fa18 (pp[3][5],pp[4][4],pp[5][3], s_s1_fa18, c_s1_fa18);
    fa u_s1_fa19 (pp[3][6],pp[4][5],pp[5][4], s_s1_fa19, c_s1_fa19);
    fa u_s1_fa20 (pp[3][7],pp[4][6],pp[5][5], s_s1_fa20, c_s1_fa20);
    fa u_s1_fa21 (pp[3][8],pp[4][7],pp[5][6], s_s1_fa21, c_s1_fa21);
    fa u_s1_fa22 (pp[3][9],pp[4][8],pp[5][7], s_s1_fa22, c_s1_fa22);
    fa u_s1_fa23 (pp[3][10],pp[4][9],pp[5][8], s_s1_fa23, c_s1_fa23);
    fa u_s1_fa24 (pp[3][11],pp[4][10],pp[5][9], s_s1_fa24, c_s1_fa24);
    fa u_s1_fa25 (pp[3][12],pp[4][11],pp[5][10], s_s1_fa25, c_s1_fa25);
    fa u_s1_fa26 (pp[3][13],pp[4][12],pp[5][11], s_s1_fa26, c_s1_fa26);
    fa u_s1_fa27 (pp[3][14],pp[4][13],pp[5][12], s_s1_fa27, c_s1_fa27);
    fa u_s1_fa28 (pp[3][15],pp[4][14],pp[5][13], s_s1_fa28, c_s1_fa28);

    fa u_s1_fa29 (pp[6][2],pp[7][1],pp[8][0], s_s1_fa29, c_s1_fa29);
    fa u_s1_fa30 (pp[6][3],pp[7][2],pp[8][1], s_s1_fa30, c_s1_fa30);
    fa u_s1_fa31 (pp[6][4],pp[7][3],pp[8][2], s_s1_fa31, c_s1_fa31);
    fa u_s1_fa32 (pp[6][5],pp[7][4],pp[8][3], s_s1_fa32, c_s1_fa32);
    fa u_s1_fa33 (pp[6][6],pp[7][5],pp[8][4], s_s1_fa33, c_s1_fa33);
    fa u_s1_fa34 (pp[6][7],pp[7][6],pp[8][5], s_s1_fa34, c_s1_fa34);
    fa u_s1_fa35 (pp[6][8],pp[7][7],pp[8][6], s_s1_fa35, c_s1_fa35);
    fa u_s1_fa36 (pp[6][9],pp[7][8],pp[8][7], s_s1_fa36, c_s1_fa36);
    fa u_s1_fa37 (pp[6][10],pp[7][9],pp[8][8], s_s1_fa37, c_s1_fa37);
    fa u_s1_fa38 (pp[6][11],pp[7][10],pp[8][9], s_s1_fa38, c_s1_fa38);
    fa u_s1_fa39 (pp[6][12],pp[7][11],pp[8][10], s_s1_fa39, c_s1_fa39);
    fa u_s1_fa40 (pp[6][13],pp[7][12],pp[8][11], s_s1_fa40, c_s1_fa40);
    fa u_s1_fa41 (pp[6][14],pp[7][13],pp[8][12], s_s1_fa41, c_s1_fa41);
    fa u_s1_fa42 (pp[6][15],pp[7][14],pp[8][13], s_s1_fa42, c_s1_fa42);

    fa u_s1_fa43 (pp[9][2],pp[10][1],pp[11][0], s_s1_fa43, c_s1_fa43);
    fa u_s1_fa44 (pp[9][3],pp[10][2],pp[11][1], s_s1_fa44, c_s1_fa44);
    fa u_s1_fa45 (pp[9][4],pp[10][3],pp[11][2], s_s1_fa45, c_s1_fa45);
    fa u_s1_fa46 (pp[9][5],pp[10][4],pp[11][3], s_s1_fa46, c_s1_fa46);
    fa u_s1_fa47 (pp[9][6],pp[10][5],pp[11][4], s_s1_fa47, c_s1_fa47);
    fa u_s1_fa48 (pp[9][7],pp[10][6],pp[11][5], s_s1_fa48, c_s1_fa48);
    fa u_s1_fa49 (pp[9][8],pp[10][7],pp[11][6], s_s1_fa49, c_s1_fa49);
    fa u_s1_fa50 (pp[9][9],pp[10][8],pp[11][7], s_s1_fa50, c_s1_fa50);
    fa u_s1_fa51 (pp[9][10],pp[10][9],pp[11][8], s_s1_fa51, c_s1_fa51);
    fa u_s1_fa52 (pp[9][11],pp[10][10],pp[11][9], s_s1_fa52, c_s1_fa52);
    fa u_s1_fa53 (pp[9][12],pp[10][11],pp[11][10], s_s1_fa53, c_s1_fa53);
    fa u_s1_fa54 (pp[9][13],pp[10][12],pp[11][11], s_s1_fa54, c_s1_fa54);
    fa u_s1_fa55 (pp[9][14],pp[10][13],pp[11][12], s_s1_fa55, c_s1_fa55);
    fa u_s1_fa56 (pp[9][15],pp[10][14],pp[11][13], s_s1_fa56, c_s1_fa56);

    fa u_s1_fa57 (pp[12][2],pp[13][1],pp[14][0], s_s1_fa57, c_s1_fa57);
    fa u_s1_fa58 (pp[12][3],pp[13][2],pp[14][1], s_s1_fa58, c_s1_fa58);
    fa u_s1_fa59 (pp[12][4],pp[13][3],pp[14][2], s_s1_fa59, c_s1_fa59);
    fa u_s1_fa60 (pp[12][5],pp[13][4],pp[14][3], s_s1_fa60, c_s1_fa60);
    fa u_s1_fa61 (pp[12][6],pp[13][5],pp[14][4], s_s1_fa61, c_s1_fa61);
    fa u_s1_fa62 (pp[12][7],pp[13][6],pp[14][5], s_s1_fa62, c_s1_fa62);
    fa u_s1_fa63 (pp[12][8],pp[13][7],pp[14][6], s_s1_fa63, c_s1_fa63);
    fa u_s1_fa64 (pp[12][9],pp[13][8],pp[14][7], s_s1_fa64, c_s1_fa64);
    fa u_s1_fa65 (pp[12][10],pp[13][9],pp[14][8], s_s1_fa65, c_s1_fa65);
    fa u_s1_fa66 (pp[12][11],pp[13][10],pp[14][9], s_s1_fa66, c_s1_fa66);
    fa u_s1_fa67 (pp[12][12],pp[13][11],pp[14][10], s_s1_fa67, c_s1_fa67);
    fa u_s1_fa68 (pp[12][13],pp[13][12],pp[14][11], s_s1_fa68, c_s1_fa68);
    fa u_s1_fa69 (pp[12][14],pp[13][13],pp[14][12], s_s1_fa69, c_s1_fa69);
    fa u_s1_fa70 (pp[12][15],pp[13][14],pp[14][13], s_s1_fa70, c_s1_fa70);

    // Stage 2
    wire s_s2_fa14, s_s2_fa13, s_s2_fa12, s_s2_fa11, s_s2_fa10, s_s2_fa9, s_s2_fa8, s_s2_fa7, s_s2_fa6, s_s2_fa5, s_s2_fa4, s_s2_fa3, s_s2_fa2, s_s2_fa1;
    wire s_s2_fa28, s_s2_fa27, s_s2_fa26, s_s2_fa25, s_s2_fa24, s_s2_fa23, s_s2_fa22, s_s2_fa21, s_s2_fa20, s_s2_fa19, s_s2_fa18, s_s2_fa17, s_s2_fa16, s_s2_fa15;
    wire s_s2_fa43, s_s2_fa42, s_s2_fa41, s_s2_fa40, s_s2_fa39, s_s2_fa38, s_s2_fa37, s_s2_fa36, s_s2_fa35, s_s2_fa34, s_s2_fa33, s_s2_fa32, s_s2_fa31, s_s2_fa30, s_s2_fa29;

    wire c_s2_fa14, c_s2_fa13, c_s2_fa12, c_s2_fa11, c_s2_fa10, c_s2_fa9, c_s2_fa8, c_s2_fa7, c_s2_fa6, c_s2_fa5, c_s2_fa4, c_s2_fa3, c_s2_fa2, c_s2_fa1;
    wire c_s2_fa28, c_s2_fa27, c_s2_fa26, c_s2_fa25, c_s2_fa24, c_s2_fa23, c_s2_fa22, c_s2_fa21, c_s2_fa20, c_s2_fa19, c_s2_fa18, c_s2_fa17, c_s2_fa16, c_s2_fa15;
    wire c_s2_fa43, c_s2_fa42, c_s2_fa41, c_s2_fa40, c_s2_fa39, c_s2_fa38, c_s2_fa37, c_s2_fa36, c_s2_fa35, c_s2_fa34, c_s2_fa33, c_s2_fa32, c_s2_fa31, c_s2_fa30, c_s2_fa29;

    wire s_s2_ha7, s_s2_ha6, s_s2_ha5, s_s2_ha4, s_s2_ha3, s_s2_ha2, s_s2_ha1;
    wire c_s2_ha7, c_s2_ha6, c_s2_ha5, c_s2_ha4, c_s2_ha3, c_s2_ha2, c_s2_ha1;

    // Half Adders
    ha u_s2_ha1 (s_s1_fa1, c_s1_ha1, s_s2_ha1, c_s2_ha1);
    ha u_s2_ha2 (c_s1_fa15, pp[6][0], s_s2_ha2, c_s2_ha2);
    ha u_s2_ha3 (c_s1_fa16, s_s1_ha5, s_s2_ha3, c_s2_ha3);
    ha u_s2_ha4 (s_s1_fa42, c_s1_fa41, s_s2_ha4, c_s2_ha4);
    ha u_s2_ha5 (s_s1_ha6, c_s1_fa42, s_s2_ha5, c_s2_ha5);
    ha u_s2_ha6 (pp[8][15], c_s1_ha6, s_s2_ha6, c_s2_ha6);
    ha u_s2_ha7 (s_s1_fa43, c_s1_ha7, s_s2_ha7, c_s2_ha7);

    // Full Adders
    fa u_s2_fa1 (s_s1_fa2, c_s1_fa1, pp[3][0], s_s2_fa1, c_s2_fa1);
    fa u_s2_fa2 (s_s1_fa3, c_s1_fa2, s_s1_ha3, s_s2_fa2, c_s2_fa2);
    fa u_s2_fa3 (s_s1_fa4, c_s1_fa3, s_s1_fa15, s_s2_fa3, c_s2_fa3);
    fa u_s2_fa4 (s_s1_fa5, c_s1_fa4, s_s1_fa16, s_s2_fa4, c_s2_fa4);
    fa u_s2_fa5 (s_s1_fa6, c_s1_fa5, s_s1_fa17, s_s2_fa5, c_s2_fa5);
    fa u_s2_fa6 (s_s1_fa7, c_s1_fa6, s_s1_fa18, s_s2_fa6, c_s2_fa6);
    fa u_s2_fa7 (s_s1_fa8, c_s1_fa7, s_s1_fa19, s_s2_fa7, c_s2_fa7);
    fa u_s2_fa8 (s_s1_fa9, c_s1_fa8, s_s1_fa20, s_s2_fa8, c_s2_fa8);
    fa u_s2_fa9 (s_s1_fa10, c_s1_fa9, s_s1_fa21, s_s2_fa9, c_s2_fa9);
    fa u_s2_fa10 (s_s1_fa11, c_s1_fa10, s_s1_fa22, s_s2_fa10, c_s2_fa10);
    fa u_s2_fa11 (s_s1_fa12, c_s1_fa11, s_s1_fa23, s_s2_fa11, c_s2_fa11);
    fa u_s2_fa12 (s_s1_fa13, c_s1_fa12, s_s1_fa24, s_s2_fa12, c_s2_fa12);
    fa u_s2_fa13 (s_s1_fa14, c_s1_fa13, s_s1_fa25, s_s2_fa13, c_s2_fa13);
    fa u_s2_fa14 (s_s1_ha2, c_s1_fa14, s_s1_fa26, s_s2_fa14, c_s2_fa14);
    fa u_s2_fa15 (pp[2][15], c_s1_ha2, s_s1_fa27, s_s2_fa15, c_s2_fa15);

    fa u_s2_fa16 (c_s1_fa17, s_s1_fa29, c_s1_ha5, s_s2_fa16, c_s2_fa16);
    fa u_s2_fa17 (c_s1_fa18, s_s1_fa30, c_s1_fa29, s_s2_fa17, c_s2_fa17);
    fa u_s2_fa18 (c_s1_fa19, s_s1_fa31, c_s1_fa30, s_s2_fa18, c_s2_fa18);
    fa u_s2_fa19 (c_s1_fa20, s_s1_fa32, c_s1_fa31, s_s2_fa19, c_s2_fa19);
    fa u_s2_fa20 (c_s1_fa21, s_s1_fa33, c_s1_fa32, s_s2_fa20, c_s2_fa20);
    fa u_s2_fa21 (c_s1_fa22, s_s1_fa34, c_s1_fa33, s_s2_fa21, c_s2_fa21);
    fa u_s2_fa22 (c_s1_fa23, s_s1_fa35, c_s1_fa34, s_s2_fa22, c_s2_fa22);
    fa u_s2_fa23 (c_s1_fa24, s_s1_fa36, c_s1_fa35, s_s2_fa23, c_s2_fa23);
    fa u_s2_fa24 (c_s1_fa25, s_s1_fa37, c_s1_fa36, s_s2_fa24, c_s2_fa24);
    fa u_s2_fa25 (c_s1_fa26, s_s1_fa38, c_s1_fa37, s_s2_fa25, c_s2_fa25);
    fa u_s2_fa26 (c_s1_fa27, s_s1_fa39, c_s1_fa38, s_s2_fa26, c_s2_fa26);
    fa u_s2_fa27 (c_s1_fa28, s_s1_fa40, c_s1_fa39, s_s2_fa27, c_s2_fa27);
    fa u_s2_fa28 (c_s1_ha4, s_s1_fa41, c_s1_fa40, s_s2_fa28, c_s2_fa28);

    fa u_s2_fa29 (s_s1_fa44, c_s1_fa43, pp[12][0], s_s2_fa29, c_s2_fa29);
    fa u_s2_fa30 (s_s1_fa45, c_s1_fa44, s_s1_ha9, s_s2_fa30, c_s2_fa30);
    fa u_s2_fa31 (s_s1_fa46, c_s1_fa45, s_s1_fa57, s_s2_fa31, c_s2_fa31);
    fa u_s2_fa32 (s_s1_fa47, c_s1_fa46, s_s1_fa58, s_s2_fa32, c_s2_fa32);
    fa u_s2_fa33 (s_s1_fa48, c_s1_fa47, s_s1_fa59, s_s2_fa33, c_s2_fa33);
    fa u_s2_fa34 (s_s1_fa49, c_s1_fa48, s_s1_fa60, s_s2_fa34, c_s2_fa34);
    fa u_s2_fa35 (s_s1_fa50, c_s1_fa49, s_s1_fa61, s_s2_fa35, c_s2_fa35);
    fa u_s2_fa36 (s_s1_fa51, c_s1_fa50, s_s1_fa62, s_s2_fa36, c_s2_fa36);
    fa u_s2_fa37 (s_s1_fa52, c_s1_fa51, s_s1_fa63, s_s2_fa37, c_s2_fa37);
    fa u_s2_fa38 (s_s1_fa53, c_s1_fa52, s_s1_fa64, s_s2_fa38, c_s2_fa38);
    fa u_s2_fa39 (s_s1_fa54, c_s1_fa53, s_s1_fa65, s_s2_fa39, c_s2_fa39);
    fa u_s2_fa40 (s_s1_fa55, c_s1_fa54, s_s1_fa66, s_s2_fa40, c_s2_fa40);
    fa u_s2_fa41 (s_s1_fa56, c_s1_fa55, s_s1_fa67, s_s2_fa41, c_s2_fa41);
    fa u_s2_fa42 (s_s1_ha8, c_s1_fa56, s_s1_fa68, s_s2_fa42, c_s2_fa42);
    fa u_s2_fa43 (pp[11][15], c_s1_ha8, s_s1_fa69, s_s2_fa43, c_s2_fa43);

    // Stage 3

    wire s_s3_fa14, s_s3_fa13, s_s3_fa12, s_s3_fa11, s_s3_fa10, s_s3_fa9, s_s3_fa8, s_s3_fa7, s_s3_fa6, s_s3_fa5, s_s3_fa4, s_s3_fa3, s_s3_fa2, s_s3_fa1;
    wire s_s3_fa27, s_s3_fa26, s_s3_fa25, s_s3_fa24, s_s3_fa23, s_s3_fa22, s_s3_fa21, s_s3_fa20, s_s3_fa19, s_s3_fa18, s_s3_fa17, s_s3_fa16, s_s3_fa15;
    wire c_s3_fa14, c_s3_fa13, c_s3_fa12, c_s3_fa11, c_s3_fa10, c_s3_fa9, c_s3_fa8, c_s3_fa7, c_s3_fa6, c_s3_fa5, c_s3_fa4, c_s3_fa3, c_s3_fa2, c_s3_fa1;
    wire c_s3_fa27, c_s3_fa26, c_s3_fa25, c_s3_fa24, c_s3_fa23, c_s3_fa22, c_s3_fa21, c_s3_fa20, c_s3_fa19, c_s3_fa18, c_s3_fa17, c_s3_fa16, c_s3_fa15;

    wire s_s3_ha10, s_s3_ha9, s_s3_ha8, s_s3_ha7, s_s3_ha6, s_s3_ha5, s_s3_ha4, s_s3_ha3, s_s3_ha2, s_s3_ha1;
    wire c_s3_ha10, c_s3_ha9, c_s3_ha8, c_s3_ha7, c_s3_ha6, c_s3_ha5, c_s3_ha4, c_s3_ha3, c_s3_ha2, c_s3_ha1;

    // Half Adders
    ha u_s3_ha1 (s_s2_fa1, c_s2_ha1, s_s3_ha1, c_s3_ha1);
    ha u_s3_ha2 (s_s2_fa2, c_s2_fa1, s_s3_ha2, c_s3_ha2);
    ha u_s3_ha3 (s_s1_ha4, s_s2_fa27, s_s3_ha3, c_s3_ha3);
    ha u_s3_ha4 (pp[5][15], s_s2_fa28, s_s3_ha4, c_s3_ha4);
    ha u_s3_ha5 (c_s2_fa16, pp[9][0], s_s3_ha5, c_s3_ha5);
    ha u_s3_ha6 (c_s2_fa17, s_s1_ha7, s_s3_ha6, c_s3_ha6);
    ha u_s3_ha7 (c_s2_fa18, s_s2_ha7, s_s3_ha7, c_s3_ha7);
    ha u_s3_ha8 (s_s2_fa42, c_s2_fa41, s_s3_ha8, c_s3_ha8);
    ha u_s3_ha9 (s_s2_fa43, c_s2_fa42, s_s3_ha9, c_s3_ha9);
    ha u_s3_ha10 (s_s1_fa70, c_s2_fa43, s_s3_ha10, c_s3_ha10);

    // Full Adders
    fa u_s3_fa1 (s_s2_fa3, c_s2_fa2, c_s1_ha3, s_s3_fa1, c_s3_fa1);
    fa u_s3_fa2 (s_s2_fa4, c_s2_fa3, s_s2_ha2, s_s3_fa2, c_s3_fa2);
    fa u_s3_fa3 (s_s2_fa5, c_s2_fa4, s_s2_ha3, s_s3_fa3, c_s3_fa3);
    fa u_s3_fa4 (s_s2_fa6, c_s2_fa5, s_s2_fa16, s_s3_fa4, c_s3_fa4);
    fa u_s3_fa5 (s_s2_fa7, c_s2_fa6, s_s2_fa17, s_s3_fa5, c_s3_fa5);
    fa u_s3_fa6 (s_s2_fa8, c_s2_fa7, s_s2_fa18, s_s3_fa6, c_s3_fa6);
    fa u_s3_fa7 (s_s2_fa9, c_s2_fa8, s_s2_fa19, s_s3_fa7, c_s3_fa7);
    fa u_s3_fa8 (s_s2_fa10, c_s2_fa9, s_s2_fa20, s_s3_fa8, c_s3_fa8);
    fa u_s3_fa9 (s_s2_fa11, c_s2_fa10, s_s2_fa21, s_s3_fa9, c_s3_fa9);
    fa u_s3_fa10 (s_s2_fa12, c_s2_fa11, s_s2_fa22, s_s3_fa10, c_s3_fa10);
    fa u_s3_fa11 (s_s2_fa13, c_s2_fa12, s_s2_fa23, s_s3_fa11, c_s3_fa11);
    fa u_s3_fa12 (s_s2_fa14, c_s2_fa13, s_s2_fa24, s_s3_fa12, c_s3_fa12);
    fa u_s3_fa13 (s_s2_fa15, c_s2_fa14, s_s2_fa25, s_s3_fa13, c_s3_fa13);
    fa u_s3_fa14 (s_s1_fa28, c_s2_fa15, s_s2_fa26, s_s3_fa14, c_s3_fa14);

    fa u_s3_fa15 (c_s2_fa19, s_s2_fa29, c_s2_ha7, s_s3_fa15, c_s3_fa15);
    fa u_s3_fa16 (c_s2_fa20, s_s2_fa30, c_s2_fa29, s_s3_fa16, c_s3_fa16);
    fa u_s3_fa17 (c_s2_fa21, s_s2_fa31, c_s2_fa30, s_s3_fa17, c_s3_fa17);
    fa u_s3_fa18 (c_s2_fa22, s_s2_fa32, c_s2_fa31, s_s3_fa18, c_s3_fa18);
    fa u_s3_fa19 (c_s2_fa23, s_s2_fa33, c_s2_fa32, s_s3_fa19, c_s3_fa19);
    fa u_s3_fa20 (c_s2_fa24, s_s2_fa34, c_s2_fa33, s_s3_fa20, c_s3_fa20);
    fa u_s3_fa21 (c_s2_fa25, s_s2_fa35, c_s2_fa34, s_s3_fa21, c_s3_fa21);
    fa u_s3_fa22 (c_s2_fa26, s_s2_fa36, c_s2_fa35, s_s3_fa22, c_s3_fa22);
    fa u_s3_fa23 (c_s2_fa27, s_s2_fa37, c_s2_fa36, s_s3_fa23, c_s3_fa23);
    fa u_s3_fa24 (c_s2_fa28, s_s2_fa38, c_s2_fa37, s_s3_fa24, c_s3_fa24);
    fa u_s3_fa25 (c_s2_ha4, s_s2_fa39, c_s2_fa38, s_s3_fa25, c_s3_fa25);
    fa u_s3_fa26 (c_s2_ha5, s_s2_fa40, c_s2_fa39, s_s3_fa26, c_s3_fa26);
    fa u_s3_fa27 (c_s2_ha6, s_s2_fa41, c_s2_fa40, s_s3_fa27, c_s3_fa27);

    // Stage 4

    wire s_s4_fa14, s_s4_fa13, s_s4_fa12, s_s4_fa11, s_s4_fa10, s_s4_fa9, s_s4_fa8, s_s4_fa7, s_s4_fa6, s_s4_fa5, s_s4_fa4, s_s4_fa3, s_s4_fa2, s_s4_fa1;
    wire s_s4_fa27, s_s4_fa26, s_s4_fa25, s_s4_fa24, s_s4_fa23, s_s4_fa22, s_s4_fa21, s_s4_fa20, s_s4_fa19, s_s4_fa18, s_s4_fa17, s_s4_fa16, s_s4_fa15;
    wire s_s4_fa30, s_s4_fa29, s_s4_fa28;
    wire c_s4_fa14, c_s4_fa13, c_s4_fa12, c_s4_fa11, c_s4_fa10, c_s4_fa9, c_s4_fa8, c_s4_fa7, c_s4_fa6, c_s4_fa5, c_s4_fa4, c_s4_fa3, c_s4_fa2, c_s4_fa1;
    wire c_s4_fa27, c_s4_fa26, c_s4_fa25, c_s4_fa24, c_s4_fa23, c_s4_fa22, c_s4_fa21, c_s4_fa20, c_s4_fa19, c_s4_fa18, c_s4_fa17, c_s4_fa16, c_s4_fa15;
    wire c_s4_fa30, c_s4_fa29, c_s4_fa28;

    wire s_s4_ha6, s_s4_ha5, s_s4_ha4, s_s4_ha3, s_s4_ha2, s_s4_ha1;
    wire c_s4_ha6, c_s4_ha5, c_s4_ha4, c_s4_ha3, c_s4_ha2, c_s4_ha1;

    // Half Adders
    ha u_s4_ha1 (s_s3_ha2, c_s3_ha1, s_s4_ha1, c_s4_ha1);
    ha u_s4_ha2 (s_s3_fa1, c_s3_ha2, s_s4_ha2, c_s4_ha2);
    ha u_s4_ha3 (s_s3_fa2, c_s3_fa1, s_s4_ha3, c_s4_ha3);
    ha u_s4_ha4 (s_s2_ha5, s_s3_fa25, s_s4_ha4, c_s4_ha4);
    ha u_s4_ha5 (s_s2_ha6, s_s3_fa26, s_s4_ha5, c_s4_ha5);
    ha u_s4_ha6 (c_s3_fa16, c_s1_ha9, s_s4_ha6, c_s4_ha6);

    // Full Adders
    fa u_s4_fa1 (s_s3_fa3, c_s3_fa2, c_s2_ha2, s_s4_fa1, c_s4_fa1);
    fa u_s4_fa2 (s_s3_fa4, c_s3_fa3, c_s2_ha3, s_s4_fa2, c_s4_fa2);
    fa u_s4_fa3 (s_s3_fa5, c_s3_fa4, s_s3_ha5, s_s4_fa3, c_s4_fa3);
    fa u_s4_fa4 (s_s3_fa6, c_s3_fa5, s_s3_ha6, s_s4_fa4, c_s4_fa4);
    fa u_s4_fa5 (s_s3_fa7, c_s3_fa6, s_s3_ha7, s_s4_fa5, c_s4_fa5);
    fa u_s4_fa6 (s_s3_fa8, c_s3_fa7, s_s3_fa15, s_s4_fa6, c_s4_fa6);
    fa u_s4_fa7 (s_s3_fa9, c_s3_fa8, s_s3_fa16, s_s4_fa7, c_s4_fa7);
    fa u_s4_fa8 (s_s3_fa10, c_s3_fa9, s_s3_fa17, s_s4_fa8, c_s4_fa8);
    fa u_s4_fa9 (s_s3_fa11, c_s3_fa10, s_s3_fa18, s_s4_fa9, c_s4_fa9);
    fa u_s4_fa10 (s_s3_fa12, c_s3_fa11, s_s3_fa19, s_s4_fa10, c_s4_fa10);
    fa u_s4_fa11 (s_s3_fa13, c_s3_fa12, s_s3_fa20, s_s4_fa11, c_s4_fa11);
    fa u_s4_fa12 (s_s3_fa14, c_s3_fa13, s_s3_fa21, s_s4_fa12, c_s4_fa12);
    fa u_s4_fa13 (s_s3_ha3, c_s3_fa14, s_s3_fa22, s_s4_fa13, c_s4_fa13);
    fa u_s4_fa14 (s_s3_ha4, c_s3_ha3, s_s3_fa23, s_s4_fa14, c_s4_fa14);
    fa u_s4_fa15 (s_s2_ha4, c_s3_ha4, s_s3_fa24, s_s4_fa15, c_s4_fa15);

    fa u_s4_fa16 (c_s3_fa17, c_s1_fa57, pp[15][0], s_s4_fa16, c_s4_fa16);
    fa u_s4_fa17 (c_s3_fa18, c_s1_fa58, pp[15][1], s_s4_fa17, c_s4_fa17);
    fa u_s4_fa18 (c_s3_fa19, c_s1_fa59, pp[15][2], s_s4_fa18, c_s4_fa18);
    fa u_s4_fa19 (c_s3_fa20, c_s1_fa60, pp[15][3], s_s4_fa19, c_s4_fa19);
    fa u_s4_fa20 (c_s3_fa21, c_s1_fa61, pp[15][4], s_s4_fa20, c_s4_fa20);
    fa u_s4_fa21 (c_s3_fa22, c_s1_fa62, pp[15][5], s_s4_fa21, c_s4_fa21);
    fa u_s4_fa22 (c_s3_fa23, c_s1_fa63, pp[15][6], s_s4_fa22, c_s4_fa22);
    fa u_s4_fa23 (c_s3_fa24, c_s1_fa64, pp[15][7], s_s4_fa23, c_s4_fa23);
    fa u_s4_fa24 (c_s3_fa25, c_s1_fa65, pp[15][8], s_s4_fa24, c_s4_fa24);
    fa u_s4_fa25 (c_s3_fa26, c_s1_fa66, pp[15][9], s_s4_fa25, c_s4_fa25);
    fa u_s4_fa26 (c_s3_fa27, c_s1_fa67, pp[15][10], s_s4_fa26, c_s4_fa26);
    fa u_s4_fa27 (c_s3_ha8, c_s1_fa68, pp[15][11], s_s4_fa27, c_s4_fa27);
    fa u_s4_fa28 (c_s3_ha9, c_s1_fa69, pp[15][12], s_s4_fa28, c_s4_fa28);
    fa u_s4_fa29 (c_s3_ha10, c_s1_fa70, pp[15][13], s_s4_fa29, c_s4_fa29);
    fa u_s4_fa30 (pp[14][15], c_s1_ha10, pp[15][14], s_s4_fa30, c_s4_fa30);

    // Stage 5

    wire s_s5_fa15, s_s5_fa14, s_s5_fa13, s_s5_fa12, s_s5_fa11, s_s5_fa10, s_s5_fa9, s_s5_fa8, s_s5_fa7, s_s5_fa6, s_s5_fa5, s_s5_fa4, s_s5_fa3, s_s5_fa2, s_s5_fa1;
    wire c_s5_fa15, c_s5_fa14, c_s5_fa13, c_s5_fa12, c_s5_fa11, c_s5_fa10, c_s5_fa9, c_s5_fa8, c_s5_fa7, c_s5_fa6, c_s5_fa5, c_s5_fa4, c_s5_fa3, c_s5_fa2, c_s5_fa1;

    wire s_s5_ha9, s_s5_ha8, s_s5_ha7, s_s5_ha6, s_s5_ha5, s_s5_ha4, s_s5_ha3, s_s5_ha2, s_s5_ha1;
    wire c_s5_ha9, c_s5_ha8, c_s5_ha7, c_s5_ha6, c_s5_ha5, c_s5_ha4, c_s5_ha3, c_s5_ha2, c_s5_ha1;

    // Half Adders
    ha u_s5_ha1 (s_s4_ha2, c_s4_ha1, s_s5_ha1, c_s5_ha1);
    ha u_s5_ha2 (s_s4_ha3, c_s4_ha2, s_s5_ha2, c_s5_ha2);
    ha u_s5_ha3 (s_s4_fa1, c_s4_ha3, s_s5_ha3, c_s5_ha3);
    ha u_s5_ha4 (s_s4_fa2, c_s4_fa1, s_s5_ha4, c_s5_ha4);
    ha u_s5_ha5 (s_s4_fa3, c_s4_fa2, s_s5_ha5, c_s5_ha5);
    ha u_s5_ha6 (s_s3_ha8, s_s4_fa26, s_s5_ha6, c_s5_ha6);
    ha u_s5_ha7 (s_s3_ha9, s_s4_fa27, s_s5_ha7, c_s5_ha7);
    ha u_s5_ha8 (s_s3_ha10, s_s4_fa28, s_s5_ha8, c_s5_ha8);
    ha u_s5_ha9 (s_s1_ha10, s_s4_fa29, s_s5_ha9, c_s5_ha9);

    // Full Adders
    fa u_s5_fa1 (s_s4_fa4, c_s4_fa3, c_s3_ha5, s_s5_fa1, c_s5_fa1);
    fa u_s5_fa2 (s_s4_fa5, c_s4_fa4, c_s3_ha6, s_s5_fa2, c_s5_fa2);
    fa u_s5_fa3 (s_s4_fa6, c_s4_fa5, c_s3_ha7, s_s5_fa3, c_s5_fa3);
    fa u_s5_fa4 (s_s4_fa7, c_s4_fa6, c_s3_fa15, s_s5_fa4, c_s5_fa4);
    fa u_s5_fa5 (s_s4_fa8, c_s4_fa7, s_s4_ha6, s_s5_fa5, c_s5_fa5);
    fa u_s5_fa6 (s_s4_fa9, c_s4_fa8, s_s4_fa16, s_s5_fa6, c_s5_fa6);
    fa u_s5_fa7 (s_s4_fa10, c_s4_fa9, s_s4_fa17, s_s5_fa7, c_s5_fa7);
    fa u_s5_fa8 (s_s4_fa11, c_s4_fa10, s_s4_fa18, s_s5_fa8, c_s5_fa8);
    fa u_s5_fa9 (s_s4_fa12, c_s4_fa11, s_s4_fa19, s_s5_fa9, c_s5_fa9);
    fa u_s5_fa10 (s_s4_fa13, c_s4_fa12, s_s4_fa20, s_s5_fa10, c_s5_fa10);
    fa u_s5_fa11 (s_s4_fa14, c_s4_fa13, s_s4_fa21, s_s5_fa11, c_s5_fa11);
    fa u_s5_fa12 (s_s4_fa15, c_s4_fa14, s_s4_fa22, s_s5_fa12, c_s5_fa12);
    fa u_s5_fa13 (s_s4_ha4, c_s4_fa15, s_s4_fa23, s_s5_fa13, c_s5_fa13);
    fa u_s5_fa14 (s_s4_ha5, c_s4_ha4, s_s4_fa24, s_s5_fa14, c_s5_fa14);
    fa u_s5_fa15 (s_s3_fa27, c_s4_ha5, s_s4_fa25, s_s5_fa15, c_s5_fa15);

    // Stage 6
    wire s_s6_fa15, s_s6_fa14, s_s6_fa13, s_s6_fa12, s_s6_fa11, s_s6_fa10, s_s6_fa9, s_s6_fa8, s_s6_fa7, s_s6_fa6, s_s6_fa5, s_s6_fa4, s_s6_fa3, s_s6_fa2, s_s6_fa1;
    wire c_s6_fa15, c_s6_fa14, c_s6_fa13, c_s6_fa12, c_s6_fa11, c_s6_fa10, c_s6_fa9, c_s6_fa8, c_s6_fa7, c_s6_fa6, c_s6_fa5, c_s6_fa4, c_s6_fa3, c_s6_fa2, c_s6_fa1;

    wire s_s6_ha9, s_s6_ha8, s_s6_ha7, s_s6_ha6, s_s6_ha5, s_s6_ha4, s_s6_ha3, s_s6_ha2, s_s6_ha1;
    wire c_s6_ha9, c_s6_ha8, c_s6_ha7, c_s6_ha6, c_s6_ha5, c_s6_ha4, c_s6_ha3, c_s6_ha2, c_s6_ha1;

    // Half Adders
    ha u_s6_ha1 (s_s5_ha2, c_s5_ha1, s_s6_ha1, c_s6_ha1);
    ha u_s6_ha2 (s_s5_ha3, c_s5_ha2, s_s6_ha2, c_s6_ha2);
    ha u_s6_ha3 (s_s5_ha4, c_s5_ha3, s_s6_ha3, c_s6_ha3);
    ha u_s6_ha4 (s_s5_ha5, c_s5_ha4, s_s6_ha4, c_s6_ha4);
    ha u_s6_ha5 (s_s5_fa1, c_s5_ha5, s_s6_ha5, c_s6_ha5);
    ha u_s6_ha6 (s_s5_fa2, c_s5_fa1, s_s6_ha6, c_s6_ha6);
    ha u_s6_ha7 (s_s5_fa3, c_s5_fa2, s_s6_ha7, c_s6_ha7);
    ha u_s6_ha8 (s_s5_fa4, c_s5_fa3, s_s6_ha8, c_s6_ha8);
    ha u_s6_ha9 (s_s5_fa5, c_s5_fa4, s_s6_ha9, c_s6_ha9);
    ha u_s6_ha10 (pp[15][15], c_s4_fa30, s_s6_ha10, c_s6_ha10);

    // Full Adders
    fa u_s6_fa1 (s_s5_fa6, c_s5_fa5, c_s4_ha6, s_s6_fa1, c_s6_fa1);
    fa u_s6_fa2 (s_s5_fa7, c_s5_fa6, c_s4_fa16, s_s6_fa2, c_s6_fa2);
    fa u_s6_fa3 (s_s5_fa8, c_s5_fa7, c_s4_fa17, s_s6_fa3, c_s6_fa3);
    fa u_s6_fa4 (s_s5_fa9, c_s5_fa8, c_s4_fa18, s_s6_fa4, c_s6_fa4);
    fa u_s6_fa5 (s_s5_fa10, c_s5_fa9, c_s4_fa19, s_s6_fa5, c_s6_fa5);
    fa u_s6_fa6 (s_s5_fa11, c_s5_fa10, c_s4_fa20, s_s6_fa6, c_s6_fa6);
    fa u_s6_fa7 (s_s5_fa12, c_s5_fa11, c_s4_fa21, s_s6_fa7, c_s6_fa7);
    fa u_s6_fa8 (s_s5_fa13, c_s5_fa12, c_s4_fa22, s_s6_fa8, c_s6_fa8);
    fa u_s6_fa9 (s_s5_fa14, c_s5_fa13, c_s4_fa23, s_s6_fa9, c_s6_fa9);
    fa u_s6_fa10 (s_s5_fa15, c_s5_fa14, c_s4_fa24, s_s6_fa10, c_s6_fa10);
    fa u_s6_fa11 (s_s5_ha6, c_s5_fa15, c_s4_fa25, s_s6_fa11, c_s6_fa11);
    fa u_s6_fa12 (s_s5_ha7, c_s5_ha6, c_s4_fa26, s_s6_fa12, c_s6_fa12);
    fa u_s6_fa13 (s_s5_ha8, c_s5_ha7, c_s4_fa27, s_s6_fa13, c_s6_fa13);
    fa u_s6_fa14 (s_s5_ha9, c_s5_ha8, c_s4_fa28, s_s6_fa14, c_s6_fa14);
    fa u_s6_fa15 (s_s4_fa30, c_s5_ha9, c_s4_fa29, s_s6_fa15, c_s6_fa15);

    // Ripple Carry Adder
    wire [24:0] rca_inp1, rca_inp2;
    wire rca_cin;
    wire cout_rca_10, cout_rca_9, cout_rca_8, cout_rca_7, cout_rca_6, cout_rca_5, cout_rca_4, cout_rca_3, cout_rca_2, cout_rca_1, cout_rca_0;
    wire cout_rca_20, cout_rca_19, cout_rca_18, cout_rca_17, cout_rca_16, cout_rca_15, cout_rca_14, cout_rca_13, cout_rca_12, cout_rca_11;
    wire cout_rca_24, cout_rca_23, cout_rca_22, cout_rca_21;
    
    assign rca_inp1 = {1'b0, s_s6_ha10, s_s6_fa15, s_s6_fa14, s_s6_fa13, s_s6_fa12, s_s6_fa11, s_s6_fa10, s_s6_fa9, s_s6_fa8, s_s6_fa7, s_s6_fa6, s_s6_fa5, s_s6_fa4, s_s6_fa3, s_s6_fa2, s_s6_fa1, s_s6_ha9, s_s6_ha8, s_s6_ha7, s_s6_ha6, s_s6_ha5, s_s6_ha4, s_s6_ha3, s_s6_ha2};
    assign rca_inp2 = {c_s6_ha10, c_s6_fa15, c_s6_fa14, c_s6_fa13, c_s6_fa12, c_s6_fa11, c_s6_fa10, c_s6_fa9, c_s6_fa8, c_s6_fa7, c_s6_fa6, c_s6_fa5, c_s6_fa4, c_s6_fa3, c_s6_fa2, c_s6_fa1, c_s6_ha9, c_s6_ha8, c_s6_ha7, c_s6_ha6, c_s6_ha5, c_s6_ha4, c_s6_ha3, c_s6_ha2, c_s6_ha1};
    assign rca_cin = 0;

    // 25 bit RCA
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
    fa u_fa_rca_11 (rca_inp1[11], rca_inp2[11], cout_rca_10, sum_rca_11, cout_rca_11);
    fa u_fa_rca_12 (rca_inp1[12], rca_inp2[12], cout_rca_11, sum_rca_12, cout_rca_12);
    fa u_fa_rca_13 (rca_inp1[13], rca_inp2[13], cout_rca_12, sum_rca_13, cout_rca_13);
    fa u_fa_rca_14 (rca_inp1[14], rca_inp2[14], cout_rca_13, sum_rca_14, cout_rca_14);
    fa u_fa_rca_15 (rca_inp1[15], rca_inp2[15], cout_rca_14, sum_rca_15, cout_rca_15);
    fa u_fa_rca_16 (rca_inp1[16], rca_inp2[16], cout_rca_15, sum_rca_16, cout_rca_16);
    fa u_fa_rca_17 (rca_inp1[17], rca_inp2[17], cout_rca_16, sum_rca_17, cout_rca_17);
    fa u_fa_rca_18 (rca_inp1[18], rca_inp2[18], cout_rca_17, sum_rca_18, cout_rca_18);
    fa u_fa_rca_19 (rca_inp1[19], rca_inp2[19], cout_rca_18, sum_rca_19, cout_rca_19);
    fa u_fa_rca_20 (rca_inp1[20], rca_inp2[20], cout_rca_19, sum_rca_20, cout_rca_20);
    fa u_fa_rca_21 (rca_inp1[21], rca_inp2[21], cout_rca_20, sum_rca_21, cout_rca_21);
    fa u_fa_rca_22 (rca_inp1[22], rca_inp2[22], cout_rca_21, sum_rca_22, cout_rca_22);
    fa u_fa_rca_23 (rca_inp1[23], rca_inp2[23], cout_rca_22, sum_rca_23, cout_rca_23);
    fa u_fa_rca_24 (rca_inp1[24], rca_inp2[24], cout_rca_23, sum_rca_24, cout_rca_24);
    
    assign product = {sum_rca_24, sum_rca_23, sum_rca_22, sum_rca_21, sum_rca_20, sum_rca_19, sum_rca_18, sum_rca_17, sum_rca_16, sum_rca_15, sum_rca_14, sum_rca_13, sum_rca_12, sum_rca_11, sum_rca_10,sum_rca_9,sum_rca_8,sum_rca_7,sum_rca_6,sum_rca_5,sum_rca_4,sum_rca_3,sum_rca_2,sum_rca_1,sum_rca_0,s_s6_ha1,s_s5_ha1,s_s4_ha1,s_s3_ha1,s_s2_ha1,s_s1_ha1,pp[0][0]};

    // Multiple bit RCA

endmodule