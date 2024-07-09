//TESTBENCH
module d_ff_tb;
  reg d,clk;
  wire q,qbar;
    
  d_ff d1(d,clk,q,qbar);
    
  always #5 clk=~clk;
    initial
      begin
       clk=0;
       #2 d=0;
       #10 d=1;
       #10 d=0;
       #5 $finish;
     end
endmodule


module d_ff(input d,clk,output reg q,qbar

    );
    always @(negedge clk)
     begin
      q=d;
      qbar=~d;
     end
endmodule
