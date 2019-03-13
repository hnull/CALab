module ID_Stage
  (
    input clk,
    input rst,
    input [31:0] PC_in,
    input [31:0]Instruction,
    output WB_enable,
    output Branch_type,
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
  Control_Unit control_unit(Instruction[4:0], Ex_cmd,
  Mem_read, Mem_write, WB_enable, Branch_type, Is_imm);
  Sign_Extend sign_extend(Instruction[15:0], Extended);
  Registers_File register_file(clk,rst,Instruction[25:21],
                              Instruction[20:16],Instruction[15:11],
                              WB_enable,Reg1,Reg2);
  Mux32 mux1(Is_imm, Reg2_tmp, Extended, Mux_1_res);
  Mux5 mux2(Is_imm, Instruction[15:11], Instruction[20:16], Destination);

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