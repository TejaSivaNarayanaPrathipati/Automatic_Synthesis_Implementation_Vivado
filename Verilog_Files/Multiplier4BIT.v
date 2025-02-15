`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.02.2025 18:39:20
// Design Name: 
// Module Name: Multiplier4BIT
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


module Multiplier4Bit (
    input [3:0] A, 
    input [3:0] B,  
    output [7:0] P 
);

    assign P = A * B; 

endmodule

