`timescale 1ns/1ps

module counter_up_tb;

parameter WIDTH = 4;

reg clk;
reg rst;

wire [WIDTH-1:0] count;

counter_up #

(
    .WIDTH(WIDTH)
)

dut

(
    .clk(clk),
    .rst(rst),
    .count(count)
);

always #5 clk = ~clk;

initial

begin

    clk = 0;

    rst = 1;

    #10;

    rst = 0;

    #160;

    $finish;

end

initial

begin

    $dumpfile("counter_up.vcd");

    $dumpvars(0,counter_up_tb);

end

endmodule
