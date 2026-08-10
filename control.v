module control(
        input wire [3:0] opcode,
        output wr_en_rf,
        output wr_en_dm,
        output rd_en_dm,
        output sel_mux
    );

    assign wr_en_rf = opcode[3];
    assign wr_en_dm = opcode[2];
    assign rd_en_dm = opcode[1];
    assign sel_mux  = opcode[0];

endmodule //control


