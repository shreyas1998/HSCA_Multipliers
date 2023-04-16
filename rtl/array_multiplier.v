`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2023 01:28:15 PM
// Design Name: 
// Module Name: array
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


module array_multiplier(a, b, sum);

// Modify for 8x8, 16x16 etc.
parameter n = 8;

input wire [n-1:0]a;
input wire [n-1:0]b;
output [2*n-1:0] sum;

wire [n-1:0] g[n-1:0]; 
wire [2*n-1:0] C[2*n-1:0];
wire [2*n-1:0] S[2*n-1:0];
wire [2*n-1:0]Cout;
wire [2*n-1:0]p;

// Generate 2n-1 gates
genvar i;
generate
for(i = 0; i < n; i = i + 1)
begin
    and(g[i][0], a[i], b[0]);
end

for(i = n-1; i >= 0; i = i-1)
begin
    and(g[n-1][i], a[n-1], b[i]);
end

endgenerate


// Generate half adder cell for 2nd row
generate

for(i = 0; i < n-1; i = i+1) begin

    Cell_ha c(a[i], b[1], g[i+1][0], C[i][1], S[i][1]);

end

endgenerate


// Generate full adder cells
generate 

genvar j;

for(j = 2; j < n; j = j+1) 
begin
    
    
    for(i = 0; i < n-1; i = i + 1) begin
    
        if(i == (n-2)) begin
        
        Cell_fa f(a[i], b[j], g[i+1][j-1], C[i][j-1], C[i][j], S[i][j]);
        
        end
        else begin
    
        Cell_fa f(a[i], b[j], S[i+1][j-1], C[i][j-1], C[i][j], S[i][j]);
        end
        
    end

end

endgenerate


// First half adder of last row
ha h1(C[0][n-1], S[1][n-1], p[n], Cout[n]);


// Full adders for the MSB bits in last row
generate

for(i = 1; i < (n-1); i = i + 1) begin

    if(i == (n-2)) begin
    fa f(Cout[i+n-1], C[i][n-1], g[i+1][n-1], p[i+n], p[i+n+1]);
    
    end
    else begin 
    fa f(Cout[i+n-1], C[i][n-1], S[i+1][n-1], p[i+n], Cout[i+n]);
    end

end

endgenerate

assign sum = {p[2*n-1:n], S[0][n-1:1], g[0][0]};


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


module Cell_ha(a, b, Cin, Cout, Sout);

input a, b, Cin;
output Cout, Sout;

wire t;

and(t, a, b);

ha h(t, Cin, Sout, Cout);


endmodule

module Cell_fa(a, b, S_prev, C_current, C_next, S_current);

output C_next, S_current;
input a, b, S_prev, C_current;

wire t;

and(t, a, b);

fa f(t, S_prev, C_current, S_current, C_next);


endmodule

