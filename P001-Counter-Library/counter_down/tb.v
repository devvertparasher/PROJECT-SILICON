`timescale 1ns/1ps

module counter_down_tb;

reg clk;
reg reset;
reg enable;

wire [3:0] count;

counter_down uut(
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .count(count)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;
    enable = 0;

    #10;
    reset = 0;
    enable = 1;

    #160;

    enable = 0;

    #20;

    $finish;
end

initial
begin
    $dumpfile("counter_down.vcd");
    $dumpvars(0,counter_down_tb);
end

endmodule
