module ID_Stage
  (
    input clk,
    input rst,
    input Freeze,
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
  wire [8:0] Input_Controller_Signals;
  wire [8:0] Output_Controller_Signals;
  wire temp_WB_enable;
  wire temp_Mem_read;
  wire temp_Mem_write;
  wire [1:0] temp_Branch_type;
  wire [3:0] temp_Ex_cmd;

  assign PC_out = PC_in;
  assign Reg2_tmp = Reg2;
  assign Input_Controller_Signals = {temp_WB_enable, temp_Mem_read, temp_Mem_write, temp_Branch_type, temp_Ex_cmd};
  assign Ex_cmd = Output_Controller_Signals [3:0];
  assign Branch_type = Output_Controller_Signals [5:4];
  assign Mem_write = Output_Controller_Signals [6];
  assign Mem_read = Output_Controller_Signals [7];
  assign WB_enable = Output_Controller_Signals [8];

  Control_Unit control_unit(.Op_Code(Instruction[31:26]), .Alu_Command(temp_Ex_cmd),
                            .mem_read(temp_Mem_read), .mem_write(temp_Mem_write), .branch_type(temp_Branch_type), .wb_enable(temp_WB_enable), .is_immediate(Is_imm));
  Sign_Extend sign_extend(.in(Instruction[15:0]), .out(Extended));
  Registers_File register_file(.clk(clk), .rst(rst), .src1(Instruction[25:21]),
                              .src2(Instruction[20:16]), .dest(Dest_in), . Write_Val(write_val),
                              .Write_EN(WB_enable_in), .reg1(Reg1), .reg2(Reg2));
  Mux32 mux1(.is_immediate(Is_imm), .inp1(Reg2_tmp), .inp2(Extended), .out(Mux_1_res));
  Mux5 mux2(.is_immediate(Is_imm), .inp1(Instruction[15:11]), .inp2(Instruction[20:16]), .out(Destination));
  Mux9 mux3(.sel(Freeze), .inp1(Input_Controller_Signals), .inp2(9'b0), .out(Output_Controller_Signals));

endmodule
