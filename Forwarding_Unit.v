module Forwarding_Unit (
                        input[31:0] src1_EXE,
                        input[31:0] src2_EXE,
                        input[31:0] ST_src_EXE,
                        input[4:0] dest_MEM,
                        input[4:0] dest_WB,
                        input WB_EN_MEM,
                        input WB_EN_WB,
                        input is_two_source,

                        output[1:0] val1_sel,
                        output[1:0] val2_sel,
                        output[1:0] ST_val_sel
                       );

    assign val1_sel = (WB_EN_MEM && src1_EXE[4:0] == dest_MEM) ? 2'b01 :
                      (WB_EN_WB && src1_EXE[4:0] == dest_WB) ? 2'b10 :
                      2'b00;
    assign val2_sel = (is_two_source && WB_EN_MEM && src2_EXE[4:0] == dest_MEM) ? 2'b01 :
                      (is_two_source && WB_EN_WB && src2_EXE[4:0] == dest_WB) ? 2'b10 :
                      2'b00;
    assign ST_val_sel = val2_sel;
    // assign ST_val_sel = (is_two_source && WB_EN_MEM && ST_src_EXE[4:0] == dest_MEM) ? 2'b01 :
    //                     (is_two_source && WB_EN_WB && ST_src_EXE[4:0] == dest_WB) ? 2'b10 :
    //                     2'b00;

endmodule
