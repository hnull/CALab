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
    // wire sram_write_command,sram_read_command;
    // wire [63:0] output_for_cache;
    // // assign sram_ready = freeze;
    // wire [31:0] mem_val_between;
    // wire sram_ready_for_cache;


    wire [17:0] edited_address;
    assign edited_address = adr[18:1];
    wire [63:0] sram_output;
    wire sraam_ready,sram_mem_read,sram_mem_write,freeze;
    assign sram_ready = freeze;
     SRAM sram(
    	.clk(clk),
    	.rst(rst),
    	.mem_read(sram_mem_read),
    	.mem_write(sram_mem_write),
    	.data(data),
    	.address(edited_address),
    	.SRAM_DQ(SRAM_DQ),
    	.SRAM_ADDR(SRAM_ADDR),
    	.SRAM_WE_N(SRAM_WE_N),
    	.data_out(sram_output),
    	.ready(sraam_ready)
    );
    Cache cache(
    	.clk(clk),
    	.rst(rst),
    	.address(edited_address[16:1]),
    	.mem_read(MEM_R_EN_in),
    	.mem_write(MEM_W_EN_in),
    	.SRAM_data(sram_output),
    	.SRAM_ready(sraam_ready),
    	.data(MEM_read_value),
    	.SRAM_mem_read(sram_mem_read),
    	.SRAM_mem_write(sram_mem_write),
    	.freeze(freeze)
    );
   // cache_controller Cache (
   //           .clk(clk),
   //           .rst(rst),
   //           .address(adr),
   //           .wdata(ST_val_in),
   //           .MEM_R_EN(MEM_R_EN_in),
   //           .MEM_W_EN(MEM_W_EN_in),
   //           .rdata(MEM_read_value),
   //           .SRAM_mem_read(sram_read_command),
   //           .SRAM_mem_write(sram_write_command),
   //           .sram_rdata(output_for_cache),
   //           .sram_ready(sram_ready_for_cache),
   //           .freeze(freeze)
   //   );
   // SRAM sram(
		// 		      .clk(clk),
   //            .rst(rst),
   //            .mem_wr_en(sram_write_command),
   //            .mem_rd_en(sram_read_command),
   //            .address(adr),
   //            .write_data(ST_val_in),
   //            .ready(sram_ready_for_cache),
   //            .SRAM_DQ(SRAM_DQ),
   //            .SRAM_ADDR(SRAM_ADDR),
   //            .SRAM_WE_N(SRAM_WE_N),
   //            .output_for_cache(output_for_cache)
   //           );
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
