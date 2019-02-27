module sign_extend(
  input is_immediate,
  input [31:0]inp1,inp2,
  output [31:0] out
);
assign out = (is_immediate)?(inp1):(inp2);
endmodule 