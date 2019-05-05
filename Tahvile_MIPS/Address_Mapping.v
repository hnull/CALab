module Address_Mapping
  (
    input[31: 0] in,
    output[31:0] out
  );

  assign out = in - 32'b00000000000000000000010000000000;
endmodule
