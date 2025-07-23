//VERSION 1: code for implementing 16x1 multiplexer(BEHAVIOURAL 16X1 Mux)
module mux16x1(out,sel,in);
input [15:0]in; input [3:0]sel;
output out;
assign out=in[sel];
endmodule

//VERSION 4: code for implementing 16x1 mux by instantiating 2x1 mux(STRUCTURAL 2x1 Mux)
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
wire [1:0]t;
mux2x1 m0(t[0],sel[0],in[1:0]);
mux2x1 m1(t[1],sel[0],in[3:2]);
mux2x1 m2(out,sel[1],t);
endmodule

module mux2x1(out,sel,in);
input [1:0]in;input sel;
output out;
wire t0,t1,t2;
not a1(t0,sel);
and a2(t1,in[0],t0);
and a3(t2,in[1],sel);
or a4(out,t1,t2);
endmodule

