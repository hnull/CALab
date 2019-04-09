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
    output reg [4:0] dest_out,
    output reg [31:0] val_src2_out,
    output reg WB_EN_out,
    output reg MEM_Write_out,
    output reg MEM_Read_out,
  );

  Alu alu (.first(val1), .second(val2), .control(EXE_CMD), .out(ALU_result));
  Adder32 addr32(.inp1(PC_in), .inp2(val2), .result(Br_Addr));
  Condition_Check condition_check ( .Branch_Type(Br_type), .Val1(val1), .Val2(val_src2), .Br_taken(Br_taken));


  always @(posedge clk, posedge rst)
    begin
      if(rst)
        begin
          // PC <= 32'b0;
          // val_src2_out <= 32'b0;
          // dest <= 5'b0;

      end
      else
        begin
          PC <= PC_in;
          val_src2_out <= val_src2;
          dest <= dest_out;
          WB_EN_out <= WB_EN;
          MEM_Write_out <= MEM_Write;
          MEM_Read_out <= MEM_Read;

        end
    end

endmodule
