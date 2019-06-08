module cache_controller
  (
    input clk,
    input rst,

    //memory stage unit
    input [31:0] address,
    input [31:0] wdata,
    input   MEM_R_EN,
    input   MEM_W_EN,
    input   sram_ready,
    input [63:0] sram_rdata,
    output [31:0] rdata,
    output ready,

    //SRAM cache_controller
    // output [31:0] sram_address,
    // output [31:0] sram_wdata,
    output reg SRAM_mem_read,
    output reg SRAM_mem_write,
    output freeze
  );

  reg[73:0] way_1 [63:0];
  reg[73:0] way_2 [63:0];
  reg [63:0] least_recent_used; // = 0 yani way1 akharin estefade ra darad , =1 yani way2 akharin estefade ra darad
  wire [8:0] tag;
  wire [5:0] index;
  wire valid1,valid2,hit;
  wire first_or_second;

  assign tag = address[15:7];
  assign index = address[6:1];
  assign first_or_second = (address[0]) ? 1'b1 : 1'b0;

  integer i;
  always @ (posedge rst,posedge clk)
   begin
    if(rst)
      begin
        SRAM_mem_write <= 1'b0;
        SRAM_mem_read <= 1'b0;
        for(i = 0; i < 64 ; i = i + 1)
          begin
            way_1[i][73:0] <= {1'b0,9'b0,32'b0,32'b0};
            way_2[i][73:0] <= {1'b0,9'b0,32'b0,32'b0};
          end
      end
    else
      begin
        if (MEM_R_EN == 1'b1)
          begin
            if (hit == 1'b1)
              begin
                if (valid1)
                  least_recent_used[index] = 1'b0;
                else if (valid2)
                  least_recent_used[index] = 1'b1;
              end //hit 1
            else if (hit == 1'b0)
              begin
                SRAM_mem_read <= 1'b1;
              if(least_recent_used[index] == 1'b0 && sram_ready)
                begin
                  {way_2[index][63:0], way_2[index][72:64], way_2[index][73], least_recent_used[index]} = {sram_rdata, tag, 1'b1,1'b1};
                  // way_2[index][63:0] = sram_rdata;
                  // way_2[index][72:64] = tag;
                  // way_2[index][73] = 1'b1;
                  // least_recent_used[index] == 1'b1;
                end
              else if(least_recent_used[index] == 1'b0 && sram_ready)
                begin
                  {way_1[index][63:0], way_1[index][72:64], way_1[index][73], least_recent_used[index]} = {sram_rdata, tag, 1'b1,1'b0};
                  // way_1[index][63:0] = sram_rdata;
                  // way_1[index][72:64] = tag;
                  // way_1[index][73] = 1'b1;
                  // least_recent_used[index] == 1'b0;
                end
            end //hit 0
          end //mem read en

        else if(MEM_W_EN == 1'b1)
          begin
            SRAM_mem_write <= 1'b1;
              if (valid1 == 1'b1)
                begin
                  way_1[index][73] = 1'b0;
                  least_recent_used[index] = 1'b0;
                end
              else if (valid2 == 1'b1)
                begin
                  way_2[index][73] = 1'b0;
                  least_recent_used[index] = 1'b1;
                end
          end //mem write en
        else if (sram_ready)
          begin
            SRAM_mem_write <= 1'b0;
            SRAM_mem_read <= 1'b0;
          end
      end
   end

  assign rdata = (hit) ?
                 (
                   (valid1) ? ((first_or_second) ? (way_1[index][31:0]) : (way_1[index][63:32])) :
                              ((first_or_second) ? (way_2[index][31:0]) : (way_2[index][63:32]))
                 ) : sram_rdata[31:0];

  assign valid1 = (way_1[index][73] && (tag == way_1[index][72:64]));
  assign valid2 = (way_2[index][73] && (tag == way_2[index][72:64]));
  assign hit = ((valid1 || valid2)) && (MEM_R_EN);
  assign freeze = (sram_ready) ? (hit) ? 1'b1 : 1'b0 : 1'b0;

endmodule // cache_controller
