module ALU(
    A, B, Control_in, ALU_Result, zero
);

input [31:0] A, B;
input [3:0] Control_in;
output reg zero;
output reg [31:0] ALU_Result;

always @(Control_in or A or B)
begin
    case(Control_in)
    4'b0000: begin zero <= 0; ALU_Result <= A & B; end
    4'b0001: begin zero <= 0; ALU_Result <= A | B; end
    4'b0010: begin zero <= 0; ALU_Result <= A + B; end
    4'b0110: begin if(A==B) zero <= 1; else zero <= 0; ALU_Result <= A - B; end
    4'b0011: begin zero <= 0; ALU_Result <= A ^ B; end
    4'b0100: begin zero <= 0; ALU_Result <= A << B[4:0]; end
    4'b0101: begin zero <= 0; ALU_Result <= A >> B[4:0]; end
    4'b1001: begin zero <= 0; ALU_Result <= $signed(A) >>> B[4:0]; end
    4'b0111: begin zero <= 0; ALU_Result <= ($signed(A) < $signed(B)) ? 32'd1 : 32'd0; end
    4'b1000: begin zero <= 0; ALU_Result <= (A < B) ? 32'd1 : 32'd0; end
    default: begin zero <= 0; ALU_Result <= 32'b00; end
    endcase
end
endmodule