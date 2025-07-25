module adder16bit(x,y,z,sign,zero,carry,parity,overflow);
input [15:0]x,y;output [15:0]z;
output sign,zero,carry,parity,overflow;
wire [2:0]t;
adder4bit a0(x[3:0],y[3:0],1'b0,z[3:0],t[0]);
adder4bit a1(x[7:4],y[7:4],t[0],z[7:4],t[1]);
adder4bit a2(x[11:8],y[11:8],t[1],z[11:8],t[2]);
adder4bit a3(x[15:12],y[15:12],t[2],z[15:12],cout);
assign sign=z[15];
assign zero=~|z;
assign parity=~^z;
assign overflow=(x[15]&y[15]&~z[15]|~x[15]&~y[15]&z[15]);
endmodule

module adder4bit(x,y,cin,z,cout);
input [3:0]x,y; output [3:0]z;
input cin;output cout;
wire [2:0]t;
fulladder f0(x[0],y[0],cin,z[0],t[0]);
fulladder f1(x[1],y[1],t[0],z[1],t[1]);
fulladder f2(x[2],y[2],t[1],z[2],t[2]);
fulladder f3(x[3],y[3],t[2],z[3],cout);
endmodule

module fulladder(a,b,cin,s,cout);
input a,b,cin;output s,cout;
wire s1,c1,c2;
xor G1(s1,a,b),G2(s,s1,cin),G3(cout,c1,c2);
and G4(c1,a,b),G5(c2,s1,cin);
endmodule
