module top_module (
    input 				clk,
    input [7:0] 		d,
    output reg [7:0] 	q
);
// 请用户在下方编辑代码
always @(posedge clk)
q<=d;


//用户编辑到此为止
endmodule
