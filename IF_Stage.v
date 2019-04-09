module IF_Stage
  (
    input clk,
    input rst,
    output[31:0] PC,
    output[31:0] Instruction3 
  );
  wire [31:0] PC_out, Adder_out;
  Adder Adder(PC_out, Adder_out);
  PC PC2(clk, rst, Adder_out, PC_out);
  Instruction Instruction2(Adder_out, Instruction3);
  assign PC = Adder_out;  
endmodule
