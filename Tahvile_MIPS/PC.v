module PC
  (
    input clk,
    input rst,
    input [31:0] PC_in,
    output reg [31:0] PC_out
  );
  
  always @(posedge clk, posedge rst)  begin
      if (rst)
        PC_out <= 32'b0;
      else
        PC_out <= PC_in;      
    end

endmodule