`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 02:08:21
// Design Name: 
// Module Name: top_priority_encoder0
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


module top_priority_encoder0(A,O,en);
  input [7:0]A;
  input en;
  output [2:0]O;
  wire w1,w2,w3,w4,w5,w6,w7,w8;
  wire o_0,o_1,o_2;
  
  /*after simplifying the boolean equations for [2:0]O we finally get these equations and we created them with using 'and','or' and 'not' gates.*/
  
  or(o_2,A[7],A[6],A[5],A[4]);
  and(O[2],o_2,en); 
  
  and(w1,~A[7],~A[6],~A[5],~A[4]);
  or(w2,A[3],A[2]);
  and(w3,w1,w2);
  or(o_1,A[7],A[6],w3);
  and(O[1],o_1,en);
  
  and(w4,~A[6],A[5]);
  and(w5,~A[7],~A[6],~A[5],~A[4]);
  and(w6,~A[2],A[1]);
  or(w7,A[3],w6);
  and(w8,w5,w7);
  or(o_0,A[7],w4,w8);
  and(O[0],o_0,en);
  
endmodule