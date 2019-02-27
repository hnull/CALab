module IF_Stage
  (
    input clk,
    input rst,
    output[31:0] PC,
    output[31:0] Instruction  
  );
  wire [31:0] PC_in, PC_out;
  Adder adder(PC_out, PC_in);
  PC pc(clk, rst, PC_in, PC_out);
  Instrcution instruction(PC_out, Instruction);
  assign PC = PC_out;  
endmodule
