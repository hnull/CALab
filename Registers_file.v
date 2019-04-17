module Registers_File
  (
    input clk,
    input rst,
    input[4:0] src1,
    input[4:0] src2,
    input[4:0] dest,
    input[31:0] Write_Val,
    input Write_EN,
    output[31:0] reg1,
    output[31:0] reg2
   );

  reg[31:0] registers[31:0];
  integer i = 0;

  always @(negedge clk, posedge rst) begin

	 if(rst)begin
		for(i = 0; i < 32; i = i + 1) begin
			registers[i] <= 32'b0;
		end
	 end

    if (Write_EN) begin
      registers[dest] <= Write_Val;
    end
    registers[0] <= 32'b0;
  end
    assign reg1 = registers[src1];
    assign reg2 = registers[src2];
endmodule
