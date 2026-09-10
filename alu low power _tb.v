`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2026 11:32:25 AM
// Design Name: 
// Module Name: alu low power _tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

// =================================================================
// Module: low_power_alu_8bit_tb
// =================================================================
module low_power_alu_8bit_tb;

    // Testbench Inputs (declared as reg)
    reg [7:0] A;
    reg [7:0] B;
    reg [2:0] opcode;

    // Testbench Outputs (declared as wire)
    wire [7:0] alu_out;
    wire       carry_out;

    // Instantiate the Unit Under Test (UUT)
    low_power_alu_8bit uut (
        .A(A), 
        .B(B), 
        .opcode(opcode), 
        .alu_out(alu_out), 
        .carry_out(carry_out)
    );

    initial begin
        // Display Setup
        $monitor("Time=%0t | Opcode=%3b | A=0x%h, B=0x%h | Out=0x%h | Carry=%b", 
                 $time, opcode, A, B, alu_out, carry_out);
        
        // Initialize Inputs
        A = 8'h00; B = 8'h00; opcode = 3'b000;
        #10;

        // Test Case 1: ADD (0x05 + 0x02 = 0x07, Carry = 0)
        A = 8'h05; B = 8'h02; opcode = 3'b000; #10;
        
        // Test Case 2: ADD with Carry (0xFF + 0x01 = 0x00, Carry = 1)
        A = 8'hFF; B = 8'h01; opcode = 3'b000; #10;

        // Test Case 3: SUB (0x0A - 0x03 = 0x07)
        A = 8'h0A; B = 8'h03; opcode = 3'b001; #10;

        // Test Case 4: Bitwise AND (0xF0 & 0x0F = 0x00)
        A = 8'hF0; B = 8'h0F; opcode = 3'b010; #10;

        // Test Case 5: Bitwise OR (0xF0 | 0x0F = 0xFF)
        A = 8'hF0; B = 8'h0F; opcode = 3'b011; #10;

        // Test Case 6: Bitwise XOR (0x55 ^ 0x33 = 0x66)
        A = 8'h55; B = 8'h33; opcode = 3'b100; #10;

        // Test Case 7: Bitwise NOT (~0xAA = 0x55)
        A = 8'hAA; B = 8'h00; opcode = 3'b101; #10;

        // Test Case 8: Logical Shift Left (0x01 << 2 = 0x04)
        A = 8'h01; B = 8'h02; opcode = 3'b110; #10;

        // Test Case 9: Logical Shift Right (0x80 >> 3 = 0x10)
        A = 8'h80; B = 8'h03; opcode = 3'b111; #10;

        // Stop simulation
        $finish;
    end
      
endmodule

