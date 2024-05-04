`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2024 04:28:12 PM
// Design Name: 
// Module Name: Instruction_memory
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


module Instruction_memory(Inst_Address, Instruction);
  
  input [63:0] Inst_Address;
  output [31:0] Instruction;
  
  reg[7:0]Array[11:0];
  
  initial 
    begin
        
      {Array[3], Array[2], Array[1], Array[0]} = 32'h003100b3; 
      //add x1 x2 x3
      {Array[7], Array[6], Array[5], Array[4]} = 32'h00308133; 
      //add x2 x1 x3
      {Array[11], Array[10], Array[9], Array[8]} = 32'h002081b3; 
      //addi x3 x1 x2
      
    end
 
 
  assign Instruction[7:0] = Array[Inst_Address + 0];
  assign Instruction[15:8] = Array[Inst_Address + 1];
  assign Instruction[23:16] = Array[Inst_Address + 2];
  assign Instruction[31:24] = Array[Inst_Address + 3];
  
endmodule

