module ram_one_port(
	input 	clk,
	input	[1:0] addr,
	input	wr_en,
	input	[7:0] wr_data,
	output	[7:0] rd_data
);
	reg		[7:0] mem[3:0];
	initial
	begin
      mem[0] = 8'b0;
      mem[1] = 8'b0;
      mem[2] = 8'b0;
      mem[3] = 8'b0;
	end
	assign rd_data = mem[addr];
	always@(posedge clk)
	begin
		if(wr_en)
			mem[addr] <= wr_data;
	end
endmodule

//`timescale 1ns/1ps 加上一直过不去不知道为什么
module tb(
);
	//信号定义
	reg				clk,wr_en;
	reg		[1:0] 	addr;
	reg		[7:0] 	wr_data;
	wire	[7:0] 	rd_data;
	//信号生成
    initial begin
        clk=0;
        forever #5 begin
            clk=~clk;  //生成周期为10的一个时钟信号，forever为verilog的关键字
        end
    end
    initial begin
    addr<=0;
    repeat(4) begin
	  @(posedge clk);
	  #1 addr=addr+1;
	end
    end

	initial begin 
		wr_en<=0;
		#50 ;//什么都不做，延迟
		#1 wr_en = 1;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);	//等待4个clk上升沿
	#1 wr_en = 0;
	end

	initial begin
		wr_data = 8'h0;
    repeat(4) begin  //随机数
    	wait(wr_en==1'b1);
	#1 wr_data = $random%256;
    	@(posedge clk);
    end
	end
	//例化被测模块
	ram_one_port u1(
		.clk (clk),
		.wr_en (wr_en),
		.wr_data (wr_data),
		.addr (addr),
		.rd_data(rd_data)
	);
endmodule
