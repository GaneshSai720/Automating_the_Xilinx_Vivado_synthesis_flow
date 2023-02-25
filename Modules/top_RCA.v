`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.01.2023 01:42:08
// Design Name: 
// Module Name: top_RCA
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

module top_RCA(a,b,cin,sum,carry);
  parameter N = 8; // size of the RCA is of 8 bits
  input [N-1:0]a; // a7,a6,..a1,a0
  input [N-1:0]b; // b7,b6,..b1,b0
  input cin; // input carry we will be giving to adder
  output [N-1:0]sum;
  output carry;
  wire [N:0]cout; 
  
  assign cout[0] = cin; // cin is taken as zeroth bit of cout to push it through the loop
  genvar i;
  
  generate
    
    for(i=0;i<N;i=i+1) // this loop creates a series of N adders
      begin
        full_adder FA(.A(a[i]),.B(b[i]),.Cin(cout[i]),.Sum(sum[i]),.Cout(cout[i+1])); // We are initiating the full adder and mapping it with inputs, such a way it has the input carry which was taken from the output carry of previous fa, and other inputs A and B are each bit of a and b respectively.
      end
    
  endgenerate
  
  assign carry = cout[N]; // last bit of cout or cout of last fa in design is considered as carry of entire addition

endmodule
