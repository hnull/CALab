module Hazard_Unit (
                    input [4:0] Src1,Src2;
                    input Exe_wb_en;
                    input [4:0] Exe_dst;
                    input [4:0] Mem_dst;
                    input Mem_wb_en;
              //      input Is_immediate;

                    output Hazard_detected_signal;
                   );

    assign  Hazard_detected_signal = (Exe_wb_en) ? (Src1 == Exe_dst || Src2 == Exe_dst) ? 1'b1 :
                                     (Mem_wb_en) ? (Src1 == Mem_dst || Src2 == Mem_dst) ? 1'b1 :
                                      1'b0;

    // always @ ( * ) begin
    //      if (Is_immediate && Exe_wb_en) begin
    //        if (src1 == Exe_dst || src2 == Exe_dst) begin
    //          Hazard_detected_signal = 1'b1;
    //        end
    //      end
    //      if (Mem_wb_en) begin
    //        if (src1 == Mem_dst || src2 == Mem_dst) begin
    //          Hazard_detected_signal = 1'b1;
    //        end
    //      end
    // end
endmodule // Hazard_Unit
