`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2025 15:30:42
// Design Name: 
// Module Name: Function
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


module Function(Y_cont,Y_struct,A,B,C,D);

input A,B,C,D;
output Y_cont, Y_struct;

assign Y_cont = (~A & ~B & ~D) | (B & ~C & D) | (A & D);

not(notA, A);
not(notB,B);
not(notC,C);
not(notD, D);

and(m1,notA, notB, notD);
and(m2,B, notC, D);
and(m3,A, D);

or(Y_struct, m1,m2,m3);
endmodule
