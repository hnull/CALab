// module SRAM (input clk,rst,
//              input wr_en,
//              input rd_en,
//              input [31:0] address,
//              input [31:0] write_data,
//
//              output [31:0] read_data,
//
//              output ready,
//
//              inout [15:0] SRAM_DQ,
//              output [17:0] SRAM_ADDR,
//              output SRAM_UB_N,
//              output SRAM_LB_N,
//              output SRAM_WE_N,
//              output SRAM_WE_N,
//              output SRAM_CE_N,
//              output SRAM_OE_N
//               );
//   integer cnt_write;
//   integer cnt_read;
//   assign SRAM_UB_N = 1'b0;
//   assign SRAM_LB_N = 1'b0;
//   assign SRAM_WE_N = 1'b0;
//   assign SRAM_CE_N = 1'b0;
//
//   always @ ( posedge clk, posedge rst ) begin
//     if (wr_en) begin
//        SRAM_DQ <= write_data;
//        SRAM_ADDR <= address;
//        SRAM_WE_N <= 1'b0;
//     end
//     else if (rd_en) begin
//       case (cnt)
//         1: ;
//         2: ;
//         3: ;
//         4: ;
//         5: ;
//         6: ;
//         default: ;
//       endcase
//     end
//   end
// endmodule // SRAM
