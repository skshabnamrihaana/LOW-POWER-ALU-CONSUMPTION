// =================================================================
// Module: low_power_alu_8bit
// Strategy: Operand Isolation / Gated Inputs to limit switching activity
// =================================================================
module low_power_alu_8bit (
    input  wire [7:0] A,        // Operand A
    input  wire [7:0] B,        // Operand B
    input  wire [2:0] opcode,   // 3-bit Opcode (8 operations)
    output reg  [7:0] alu_out,  // 8-bit ALU Result
    output reg        carry_out // Carry Flag for Arithmetic
);

    // Internal gated operands to avoid unnecessary switching
    reg [7:0] gated_A;
    reg [7:0] gated_B;

    // Operand Isolation Logic
    // Inputs propagate to internal paths ONLY when that specific group is active.
    always @(*) begin
        case (opcode)
            3'b000, 3'b001: begin // Arithmetic (ADD, SUB)
                gated_A = A;
                gated_B = B;
            end
            3'b010, 3'b011, 3'b100, 3'b101: begin // Logical (AND, OR, XOR, NOT)
                gated_A = A;
                gated_B = (opcode == 3'b101) ? 8'b0 : B; // NOT only uses A
            end
            3'b110, 3'b111: begin // Shifts (LSL, LSR)
                gated_A = A;
                gated_B = B; // B can act as shift amount
            end
            default: begin
                gated_A = 8'b0;
                gated_B = 8'b0;
            end
        endcase
    end

    // Computation Logic using Gated Signals
    always @(*) begin
        // Default assignments to prevent latch generation
        alu_out   = 8'b0;
        carry_out = 1'b0;

        case (opcode)
            3'b000: {carry_out, alu_out} = gated_A + gated_B;  // ADD
            3'b001: {carry_out, alu_out} = gated_A - gated_B;  // SUB
            3'b010: alu_out = gated_A & gated_B;              // AND
            3'b011: alu_out = gated_A | gated_B;              // OR
            3'b100: alu_out = gated_A ^ gated_B;              // XOR
            3'b101: alu_out = ~gated_A;                       // NOT A
            3'b110: alu_out = gated_A << gated_B[2:0];        // Logical Shift Left
            3'b111: alu_out = gated_A >> gated_B[2:0];        // Logical Shift Right
            default: begin
                alu_out   = 8'b0;
                carry_out = 1'b0;
            end
        endcase
    end

endmodule




