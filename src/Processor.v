module processor(clk, reset, Rd1, Rd2);
input clk, reset;
output [31:0]Rd1,Rd2;

wire [31:0] PC_out, instruction_out,ImmExt, m1_out, Adder_out, NextoPC, m2_out, m3_out, aluresult, MemData_out;
wire [3:0] ALU_control;
wire [1:0] ALUOp;
wire RegWrite, ALUSrc, zero, branch, and_out, MemtoReg, MemWrite, MemRead;

// Program Counter
PC PC(.clk(clk), .reset(reset), .PC_in(m2_out), .PC_out(PC_out));

// PC Adder
PCAdder PCAdder(.fromPC(PC_out), .NextoPC(NextoPC));

// Instruction Memory
INST_MEM INST_MEM(.clk(clk),.reset(reset),.read_address(PC_out),.instruction_out(instruction_out));

// Register File
REG_FILE REG_FILE(.clk(clk),.reset(reset),.RegWrite(RegWrite),.Rs1(instruction_out[19:15]),.Rs2(instruction_out[24:20]),.Rd(instruction_out[11:7]),.Write_data(m3_out),.read_data1(Rd1),.read_data2(Rd2));

// Immediate Generator
IMM_GEN IMM_GEN(.Opcode(instruction_out[6:0]), .instruction(instruction_out), .ImmExt(ImmExt));

// Control Unit
CTRL_UNIT CTRL_UNIT(
    .instruction(instruction_out[6:0]),
    .Branch(branch),
    .MemRead(MemRead),
    .MemtoReg(MemtoReg),
    .ALUOp(ALUOp),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite)
);

// ALU Control
ALU_CTRL ALU_CTRL(
    .ALUOp(ALUOp),
    .func7(instruction_out[30]),
    .func3(instruction_out[14:12]),
    .Control_out(ALU_control)
);

// ALU
ALU ALU(
    .A(Rd1), .B(m1_out), .Control_in(ALU_control), .ALU_Result(aluresult), .zero(zero)
);

// MUX ALU
Mux m1(.sel(ALUSrc),.A(Rd2),.B(ImmExt),.Mux_out(m1_out));

// ADDER
ADD ADD(.in_1(PC_out),.in_2(ImmExt),.out(Adder_out));

// AND
AND AND(.branch(branch), .zero(zero), .and_out(and_out));

// MUX2
Mux m2(.sel(and_out),.A(NextoPC),.B(Adder_out),.Mux_out(m2_out));

// DATA MEMORY
DATA_MEM DATA_MEM(
    .clk(clk),
    .reset(reset),
    .MemWrite(MemWrite),
    .MemRead(MemRead),
    .read_address(aluresult),
    .Write_data(Rd2),
    .MemData_out(MemData_out)
);

// MUX3
Mux m3(.sel(MemtoReg),.A(aluresult),.B(MemData_out),.Mux_out(m3_out));

endmodule