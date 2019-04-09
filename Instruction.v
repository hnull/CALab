module Instruction
  (
    input[31:0] adrs,
    output[31:0] inst
  );

  wire [31:0] Mem [100:0];

  assign Mem[0] = 32'b00000000001000100000000000000000;
  assign Mem[4] = 32'b00000000011001000000000000000000;
  assign Mem[8] = 32'b00000000101001100000000000000000;
  assign Mem[12] = 32'b00000000111010000001000000000000;
  assign Mem[16] = 32'b00000001001010100001100000000000;
  assign Mem[20] = 32'b00000001011011000000000000000000;
  assign inst = Mem[adrs];

endmodule
