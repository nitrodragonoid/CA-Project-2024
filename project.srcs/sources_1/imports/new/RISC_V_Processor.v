`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 01:48:21 PM
// Design Name: 
// Module Name: RISC_V_Processor
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


module RISC_V_Processor(
input clk, reset,
output [63:0] PC_In , 
output[31:0] Instruction,
output [4:0] rs1, rs2, rd,
output [63:0] ReadData1, ReadData2, WriteData,
imm_data, 
result,
ReadData, 
output Branch, zero, ALUSrc, MemRead, MemtoReg, MemWrite, RegWrite,
output[1:0] ALUOp,
output [6:0] opcode,
output [2:0] funct3,
output [6:0] funct7,
output [3:0] Operation,
output [63:0] muxOut,

output [63:0] element_0,
element_1,
element_2,
element_3,
element_4,
element_5,
element_6, //array elements
ith_address, //address of array[i], array[j] 
jth_address,
i,
j,
array_j,
array_j_1 
);
    
    //wire [63:0] PC_In;
    wire [63:0] PC_Out; 
    //wire [31:0] Instruction;
    wire [63:0] adderOut, adder2Out;
    //wire [63:0] WriteData;
    //wire [63:0] ReadData1, ReadData2;
    //wire [63:0] imm_data;
    
    //wire [63:0] result;
    //wire [63:0] ReadData;
   
    //wire []
    
    
    Program_Counter PC(clk, reset, PC_In, PC_Out);
    
    Instruction_Memory im(PC_Out, Instruction);
    
    reg [63:0] offset = 63'b100;
    Adder a1(PC_Out, offset, adderOut);
    
    InsParser ip(Instruction, opcode, rd, funct3, rs1, rs2, funct7);
    
    Control_Unit cu(opcode, ALUOp, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite);
    
    ImmGen ig(Instruction, imm_data);
    
    Adder a2(PC_Out, imm_data<<1, adder2Out); //imm_data * 2
    
    ALU_Control ac(ALUOp, {Instruction[30], funct3}, Operation);
    
    registerFile rf(WriteData, rs1, rs2, rd, RegWrite, clk, reset, ReadData1, ReadData2);
//    ith_address, //address of array[i], array[j] 
//    jth_address,
//    i,j,
//    array_j, array_j_1);
    
    Mux m1(ReadData2, imm_data, ALUSrc, muxOut);
    
    ALU_64_bit alu64(ReadData1, muxOut, Operation, funct3, zero, result);
    
    Mux m2(adderOut, adder2Out, (Branch && zero), PC_In); //
    
    Data_Memory dm(result, ReadData2, clk, MemWrite, MemRead, ReadData);
//    element_0,
//    element_1,
//    element_2,
//    element_3,
//    element_4,
//    element_5,
//    element_6);
    
    Mux m3(result, ReadData, MemtoReg, WriteData);
    
endmodule
