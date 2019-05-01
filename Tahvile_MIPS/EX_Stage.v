module EX_Stage
  (
    input clk,
    input rst,
    input [3:0] EXE_CMD,
    input [31:0] val1,
    input [31:0] val2,
    input [31:0] val_src2,
    input [31:0] PC_in,
    input [1:0] Br_type,
    input WB_EN,
    input MEM_Write,
    input MEM_Read,
    input [4:0] dest,

    output reg [31:0] PC,
    output [31:0] ALU_result,
    output [31:0] Br_Addr,
    output Br_taken,
    output [4:0] dest_out,
    output [31:0] val_src2_out,
    output WB_EN_out,
    output MEM_Write_out,
    output MEM_Read_out
  );

  assign WB_EN_out = WB_EN;
  assign MEM_Write_out = MEM_Write;
  assign MEM_Read_out = MEM_Read;
  assign dest_out = dest;
  assign val_src2_out = val_src2;
  Alu alu (.first(val1), .second(val2), .control(EXE_CMD), .out(ALU_result));
  Adder32 addr32(.inp1(PC_in), .inp2(val2), .result(Br_Addr));
  Condition_Check condition_check ( .Branch_Type(Br_type), .Val1(val1), .Val2(val_src2), .Br_taken(Br_taken));


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
