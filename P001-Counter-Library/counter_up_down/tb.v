`timescale 1ns/1ps

module counter_up_down_tb;

reg clk;
reg reset;
reg enable;
reg up_down;

wire [3:0] count;

counter_up_down uut (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .up_down(up_down),
    .count(count)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    enable = 0;
    up_down = 1;

    // Reset
    #10;
    reset = 0;

    // Count Up
    enable = 1;
    up_down = 1;
    #60;

    // Hold
    enable = 0;
    #20;

    // Count Down
    enable = 1;
    up_down = 0;
    #80;

    $finish;
end

initial begin
    $dumpfile("counter_up_down.vcd");
    $dumpvars(0, counter_up_down_tb);
end

endmodule
