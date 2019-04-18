module ss
  (
    input[31:0] in,
    output reg[6:0] out
  );
  
    always @(*) begin
    case (in[3:0])
      4'b0000: out <= 7'b0111111;
      4'b0001: out <= 7'b0000110;
      4'b0010: out <= 7'b1011011;
      4'b0011: out <= 7'b1001111;
      4'b0100: out <= 7'b1100110;
      4'b0101: out <= 7'b1101101;
      4'b0110: out <= 7'b1111101;
      4'b0111: out <= 7'b0000111;
      4'b1000: out <= 7'b1111111;         
    endcase
  end
  
endmodule
