module Data_Memory(input [31:0]address,write_data,input mem_read,mem_write,input clk,rst,output [31:0] read_data);
  reg [31:0] memory [255:0];
  assign read_data = mem_read ? memory[address] : 32'b0;

  always @ ( posedge clk ) begin
    if (mem_write) begin
      memory[address] = write_data;
    end

  end

endmodule //data_memory
