`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 15:31:54
// Design Name: 
// Module Name: top_BA_4x4_Multiplier
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


// Code your design here
module top_BA_4x4_Multiplier(A,B,OUT);
  input [3:0]A; // multiplicand
  input [3:0]B; // multiplier
  output [7:0]OUT; // output 
  wire P00,P10,P20,P30; // partial products
  wire P01,P11,P21,P31;
  wire P02,P12,P22,P32;
  wire P03,P13,P23,P33;
  
  wire c1_0,c1_1,c1_2,c1_3;
  wire sum1_1,sum1_2,sum1_3;
  wire c2_0,c2_1,c2_2,c2_3;
  wire sum2_1,sum2_2,sum2_3;
  wire c3_0,c3_1,c3_2;  
  
  and(P00,A[0],B[0]);// partial products (1-bit mutlipliction with the help of and gates)
  and(P10,A[1],B[0]);
  and(P20,A[2],B[0]);
  and(P30,A[3],B[0]);
  
  and(P01,A[0],B[1]);
  and(P11,A[1],B[1]);
  and(P21,A[2],B[1]);
  and(P31,A[3],B[1]);
  
  and(P02,A[0],B[2]);
  and(P12,A[1],B[2]);
  and(P22,A[2],B[2]);
  and(P32,A[3],B[2]);
  
  and(P03,A[0],B[3]);
  and(P13,A[1],B[3]);
  and(P23,A[2],B[3]);
  and(P33,A[3],B[3]);   
  
  and(OUT[0],A[0],B[0]);
  
  // first row of adders
  half_adder HA_0(.H_A(P10),.H_B(P01),.H_Carry(c1_0),.H_Sum(OUT[1]));
  full_adder FA_0(.A(P20),.B(P11),.Cin(c1_0),.Cout(c1_1),.Sum(sum1_1));
  full_adder FA_1(.A(P30),.B(P21),.Cin(c1_1),.Cout(c1_2),.Sum(sum1_2));   
  half_adder HA_1(.H_A(P31),.H_B(c1_2),.H_Carry(c1_3),.H_Sum(sum1_3));
  
  // second row of adders
  half_adder HA_2(.H_A(sum1_1),.H_B(P02),.H_Carry(c2_0),.H_Sum(OUT[2]));
  full_adder FA_2(.A(sum1_2),.B(P12),.Cin(c2_0),.Cout(c2_1),.Sum(sum2_1));
  full_adder FA_3(.A(sum1_3),.B(P22),.Cin(c2_1),.Cout(c2_2),.Sum(sum2_2));
  full_adder FA_4(.A(c1_3),.B(P32),.Cin(c2_2),.Cout(c2_3),.Sum(sum2_3));
  
  //third row of adders
  half_adder HA_3(.H_A(sum2_1),.H_B(P03),.H_Carry(c3_0),.H_Sum(OUT[3])); 
  full_adder FA_5(.A(sum2_2),.B(P13),.Cin(c3_0),.Cout(c3_1),.Sum(OUT[4]));
  full_adder FA_6(.A(sum2_3),.B(P23),.Cin(c3_1),.Cout(c3_2),.Sum(OUT[5]));
  full_adder FA_7(.A(c2_3),.B(P33),.Cin(c3_2),.Cout(OUT[7]),.Sum(OUT[6]));
  
endmodule




