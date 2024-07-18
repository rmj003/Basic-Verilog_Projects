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


//Sample testbench
module up_down_counter_tb;
    reg clr,mode,ld,clk; reg [7:0]din;
    wire [7:0]count;
    up_down_counter m1(count,clr,ld,clk,mode,din);
    always #5 clk=~clk;
    initial
        begin
            clk=1;
            #2 clr=1'b1;ld=1'b0;mode=1'b0;din=8'b0;
            #5 clr=1'b0;ld=1'b1;din=8'd100;
            #10 ld=1'b0;
            #20 ld=1'b0;mode=1'b1;
            #30 $finish;
        end    
endmodule
