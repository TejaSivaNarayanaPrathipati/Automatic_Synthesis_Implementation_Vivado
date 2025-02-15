`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2025 14:23:15
// Design Name: 
// Module Name: BiasA
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Y = A + BC
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BiasA(
output Y,
input A,B,C
    );
    wire W1;
//    AND A1(W1, B, C);
//    OR O1(Y, A, W1);
    assign #1 Y = (A | (B&C));
endmodule