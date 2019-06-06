module cache_controller (
  input clk,
  input rst,
  //memory stage unit
  input [31:0] address,
  input [31:0] wdata,
  input   MEM_R_EN,
  input   MEM_W_EN,
  output [31:0] rdata,
  output ready,

  //SRAM cache_controller
  output [31:0] sram_address,
  output [31:0] sram_wdata,
  output write,
  output reg SRAM_mem_read,
  output reg SRAM_mem_write,
  input [63:0] sram_rdata,
  input sram_ready
  );
  reg[72:0] way_1 [63:0];
  reg[72:0] way_2 [63:0];
  reg [63:0] least_recent_used; // = 0 yani way1 akharin estefade ra darad , =1 yani way2 akharin estefade ra darad
  reg [8:0] tag;
  reg [5:0] index;
  wire valid1,valid2,hit;
  reg first_or_second;

  assign tag = address[15:7];
  assign index = address[6:1];
  assign first_or_second = address[0];

  always @ (posedge rst,posedge clk) begin
    if (rst) begin
      way_1[63:0] <= 72'b0;
      way_2[63:0] <= 72'b0;
    end
    else
        else if(MEM_R_EN == 1'b1)

          if (hit == 1'b1) begin
            if (valid1)
              least_recent_used[index] = 1'b0;
            else if(valid2)
              least_recent_used[index] = 1'b1;
          end//hit 1

          else if(hit == 1'b0)begin
            SRAM_mem_read <= 1'b1;

            if(least_recent_used[index] == 1'b0) begin
              way_2[index][63:0] = sram_rdata;
              way_2[index][72:64] = tag;
              way_2[index][73] = 1'b1;
              least_recent_used[index] == 1'b1;
            end
            else begin
              way_1[index][63:0] = sram_rdata;
              way_1[index][72:64] = tag;
              way_1[index][73] = 1'b1;
              least_recent_used[index] == 1'b0;
            end

          end//hit 0

        end//mem read en

        else if(MEM_W_EN == 1'b1)begin
           SRAM_mem_write <= 1'b1;
           if (valid1 == 1'b1) begin
               way_1[index] = 1'b0;
               least_recent_used[index] == 1'b0;
           end

           else if(valid2 == 1'b1)begin
              way_2[index] = 1'b0;
              least_recent_used[index] == 1'b1;
           end

        end//mem
        else if(sram_ready)begin
              SRAM_mem_write <= 1'b0;
              SRAM_mem_read <= 1'b0;
        end
    begin //not reset

  end

  assign rdata = (hit) ? (
    (valid1) ? ((first_or_second) ? (way_1[index][31:0] : way_1[index][63:32])) : ((first_or_second) ? (way_2[index][31:0] : way_2[index][63:32]));
    ) : sram_rdata[31:0] ;

  assign valid1 = ( way_1[index][73] && (tag_in == way_1[index][72:64]));
  assign valid2 = (way_2[index][73] && (tag_in == way_2[index][72:64]));
  assign hit = ((valid1 || valid2));
endmodule // cache_controller
