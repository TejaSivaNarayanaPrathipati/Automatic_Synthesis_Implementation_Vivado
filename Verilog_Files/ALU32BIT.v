`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.02.2025 18:46:04
// Design Name: 
// Module Name: ALU32BIT
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


module ALU32Bit (
    input [31:0] A,     
    input [31:0] B,     
    input [2:0] ALUOp,  
    output reg [31:0] Result,  
    output reg CarryOut,       
    output reg Zero            
);

    always @(*) begin
        case (ALUOp)
            3'b000: {CarryOut, Result} = A + B;   
            3'b001: {CarryOut, Result} = A - B;   
            3'b010: Result = A & B;               
            3'b011: Result = A | B;               
            3'b100: Result = A ^ B;               
            3'b101: Result = A << 1;              
            3'b110: Result = A >> 1;              
            3'b111: Result = ~A;                  
            default: Result = 32'b0;
        endcase
        
   
        Zero = (Result == 32'b0) ? 1'b1 : 1'b0;
    end

endmodule

