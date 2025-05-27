module INST_MEM(
    clk,
    reset,
    read_address,
    instruction_out
);

input clk, reset;
input [31:0] read_address;
output [31:0] instruction_out;
reg [7:0] I_Mem[63:0];
assign instruction_out = {I_Mem[read_address],I_Mem[read_address+1],I_Mem[read_address+2],I_Mem[read_address+3]};

always @(posedge clk or posedge reset)
begin

if(reset)
    begin   

//    I_Mem[0]  <= 8'b0000000_1; // add x13, x16, x25
//    I_Mem[1]  <= 8'b1001_1000;
//    I_Mem[2]  <= 8'b0_000_0110;
//    I_Mem[3]  <= 8'b1_0110011;
//    I_Mem[0]  <= 8'b00000000; // add x13, x16, x25
//    I_Mem[1]  <= 8'b00000000;
//    I_Mem[2]  <= 8'b00000000;
//    I_Mem[3]  <= 8'b00000000;
//    I_Mem[4]  <= 8'b0000000_1; // add x13, x16, x25
//    I_Mem[5]  <= 8'b1001_1000;
//    I_Mem[6]  <= 8'b0_000_0110;
//    I_Mem[7]  <= 8'b1_0110011;
//    I_Mem[8]  <= 8'b0100000_0; // sub x5, x8, x3
//    I_Mem[9]  <= 8'b0011_0100;
//    I_Mem[10] <= 8'b0_000_0010;
//    I_Mem[11] <= 8'b1_0110011;
//    I_Mem[12] <= 8'b0000000_0;// and x1, x2, x3
//    I_Mem[13] <= 8'b0011_0001;
//    I_Mem[14] <= 8'b0_111_0000;
//    I_Mem[15] <= 8'b1_0110011;
//    I_Mem[16] <= 8'b0000000_0; // or x4, x3, x5
//    I_Mem[17] <= 8'b0101_0001;
//    I_Mem[18] <= 8'b1_110_0010;
//    I_Mem[19] <= 8'b0_0110011;
//    I_Mem[20] <= 8'b00000000; // addi x22, x21, 3
//    I_Mem[21] <= 8'b0011_1010;
//    I_Mem[22] <= 8'b1_000_1011;
//    I_Mem[23] <= 8'b0_0010011;
//    I_Mem[24] <= 8'b00000000; // ori x9, x8, 1
//    I_Mem[25] <= 8'b0001_0100;
//    I_Mem[26] <= 8'b0_110_0100;
//    I_Mem[27] <= 8'b1_0010011;
//    I_Mem[28] <= 8'b00000000; // lw x8, 15(x5)
//    I_Mem[29] <= 8'b1111_0010;
//    I_Mem[30] <= 8'b1_010_0100;
//    I_Mem[31] <= 8'b0_0000011;
//    I_Mem[32] <= 8'b00000000; // lh x1, 8(x2)
//    I_Mem[33] <= 8'b1000_0001;
//    I_Mem[34] <= 8'b0_001_0000;
//    I_Mem[35] <= 8'b1_0000011;
//    I_Mem[36] <= 8'b0000000_0;// sw x15, 12(x5)
//    I_Mem[37] <= 8'b1111_0010;
//    I_Mem[38] <= 8'b1_010_0110;
//    I_Mem[39] <= 8'b0_0100011;
//    I_Mem[40] <= 8'b0000000_0;// sh x3, 12(x2)
//    I_Mem[41] <= 8'b0011_0001;
//    I_Mem[42] <= 8'b0_001_0110;
//    I_Mem[43] <= 8'b0_0100011;
//    I_Mem[44] <= 8'b0000000_0;// beq x9, x9, 8
//    I_Mem[45] <= 8'b1001_0100;
//    I_Mem[46] <= 8'b1_000_0100;
//    I_Mem[47] <= 8'b0_1100011;
//    I_Mem[48] <= 8'b0000000_0;// xor x7, x2, x3
//    I_Mem[49] <= 8'b0011_0001;
//    I_Mem[50] <= 8'b0_100_0000;
//    I_Mem[51] <= 8'b1_0110011;
//    I_Mem[52] <= 8'b0000000_0;// slt x8, x4, x5
//    I_Mem[53] <= 8'b0011_0001;
//    I_Mem[54] <= 8'b0_010_0000;
//    I_Mem[55] <= 8'b1_0110011;
//    I_Mem[56] <= 8'b0000000_0;// sll x1, x2, x3
//    I_Mem[57] <= 8'b0011_0001;
//    I_Mem[58] <= 8'b0_001_0000;
//    I_Mem[59] <= 8'b1_0110011;
//    I_Mem[60] <= 8'b0000000_0;// blt x1, x2, 4
//    I_Mem[61] <= 8'b0010_0000;
//    I_Mem[62] <= 8'b1_100_0010;
//    I_Mem[63] <= 8'b0_1100011;
    
    // Sum integers 1 to 5 and print result (15)
    I_Mem[0]  = 8'h00;
    I_Mem[1]  = 8'h00;
    I_Mem[2]  = 8'h00;
    I_Mem[3]  = 8'h00;
    I_Mem[4]  = 8'h00; // addi x5, x0, 1
    I_Mem[5]  = 8'h10;
    I_Mem[6]  = 8'h02;
    I_Mem[7]  = 8'h93;
    I_Mem[8]  = 8'h00; // addi x6, x0, 1
    I_Mem[9]  = 8'h10;
    I_Mem[10] = 8'h03;
    I_Mem[11] = 8'h93;
    I_Mem[12] = 8'h00; // addi x7, x0, 5
    I_Mem[13] = 8'h50;
    I_Mem[14] = 8'h03;
    I_Mem[15] = 8'h93;
    I_Mem[16] = 8'h00; // add x5, x5, x6
    I_Mem[17] = 8'h62;
    I_Mem[18] = 8'h82;
    I_Mem[19] = 8'hb3;
    I_Mem[20] = 8'h00; // addi x6, x6, 1
    I_Mem[21] = 8'h13;
    I_Mem[22] = 8'h03;
    I_Mem[23] = 8'h13;
    I_Mem[24] = 8'hfe; // blt x6, x7, -8
    I_Mem[25] = 8'h73;
    I_Mem[26] = 8'h1c;
    I_Mem[27] = 8'he3;
    I_Mem[28] = 8'h00; // addi x10, x5, 0
    I_Mem[29] = 8'h02;
    I_Mem[30] = 8'h85;
    I_Mem[31] = 8'h13;
    I_Mem[32] = 8'h00; // addi x17, x0, 1
    I_Mem[33] = 8'h10;
    I_Mem[34] = 8'h08;
    I_Mem[35] = 8'h93;
    I_Mem[36] = 8'h00; // ecall
    I_Mem[37] = 8'h00;
    I_Mem[38] = 8'h00;
    I_Mem[39] = 8'h73;
    I_Mem[40] = 8'h00;
    I_Mem[41] = 8'h00;
    I_Mem[42] = 8'h00;
    I_Mem[43] = 8'h00;
    I_Mem[44] = 8'h00;
    I_Mem[45] = 8'h00;
    I_Mem[46] = 8'h00;
    I_Mem[47] = 8'h00;
    I_Mem[48] = 8'h00;
    I_Mem[49] = 8'h00;
    I_Mem[50] = 8'h00;
    I_Mem[51] = 8'h00;
    I_Mem[52] = 8'h00;
    I_Mem[53] = 8'h00;
    I_Mem[54] = 8'h00;
    I_Mem[55] = 8'h00;
    I_Mem[56] = 8'h00;
    I_Mem[57] = 8'h00;
    I_Mem[58] = 8'h00;
    I_Mem[59] = 8'h00;
    I_Mem[60] = 8'h00;
    I_Mem[61] = 8'h00;
    I_Mem[62] = 8'h00;
    I_Mem[63] = 8'h00;    
    
    end
end
endmodule
