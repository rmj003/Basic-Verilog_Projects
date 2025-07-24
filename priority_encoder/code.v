`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2024 21:55:59
// Design Name: 
// Module Name: priority_encoder
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


module priority_encoder(in,code);
  input[7:0]in;
  output reg [2:0]code;
  always @(*)
    begin
         if(in[0]) code=3'd0;
         else if (in[1]) code=3'd1;
         else if (in[2]) code=3'd2;
         else if (in[3]) code=3'd3;
         else if (in[4]) code=3'd4;
         else if (in[5]) code=3'd5;
         else if (in[6]) code=3'd6;
         else if (in[7]) code=3'd7;
         else            code=3'bxxx;
    end
endmodule



