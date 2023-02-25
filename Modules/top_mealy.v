`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 02:38:58
// Design Name: 
// Module Name: top_mealy
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
module top_mealy(clk,reset,w,out,clock_out);
    input w,clk,reset;                           
    output out,clock_out; // clock_out -> the clock which is slowed to have a period of 1s which can be seen on fpga board
    wire slowed_clk;
    
    clkdiv cld(.clk(clk), .slowed_clk(slowed_clk));                      
    top_mealy_0011 melay_0011(.clk(slowed_clk), .reset(reset), .w(w), .out(out), .clk_out(clock_out));     
endmodule


module top_mealy_0011(clk,reset,w,out,clk_out);
  input clk,reset,w; // w is input we are giving the sequence bit by bit
  output clk_out;
  output reg out;// detects the sequence
  reg [1:0]y,Y;// y->present state, Y->next state
  parameter [1:0] S0 = 2'b00,S1 = 2'b01,S2 = 2'b10,S3 = 2'b11;// defining the states
  assign clk_out = clk;
  
  always@(posedge clk, negedge reset)
    begin
      if(reset==0) //active-low reset
        begin
          y<=0;
        end
      else
        begin
          y<=Y; // next state of previous cycle is transferred to present state
        end
    end
  
  always@(y,w)
    begin
      if(y==S0) // present state
        begin
          if(w==0) // input condition
            begin
              Y<=S1; // future state would be this
              out = 0; // we can see output is dependent on present state and input
            end
          else
            begin
              Y<=S0;
              out = 0; // we can see output is dependent on present state and input
            end
        end
      if(y==S1)
        begin
          if(w==0)
            begin
              Y<=S2;
              out = 0; 
            end
          else
            begin
              Y<=S0;
              out = 0;
            end
        end
      if(y==S2)
        begin
          if(w==0)
            begin
              Y<=S2;
              out = 0; 
            end
          else
            begin
              Y<=S3;
              out = 0;
            end
        end
      if(y==S3)
        begin
          if(w==0)
            begin
              Y<=S1;
              out = 0; 
            end
          else
            begin
              Y<=S0;
              out = 1;
            end
        end
    end
  
endmodule


  