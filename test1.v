module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
	assign {cout,sum} = a + b + cin;
endmodule
module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] b1=b^{32{sub}};
    wire cout;
   
    
    add16 u1(
        .a (a[15:0]),
        .b (b1[15:0]),
        .cin (0),
        .sum (sum[15:0]),
        .cout (cout)
    );

    add16 u2(
        .a (a[31:16]),
        .b (b1[31:16]),
        .cin (cout),
        .sum (sum[31:16])
    );
endmodule

bufan测试一下新功能
