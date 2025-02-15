`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2025 14:22:15
// Design Name: 
// Module Name: COUNTER_4_BIT
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


module COUNTER_4_BIT(clk,reset, count);

input clk, reset;
output reg[3:0] count;


always@(posedge clk)begin

if(reset==1)
count <= 0;
else if(count == 15)
count <= 0;
else
count <= count + 1;

end

endmodule
