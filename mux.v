module Mux32
  (
    input is_immediate,
    input [31:0] inp1,inp2,
    output [31:0] out
  );
  assign out = (is_immediate)?(inp2):(inp1);
endmodule

module Mux5
  (
    input is_immediate,
    input [4:0] inp1,inp2,
    output [4:0] out
  );
  assign out = (is_immediate)?(inp2):(inp1);
endmodule

module Mux9
  (
    input sel,
    input [9:0] inp1, inp2,
    output [9:0] out
  );
  assign out = (sel) ? (inp2) : (inp1);
endmodule

module Mux_3to1
  (
    input[1:0] sel,
    input[31:0] inp1, inp2, inp3,
    output[31:0] out
  );
  assign out = (sel == 2'b01) ? inp2 :
               (sel == 2'b10) ? inp3 :
               inp1;
endmodule
