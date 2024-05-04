`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2024 05:39:32 PM
// Design Name: 
// Module Name: Instruction_Memory
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


//module Instruction_Memory(Inst_Address, Instruction);
  
//  input [63:0] Inst_Address;
//  output [31:0] Instruction;
  
//  reg[7:0]Array[63:0];
  
//  initial 
//    begin
//        Array[0] = 8'b00010011;
//        Array[1] = 8'b00000110;
//        Array[2] = 8'b00010000;
//        Array[3] = 8'b00000000; //addi x12, x0, 1 //1
////        Array[4] = 8'b01100011;
////        Array[5] = 8'b00001000;
////        Array[6] = 8'b00110110;
////        Array[7] = 8'b00000100; //beq x12, x3, exit //2   
/////////////////////////////////////////////////////////////////////////////////////////////////
//        Array[4] = 8'b00010011;
//        Array[5] = 8'b00000110;
//        Array[6] = 8'bb00010000;
//        Array[7] = 8'b0000000000000000; //addi x12, x0, 1 //1
/////////////////////////////////////////////////////////////////////////////////////////////////
 
//        Array[8] = 8'b10110011;
//        Array[9] = 8'b00000110;
//        Array[10] = 8'b11000000;
//        Array[11] = 8'b00000000; //add x13, x0, x12 //4
//        Array[12] = 8'b00010011;
//        Array[13] = 8'b10010111;
//        Array[14] = 8'b00110110;
//        Array[15] = 8'b00000000; //slli x14, x13, 3*  (not sure if this will be needed) //5
//        Array[16] = 8'b00110011; 
//        Array[17] = 8'b00000111;
//        Array[18] = 8'b01000111;
//        Array[19] = 8'b00000000; //add x14, x14, x4 //6 
//        Array[20] = 8'b10000011;
//        Array[21] = 8'b00110111;
//        Array[22] = 8'b00000111;
//        Array[23] = 8'b00000000; //ld* x15, 0(x14) //7
////        Array[24] = 8'b01100011;
////        Array[25] = 8'b10001010;
////        Array[26] = 8'b00000110;
////        Array[27] = 8'b00000010; //beq x13, x0, end_loop2 //8
///////////////////////////////////////////////////////////////////////////////////////////////////////////
//        Array[24] = 8'b00110011;
//        Array[25] = 8'b00000111;
//        Array[26] = 8'b01000111;
//        Array[27] = 8'b00000000; //add x14, x14, x4 //6 
///////////////////////////////////////////////////////////////////////////////////////////////////////////
//        Array[28] = 8'b00010011;
//        Array[29] = 8'b10001000;
//        Array[30] = 8'b11110110;
//        Array[31] = 8'b11111111; //addi x16, x13, -1 # (x16 = j - 1) //9
//        Array[32] = 8'b10010011;
//        Array[33] = 8'b00011000;
//        Array[34] = 8'b00101000;
//        Array[35] = 8'b00000000; //slli x17, x16, 3* (not sure if this will be needed) //10    
//        Array[36] = 8'b10110011;
//        Array[37] = 8'b10001000;
//        Array[38] = 8'b01001000;
//        Array[39] = 8'b00000000; //add x17, x17, x4  # add array base address //11
        
//        Array[40] = 8'b00000011;
//        Array[41] = 8'b10111001;
//        Array[42] = 8'b00001000;
//        Array[43] = 8'b00000000; //ld* x18, 0(x17)  # load A[j-1] //12
                
////        Array[44] = 8'b01100011;
////        Array[45] = 8'b01000000;
////        Array[46] = 8'b11111001;
////        Array[47] = 8'b00000010; //blt x18, x15, end_loop2  # if A[j-1] <= A[j], exit loop2 //13

/////////////////////////////////////////////////////////////////////////////////////////////////////////
//        Array[44] = 8'b00110011;
//        Array[45] = 8'b00000111;
//        Array[46] = 8'b01000111;
//        Array[47] = 8'b00000000; //add x14, x14, x4 //6 
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//        Array[48] = 8'b00100011;
//        Array[49] = 8'b00110000;
//        Array[50] = 8'b00100111;
//        Array[51] = 8'b00000001; //sd* x18, 0(x14)  # store A[j-1] at A[j] //14
//        Array[52] = 8'b00100011;
//        Array[53] = 8'b10110000;
//        Array[54] = 8'b11111000;
//        Array[55] = 8'b00000000; //sd* x15, 0(x17)  # store A[j] at A[j-1] //15
//        Array[56] = 8'b10010011;
//        Array[57] = 8'b10000110;
//        Array[58] = 8'b11110110;
//        Array[59] = 8'b11111111; //addi x13, x13, -1  # j = j - 1 //16
//        Array[60] = 8'b00010011;
//        Array[61] = 8'b10010111;
//        Array[62] = 8'b00110110;
//        Array[63] = 8'b00000000; //slli x14, x13, 3*  # multiply by 4 to get offset //17
//    end
 
 
//  assign Instruction[7:0] = Array[Inst_Address + 0];
//  assign Instruction[15:8] = Array[Inst_Address + 1];
//  assign Instruction[23:16] = Array[Inst_Address + 2];
//  assign Instruction[31:24] = Array[Inst_Address + 3];
  
//endmodule



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////



module Instruction_Memory(Inst_Address, Instruction);
  
  input [63:0] Inst_Address;
  output [31:0] Instruction;
  
  reg[7:0]Array[63:0];
  
  initial 
    begin   
        Array[0]  = 8'b00010011;
        Array[1]  = 8'b00000000;
        Array[2]  = 8'b00010000;
        Array[3]  = 8'b00000000; 
        Array[4]  = 8'b00010011;
        Array[5]  = 8'b00000000;
        Array[6]  = 8'b00010000;
        Array[7]  = 8'b00000000;   
        Array[8]  = 8'b00010011;
        Array[9]  = 8'b00000000;
        Array[10] = 8'b00010000;
        Array[11] = 8'b00000000; 
        Array[12] = 8'b00010011;
        Array[13] = 8'b00000000;
        Array[14] = 8'b00010000;
        Array[15] = 8'b00000000; 
        Array[16] = 8'b00010011; 
        Array[17] = 8'b00000000;
        Array[18] = 8'b00010000;
        Array[19] = 8'b00000000; 
        Array[20] = 8'b00010011;
        Array[21] = 8'b00000000;
        Array[22] = 8'b00010000;
        Array[23] = 8'b00000000; 
        Array[24] = 8'b00010011;
        Array[25] = 8'b00000000;
        Array[26] = 8'b00010000;
        Array[27] = 8'b00000000; 
        Array[28] = 8'b00010011;
        Array[29] = 8'b00000000;
        Array[30] = 8'b00010000;
        Array[31] = 8'b00000000; 
        Array[32] = 8'b00010011;
        Array[33] = 8'b00000000;
        Array[34] = 8'b00010000;
        Array[35] = 8'b00000000; 
        Array[36] = 8'b00010011;
        Array[37] = 8'b00000000;
        Array[38] = 8'b00010000;
        Array[39] = 8'b00000000; 
        Array[40] = 8'b00010011;
        Array[41] = 8'b00000000;
        Array[42] = 8'b00010000;
        Array[43] = 8'b00000000; 
        Array[44] = 8'b00010011;
        Array[45] = 8'b00000000;
        Array[46] = 8'b00010000;
        Array[47] = 8'b00000000; 
        Array[48] = 8'b00010011;
        Array[49] = 8'b00000000;
        Array[50] = 8'b00010000;
        Array[51] = 8'b00000000; 
        Array[52] = 8'b00010011;
        Array[53] = 8'b00000000;
        Array[54] = 8'b00010000;
        Array[55] = 8'b00000000; 
        Array[56] = 8'b00010011;
        Array[57] = 8'b00000000;
        Array[58] = 8'b00010000;
        Array[59] = 8'b00000000; 
        Array[60] = 8'b00010011;
        Array[61] = 8'b00000000;
        Array[62] = 8'b00010000;
        Array[63] = 8'b00000000; 
    end
  
  assign Instruction[7:0] = Array[Inst_Address + 0];
  assign Instruction[15:8] = Array[Inst_Address + 1];
  assign Instruction[23:16] = Array[Inst_Address + 2];
  assign Instruction[31:24] = Array[Inst_Address + 3];
  
endmodule

////////////////////////////////////////////////////////////////////////////

