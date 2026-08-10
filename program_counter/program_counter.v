module program_counter(
    input clk,
    input rst,
    input pc_enable,      // Increment enable
    input pc_load,        // Future branch/jump
    input [7:0] pc_in,
    output reg [7:0] pc
);

always @(posedge clk or posedge rst)
begin
    if (rst)
        pc <= 8'd0;

    else if (pc_load)
        pc <= pc_in;

    else if (pc_enable)
        pc <= pc + 8'd1;

    else
        pc <= pc;      // Hold PC
end

endmodule