`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2025 00:39:29
// Design Name: 
// Module Name: Sequence_10011_Mealy
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


module Sequence_10011_Mealy(Y, CLK, RST, I);

input I, RST, CLK;
output reg Y;

reg[2:0] State;

parameter[2:0] S=0, S1=1, S10=2, S100 = 3, S1001=4;

always @(posedge CLK)

if(RST)begin
    Y <= 0;
    State <= S;
end

else

case (State)

    S: begin
             if(I) begin
             State <= S1;
             Y <= 0;
             end
             else begin
             State <= S;
             Y <= 0;
             end            
       end
       
     S1: begin
             if(I) begin
             State <= S1;
             Y <= 0;
             end
             else begin
             State <= S10;
             Y <= 0;
             end            
       end    
       
       
    S10: begin
             if(I) begin
             State <= S1;
             Y <= 0;
             end
             else begin
             State <= S100;
             Y <= 0;
             end            
       end    
       
    S100: begin
             if(I) begin
             State <= S1001;
             Y <= 0;
             end
             else begin
             State <= S;
             Y <= 0;
             end            
       end            
       
    S1001: begin
             if(I) begin
             State <= S1;
             Y <= 1;
             end
             else begin
             State <= S10;
             Y <= 0;
             end            
       end
       
      default: State <= S;
       
endcase



endmodule
