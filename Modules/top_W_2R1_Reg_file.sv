`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2023 12:49:22
// Design Name: 
// Module Name: top_W_2R1_Reg_file
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


module top_W_2R1_Reg_file(clk, WE, RW, D_IN, R1, Q1, R2, Q2);
  input logic clk,WE; // clk and write enable 
  parameter M = 8; //  no. of registers
  parameter N = 8; // data length in bits
  input logic [N-1:0]D_IN; // write data
  input logic [$clog2(M)-1:0]RW; // write address
  input logic [$clog2(M)-1:0]R1; // read address 1
  input logic [$clog2(M)-1:0]R2; // read address 2
  output logic[N-1:0]Q1; // output data 1 
  output logic[N-1:0]Q2; // output data 2 
  logic [N-1:0]Registers[M-1:0]; // data which has M elements and every one has a size of N  
  
  always_ff@(posedge clk) begin
  if(WE)
    begin
      Registers[RW] = D_IN; //feeding the data to the given address by the given data
    end
  end 
  
  assign Q1 = Registers[R1]; // reading the data from the given address
  assign Q2 = Registers[R2]; 
  
endmodule
