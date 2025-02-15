`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2025 16:07:35
// Design Name: 
// Module Name: SHIFTER
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


module SHIFTER(Q,D,M);

output reg[3:0] Q;
input[2:0] M;
input[3:0] D;

always@(M) begin

case(M)
 0: Q <= D;
 
 1: begin
    Q[3]<=Q[2];
    Q[2]<=Q[1];
    Q[1]<=Q[0]; 
    Q[0] <= Q[3];// cyclic left
    end
 
 2: begin
    Q[0]<=Q[1];
    Q[1]<=Q[2];
    Q[2]<=Q[3]; 
    Q[3] <= Q[0];// cyclic right
    end    
    
 
 3: begin
    Q <= Q;// NO SHIFT
    end
  
endcase

end

endmodule
