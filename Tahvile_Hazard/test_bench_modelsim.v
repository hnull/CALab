module TB ();

  reg clk, rst;

  mips_modelsim mm1(clk,rst);



  initial begin
            clk = 1;
            forever #100 clk = ~clk;
       end
  initial begin
      rst = 1;
      #10;
      rst = 0;
  end

endmodule // TB
