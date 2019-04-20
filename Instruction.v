module Instruction
  (
    input[31:0] adrs,
    output[31:0] inst
  );

  wire [31:0] Mem [999:0];

  assign Mem[0] = 32'b00000000000000000000000000000000;

  assign Mem[4] =	32'b10000000000000010000011000001010;//-- Addi r1 ,r0 ,1546 //r1=1546
  assign Mem[8] =	32'b00000000000000000000000000000000;
  assign Mem[12] = 32'b00000000000000000000000000000000;
  assign Mem[16] =	32'b00000100000000010001000000000000;//-- Add r2 ,r0 ,r1//r2=1546
  assign Mem[20] =	32'b00001100000000010001100000000000;//-- sub r3 ,r0 ,r1//r3=-1546
  assign Mem[24] =	32'b00000000000000000000000000000000;
  assign Mem[28] =	32'b00000000000000000000000000000000;
  assign Mem[32] =	32'b00010100010000110010000000000000; //--and r4,r2,r3 //r4=2
  assign Mem[36] =	32'b10000100011001010001101000110100; //--subi r5,r3,//r5=-8254
  assign Mem[40] =	32'b00011000011001000010100000000000; //--or r5,r3,r4 //r5=-1546
  assign Mem[44] =	32'b00000000000000000000000000000000;
  assign Mem[48] =	32'b00000000000000000000000000000000;
  assign Mem[52] =	32'b00011100101000000011000000000000; //--nor r6,r5,r0//r6=1545
  assign Mem[56] =	32'b00011100100000000101100000000000; //--nor r11,r4,r0//r11=-3
  assign Mem[60] =	32'b00001100101001010010100000000000; //--sub r5,r5,r5//r5=0
  assign Mem[64] =	32'b10000000000000010000010000000000; //--addi r1,r0,1024 //r1=1024
  assign Mem[68] =	32'b00000000000000000000000000000000;
  assign Mem[72] =	32'b00000000000000000000000000000000;
  assign Mem[76] =	32'b10010100001000100000000000000000;//-- st r2 ,r1 ,0 //
  assign Mem[80] =	32'b10010000001001010000000000000000;//-- ld r5 ,r1 ,0 //r5=1546
  assign Mem[84] =	32'b00000000000000000000000000000000;
  assign Mem[88] =	32'b00000000000000000000000000000000;
  assign Mem[92] =	32'b10100000101000000000000000000011;//-- Bez r5 ,1//not taken/////////////////////////////ok//////////////////////////////////
  assign Mem[96] =	32'b00000000000000000000000000000000;
  assign Mem[100] =	32'b00000000000000000000000000000000;
  assign Mem[104] =	32'b00100000101000010011100000000000;//-- xor r7 ,r5 ,r1 //r7=522
  assign Mem[108] =	32'b00000000000000000000000000000000;//dota baedi dare r7 ro estefade mikone
  assign Mem[112] =	32'b00100000101000010000000000000000;//-- xor r0 ,r5 ,r1 //r0=0
  assign Mem[116] =	32'b00100100011001000011100000000000;//-- sla r7 ,r3 ,r4//r7=-6184
  assign Mem[120] =	32'b10010100001001110000000000010100;//-- st r7 ,r1 ,20
  assign Mem[124] =	32'b00101000011001000100000000000000;//-- sll r8 ,r3 ,r4  //r8= -387
  assign Mem[128] =	32'b00101100011001000100100000000000;//-- sra r9 ,r3 ,r4 //r9=1073741437
  assign Mem[132] =	32'b00110000011001000101000000000000;//-- srl r10 ,r3 ,r4//r10=-384
  assign Mem[136] =	32'b10010100001000110000000000000100;//-- st r3 ,r1 ,4
  // assign Mem[140] =	32'b00000000000000000000000000000000;//inja chera gozashte bodi
  // assign Mem[144] =	32'b00000000000000000000000000000000;//inja chera gozashte bodi
  assign Mem[140] =	32'b10010100001001000000000000001000;//-- st r4 ,r1 ,8
  assign Mem[144] =	32'b10010100001001010000000000001100;//-- st r5 ,r1 ,12
  assign Mem[148] =	32'b10010100001001100000000000010000;//-- st r6 ,r1 ,16
  assign Mem[152] =	32'b10010000001010110000000000000100;//-- ld r11 ,r1 ,4//r11=-1456
  assign Mem[156] =	32'b10010100001010110000000000011000;//-- st r11 ,r1 ,24
  assign Mem[160] =	32'b10010100001010010000000000011100;//-- st r9 ,r1 ,28
  assign Mem[164] =	32'b10010100001010100000000000100000;//-- st r10 ,r1 ,32
  assign Mem[168] =	32'b10010100001010000000000000100100;//-- st r8 ,r1 ,36
  assign Mem[172] =	32'b10000000000000010000000000000011;//-- Addi r1 ,r0 ,3 //r1=3
  assign Mem[176] =	32'b00000000000000000000000000000000;
  assign Mem[180] =	32'b00000000000000000000000000000000;
  assign Mem[184] =	32'b10000000000001000000010000000000;//-- Addi r4 ,r0 ,1024   //r4=1024
  assign Mem[188] =	32'b10000000000000100000000000000000;//-- Addi r2 ,r0 ,0 //r2=0
  assign Mem[192] =	32'b10000000000000110000000000000001;//-- Addi r3 ,r0 ,1 //r3=1
  assign Mem[196] =	32'b10000000000010010000000000000010;//-- Addi r9 ,r0 ,2 //r9=2
  assign Mem[200] =	32'b00000000000000000000000000000000;
  assign Mem[204] =	32'b00000000000000000000000000000000;
  assign Mem[208] =	32'b00101000011010010100000000000000;//-- sll r8 ,r3 ,r9 //r8=r3*4
  assign Mem[212] =	32'b00000000000000000000000000000000;
  assign Mem[216] =	32'b00000000000000000000000000000000;
  assign Mem[220] =	32'b00000100100010000100000000000000;//-- Add r8 ,r4 ,r8 //r8=1024+r3*4
  assign Mem[224] =	32'b00000000000000000000000000000000;
  assign Mem[228] =	32'b00000000000000000000000000000000;
  assign Mem[232] =	32'b10010001000001010000000000000000;//-- ld r5 ,r8 ,0 //
  assign Mem[236] =	32'b10010001000001101111111111111100;//-- ld r6 ,r8 ,-4 //
  assign Mem[240] =	32'b00000000000000000000000000000000;
  assign Mem[244] =	32'b00000000000000000000000000000000;
  assign Mem[248] =	32'b00001100101001100100100000000000;//-- sub r9 ,r5 ,r6 //-3092
  assign Mem[252] =	32'b10000000000010101000000000000000;//-- Addi r10 ,r0 ,0x8000 //-32768
  assign Mem[256] =	32'b10000000000010110000000000010000;//-- Addi r11 ,r0 ,16 //16
  assign Mem[260] =	32'b00000000000000000000000000000000;
  assign Mem[264] =	32'b00000000000000000000000000000000;
  assign Mem[268] =	32'b00101001010010110101000000000000;//-- sll r10 ,r1 ,r11 //2
  assign Mem[272] =	32'b00000000000000000000000000000000;
  assign Mem[276] =	32'b00000000000000000000000000000000;
  assign Mem[280] =	32'b00010101001010100100100000000000;//-- And r9 ,r9 ,r10 // if(r5>r6) r9=0 else r9=-2147483648
  assign Mem[284] =	32'b00000000000000000000000000000000;
  assign Mem[288] =	32'b00000000000000000000000000000000;
  assign Mem[292] =	32'b10100001001000000000000000000010;//-- Bez r9 ,2//////////////////////////////////////////////////////////////////////////////////////////////////
  assign Mem[296] =	32'b10010101000001011111111111111100;//-- st r5 ,r8 ,-4
  assign Mem[300] =	32'b10010101000001100000000000000000;//-- st r6 ,r8 ,0
  assign Mem[304] =	32'b10000000011000110000000000000001;//-- Addi r3 ,r3 ,1 //2
  assign Mem[308] =	32'b00000000000000000000000000000000;
  assign Mem[312] =	32'b00000000000000000000000000000000;
  assign Mem[316] =	32'b10100100001000111111111111100001;//-- BNE r1 ,r3 ,-15////////////////////////////ok///////////////////////////////////////////////////////////////////////////
  assign Mem[320] =	32'b10000000010000100000000000000001;//-- Addi r2 ,r2 ,1 //2
  assign Mem[324] =	32'b00000000000000000000000000000000;
  assign Mem[328] =	32'b00000000000000000000000000000000;
  assign Mem[332] =	32'b10100100001000101111111111011100;//-- BNE r1 ,r2 ,-18/////////////////////////////ok////////////////////////////////////////////////////////////////////////
  assign Mem[336] =	32'b00000000000000000000000000000000;//dota paeein tar az r1 estefade karde
  assign Mem[340] =	32'b00000000000000000000000000000000;
  assign Mem[344] =	32'b10000000000000010000010000000000;//-- Addi r1 ,r0 ,1024 //r1=1024
  assign Mem[348] =	32'b00000000000000000000000000000000;
  assign Mem[352] =	32'b00000000000000000000000000000000;
  assign Mem[356] =	32'b10010000001000100000000000000000;//-- ld ,r2 ,r1 ,0 //r2=-1546
  assign Mem[360] =	32'b10010000001000110000000000000100;//-- ld ,r3 ,r1 ,4 //r3=2
  assign Mem[364] =	32'b10010000001001000000000000001000;//-- ld ,r4 ,r1 ,8 //r4=1546
  assign Mem[368] =	32'b10010000001001000000001000001000;//-- ld ,r4 ,r1 ,520 // after SRAM r4=random number
  assign Mem[372] =	32'b10010000001001000000010000001000;//-- ld ,r4 ,r1 ,1023 // after SRAM r4=random number
  assign Mem[376] =	32'b10010000001001010000000000001100;//-- ld ,r5 ,r1 ,12 // r5=1546
  assign Mem[380] =	32'b10010000001001100000000000010000;//-- ld ,r6 ,r1 ,16 //r6=1545
  assign Mem[384] =	32'b10010000001001110000000000010100;//-- ld ,r7 ,r1 ,20 //r7=-6184
  assign Mem[388] =	32'b10010000001010000000000000011000;//-- ld ,r8 ,r1 ,24 //r8=-1546
  assign Mem[392] =	32'b10010000001010010000000000011100;//-- ld ,r9 ,r1 ,28 //r9=1073741437
  assign Mem[396] =	32'b10010000001010100000000000100000;//-- ld ,r10,r1 ,32 //r10=-387
  assign Mem[400] =	32'b10010000001010110000000000100100;//-- ld ,r11,r1 ,36 //r11=-6184 // when change report execution clock
  assign Mem[404] =	32'b10101000000000001111111111111111;//-- JMP -1*/
  // assign Mem[4] = 32'b10000000000000010000011000001010;
  // assign Mem[8] = 32'b00000100000000010001000000000000;
  // assign Mem[12] = 32'b00001100000000010001100000000000;
  // assign Mem[16] = 32'b00010100010000110010000000000000;
  // assign Mem[20] = 32'b10000100011001010001101000110100;
  // assign Mem[24] = 32'b00011000011001000010100000000000;
  assign inst = Mem[adrs];

endmodule
