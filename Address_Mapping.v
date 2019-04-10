module Address_Mapping
  (
    input[31: 0] in,
    output[31:0] out
  );

  assign out = in - 11'b10000000000;
endmodule
