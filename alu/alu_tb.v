module alu_tb();

    reg [3:0] opcode;
    reg [1:0] bit_sel;
    reg [31:0] A;
    reg [31:0] B;
    wire [31:0] Out;

    alu dut(
        .opcode(opcode),
        .bit_sel(bit_sel),
        .A(A),
        .B(B),
        .Out(Out)
    );

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0,alu_tb);
        $monitor("Time=%0t | Opcode=%b | BitSel=%b | A=%d | B=%d | Out=%d", $time, opcode, bit_sel, A, B, Out);
        A = 32'd10;
        B = 32'd5;
        opcode = 4'b0000;
        bit_sel = 2'b00;
        #10;

        A = 32'd10;
        B = 32'd5;
        opcode = 4'b0001;
        bit_sel = 2'b00;
        #10;

        A = 32'd10;
        B = 32'd5;
        opcode = 4'b0010;
        bit_sel = 2'b00;
        #10;

        A = 32'd10;
        B = 32'd5;
        opcode = 4'b0011;
        bit_sel = 2'b00;
        #10;

        A = 32'd10;
        B = 32'd5;
        opcode = 4'b0100;
        bit_sel = 2'b00;
        #10;

        A = 32'd10;
        B = 32'd5;
        opcode = 4'b0101;
        bit_sel = 2'b00;
        #10;

        A = 32'd10;
        B = 32'd5;
        opcode = 4'b0110;
        bit_sel = 2'b00;
        #10;

        A = 32'd10;
        B = 32'd5;
        opcode = 4'b0111;
        bit_sel = 2'b00;
        #10;
        $finish;
    end
endmodule