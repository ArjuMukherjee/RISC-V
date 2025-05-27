module ALU_CTRL(
    ALUOp,
    func7,
    func3,
    Control_out
);

input func7;
input [2:0] func3;
input [1:0] ALUOp;
output reg [3:0] Control_out;

always @(*)
begin
    case({ALUOp, func7, func3})
    
    // I-Type
    6'b00_0_000: Control_out <= 4'b0010; // ADDI
    6'b00_0_100: Control_out <= 4'b0011; // XORI
    6'b00_0_110: Control_out <= 4'b0001; // ORI
    6'b00_0_111: Control_out <= 4'b0000; // ANDI
    6'b00_0_001: Control_out <= 4'b0100; // SLLI
    6'b00_0_101: Control_out <= 4'b0101; // SRLI
    6'b00_0_101: Control_out <= 4'b1001; // SRAI
    6'b00_0_010: Control_out <= 4'b0111; // SLTI
    6'b00_0_011: Control_out <= 4'b1000; // SLTUI
    
    // 6'b01_0_000: Control_out <= 4'b0110; // BEQ
    
    // R-Type
    6'b10_0_000: Control_out <= 4'b0010; // ADD
    6'b10_1_000: Control_out <= 4'b0110; // SUB
    6'b10_0_100: Control_out <= 4'b0011; // XOR
    6'b10_0_110: Control_out <= 4'b0001; // OR
    6'b10_0_111: Control_out <= 4'b0000; // AND
    6'b10_0_001: Control_out <= 4'b0100; // SLL
    6'b10_0_101: Control_out <= 4'b0101; // SRL
    6'b10_1_101: Control_out <= 4'b1001; // SRA
    6'b10_0_010: Control_out <= 4'b0111; // SLT
    6'b10_0_011: Control_out <= 4'b1000; // SLTU
    
    endcase
end
endmodule