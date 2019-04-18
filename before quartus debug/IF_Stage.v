module IF_Stage
  (
    input clk,
    input rst,
    input Br_taken,
    input[31:0] Branch_Address,
    output[31:0] PC,
    output[31:0] Instruction3
  );
  wire[31:0] mux_out;
  wire [31:0] PC_out, Adder_out;
  Mux32 m(Br_taken, Adder_out, Branch_Address, mux_out);
  Adder Adder(PC_out, Adder_out);
  PC PC2(clk, rst, mux_out, PC_out);
  Instruction Instruction2(PC_out, Instruction3);
  assign PC = Adder_out;
endmodule
