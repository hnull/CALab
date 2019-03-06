module ID_Stage_reg
  (
    input clk,
    input rst,
    input[31:0] PC_in,
    input flush;
    input WB_enable,
    input
    output reg[31:0] PC

  );


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



