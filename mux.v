module mux (
    input wb_select,
    input [31:0] read_data,
    input [31:0] result,
    output [31:0] write_data
);

assign write_data = (wb_select) ? read_data : result;

endmodule
