`timescale 1ns/1ps

module parameterized_counter_tb;

parameter WIDTH = 4;

reg clk;
reg reset;
reg enable;

wire [WIDTH-1:0] count;

parameterized_counter #(
    .WIDTH(WIDTH)
) uut (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .count(count)
);

// Clock Generation
always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;
    enable = 0;

    // Reset
    #10;
    reset = 0;

    // Count
    enable = 1;
    #80;

    // Hold
    enable = 0;
    #20;

    $finish;

end

initial begin

    $dumpfile("parameterized_counter.vcd");
    $dumpvars(0, parameterized_counter_tb);

end

endmodule
