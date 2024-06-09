//Testbench for carry lookahead Adder
module adder16_tb;
reg [15:0]x,y;
wire [15:0]z;
wire s,zr,c,p,ov;
adder16bit a1(.x(x),.y(y),.z(z),.sign(s),.zero(zr),.carry(c),.parity(p),.overflow(ov));
initial
 begin
  $dumpfile("adder.vcd");
  $dumpvars(0,adder16_tb);
  $monitor($time,"x=%h,y=%h,z=%h,s=%b,zr=%b,c=%b,p=%b,ov=%b",x,y,z,s,zr,c,p,ov);
  #2 x=16'h8fff;y=16'h8000;
  #5 x=16'hfafe;y=16'h0002;
  #5 x=16'haaaa;y=16'h5555;
  #5 $finish;
end
endmodule

//Code for implementing 16bit adder using four 4bit Carry lookahead Adder
module adder16bit(x,y,z,sign,zero,carry,parity,overflow);
input [15:0]x,y;output [15:0]z;
output sign,zero,carry,parity,overflow;
wire [2:0]t;
carry_lookaheadadder_4bit a0(x[3:0],y[3:0],1'b0,z[3:0],t[0]);
carry_lookaheadadder_4bit a1(x[7:4],y[7:4],t[0],z[7:4],t[1]);
carry_lookaheadadder_4bit a2(x[11:8],y[11:8],t[1],z[11:8],t[2]);
carry_lookaheadadder_4bit a3(x[15:12],y[15:12],t[2],z[15:12],cout);
assign sign=z[15];
assign zero=~|z;
assign parity=~^z;
assign overflow=(x[15]&y[15]&~z[15]|~x[15]&~y[15]&z[15]);
endmodule

module carry_lookaheadadder_4bit(x,y,cin,z,cout);
input [3:0]x,y;output [3:0]z;
input cin;output cout;
wire g0,g1,g2,g3,p0,p1,p2,p3;
wire c1,c2,c3;
assign p0=x[0]^y[0],p1=x[1]^y[1],p2=x[2]^y[2],p3=x[3]^y[3];
assign g0=x[0]&y[0],g1=x[1]&y[1],g2=x[2]&y[2],g3=x[3]&y[3];
assign c1=g0|(cin&p0),
 c2=g1|(g0&p1)|(cin&p0&p1),
 c3=g2|(g1&p2)|(g0&p1&p2)|(cin&p0&p1&p2),
 cout=g3|(g2&p3)|(g1&p2&p3)|(g0&p1&p2&p3)|(cin&p0&p1&p2&p3);
assign z[0]=p0^cin;
assign z[1]=p1^c1;
assign z[2]=p2^c2;
assign z[3]=p3^c3;
endmodule
