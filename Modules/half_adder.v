`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.02.2023 00:35:56
// Design Name: 
// Module Name: half_adder
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


module half_adder(H_A,H_B,H_Sum,H_Carry);
  input H_A,H_B; // half adder's inputs H_A,H_B
  output H_Sum,H_Carry; // sum and carry are H_Sum,H_Carry respectively
  
  xor(H_Sum,H_A,H_B); // sum = A^B
  and(H_Carry,H_A,H_B); // carry = AB
  
endmodule
