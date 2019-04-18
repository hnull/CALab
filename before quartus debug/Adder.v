module Adder
  (
    input [31:0] PC_in,
    output [31:0] PC_out
  );
  
  assign PC_out = PC_in + 4;

endmodule

module Adder32
  (
    input [31:0] inp1,inp2,
    output [31:0] result
  );

  assign result = inp1 + inp2;

endmodule // Adder32
