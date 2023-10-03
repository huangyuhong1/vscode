module add16 ( 
	input[15:0] a, 
    input[15:0] b, 
    input cin, 
    output[15:0] sum, 
    output cout 
);
	assign {cout,sum} = a + b + cin;
endmodule

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
wire cout1;
wire [15:0] sum1;
wire [15:0] sum2;

add16 u1(
    .a (a[15:0]),
    .b (b[15:0]),
    .cin (0),
    .sum (sum[15:0]),
    .cout (cout1)
);

add16 u2(
    .a (a[31:16]),
    .b (b[31:16]),
    .cin (0),
    .sum (sum1)
);

add16 u3(
    .a (a[31:16]),
    .b (b[31:16]),
    .cin (1),
    .sum (sum2)
);
assign sum[31:16]=(cout1)?sum2:sum1;


endmodule