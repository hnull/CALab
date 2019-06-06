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
  input [63:0] sram_rdata,
  input sram_ready
  );
  reg[72:0] way_1 [63:0];
  reg[72:0] way_2 [63:0];
  reg [63:0] least_recent_used;
  reg [8:0] tag;
  reg [5:0] index;
  reg first_or_second;

  assign tag = address[15:7];
  assign index = address[6:1];
  assign first_or_second = address[0];

  always @ (posedge rst,posedge clk) begin
    if (rst) begin
      way_1[63:0] <= 72'b0;
      way_2[63:0] <= 72'b0;
    end

    if (hit == 1'b0) begin

    end

  end

  assign rdata = (hit) ? (
    (valid1) ? ((first_or_second) ? (way_1[index][31:0] : way_1[index][63:32])) : ((first_or_second) ? (way_2[index][31:0] : way_2[index][63:32]));
    ) : sram_rdata[31:0] ;

  assign valid1 = ( way_1[index][73] && (tag_in == way_1[index][64:72]));
  assign valid2 = (way_2[index][73] && (tag_in == way_2[index][64:72]));
  assign hit = ((valid1 || valid2));
endmodule // cache_controller
