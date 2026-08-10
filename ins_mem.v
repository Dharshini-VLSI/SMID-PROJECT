module instruction_memory(
    input clk,
    input wire [23:0] inputinstruction,
    input wire [7:0] ins_address,
    output reg [23:0] ins_dec
);

reg [23:0] ins_loc [255:0];

initial begin
ins_dec = 24'b0;
end

always@(posedge clk) begin
    ins_loc[ins_address] = inputinstruction;
 ins_dec = ins_loc[ins_address];
end

endmodule