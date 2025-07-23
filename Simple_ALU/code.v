`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2024 11:56:37
// Design Name: 
// Module Name: alu
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


module alu(f,a,b,mode,op);
    input mode;
    input [1:0]op;
    input[7:0]a,b;
    output reg [7:0]f;
    parameter ADD=2'b00,SUB=2'B01,DIV=2'b10,MUL=2'b11;
    parameter LAND=2'b00,LOR=2'b01,LXOR=2'b10,LNOT=2'b11;
    always @(*)
    begin
    if (mode)
      case(op)
       ADD: f=a+b;
       SUB: f=a-b;
       DIV: f=a/b;
       MUL: f=a*b;
      endcase
    else
      case(op)
      LAND:f=a&b;
      LOR:f=a|b;
      LXOR:f=a^b;
      LNOT:f=~a;
      endcase
   end
endmodule
