`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2024 22:37:15
// Design Name: 
// Module Name: up_down_counter
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


module up_down_counter(count,clr,ld,clk,mode,din);
    input clr,clk,mode,ld;
    input [7:0]din;
    output reg[7:0]count;
    always @(posedge clk)
        begin
            if(ld) count<=din;
            else if(clr) count<=0;
            else if(mode) count<=count+1;
            else          count<=count-1;
        end
endmodule
