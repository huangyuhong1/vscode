`timescale 1ns/1ns
module tb();
reg a,b;
initial begin
    a=1;b=0;
    #10 b=1;
    #10 a=0;
    #10 b=0;
    #10 a=1;
    #10 $finish;
end
endmodule