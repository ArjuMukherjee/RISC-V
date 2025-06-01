module Branch_Unit (
    input  [31:0] rs1,
    input  [31:0] rs2,
    input  [2:0]  func3,
    input         branch,
    output        branch_out
);

    reg result;

    always @(*) begin
        case (func3)
            3'b000: result = (rs1 == rs2);                           // BEQ
            3'b001: result = (rs1 != rs2);                           // BNE
            3'b100: result = ($signed(rs1) < $signed(rs2));         // BLT
            3'b101: result = ($signed(rs1) >= $signed(rs2));        // BGE
            3'b110: result = (rs1 < rs2);                            // BLTU
            3'b111: result = (rs1 >= rs2);                           // BGEU
            default: result = 1'b0;
        endcase
    end

    assign branch_out = (branch==1'b1) ? result : 1'b0;

endmodule