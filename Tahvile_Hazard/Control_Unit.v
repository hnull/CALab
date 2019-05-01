module Control_Unit(
    input[5:0] Op_Code,
    output [3:0] Alu_Command, output mem_read,mem_write,
    output [1:0] branch_type,
    output wb_enable,is_immediate
  );
  assign Alu_Command = (Op_Code == 6'b000000) ?  4'bxxxx ://0
                       (Op_Code == 6'b000001) ?  4'b0000 ://1
                       (Op_Code == 6'b000011) ?  4'b0010 ://3
                       (Op_Code == 6'b000101) ?  4'b0100 ://5
                       (Op_Code == 6'b000110) ?  4'b0101 ://6
                       (Op_Code == 6'b000111) ?  4'b0110 ://7
                       (Op_Code == 6'b001000) ?  4'b0111 ://8
                       (Op_Code == 6'b001001) ?  4'b1000 ://9
                       (Op_Code == 6'b001010) ?  4'b1000 ://10
                       (Op_Code == 6'b001011) ?  4'b1001 ://11
                       (Op_Code == 6'b001100) ?  4'b1010 ://12
                       (Op_Code == 6'b100000) ?  4'b0000 ://32
                       (Op_Code == 6'b100001) ?  4'b0010 ://33
                       (Op_Code == 6'b100100) ?  4'b0000 ://36
                       (Op_Code == 6'b100101) ?  4'b0000 ://37
                       (Op_Code == 6'b101000) ?  4'bxxxx ://40
                       (Op_Code == 6'b101001) ?  4'bxxxx ://41
                       (Op_Code == 6'b101010) ?  4'bxxxx ://42
                       4'bxxxx;//default ine ya 0000  bayad gozasht ?


  assign wb_enable =   (Op_Code == 6'b000000) ?  1'b1 ://0
                       (Op_Code == 6'b000001) ?  1'b1 ://1
                       (Op_Code == 6'b000011) ?  1'b1 ://3
                       (Op_Code == 6'b000101) ?  1'b1 ://5
                       (Op_Code == 6'b000110) ?  1'b1 ://6
                       (Op_Code == 6'b000111) ?  1'b1 ://7
                       (Op_Code == 6'b001000) ?  1'b1 ://8
                       (Op_Code == 6'b001001) ?  1'b1 ://9
                       (Op_Code == 6'b001010) ?  1'b1 ://10
                       (Op_Code == 6'b001011) ?  1'b1 ://11
                       (Op_Code == 6'b001100) ?  1'b1 ://12
                       (Op_Code == 6'b100000) ?  1'b1 ://32
                       (Op_Code == 6'b100001) ?  1'b1 ://33
                       (Op_Code == 6'b100100) ?  1'b1 ://36
                       // (Op_Code == 6'b100101) ?  1'b1 ://37
                       // (Op_Code == 6'b101000) ?  1'b1 ://40
                       // (Op_Code == 6'b101001) ?  1'b1 ://41
                       // (Op_Code == 6'b101010) ?  1'b1 ://42
                       1'b0;//default ine ya 0000  bayad gozasht ?

  assign is_immediate =  //(Op_Code == 6'b000000) ?  1'b1 ://0
                         // (Op_Code == 6'b000001) ?  1'b1 ://1
                         // (Op_Code == 6'b000011) ?  1'b1 ://3
                         // (Op_Code == 6'b000101) ?  1'b1 ://5
                         // (Op_Code == 6'b000110) ?  1'b1 ://6
                         // (Op_Code == 6'b000111) ?  1'b1 ://7
                         // (Op_Code == 6'b001000) ?  1'b1 ://8
                         // (Op_Code == 6'b001001) ?  1'b1 ://9
                         // (Op_Code == 6'b001010) ?  1'b1 ://10
                         // (Op_Code == 6'b001011) ?  1'b1 ://11
                         // (Op_Code == 6'b001100) ?  1'b1 ://12
                         (Op_Code == 6'b100000) ?  1'b1 ://32
                         (Op_Code == 6'b100001) ?  1'b1 ://33
                         (Op_Code == 6'b100100) ?  1'b1 ://36
                         (Op_Code == 6'b100101) ?  1'b1 ://37
                         (Op_Code == 6'b101000) ?  1'b1 ://40
                         (Op_Code == 6'b101001) ?  1'b1 ://41
                         (Op_Code == 6'b101010) ?  1'b1 ://42
                         1'b0;//default ine ya 0000  bayad gozasht ?

  assign mem_read = (Op_Code == 6'b100100) ? 1'b1: 1'b0;//36

  assign mem_write = (Op_Code == 6'b100101) ? 1'b1: 1'b0;//37

  assign branch_type = (Op_Code == 6'b101000) ?  2'b01 ://40
                       (Op_Code == 6'b101001) ?  2'b10 ://41
                       (Op_Code == 6'b101010) ?  2'b11 ://42
                       2'b00;//default ine ya 0000  bayad gozasht ?


  // always@(*) begin
  //  case(Op_Code)
  //     6'b000000: Alu_Command <= 4'bxxxx;  //0
  //     6'b000001: begin Alu_Command <= 4'b0000; wb_enable <=1'b1; end //1
  //     6'b000011: begin Alu_Command <= 4'b0010; wb_enable <=1'b1;  end //3
  //     6'b000101: begin Alu_Command <= 4'b0100; wb_enable <=1'b1;  end//5
  //     6'b000110: begin Alu_Command <= 4'b0101; wb_enable <=1'b1;  end //6
  //     6'b000111: begin Alu_Command <= 4'b0110; wb_enable <=1'b1;  end //7
  //     6'b001000: begin Alu_Command <= 4'b0111; wb_enable <=1'b1;  end//8
  //     6'b001001: begin Alu_Command <= 4'b1000; wb_enable <=1'b1;  end//9
  //     6'b001010: begin Alu_Command <= 4'b1000; wb_enable <=1'b1;  end//10
  //     6'b001011: begin Alu_Command <= 4'b1001; wb_enable <=1'b1;  end//11
  //     6'b001100: begin Alu_Command <= 4'b1010; wb_enable <=1'b1;  end//12
  //     6'b100000: begin Alu_Command <= 4'b0000; wb_enable <=1'b1;
  //                      is_immediate <=1'b1;end//32
  //     6'b100001: begin Alu_Command <= 4'b0010; wb_enable <=1'b1;
  //                      is_immediate <=1'b1;end//33
  //     6'b100100: begin Alu_Command <= 4'b0000; mem_read<=1'b1;
  //                      wb_enable <=1'b1;
  //                      is_immediate <= 1'b1; end//36
  //     6'b100101: begin Alu_Command <= 4'b0000; mem_write <=1'b1; is_immediate <= 1'b1; end//37
  //     6'b101000: begin Alu_Command <= 4'bxxxx; branch_type <= 2'b01; is_immediate <= 1'b1; end //branch_taken <=1;  end//40
  //     6'b101001: begin Alu_Command <= 4'bxxxx; branch_type <= 2'b10; is_immediate <= 1'b1; end// branch_taken <=1;  end//41
  //     6'b101010: begin Alu_Command <= 4'bxxxx; branch_type <= 2'b11; is_immediate <= 1'b1; end //branch_taken <=1; end//42
	// 	default:
	// 		begin
	// 			Alu_Command<=4'b0000;
	// 			mem_read<=1'b0;
	// 			mem_write<=1'b0;
	// 			wb_enable<=1'b0;
	// 			branch_type<=2'b0;
	// 			is_immediate<=1'b0;
	// 		end
  //   endcase
  // end

  endmodule
