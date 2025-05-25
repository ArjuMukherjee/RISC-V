module DATA_MEM(
    clk,
    reset,
    MemWrite,
    MemRead,
    read_address,
    Write_data,
    MemData_out
);

input clk, reset, MemWrite, MemRead;
input [31:0] read_address, Write_data;
output [31:0] MemData_out;

reg [31:0] D_Memory[63:0];

/*initial begin
//#10

D_Memory[0] = 32'd0;
D_Memory[1] = 32'd84;
D_Memory[2] = 32'd23;
D_Memory[3] = 32'd59;
D_Memory[4] = 32'd91;
D_Memory[5] = 32'd6;
D_Memory[6] = 32'd18;
D_Memory[7] = 32'd76;
D_Memory[8] = 32'd64;
D_Memory[9] = 32'd99;
D_Memory[10] = 32'd5;
D_Memory[11] = 32'd43;
D_Memory[12] = 32'd37;
D_Memory[13] = 32'd2;
D_Memory[14] = 32'd87;
D_Memory[15] = 32'd15;
D_Memory[16] = 32'd93;
D_Memory[17] = 32'd31;
D_Memory[18] = 32'd49;
D_Memory[19] = 32'd60;
D_Memory[20] = 32'd1;
D_Memory[21] = 32'd22;
D_Memory[22] = 32'd35;
D_Memory[23] = 32'd80;
D_Memory[24] = 32'd13;
D_Memory[25] = 32'd95;
D_Memory[26] = 32'd27;
D_Memory[27] = 32'd67;
D_Memory[28] = 32'd51;
D_Memory[29] = 32'd11;
D_Memory[30] = 32'd73;
D_Memory[31] = 32'd8;
D_Memory[32] = 32'd42;
D_Memory[33] = 32'd90;
D_Memory[34] = 32'd17;
D_Memory[35] = 32'd7;
D_Memory[36] = 32'd100;
D_Memory[37] = 32'd28;
D_Memory[38] = 32'd39;
D_Memory[39] = 32'd58;
D_Memory[40] = 32'd12;
D_Memory[41] = 32'd97;
D_Memory[42] = 32'd3;
D_Memory[43] = 32'd44;
D_Memory[44] = 32'd66;
D_Memory[45] = 32'd19;
D_Memory[46] = 32'd78;
D_Memory[47] = 32'd25;
D_Memory[48] = 32'd40;
D_Memory[49] = 32'd30;
D_Memory[50] = 32'd14;
D_Memory[51] = 32'd85;
D_Memory[52] = 32'd9;
D_Memory[53] = 32'd62;
D_Memory[54] = 32'd47;
D_Memory[55] = 32'd21;
D_Memory[56] = 32'd55;
D_Memory[57] = 32'd10;
D_Memory[58] = 32'd33;
D_Memory[59] = 32'd69;
D_Memory[60] = 32'd38;
D_Memory[61] = 32'd4;
D_Memory[62] = 32'd70;
D_Memory[63] = 32'd16;
end
*/
//integer k;
always @(posedge clk or posedge reset)
begin
if(reset)
    begin
        /*for(k=0; k<64; k=k+1) begin
        D_Memory[k] <= 32'b00;
        end*/
        
        D_Memory[0] <= 32'd0;
        D_Memory[1] <= 32'd84;
        D_Memory[2] <= 32'd23;
        D_Memory[3] <= 32'd59;
        D_Memory[4] <= 32'd91;
        D_Memory[5] <= 32'd6;
        D_Memory[6] <= 32'd18;
        D_Memory[7] <= 32'd76;
        D_Memory[8] <= 32'd64;
        D_Memory[9] <= 32'd99;
        D_Memory[10] <= 32'd5;
        D_Memory[11] <= 32'd43;
        D_Memory[12] <= 32'd37;
        D_Memory[13] <= 32'd2;
        D_Memory[14] <= 32'd87;
        D_Memory[15] <= 32'd15;
        D_Memory[16] <= 32'd93;
        D_Memory[17] <= 32'd31;
        D_Memory[18] <= 32'd49;
        D_Memory[19] <= 32'd60;
        D_Memory[20] <= 32'd1;
        D_Memory[21] <= 32'd22;
        D_Memory[22] <= 32'd35;
        D_Memory[23] <= 32'd80;
        D_Memory[24] <= 32'd13;
        D_Memory[25] <= 32'd95;
        D_Memory[26] <= 32'd27;
        D_Memory[27] <= 32'd67;
        D_Memory[28] <= 32'd51;
        D_Memory[29] <= 32'd11;
        D_Memory[30] <= 32'd73;
        D_Memory[31] <= 32'd8;
        D_Memory[32] <= 32'd42;
        D_Memory[33] <= 32'd90;
        D_Memory[34] <= 32'd17;
        D_Memory[35] <= 32'd7;
        D_Memory[36] <= 32'd100;
        D_Memory[37] <= 32'd28;
        D_Memory[38] <= 32'd39;
        D_Memory[39] <= 32'd58;
        D_Memory[40] <= 32'd12;
        D_Memory[41] <= 32'd97;
        D_Memory[42] <= 32'd3;
        D_Memory[43] <= 32'd44;
        D_Memory[44] <= 32'd66;
        D_Memory[45] <= 32'd19;
        D_Memory[46] <= 32'd78;
        D_Memory[47] <= 32'd25;
        D_Memory[48] <= 32'd40;
        D_Memory[49] <= 32'd30;
        D_Memory[50] <= 32'd14;
        D_Memory[51] <= 32'd85;
        D_Memory[52] <= 32'd9;
        D_Memory[53] <= 32'd62;
        D_Memory[54] <= 32'd47;
        D_Memory[55] <= 32'd21;
        D_Memory[56] <= 32'd55;
        D_Memory[57] <= 32'd10;
        D_Memory[58] <= 32'd33;
        D_Memory[59] <= 32'd69;
        D_Memory[60] <= 32'd38;
        D_Memory[61] <= 32'd4;
        D_Memory[62] <= 32'd70;
        D_Memory[63] <= 32'd16;
    end
else if(MemWrite) begin
    D_Memory[read_address] <= Write_data;
    end
end

assign  MemData_out = (MemRead) ? D_Memory[read_address] : 32'b00;

endmodule