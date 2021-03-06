module Mem_Stage
  (
    input clk,
    input rst,
    input[31:0] PC_in,
    input WB_en_in,
    input MEM_R_EN_in,
    input MEM_W_EN_in,
    input [31:0] ALU_result_in,
    input [31:0] ST_val_in,
    input [4:0] Dest_in,

    output WB_en,
    output reg [31:0] PC,
    output MEM_R_EN,
    output [31:0] ALU_result,
    output [31:0] MEM_read_value,
    output [4:0] Dest,
    output sram_ready,
    inout [15:0] SRAM_DQ,
    output [17:0] SRAM_ADDR,
    output SRAM_WE_N
  );
    wire [31:0] adr;
    assign WB_en = WB_en_in;
    assign ALU_result = ALU_result_in;
    assign MEM_R_EN = MEM_R_EN_in;
    assign Dest = Dest_in;
    /*
    Data_Memory data_mem (.address(adr), .write_data(ST_val_in),
                           .mem_read(MEM_R_EN_in), .mem_write(MEM_W_EN_in), .clk(clk),
                           .rst(rst), .read_data(MEM_read_value));
    */
   SRAM sram(
				  .clk(clk),
              .rst(rst),
              .mem_wr_en(MEM_W_EN_in),
              .mem_rd_en(MEM_R_EN_in),
              .address(adr),
              .write_data(ST_val_in),
              .read_data(MEM_read_value),
              .ready(sram_ready),
              .SRAM_DQ(SRAM_DQ),
              .SRAM_ADDR(SRAM_ADDR),
              .SRAM_WE_N(SRAM_WE_N)
             );
	 Address_Mapping address_mapping (.in(ALU_result_in), .out(adr));
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
