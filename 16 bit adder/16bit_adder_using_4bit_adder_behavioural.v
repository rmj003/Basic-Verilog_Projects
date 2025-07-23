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
assign {cout,z}=x+y+cin;
endmodule
