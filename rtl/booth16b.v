`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2023 14:27:17
// Design Name: 
// Module Name: booth16b
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module xor2 (input wire i0, i1, output wire o);
  //assign o = i0 ^ i1;
    wire q1, q2, q3, q4;
    not(q1, i0);
    not(q2, i1);
    and(q3, q1, i1);
    and(q4, q2, i0);
    or(o, q3, q4);
endmodule

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


module sixteen_bit_adder_subractor(
    input wire cin,
    input wire [16:0] i0,i1,
    output wire [16:0] sum);

	wire cout;
	wire [16:0] temp;
	wire [16:0] int_ip; //intermediate input - processed from the inputs and fed into fa module 
	
	//if cin == 1, int_ip = 1's complement
	//else int_ip = i1
    xor2 x0 (i1[0], cin, int_ip[0]);
    xor2 x1 (i1[1], cin, int_ip[1]);
    xor2 x2 (i1[2], cin, int_ip[2]);
    xor2 x3 (i1[3], cin, int_ip[3]);
    xor2 x4 (i1[4], cin, int_ip[4]);
    xor2 x5 (i1[5], cin, int_ip[5]);
    xor2 x6 (i1[6], cin, int_ip[6]);
    xor2 x7 (i1[7], cin, int_ip[7]);
    xor2 x8 (i1[8], cin, int_ip[8]);
    xor2 x9 (i1[9], cin, int_ip[9]);
    xor2 x10 (i1[10], cin, int_ip[10]);
    xor2 x11 (i1[11], cin, int_ip[11]);
    xor2 x12 (i1[12], cin, int_ip[12]);
    xor2 x13 (i1[13], cin, int_ip[13]);
    xor2 x14 (i1[14], cin, int_ip[14]);
    xor2 x15 (i1[15], cin, int_ip[15]);
    xor2 x16 (i1[16], cin, int_ip[16]);
    
    //if cin == 1, cin added to make two's complement
    //else addition takes place
	fa fa1(i0[0], int_ip[0], cin,     sum[0], temp[0]);
	fa fa2(i0[1], int_ip[1], temp[0], sum[1], temp[1]);
	fa fa3(i0[2], int_ip[2], temp[1], sum[2], temp[2]);
	fa fa4(i0[3], int_ip[3], temp[2], sum[3], temp[3]);
	fa fa5(i0[4], int_ip[4], temp[3], sum[4], temp[4]);
	fa fa6(i0[5], int_ip[5], temp[4], sum[5], temp[5]);
	fa fa7(i0[6], int_ip[6], temp[5], sum[6], temp[6]);
	fa fa8(i0[7], int_ip[7], temp[6], sum[7], temp[7]);
	fa fa9(i0[8], int_ip[8], temp[7], sum[8], temp[8]);
	fa fa10(i0[9], int_ip[9], temp[8], sum[9], temp[9]);
	fa fa11(i0[10], int_ip[10], temp[9], sum[10], temp[10]);
	fa fa12(i0[11], int_ip[11], temp[10], sum[11], temp[11]);
	fa fa13(i0[12], int_ip[12], temp[11], sum[12], temp[12]);
	fa fa14(i0[13], int_ip[13], temp[12], sum[13], temp[13]);
	fa fa15(i0[14], int_ip[14], temp[13], sum[14], temp[14]);
	fa fa16(i0[15], int_ip[15], temp[14], sum[15], temp[15]);
	fa fa17(i0[16], int_ip[16], temp[15], sum[16], cout);
	
endmodule


module booth_substep_16b(
    input wire signed [16:0] acc,    //Current value of accumulator
    input wire signed [16:0] Q,  //Current value of Q (initially the multiplier)    
    input wire signed q0,       //Current value of q-1 th bit
    input wire signed [16:0] multiplicand,  //the multipliand
    output reg signed [16:0] next_acc,   //next accumulator value || value of 8 MSB's of 16 bit output [17:8]
    output reg signed [16:0] next_Q, //Next value of Q || value of 8 LSB's of 16 bit output [7:0]
    output reg q0_next);
    
	wire [16:0] addsub_temp;  //next value of q_-1 th bit
	
	sixteen_bit_adder_subractor myadd(Q[0], acc, multiplicand, addsub_temp);
	
		always @(*) begin	
		if(Q[0] == q0) begin
            q0_next = Q[0];
            next_Q = Q>>1;
            next_Q[16] = acc[0];
            //right shift
            next_acc = acc>>1;
            //with sign extension
			if (acc[16] == 1)
                next_acc[16] = 1;
		end

		else begin        //if Q[0] != q0 (that is,  q_-1 bit)
            q0_next = Q[0];
            next_Q = Q>>1;
            next_Q[16] = addsub_temp[0];
            //right shift
            next_acc = addsub_temp>>1;
            //with sign extension
			if (addsub_temp[16] == 1)
                next_acc[16] = 1;
		end			
end	
endmodule 

 
module booth16b(
    input [15:0] multiplier, multiplicand,
    output [31:0] product);

	wire signed [16:0] Q[0:15];  //an 8 bit (1byte) array, with a depth of 7 (0 to 6 rows of 1 byte each)
	wire signed [16:0] acc[0:16]; //an 8 bit (1byte) array, with a depth of 8 (0 to 7 rows of 1 byte each)
	wire signed[16:0] q0;
	wire qout;
	wire signed [33:0]product1;
	wire signed [16:0] multiplier1, multiplicand1;
	
	assign acc[0] = 17'b00000000000000000;   //initialising accumulator to 0
	
	assign multiplier1 = {1'b0,multiplier};
	assign multiplicand1 = {1'b0,multiplicand};
	
	booth_substep_16b step1(acc[0], multiplier1, 1'b0, multiplicand1, acc[1],          Q[0],          q0[1]);
	booth_substep_16b step2(acc[1], Q[0],      q0[1], multiplicand1, acc[2],          Q[1],          q0[2]);
	booth_substep_16b step3(acc[2], Q[1],      q0[2], multiplicand1, acc[3],          Q[2],          q0[3]);
	booth_substep_16b step4(acc[3], Q[2],      q0[3], multiplicand1, acc[4],          Q[3],          q0[4]);
	booth_substep_16b step5(acc[4], Q[3],      q0[4], multiplicand1, acc[5],          Q[4],          q0[5]);
	booth_substep_16b step6(acc[5], Q[4],      q0[5], multiplicand1, acc[6],          Q[5],          q0[6]);
	booth_substep_16b step7(acc[6], Q[5],      q0[6], multiplicand1, acc[7],          Q[6],          q0[7]);
    booth_substep_16b step8(acc[7], Q[6],      q0[7], multiplicand1, acc[8],          Q[7],          q0[8]);
	booth_substep_16b step9(acc[8], Q[7],      q0[8], multiplicand1, acc[9],          Q[8],          q0[9]);
	booth_substep_16b step10(acc[9], Q[8],     q0[9], multiplicand1, acc[10],         Q[9],          q0[10]);
	booth_substep_16b step11(acc[10], Q[9],    q0[10], multiplicand1, acc[11],        Q[10],         q0[11]);
	booth_substep_16b step12(acc[11], Q[10],   q0[11], multiplicand1, acc[12],        Q[11],         q0[12]);
	booth_substep_16b step13(acc[12], Q[11],   q0[12], multiplicand1, acc[13],        Q[12],         q0[13]);
	booth_substep_16b step14(acc[13], Q[12],   q0[13], multiplicand1, acc[14],        Q[13],         q0[14]);
	booth_substep_16b step15(acc[14], Q[13],   q0[14], multiplicand1, acc[15],        Q[14],         q0[15]);
	booth_substep_16b step16(acc[15], Q[14],   q0[15], multiplicand1, acc[16],        Q[15],         q0[16]);
	booth_substep_16b step17(acc[16], Q[15],   q0[16], multiplicand1, product1[33:17], product1[16:0], qout);
	
	assign product = product1[31:0];
	
	 
endmodule
