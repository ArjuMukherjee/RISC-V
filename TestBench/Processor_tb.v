module processor_tb;

reg clk, reset;

processor processor(.clk(clk),.reset(reset));

initial begin
clk = 0;
reset = 1;
#1000;
reset = 0;
#400;
end

always begin
#5 clk = ~clk;
end

endmodule