//SAMPLE TESTBENCH
module priority_encoder_tb;
    reg [7:0]in;
    wire[2:0]code;
    priority_encoder m1(in,code);
    initial
        begin
            #1 in=8'd1;
            #5 in=8'd200;
            #5 in=8'd100;
            #5 $finish;
        end
endmodule
