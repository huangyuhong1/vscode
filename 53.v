module top_module(
  input clk,
  input enable,
  input S,
  input A, B, C,
  output reg Z 
);
  // Write your code here

  reg [7:0] q;


  always@(posedge clk) begin
      if (enable) begin
        q <= {q[6:0], S};  
      end
    end

    always@(*) begin

        Z = q[{A,B,C}];   //代替case

    end

endmodule
//抄的