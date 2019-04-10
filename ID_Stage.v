module ID_Stage
  (
    input clk,
    input rst,
    input [31:0] PC_in,
    input [31:0]Instruction,
    input [31:0] write_val,
    input [4:0] Dest_in,
    input WB_enable_in,
    output WB_enable,
    output [1:0]Branch_type,
    output [3:0] Ex_cmd,
    output [31:0] Mux_1_res,
    output [4:0] Destination,
    output [31:0] Reg1,Reg2,
    output Mem_read,Mem_write,
    output [31:0] PC_out

  );
  wire Is_imm;
  wire [5:0] Src1,Src2;
  wire [15:0] Immediate;
  wire [31:0] Reg2_tmp;
  wire [31:0] Extended;

  assign PC_out = PC_in;
  assign Reg2_tmp = Reg2;
  Control_Unit control_unit(.Op_Code(Instruction[31:26]), .Alu_Command(Ex_cmd),
                            .mem_read(Mem_read), .mem_write(Mem_write), .branch_type(Branch_type), .wb_enable(WB_enable), .is_immediate(Is_imm));
  Sign_Extend sign_extend(.in(Instruction[15:0]), .out(Extended));
  Registers_File register_file(.clk(clk), .rst(rst), .src1(Instruction[25:21]),
                              .src2(Instruction[20:16]), .dest(Dest_in), . Write_Val(write_val),
                              .Write_EN(WB_enable_in), .reg1(Reg1), .reg2(Reg2));
  Mux32 mux1(.is_immediate(Is_imm), .inp1(Reg2_tmp), .inp2(Extended), .out(Mux_1_res));
  Mux5 mux2(.is_immediate(Is_imm), .inp1(Instruction[15:11]), .inp2(Instruction[20:16]), .out(Destination));

endmodule
