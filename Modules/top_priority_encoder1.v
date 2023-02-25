`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 02:23:31
// Design Name: 
// Module Name: top_priority_encoder1
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


module top_priority_encoder1(A,O,en);
  input [7:0]A;
  input en;
  output reg [2:0]O;
  
  always@(A,en)
    begin
      if(en==1)
        begin
          casex(A) // using casex instead of case so it consider x and z values as don't care.
            8'b1xxxxxxx: O=3'b111; /*we get the output O while seeing is there any bit from MSB side is 1 if it is, then we are assigning O*/
            8'b01xxxxxx: O=3'b110;
            8'b001xxxxx: O=3'b101;
            8'b0001xxxx: O=3'b100; 
            8'b00001xxx: O=3'b011;
            8'b000001xx: O=3'b010;
            8'b0000001x: O=3'b001;
            8'b00000001: O=3'b000; 
            default: O=3'bzzz; 
          endcase
        end
      else
        begin
          O = 3'bzzz;
        end
    end

endmodule
