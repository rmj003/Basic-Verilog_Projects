//VERSION 1: code for implementing 16x1 multiplexer(BEHAVIOURAL 16X1 Mux)
module mux16x1(out,sel,in);
input [15:0]in; input [3:0]sel;
output out;
assign out=in[sel];
endmodule
