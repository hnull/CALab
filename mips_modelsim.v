module mips_modelsim (input clk,rst);

wire [31:0] PC;
wire [31:0] Instruction;
wire [31:0] PC1;
wire [31:0] Instruction1;
wire WB_enable;
wire [1:0] branch_type;
wire [3:0] Ex_cmd;
wire [31:0] Mux_1_res;
wire [4:0] Destination;
wire [31:0] Reg1;
wire [31:0] Reg2;
wire Mem_read;
wire Mem_write;
wire [31:0] PC2;
wire flush;
wire [31:0] PC3;
wire write_back_enable_id_reg_out;
wire [3:0] ex_cmd_id_reg_out;
wire [1:0] branch_type_id_reg_out;
wire mem_write_id_reg_out;
wire mem_Read_id_reg_out;
wire [31:0] val1_id_reg_out;
wire [31:0] reg2_id_reg_out;
wire [31:0] val2_id_reg_out;
wire [4:0] dst_id_reg_out;











IF_Stage u1(clk, rst, PC, Instruction);
IF_Stage_reg u2(clk, rst, PC, Instruction, PC1, Instruction1);
ID_Stage u3(clk, rst, PC1, Instruction1, WB_enable, Branch_type, Ex_cmd, Mux_1_res,
						Destination, Reg1, Reg2, Mem_read, Mem_write, PC2);
ID_Stage_reg u4(clk, rst, PC2, WB_enable, Ex_cmd, Branch_type, Mem_write, Mem_read, Reg1,
	 							Reg2, Mux_1_res, Destination, flush, PC3, write_back_enable_id_reg_out, ex_cmd_id_reg_out,
								branch_type_id_reg_out, mem_write_id_reg_out, mem_Read_id_reg_out, val1_id_reg_out,reg2_id_reg_out,val2_id_reg_out
								,dst_id_reg_out);

endmodule // mips_modelsim
