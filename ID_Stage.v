module ID_Stage
  (
    input clk,
    input rst,
    input [31:0] PC_in,
    input [31:0]Instruction,
    output WB_enable,
    output Branch_type,branch_taken,
    output Ex_cmd,
    output MEM_stage,
    output [31:0] Mux_1_res,
    output [5:0] Destination,
    output [31:0] Reg1,Reg2,
    output Mem_read,Mem_write,
    output reg[31:0] PC_out,
  
  );
  wire Is_imm;
  wire [5:0] Src1,Src2;
  wire [15:0] Immediate;
  wire [31:0] Reg2_tmp;
  wire [31:0] Extended;
  // wire [31:0] Mux1_result;

  assign Reg2_tmp = Reg2;
  Control_Unit control_unit(Instruction[0:4], Ex_cmd,
  Mem_read, Mem_write, WB_enable, Branch_type, Is_imm, branch_taken);
  Sign_Extend sign_extend(Instruction[16:31], Extended);
  Register_File register_file(clk,rst,Immediate[25:21],
                              Immediate[20:16],Immediate[15:11],
                              WB_enable,Reg1,Reg2);
  Mux mux1(Is_imm, Reg2_tmp,Extended,Mux_1_res);
  Mux mux2(Is_imm, Instruction[15,11], Instruction[20:16], Destination);

  always @(posedge clk, posedge rst)
    begin
      if(rst)
        begin
          PC <= 32'b0;
      end
      else
        begin
          PC <= PC_in;
        end
    end


endmodule

