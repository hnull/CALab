module mips_modelsim (input clk,rst);

wire [31:0] PC;
wire [31:0] Instruction;
wire [31:0] PC1;
wire [31:0] Instruction1;
wire WB_enable;
//wire [1:0] branch_type;
wire [3:0] Ex_cmd;
wire [31:0] Mux_1_res;
wire [4:0] Destination;
wire [31:0] Reg1;
wire [31:0] Reg2;
wire Mem_read;
wire Mem_write;
wire [31:0] PC2;
// wire flush;
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
wire [31:0] PC4;
wire [31:0] ALU_result1;
wire [31:0] Br_Addr;
wire Br_taken;
wire [4:0] dest_out;
wire [31:0] val_src2_out;
wire WB_EN_out;
wire MEM_Write_out;
wire MEM_Read_out;
wire WB_EN_out2;
wire MEM_Write_out2;
wire MEM_Read_out2;
wire [31:0] PC5;
wire [31:0] ALU_result2;
wire [31:0] ST_val;
wire [4:0] Destination2;
wire WB_EN_out3;
wire [31:0] PC6;
wire MEM_Read_out3;
wire [31:0] ALU_result3;
wire [31:0] MEM_read_value;
wire [4:0] Destination3;
wire [31:0] PC7;
wire WB_EN_out4;
wire MEM_Read_out4;
wire [31:0] ALU_result4;
wire [31:0] MEM_read_value2;
wire [4:0] Destination4;
//wire [31:0] write_val;
wire WB_EN_out5;
wire [31:0] write_val2;
wire [4:0] Destination5;
wire [31:0] PC8;
wire [1:0] Branch_type;

IF_Stage u1(
    				.clk(clk),
    				.rst(rst),
    				.Br_taken(Br_taken),
    				.Branch_Address(Br_Addr),
    				.PC(PC),
    				.Instruction3(Instruction)
  				);

IF_Stage_reg u2(
								.clk(clk),
								.rst(rst),
								.PC_in(PC),
								.Instruction_in(Instruction),
                .flush(Br_taken),
								.PC(PC1),
								.Instruction(Instruction1)
								);
ID_Stage u3(
						.clk(clk),
						.rst(rst),
						.PC_in(PC1),
						.Instruction(Instruction1),
						.write_val(write_val2),
						.Dest_in(Destination4),
						.WB_enable_in(WB_EN_out4),
						.WB_enable(WB_enable),
						.Branch_type(Branch_type),
						.Ex_cmd(Ex_cmd),
						.Mux_1_res(Mux_1_res),
						.Destination(Destination),
						.Reg1(Reg1),
						.Reg2(Reg2),
						.Mem_read(Mem_read),
						.Mem_write(Mem_write),
						.PC_out(PC2)
						);
ID_Stage_reg u4(
                .clk(clk),
                .rst(rst),
                .PC_in(PC2),
                .WB_enable(WB_enable),
                .Ex_cmd(Ex_cmd),
                .Branch_type(Branch_type),
                .MEM_Write(Mem_write),
                .MEM_Read(Mem_read),
                .Reg1(Reg1),
	 							.Reg2(Reg2),
                .Mux1_res(Mux_1_res),
                .Destination(Destination),
                .flush(Br_taken),

                .PC_out(PC3),
                .write_back_enable(write_back_enable_id_reg_out),
                .ex_cmd(ex_cmd_id_reg_out),
								.branch_type(branch_type_id_reg_out),
                .mem_write(mem_write_id_reg_out),
                .mem_Read(mem_Read_id_reg_out),
                .val1(val1_id_reg_out),
                .reg2(reg2_id_reg_out),
                .val2(val2_id_reg_out),
								.dst(dst_id_reg_out)
                );

EX_Stage u5(
		.clk(clk), .rst(rst),
    .EXE_CMD(ex_cmd_id_reg_out),
    .val1(val1_id_reg_out),
    .val2(val2_id_reg_out),
    .val_src2(reg2_id_reg_out),
    .PC_in(PC3),
    .Br_type(branch_type_id_reg_out),
    .WB_EN(write_back_enable_id_reg_out),
    .MEM_Write(mem_write_id_reg_out),
    .MEM_Read(mem_Read_id_reg_out),
    .dest(dst_id_reg_out),

    .PC(PC4),
    .ALU_result(ALU_result1),
    .Br_Addr(Br_Addr),
    .Br_taken(Br_taken),
    .dest_out(dest_out),
    .val_src2_out(val_src2_out),
    .WB_EN_out(WB_EN_out),
    .MEM_Write_out(MEM_Write_out),
    .MEM_Read_out(MEM_Read_out)
);

EX_Stage_reg u6(
    .clk(clk),
    .rst(rst),
    .WB_en_in(WB_EN_out),
    .MEM_R_EN_in(MEM_Read_out),
    .MEM_W_EN_in(MEM_Write_out),
    .PC_in(PC4),
    .ALU_result_in(ALU_result1),
    .ST_val_in(val_src2_out),
    .Dest_in(dest_out),

    .WB_en(WB_EN_out2),
    .MEM_R_EN(MEM_Read_out2),
    .MEM_W_EN(MEM_Write_out2),
    .PC(PC5),
    .ALU_result(ALU_result2),
    .ST_val(ST_val),
    .Dest(Destination2)
  );

Mem_Stage u7
	  (
	    .clk(clk),
	    .rst(rst),
	    .PC_in(PC5),
	    .WB_en_in(WB_EN_out2),
	    .MEM_R_EN_in(MEM_Read_out2),
	    .MEM_W_EN_in(MEM_Write_out2),
	    .ALU_result_in(ALU_result2),
	    .ST_val_in(ST_val),
			.Dest_in(Destination2),

	    .WB_en(WB_EN_out3),
	    .PC(PC6),
	    .MEM_R_EN(MEM_Read_out3),
	    .ALU_result(ALU_result3),
	    .MEM_read_value(MEM_read_value),
			.Dest(Destination3)
	  );

Mem_Stage_reg u8
		(
		  .clk(clk),
		  .rst(rst),
		  .PC_in(PC6),
		  .WB_en_in(WB_EN_out3),
		  .MEM_R_EN_in(MEM_Read_out3),
		  .ALU_result_in(ALU_result3),
		  .Mem_read_value_in(MEM_read_value),
		  .Dest_in(Destination3),

		  .PC(PC7),
		  .WB_en(WB_EN_out4),
		  .MEM_R_EN(MEM_Read_out4),
		  .ALU_result(ALU_result4),
		  .Mem_read_value(MEM_read_value2),
		  .Dest(Destination4)
		);

WB_Stage u9
		  (
		   .clk(clk),
		   .rst(rst),
		   .WB_en_in(WB_EN_out4),
		   .MEM_R_EN(MEM_Read_out4),
		   .ALU_result(ALU_result4),
		   .Mem_read_value(MEM_read_value2),
		   .Dest_in(Destination4),
		   .PC_in(PC7),
		   .WB_en(WB_EN_out5),
		   .Write_Value(write_val2),
		   .Dest(Destination5),
		   .PC(PC8)
		  );

endmodule // mips_modelsim
