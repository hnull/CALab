module ID_Stage_reg
  (
    input clk,
    input rst,
    input[31:0] PC_in,
    input WB_enable,
    input [3:0] Ex_cmd,
    input Branch_type,
    input MEM_Write,MEM_Read,
    input [31:0] Reg1,Reg2,
    input [31:0] Mux1_res,
    input [4:0] Destination,
    input flush,
    
    output reg[31:0] PC_out,
    output write_back_enable,
    output [3:0]ex_cmd,
    output branch_type,
    output mem_write,mem_Read,
    output [31:0] val1,reg2,
    output [31:0] val2,
    output [4:0] dst,
  );


  always @(posedge clk, posedge rst, posedge flush)
    begin
      if(rst || flush)
        begin
          PC <= 32'b0;
          write_back_enable <= 1'b0;
          ex_cmd <= 4'b0;
          branch_type <= 1'b0;
          mem_write <= 1'b0;
          mem_Read <= 1'b0;
          val1 <= 32'b0;
          val2 <= 32'b0;
          reg2 <= 32'b0;
          dst  <= 5'b0;
      end
      else
        begin
          write_back_enable <= WB_enable;
          ex_cmd <= Ex_cmd;
          branch_type <= Branch_type;
          mem_write <= MEM_Write;
          mem_Read <= MEM_Read;
          val1 <= Reg1;
          val2 <= Mux1_res;
          reg2 <= Reg2;
          dst  <= Destination;

          

          PC_out <= PC_in;
        end
    end

endmodule



