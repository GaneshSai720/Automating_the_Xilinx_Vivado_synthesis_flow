`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.02.2023 00:37:18
// Design Name: 
// Module Name: full_adder
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


module full_adder(A,B,Cin,Sum,Cout);
  input A,B,Cin; 
  output Sum,Cout;
  
  wire sum_0; // gets the sum of first half adder which has inputs A and B
  wire cout_0; // gets the carry of first half adder which has inputs A and B
  wire cout_1; // gets the carry of second half adder which has inputs sum of A and B(i.e., A^B) and Cin
  
  half_adder HA_0(.H_A(A),.H_B(B),.H_Sum(sum_0),.H_Carry(cout_0));
  half_adder HA_1(.H_A(sum_0),.H_B(Cin),.H_Sum(Sum),.H_Carry(cout_1)); /* half adders attached in a way such that the data gets into those wires as mentioned in comments */
  
  or(Cout, cout_0, cout_1); /* Cout is the carry of full-adder which can be get by keeping the or gate to both half adder carry's.*/ 
  
endmodule 
