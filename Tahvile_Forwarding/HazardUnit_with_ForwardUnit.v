module HazardUnit_with_ForwardUnit (
                    input [4:0] Src1, Src2,
                    input [4:0] Exe_dst,
                    input is_two_source,
                    input Mem_R_EN,

                    output Hazard_detected_signal
                   );

    // assign  Hazard_detected_signal = (is_two_source == 1'b1 && Exe_wb_en == 1'b1 && (Src1 == Exe_dst || Src2 == Exe_dst)) ? 1'b1 :
    //                                  (is_two_source == 1'b1 && Mem_wb_en == 1'b1 && (Src1 == Mem_dst || Src2 == Mem_dst)) ? 1'b1 :
    //                                  (is_two_source == 1'b0 && Exe_wb_en == 1'b1 && (Src1 == Exe_dst)) ? 1'b1 :
    //                                  (is_two_source == 1'b0 && Mem_wb_en == 1'b1 && (Src1 == Mem_dst)) ? 1'b1 :
    //                                  1'b0;
    //
    assign  Hazard_detected_signal =  (is_two_source == 1'b1 && Mem_R_EN == 1'b1 && (Src1 == Exe_dst || Src2 == Exe_dst)) ? 1'b1 :
                                      (is_two_source == 1'b0 && Mem_R_EN == 1'b1 && Src1 == Exe_dst) ? 1'b1 :
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
