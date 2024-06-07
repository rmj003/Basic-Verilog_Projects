//code for implementing 16x1 multiplexer
module mux16x1(out,sel,in);
input [15:0]in; input [3:0]sel;
output out;
assign out=in[sel];
endmodule

//Testbench for the above multiplexer
module mux_tb();
reg [15:0]A;
reg [3:0]S;
wire F;
mux16x1 m1(.in(A),.sel(S),.out(F));
initial
 begin
     $dumpfile("mux.vcd");
     $dumpfile(0);
     $monitor($time,"A=%h,S=%h,F=%b",A,S,F);
     #5 A=16'h33ff;S=4'h3;
     #5 S=4'ha;
     #5 S=4'h6;
     #5 S=4'hc;
     #5 $finish;
 end
endmodule
