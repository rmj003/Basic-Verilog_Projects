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
