module mem_data(
    input clk,
    input mem_wr_en,
    input mem_rd_en,
    input wire [7:0] address,
    input wire [31:0] write_data,
    output [31:0] read_data 
);

reg [31:0] mem_location [0:255];


assign read_data = (mem_rd_en) ? mem_location[address] : mem_location[0];

//assign read_data = mem_location[address];

always@(posedge clk) begin
    if (mem_wr_en) begin
        mem_location[address] = write_data;
    end
end
initial begin
    mem_location[0] = 32'h00000000;
end


endmodule