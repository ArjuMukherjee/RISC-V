module CTRL_UNIT(
    instruction,
    Branch,
    MemRead,
    MemtoReg,
    ALUOp,
    MemWrite,
    ALUSrc,
    RegWrite,
    ecall
);

input [6:0] instruction;
output reg Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, ecall;
output reg [1:0] ALUOp;

always @(*)
begin
    case(instruction)
    7'b0110011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b001000_10; // R-Type
    7'b0010011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b101100_00; // I_Type
    7'b0100011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b100010_00; // S-Type
    7'b1100011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b000001_01; // SB-Type
    7'b0000011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b111100_00; // L-Type
    7'b1110011 : begin
        {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b00;
        ecall = 1'b1;
    end
    default: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b00;
    endcase
end
endmodule