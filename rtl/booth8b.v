`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2023 13:28:07
// Design Name: 
// Module Name: booth1
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

module eight_bit_adder_subractor(
    input wire cin,
    input wire [8:0] i0,i1,
    output wire [8:0] sum);

	wire cout;
	wire [8:0] temp;
	wire [8:0] int_ip; //intermediate input - processed from the inputs and fed into fa module 
	
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
	fa fa9(i0[8], int_ip[8], temp[7], sum[8], cout);
	
endmodule


module booth_substep(
    input wire signed [8:0] acc,    //Current value of accumulator
    input wire signed [8:0] Q,  //Current value of Q (initially the multiplier)    
    input wire signed q0,       //Current value of q-1 th bit
    input wire signed [8:0] multiplicand,  //the multipliand
    output reg signed [8:0] next_acc,   //next accumulator value || value of 8 MSB's of 16 bit output [17:8]
    output reg signed [8:0] next_Q, //Next value of Q || value of 8 LSB's of 16 bit output [7:0]
    output reg q0_next);
    
	wire [8:0] addsub_temp;  //next value of q_-1 th bit
	
	eight_bit_adder_subractor myadd(Q[0], acc, multiplicand, addsub_temp);
	
		always @(*) begin	
		if(Q[0] == q0) begin
            q0_next = Q[0];
            next_Q = Q>>1;
            next_Q[8] = acc[0];
            //right shift
            next_acc = acc>>1;
            //with sign extension
			if (acc[8] == 1)
                next_acc[8] = 1;
		end

		else begin        //if Q[0] != q0 (that is,  q_-1 bit)
            q0_next = Q[0];
            next_Q = Q>>1;
            next_Q[8] = addsub_temp[0];
            //right shift
            next_acc = addsub_temp>>1;
            //with sign extension
			if (addsub_temp[8] == 1)
                next_acc[8] = 1;
		end			
end	
endmodule 

 
module booth1(
    input [7:0] multiplier, multiplicand,
    output  [15:0] product);

	wire signed [8:0] Q[0:7];  //an 8 bit (1byte) array, with a depth of 7 (0 to 6 rows of 1 byte each)
	wire signed [8:0] acc[0:8]; //an 8 bit (1byte) array, with a depth of 8 (0 to 7 rows of 1 byte each)
	wire signed[8:0] q0;
	wire qout;
	wire signed [17:0]product1;
	wire signed [8:0] multiplier1, multiplicand1;
	
	assign acc[0] = 9'b000000000;   //initialising accumulator to 0
	assign multiplier1 = {1'b0,multiplier};
	assign multiplicand1 = {1'b0,multiplicand};
	
	booth_substep step1(acc[0], multiplier1, 1'b0, multiplicand1, acc[1],        Q[0],         q0[1]);
	booth_substep step2(acc[1], Q[0],      q0[1], multiplicand1, acc[2],        Q[1],         q0[2]);
	booth_substep step3(acc[2], Q[1],      q0[2], multiplicand1, acc[3],        Q[2],         q0[3]);
	booth_substep step4(acc[3], Q[2],      q0[3], multiplicand1, acc[4],        Q[3],         q0[4]);
	booth_substep step5(acc[4], Q[3],      q0[4], multiplicand1, acc[5],        Q[4],         q0[5]);
	booth_substep step6(acc[5], Q[4],      q0[5], multiplicand1, acc[6],        Q[5],         q0[6]);
	booth_substep step7(acc[6], Q[5],      q0[6], multiplicand1, acc[7],        Q[6],         q0[7]);
	booth_substep step8(acc[7], Q[6],      q0[7], multiplicand1, acc[8],        Q[7],         q0[8]);
	booth_substep step9(acc[8], Q[7],      q0[8], multiplicand1, product1[17:9], product1[8:0], qout);
	
	assign product = product1[15:0];
	
	 
endmodule
