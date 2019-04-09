module ID_Stage
  (
    input clk,
    input rst,
    input [31:0] PC_in,
    input [31:0]Instruction,
    output WB_enable,
    output [1:0]Branch_type,
    output [3:0] Ex_cmd,
    output [31:0] Mux_1_res,
    output [4:0] Destination,
    output [31:0] Reg1,Reg2,
    output Mem_read,Mem_write,
    output reg[31:0] PC_out

  );
  wire Is_imm;
  wire [5:0] Src1,Src2;
  wire [15:0] Immediate;
  wire [31:0] Reg2_tmp;
  wire [31:0] Extended;
  // wire [31:0] Mux1_result;

  assign Reg2_tmp = Reg2;
  Control_Unit control_unit(.Op_code(Instruction[5:0]), .Alu_Command(Ex_cmd),
                            .mem_read(Mem_read), .mem_write(Mem_write), .branch_type(Branch_type), .wb_enable(WB_enable), .is_immediate(Is_imm));
  Sign_Extend sign_extend(.in(Instruction[15:0]), .out(Extended));
  Registers_File register_file(.clk(clk), .rst(rst), .src1(Instruction[25:21]),
                              .src2(Instruction[20:16]), .dest(Instruction[15:11]),
                              .Write_EN(WB_enable), .reg1(Reg1), .reg2(Reg2));
  Mux32 mux1(.is_immediate(Is_imm), .inp1(Reg2_tmp), .inp2(Extended), .out(Mux_1_res));
  Mux5 mux2(.is_immediate(Is_imm), .inp1(Instruction[15:11]), .inp2(Instruction[20:16]), .out(Destination));

  always @(posedge clk, posedge rst)
    begin
      if(rst)
        begin
          PC_out <= 32'b0;
      end
      else
        begin
          PC_out <= PC_in;
        end
    end


endmodule
