//SAMPLE TESTBENCH
module alutb;
 reg mode;
 reg [1:0]op;
 reg[7:0]a,b;
 wire [7:0]f;
 alu a1(f,a,b,mode,op);
 initial
   begin
    #10 mode=0;
    op=2'b10;
    a=8'd4;b=8'h2;
    #10 mode=1;op=2'b01;
    #10 mode=0;
    #10 $finish;
   end
endmodule
