module top_module(
    input 			clk		,  //4Hz
    input 			reset	,
	output	reg [7:0]	ss
); 
	// Write your code here
	reg [3:0] time1=0;
    always@(posedge clk)
    begin
        if(reset) ss<=0;
        else 
        begin 
        time1<=time1+1;
        if(time1==4-1)
        begin
        time1<=0;ss<=ss+1;end
        else if (ss[3:0]==4'b1010)
        ss[7:4]<=ss[7:4]+1;
        else ss<=ss;end
    end
endmodule
