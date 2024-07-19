`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2024 21:32:06
// Design Name: 
// Module Name: ripple_carry_adder
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


module ripple_carry_adder(sum,carry_out,a,b,carry_in

    );
    parameter N=8;
    input [N-1:0]a,b;
    input carry_in;
    output [N-1:0]sum;
    output carry_out;
    wire[N:0]carry;
    assign carry_out=carry[N];
    assign carry[0]=carry_in;
    genvar i;
    generate for(i=0;i<N;i=i+1)
    begin: fa_loop
        wire t1,t2,t3;
        xor G1(t1,a[i],b[i]),G2(sum[i],t1,carry[i]);
        and G3(t2,a[i],b[i]),G4(t3,t1,carry[i]);
        or G5(carry[i+1],t2,t3);
     end
     endgenerate
endmodule
