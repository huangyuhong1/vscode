module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  
  
    parameter A=0, B=1; 
	reg state;
	always @(posedge clk, posedge areset) begin    //有限状态机第二段
        // State flip-flops with asynchronous reset
        if(areset)begin
        state<=B;
        end
        else
        begin
               case(state)
               A:begin 
               if(~in) state<=B;
               else state<=A;
               end
               B:begin 
               if(~in) state<=A;
               else state<=B;
               end
               default:
               state<=state;
               endcase 
        end
    end
    //有限状态机第三段，信号输出逻辑
     assign out = (state == B)?1:0;
endmodule
