module processor_tb;

reg clk, reset;
wire [31:0] Rd1,Rd2;

processor processor(.clk(clk),.reset(reset),.Rd1(Rd1),.Rd2(Rd2));

initial begin
clk = 0;
reset = 1;
#5;
reset = 0;
#400;
end

always begin
#5 clk = ~clk;
end

endmodule