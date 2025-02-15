`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2025 01:01:00
// Design Name: 
// Module Name: Sequence_10011_Moore
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


module Sequence_10011_Moore(Y, CLK, RST, I);

input I, RST, CLK;
output reg Y;

reg[2:0] State;

parameter[2:0] S=0, S1=1, S10=2, S100 = 3, S1001=4, S10011=5;

always @(posedge CLK)

if(RST)begin
    Y <= 0;
    State <= S;
end

else

case (State)

    S: begin
             Y <= 0;
             if(I) begin
             State <= S1;
             end
             else begin
             State <= S;
             end            
       end
       
     S1: begin
             Y <= 0;
             if(I) begin
             State <= S1; 
             end
             else begin
             State <= S10;
             end            
       end    
       
       
    S10: begin
             Y <= 0;
             if(I) begin
             State <= S1;
             end
             else begin
             State <= S100;
             end            
       end    
       
    S100: begin
             Y <= 0;
             if(I) begin
             State <= S1001;
             end
             else begin
             State <= S;
             end            
       end            
       
    S1001: begin
             Y <= 0;
             if(I) begin
             State <= S10011;
             end
             else begin
             State <= S10;
             end            
       end
       
     S10011: begin
             Y <= 1;
             if(I) begin
             State <= S1;
             end
             else begin
             State <= S10;
             end            
       end
       
      default: State <= S;
       
endcase


endmodule
