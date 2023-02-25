`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 02:29:19
// Design Name: 
// Module Name: top_moore
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

module top_moore(clk,reset,w,out,clock_out);
  input clk,reset,w;
  output out,clock_out;
  wire slowed_clk;// clock_out -> the clock which is slowed to have a period of 1s which can be seen on fpga board
  
  clkdiv cld(.clk(clk),.slowed_clk(slowed_clk));
  top_moore_0011 moore_0011(.clk(slowed_clk),.reset(reset),.w(w),.out(out),.clk_out(clock_out));
  
endmodule
  
module top_moore_0011(clk,reset,w,out,clk_out);
  input clk,reset,w; // w is input we are giving the sequence bit by bit
  output reg out; // detects the sequence
  output clk_out;
  reg [2:0] y,Y; // y->present state, Y->next state
  parameter [2:0] S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100; // defining the states
  assign clk_out = clk;
  
  always@(posedge clk,negedge reset)
    begin
      if(reset==0) // active-low reset
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
            end
          else
            begin
              Y<=S0; // otherwise future state would be this
            end
        end
      if(y==S1)
        begin
          if(w==0)
            begin
              Y<=S2;
            end
          else
            begin
              Y<=S0;
            end
        end
      if(y==S2)
        begin
          if(w==0)
            begin
              Y<=S2;
            end
          else
            begin
              Y<=S3;
            end
        end
      if(y==S3)
        begin
          if(w==0)
            begin
              Y<=S1;
            end
          else
            begin
              Y<=S4;
            end
        end
      if(y==S4)
        begin
          if(w==0)
            begin
              Y<=S1;
            end
          else
            begin
              Y<=S0;
            end
        end
    end
  
  always@(y)
    begin
      if(y==S4)
        begin
          out = 1;
        end
      else
        begin
          out = 0;
        end
    end
  
endmodule
