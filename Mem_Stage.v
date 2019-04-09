module Mem_Stage
  (
    input clk,
    input rst,
    input[31:0] PC_in,

    input MEM_R_EN_in,
    input MEM_W_EN_in,
    input [31:0] ALU_result_in,
    input [31:0] ST_val_in,


    output reg [31:0] PC
    output reg  MEM_R_EN,
    output reg  MEM_W_EN,
    output reg [31:0] ALU_result,

    output reg [31:0] ST_val,

    output reg [31:0] MEM_read_value
  );
  wire [31:0] adr;

  Data_memory data_mem (.address(adr), .write_data(ST_val_in),
                        .mem_read(MEM_R_EN_in),.mem_write(MEM_W_EN_in), .clk(clk),
                        .rst(rst), .read_data(MEM_read_value));
  // module Data_memory(input [31:0]address,write_data,input mem_read,mem_write,input clk,rst,output logic [31:0] read_data);
  always @(posedge clk, posedge rst)
    begin
      if(rst)
        begin
          PC <= 32'b0;
      end
      else
        begin
          PC <= PC_in;
        end
    end

endmodule
