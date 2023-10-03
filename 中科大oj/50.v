module top_module(
    input clk,
    input reset,
    input en,
  	output reg [3:0]q);
always@(posedge clk)
begin
  if(en)
  begin
    if(reset) q<=5;
    else begin
        if(q==5) q<=15;
        else
        q<=q-1;
    end
  end
  else q<=q;
end
endmodule
