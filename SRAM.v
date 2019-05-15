module SRAM
		(
		 	 input clk,
       input rst,
       input mem_wr_en,
       input mem_rd_en,
       input [31:0] address,
       input [31:0] write_data,
       output [31:0] read_data,
       output ready,
       inout [15:0] SRAM_DQ,
       output reg  [17:0] SRAM_ADDR,
       output reg SRAM_WE_N
   );

  reg[2:0] cnt;
  reg [15:0] data_write_temp;
  reg [31:0] data_read_temp;
  wire sram_work;
  assign sram_work = (mem_rd_en || mem_wr_en);

  always @ (posedge clk, posedge rst)
		begin
		 if (rst)
			begin
				cnt <= 3'b001;
			end
	   else if (mem_wr_en)
		 	begin
	      case (cnt)
	        3'b001:
					 begin
	          SRAM_WE_N <= 1'b0;
	          data_write_temp <= write_data[15:0];
	          SRAM_ADDR <= address;
	          cnt <= cnt + 3'b001;
	         end
	        3'b010:
					 begin
	          SRAM_WE_N <= 1'b0;
	          data_write_temp <= write_data[31:16];
	          SRAM_ADDR <= address + 3'b001;
	          cnt <= cnt + 3'b001;
	         end
	        3'b110:
					 begin
	          cnt <= 3'b001;
	         end
	        default:
					 begin
	          // SRAM_WE_N <= 1'bz;
	          cnt <= cnt + 3'b001;
	         end
	      endcase
	    end
	   else if (mem_rd_en)
			begin
	      case (cnt)
	        3'b001:
					 begin
	          SRAM_ADDR <= address;
	          cnt = cnt + 3'b001;
	         end
	        3'b010:
					 begin
	          SRAM_ADDR <= address + 1;
	          data_read_temp[15:0]  <= SRAM_DQ;
	          cnt <= cnt + 3'b001;
	         end
	        3'b011:
					 begin
	          SRAM_ADDR <= address + 2;
	          data_read_temp[31:16]  <= SRAM_DQ;
	          cnt <= cnt + 3'b001;
	         end
	        3'b110:
					 begin
	          cnt <= 3'b001;
	         end
	        default:
					 begin
	          cnt <= cnt + 3'b001;
	         end
	      endcase
	    end
  	end
  assign SRAM_DQ = (mem_wr_en) ? (data_write_temp) : (16'bzzzzzzzzzzzzzzzz);
  assign ready = (cnt != 3'b110 && sram_work ) ? 1'b1 : 1'b0;
  assign read_data = (mem_rd_en) ? (data_read_temp) : (32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz);
endmodule // SRAM
