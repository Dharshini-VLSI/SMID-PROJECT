module reg_file(
        input clk,
        input wire [1:0] rf_des_addr,
        input wire [1:0] rf_src1_addr,
        input wire [1:0] rf_src2_addr,
        input wire [31:0] rf_des_data,
        input wire [7:0] immediate,
        input wire [3:0] reserve,
        input wr_enable,
        output [31:0] rf_read_data1,
        output [31:0] rf_read_data2
    );

    reg [31:0] reg_data [0:3];
    initial begin
        reg_data[0] = 32'h1234;
        reg_data[1] = 32'h5678;
        reg_data[2] = 32'h9abc;
        reg_data[3] = 32'hdef;
    end

    assign rf_read_data1 = reg_data[rf_src1_addr];
    assign rf_read_data2 = reg_data[rf_src2_addr];

    always@(posedge clk) begin
        if (wr_enable) begin
            reg_data[rf_des_addr] <= rf_des_data;
            reg_data[rf_src1_addr] = 32'hBDFACE;
            reg_data[rf_src2_addr] = 32'hABCDEF;
        end
    end


endmodule

