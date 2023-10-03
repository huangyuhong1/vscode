module top_module(
  input clk,
  input resetn,
  input [1:0] byteena,
  input [15:0] d,
  output reg [15:0] q

);
  // Write your code here
    always@(posedge clk)
    if(~resetn)begin
      q=0;
    end
    else begin
       if(byteena[0])
       q[7:0]=d[7:0];
       else if (byteena[1])
       q[15:0]=d[15:0];
       else;
    end
endmodule