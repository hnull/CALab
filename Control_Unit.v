module Control_Unit(
    input[5:0] Op_Code,
    output reg [3:0] Alu_Command, output reg mem_read,mem_write,
    output reg [1:0] branch_type,
    output reg wb_enable,is_immediate
  );
  always@(*) begin
   case(Op_Code)
      6'b000000: Alu_Command <= 4'bxxxx;  //0
      6'b000001: begin Alu_Command <= 4'b0000; wb_enable <=1'b1; end //1
      6'b000011: begin Alu_Command <= 4'b0010; wb_enable <=1'b1;  end //3
      6'b000101: begin Alu_Command <= 4'b0100; wb_enable <=1'b1;  end//5
      6'b000110: begin Alu_Command <= 4'b0101; wb_enable <=1'b1;  end //6
      6'b000111: begin Alu_Command <= 4'b0110; wb_enable <=1'b1;  end //7
      6'b001000: begin Alu_Command <= 4'b0111; wb_enable <=1'b1;  end//8
      6'b001001: begin Alu_Command <= 4'b1000; wb_enable <=1'b1;  end//9
      6'b001010: begin Alu_Command <= 4'b1000; wb_enable <=1'b1;  end//10
      6'b001011: begin Alu_Command <= 4'b1001; wb_enable <=1'b1;  end//11
      6'b001100: begin Alu_Command <= 4'b1010; wb_enable <=1'b1;  end//12
      6'b100000: begin Alu_Command <= 4'b0000; wb_enable <=1'b1;
                       is_immediate <=1'b1;end//32
      6'b100001: begin Alu_Command <= 4'b0010; wb_enable <=1'b1;
                       is_immediate <=1'b1;end//33
      6'b100100: begin Alu_Command <= 4'b0000; mem_read<=1'b1;
                       wb_enable <=1'b1;
                       is_immediate <= 1'b1; end//36
      6'b100101: begin Alu_Command <= 4'b0000; mem_write <=1'b1; is_immediate <= 1'b1; end//37
      6'b101000: begin Alu_Command <= 4'bxxxx; branch_type <= 2'b01; is_immediate <= 1'b1; end //branch_taken <=1;  end//40
      6'b101001: begin Alu_Command <= 4'bxxxx; branch_type <= 2'b10; is_immediate <= 1'b1; end// branch_taken <=1;  end//41
      6'b101010: begin Alu_Command <= 4'bxxxx; branch_type <= 2'b11; is_immediate <= 1'b1; end //branch_taken <=1; end//42
		default: 
			begin      
				Alu_Command<=4'b0000;
				mem_read<=1'b0;
				mem_write<=1'b0;
				wb_enable<=1'b0;
				branch_type<=2'b0;
				is_immediate<=1'b0;
			end
    endcase
  end
endmodule
