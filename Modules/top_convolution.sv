`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2023 15:54:57
// Design Name: 
// Module Name: top_module
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

module top_convolution#(parameter int IMG_SIZE = 3)(input clk, input [7:0]in[2:0], input signed [7:0]FILTER[2:0][2:0], output reg signed [8:0]OUT[IMG_SIZE-3:0][IMG_SIZE-3:0]);
    logic [7:0]R_IN[IMG_SIZE-1:0][IMG_SIZE-1:0];
    logic signed [8:0]R_OUT[IMG_SIZE-3:0][IMG_SIZE-3:0];
    logic [7:0]G_IN[IMG_SIZE-1:0][IMG_SIZE-1:0];
    logic signed [8:0]G_OUT[IMG_SIZE-3:0][IMG_SIZE-3:0];
    logic [7:0]B_IN[IMG_SIZE-1:0][IMG_SIZE-1:0];
    logic signed [8:0]B_OUT[IMG_SIZE-3:0][IMG_SIZE-3:0];
    
    integer counter;
    integer row,col;
    integer signed R_temp,G_temp,B_temp;
    
    
    assign row = counter/IMG_SIZE;
    assign col = counter%IMG_SIZE;
    
    always@(posedge clk)
        begin
            if(counter < IMG_SIZE*IMG_SIZE)
                begin
                    R_IN[row][col] = in[2];
                    G_IN[row][col] = in[1];
                    B_IN[row][col] = in[0];
                    counter++;
                end
            else
                begin
                    counter = 0;
                end
        end
        
    always_ff@(posedge clk)
    begin
        if(row>=2 && row<=IMG_SIZE-1)
        begin
            if(col>=2 && col<=IMG_SIZE-1)
                begin
                    R_temp = 0;                        
                    for(int k=0;k<3;k++)
                        begin
                            for(int l=0;l<3;l++)
                                begin
                                    R_temp += R_IN[row-2+k][col-2+l]*FILTER[k][l]; 
                                end 
                        end
                    R_OUT[row-2][col-2] = R_temp;  
                end
        end
    end  
    
    
    always_ff@(posedge clk)
    begin
        if(row>=2 && row<=IMG_SIZE-1)
        begin
            if(col>=2 && col<=IMG_SIZE-1)
                begin
                    G_temp = 0;                        
                    for(int k=0;k<3;k++)
                        begin
                            for(int l=0;l<3;l++)
                                begin
                                    G_temp += G_IN[row-2+k][col-2+l]*FILTER[k][l]; 
                                end 
                        end
                    G_OUT[row-2][col-2] = G_temp;  
                end
        end
    end  
    
    
    always_ff@(posedge clk)
    begin
        if(row>=2 && row<=IMG_SIZE-1)
        begin
            if(col>=2 && col<=IMG_SIZE-1)
                begin
                    B_temp = 0;                        
                    for(int k=0;k<3;k++)
                        begin
                            for(int l=0;l<3;l++)
                                begin
                                    B_temp += B_IN[row-2+k][col-2+l]*FILTER[k][l]; 
                                end 
                        end
                    B_OUT[row-2][col-2] = B_temp;  
                end
        end
    end  
    
    always@(posedge clk)
        begin
            if(row>=2 && row<=IMG_SIZE-1)
                begin
                    if(col>=2 && col<=IMG_SIZE-1)
                        begin
                            OUT[row-2][col-2] = R_OUT[row-2][col-2] + G_OUT[row-2][col-2] + B_OUT[row-2][col-2];
                        end
                end        
        end
            
endmodule 



