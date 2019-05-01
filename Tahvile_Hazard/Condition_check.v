module Condition_Check
  (
    input[1:0] Branch_Type,
    input[31:0] Val1,
    input[31:0] Val2,
    output reg Br_taken
  );

  always @(*) begin
    case (Branch_Type)
      2'b01: Br_taken = (Val1 == Val2) ? 1'b1 : 1'b0;
      2'b10: Br_taken = (Val1 != Val2) ? 1'b1 : 1'b0;
      2'b11: Br_taken = 1'b1;
      default: Br_taken = 1'b0;
    endcase
  end
endmodule
