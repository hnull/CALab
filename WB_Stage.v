module WB_Stage
  (
    input clk,
    input rst,
    input WB_en_in,
    input MEM_R_EN,
    input[31:0] ALU_result,
    input[31:0] Mem_read_value,
    input[4:0] Dest_in,
    input[31:0] PC_in,
    output reg WB_en,
    output[31:0]  Write_Value,
    output[4:0] Dest,
    output reg[31:0] PC
  );

  Mux32 mux4(MEM_R_EN, MEM_read_value, ALU_result, Write_Value);
  assign Dest = Dest_in;

  always @(posedge clk, posedge rst)
    begin
      if(rst)
        begin
          PC <= 32'b0;
          WB_en <= 32'b0;
        end
      else
        begin
          PC <= PC_in;
          WB_en <= WB_en_in;
        end
    end

endmodule
