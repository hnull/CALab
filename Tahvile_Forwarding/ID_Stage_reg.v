module ID_Stage_reg
  (
    input clk,
    input rst,
    input[31:0] PC_in,
    input WB_enable,
    input [3:0] Ex_cmd,
    input [1:0] Branch_type,
    input MEM_Write,MEM_Read,
    input [31:0] Reg1,Reg2,
    input [31:0] Mux1_res,
    input [4:0] Destination,
    input flush,
    input [4:0] src1_in,
    input [4:0] src2_in,
    input is_two_source_in,

    output reg[31:0] PC_out,
    output reg write_back_enable,
    output reg [3:0] ex_cmd,
    output reg [1:0] branch_type,
    output reg mem_write,mem_Read,
    output reg [31:0] val1,reg2,
    output reg [31:0] val2,
    output reg [4:0] dst,
    output reg [4:0] src1,
    output reg [4:0] src2,
    output reg is_two_source
  );


  always @(posedge clk, posedge rst)
    begin
      if(rst)
        begin
          PC_out <= 32'b0;
          write_back_enable <= 1'b0;
          ex_cmd <= 4'b0;
          branch_type <= 2'b0;
          mem_write <= 1'b0;
          mem_Read <= 1'b0;
          val1 <= 32'b0;
          val2 <= 32'b0;
          reg2 <= 32'b0;
          dst  <= 5'b0;
          is_two_source <= 1'b0;
          src1 <= 5'b0;
          src2 <= 5'b0;
      end
		else if(flush)begin
			    PC_out <= 32'b0;
          write_back_enable <= 1'b0;
          ex_cmd <= 4'b0;
          branch_type <= 2'b0;
          mem_write <= 1'b0;
          mem_Read <= 1'b0;
          val1 <= 32'b0;
          val2 <= 32'b0;
          reg2 <= 32'b0;
          dst  <= 5'b0;
          is_two_source <= 1'b0;
          src1 <= 5'b0;
          src2 <= 5'b0;
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
          is_two_source <= is_two_source_in;
          src1 <= src1_in;
          src2 <= src2_in;
        end
    end

endmodule
