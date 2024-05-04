`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2024 04:47:32 PM
// Design Name: 
// Module Name: ALU_64_bit
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

module ALU_64_bit(a, b, AluOp,funct3, zero, result);
  input [63:0] a;
  input [63:0] b;
  input [3:0] AluOp;
  input [2:0] funct3;
  output reg zero;
  output reg [63:0] result;
  
  always @ (*)
    begin
      case(AluOp)
        4'b0000: result = a & b;
        4'b0001: result = a | b;
        4'b0010: result = a + b;
        4'b0110: result = a - b;
        4'b1100: result = ~(a | b);
        4'b1101: result = a*(2**b);
      endcase
      
      case(funct3)
        3'b000:
          begin
            if (result == 64'b0)
              zero = 1;
            else
              zero = 0;
          end
        3'b100:
          begin
            if (b < a)
              zero = 1;
            else
              zero = 0;
          end
        
      endcase
        
    end
  
endmodule 