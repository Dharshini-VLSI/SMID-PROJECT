module alu(
input [3:0] opcode,
    input [1:0] bit_sel,
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] Out
    
    wire [31:0] add_result, mul_result, shift_result, and_result, or_result, xor_result, not_result;
    wire D, O, H, Q;
    reg sub, left;

    adder add(
        .A(A),
        .B(B),
        .Out(add_result),
        .sub(sub),
        .D(D),
        .O(O),
        .H(H),
        .Q(Q)
    );
    multiplier mul(
        .A(A),
        .B(B),
        .Out(mul_result),
        .D(D),
        .O(O),
        .H(H),
        .Q(Q)
    );
    shifter shift(
        .A(A),
        .Out(shift_result),
        .left(left),
        .D(D),
        .O(O),
        .H(H),
        .Q(Q)
    );
    logic and(
        .A(A),
        .B(B),
        .Out(and_result),
        .D(D),
        .O(O),
        .H(H),
        .Q(Q)
    );
    logic or(
        .A(A),
        .B(B),
        .Out(or_result),
        .D(D),
        .O(O),
        .H(H),
        .Q(Q)
    );
    logic xor(
        .A(A),
        .B(B),
        .Out(xor_result),
        .D(D),
        .O(O),
        .H(H),
        .Q(Q)
    );
    logic not(
        .A(A),
        .Out(not_result),
        .D(D),
        .O(O),
        .H(H),
        .Q(Q)
    );

    assign D = (bit_sel == 2'b00);
    assign O = (bit_sel == 2'b01);
    assign H = (bit_sel == 2'b10);
    assign Q = (bit_sel == 2'b11);

    always @(*)
    sub = 1'b0;
    left = 1'b0;
    
    case (opcode[3:0])
    4'b0000: Out = add_result;
    4'b0001: Out = sub_result;
    4'b0010: Out = mul_result;
    4'b0011: Out = shift_result;
    4'b0100: Out = and_result;
    4'b0101: Out = or_result;
    4'b0110: Out = xor_result;
    4'b0111: Out = not_result;
    default: Out = 32'd0;
    endcase
endmodule
