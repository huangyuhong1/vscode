`timescale 10ns/10ns
module tb();
reg a,b;
wire q;
  
//对ab信号进行初始化
initial begin
    a=0;b=0;
    #3 b=1;
    #2 b=0;a=1;
    #2 b=1;
    #2 b=0;a=0;
    #2 b=1;
    #2 b=0;a=1;
    #2 b=1;
    #2 a=0;b=0;
    #1 $finish;
end

//例化mymodule模块
  mymodule u1(
    .a (a),
    .b (b),
    .q (q)
  );
endmodule
module mymodule(
input a,b,
output q
);
  
assign q = a & b;
  
endmodule
