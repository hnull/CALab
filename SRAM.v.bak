module SRAM (input clk,
             input rst,
             input mem_wr_en,
             input mem_rd_en,
             input [31:0] address,
             input [31:0] write_data,

             output [31:0] read_data,

             output ready,

             inout [15:0] SRAM_DQ,
             output reg  [17:0] SRAM_ADDR,
             output SRAM_UB_N,
             output SRAM_LB_N,
             output reg SRAM_WE_N,
             output SRAM_CE_N,
             output SRAM_OE_N
              );
  integer cnt = 1;
  // integer cnt_read;
  reg [15:0] data_write_temp;
  reg [31:0] data_read_temp;
  wire sram_work;

  assign sram_work = (mem_rd_en || mem_wr_en);
  assign SRAM_UB_N = 1'b0;
  assign SRAM_LB_N = 1'b0;
  assign SRAM_CE_N = 1'b0;
  assign SRAM_OE_N = 1'b0;


  always @ ( posedge clk, posedge rst ) begin
    if (mem_wr_en) begin
      case (cnt)
        1:begin
          SRAM_WE_N <= 1'b0;
          data_write_temp <= write_data[15:0];
          SRAM_ADDR <= address;
          cnt = cnt + 1;
         end
        2:begin
          SRAM_WE_N <= 1'b0;
          data_write_temp <= write_data[31:16];
          SRAM_ADDR <= address + 1;
          cnt = cnt + 1;
         end
        6:begin
          cnt = 1;
        end
        default:begin
          // SRAM_WE_N <= 1'bz;
          cnt = cnt + 1;
        end
      endcase
    end
    else if (mem_rd_en) begin
      case (cnt)
        1:begin
          SRAM_ADDR <= address;
          cnt = cnt + 1;
          end

        2:begin
          SRAM_ADDR <= address + 1;
          data_read_temp[15:0]  <= SRAM_DQ;
          cnt = cnt + 1;
         end

        3:begin
          SRAM_ADDR <= address + 2;
          data_read_temp[31:16]  <= SRAM_DQ;
          cnt = cnt + 1;
         end

        6:begin
          cnt = 1;
         end

        default:begin
         cnt = cnt + 1;
        end

      endcase
    end


  end
  assign SRAM_DQ = (mem_wr_en) ? (data_write_temp) : (16'bzzzzzzzzzzzzzzzz);
  assign ready = (cnt != 6 && sram_work ) ? 1'b1 : 1'b0;
  assign read_data = (mem_rd_en) ? (data_read_temp) : (32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz);
endmodule // SRAM
