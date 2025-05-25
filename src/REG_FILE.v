module REG_FILE(
    clk,
    reset,
    RegWrite,
    Rs1,
    Rs2,
    Rd,
    Write_data,
    read_data1,
    read_data2
);

input clk, reset, RegWrite;
input [4:0] Rs1, Rs2, Rd;
input [31:0] Write_data;
output [31:0] read_data1, read_data2;

reg [31:0] Registers[31:0];

initial begin
#1000
Registers[0] = 32'd0;
Registers[1] = 32'd84;
Registers[2] = 32'd23;
Registers[3] = 32'd59;
Registers[4] = 32'd91;
Registers[5] = 32'd6;
Registers[6] = 32'd18;
Registers[7] = 32'd76;
Registers[8] = 32'd64;
Registers[9] = 32'd99;
Registers[10] = 32'd5;
Registers[11] = 32'd43;
Registers[12] = 32'd37;
Registers[13] = 32'd2;
Registers[14] = 32'd87;
Registers[15] = 32'd15;
Registers[16] = 32'd93;
Registers[17] = 32'd31;
Registers[18] = 32'd49;
Registers[19] = 32'd60;
Registers[20] = 32'd1;
Registers[21] = 32'd22;
Registers[22] = 32'd35;
Registers[23] = 32'd80;
Registers[24] = 32'd13;
Registers[25] = 32'd95;
Registers[26] = 32'd27;
Registers[27] = 32'd67;
Registers[28] = 32'd51;
Registers[29] = 32'd11;
Registers[30] = 32'd73;
Registers[31] = 32'd8;
end

integer k;
always @(posedge clk or posedge reset)
begin
if(reset)
    begin
        for(k=0;k<32;k=k+1)begin
        Registers[k] <=32'b00;
        end
    end
else if(RegWrite) begin
    Registers[Rd] <= Write_data;
end
end

assign read_data1 = Registers[Rs1];
assign read_data2 = Registers[Rs2];

endmodule