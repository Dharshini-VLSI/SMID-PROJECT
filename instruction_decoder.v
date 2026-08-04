module instruction_decoder (
    input wire [23:0] instruction,
    output reg [3:0] opcode,
    output reg [1:0] bit_sel,
    output reg [1:0] des_addr,
    output reg [1:0] src1_addr,
    output reg [1:0] src2_addr,
    output reg [11:0] immediate,
    output reg [3:0] future
);

always@(*) begin
    opcode <= instruction[23:20];
    bit_sel <= instruction[19:18];
    des_addr <= instruction[17:16];
    src1_addr <= instruction[15:14];
    src2_addr <= instruction[13:12];
    immediate <= instruction[11:4];
    future <= instruction[3:0];
    
end 
endmodule
