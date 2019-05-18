module EX_Stage_reg
  (
    input clk,
    input rst,
    input Freeze,
    input WB_en_in,
    input MEM_R_EN_in,
    input MEM_W_EN_in,
    input [31:0] PC_in,
    input [31:0] ALU_result_in,
    input [31:0] ST_val_in,
    input [4:0] Dest_in,

    output reg WB_en,
    output reg MEM_R_EN,
    output reg  MEM_W_EN,
    output reg [31:0] PC,
    output reg [31:0] ALU_result,
    output reg [31:0] ST_val,
    output reg [4:0] Dest
  );

  always @(posedge clk, posedge rst)
    begin
      if(rst)
        begin
        WB_en <= 1'b0;
        MEM_R_EN <= 1'b0;
        MEM_W_EN <= 1'b0;
        PC <= 32'b0;
        ALU_result <= 32'b0;
        ST_val <= 1'b0;
        Dest <= 5'b0;
      end
      else if(Freeze == 1'b0)
        begin
          WB_en <= WB_en_in;
          MEM_R_EN <= MEM_R_EN_in;
          MEM_W_EN <= MEM_W_EN_in;
          PC <= PC_in;
          ALU_result <= ALU_result_in;
          ST_val <= ST_val_in;
          Dest <= Dest_in;
        end
    end

endmodule
