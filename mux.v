module Mux32
  (
    input is_immediate,
    input [31:0] inp1,inp2,
    output [31:0] out
  );
  assign out = (is_immediate)?(inp1):(inp2);
endmodule

module Mux5
  (
    input is_immediate,
    input [4:0] inp1,inp2,
    output [4:0] out
  );
  assign out = (is_immediate)?(inp1):(inp2);
endmodule
