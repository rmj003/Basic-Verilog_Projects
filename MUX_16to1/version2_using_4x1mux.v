//VERSION 2: code for implementing 16x1 mux by instantiating 4x1 mux(BEHAVIOURAL 4x1 Mux)
module mux16x1(out,sel,in);
input [15:0]in; input [3:0]sel;
output out;
wire [3:0]t;
mux4x1 m0(t[0],sel[1:0],in[3:0]);
mux4x1 m1(t[1],sel[1:0],in[7:4]);
mux4x1 m2(t[2],sel[1:0],in[11:8]);
mux4x1 m3(t[3],sel[1:0],in[15:12]);
mux4x1 m4(out,sel[3:2],t);
endmodule

module mux4x1(out,sel,in);
input [3:0]in; input [1:0]sel;
output out;
assign out=in[sel];
endmodule
