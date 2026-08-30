`timescale 1ns/1ps

module loadable_counter_tb;

reg clk;
reg reset;
reg enable;
reg load;
reg [3:0] data;

wire [3:0] count;

loadable_counter uut(
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .load(load),
    .data(data),
    .count(count)
);

// Clock Generation
always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;
    enable = 0;
    load = 0;
    data = 4'd0;

    // Reset
    #10;
    reset = 0;

    // Load 9
    load = 1;
    data = 4'd9;
    #10;

    // Count
    load = 0;
    enable = 1;
    #60;

    // Hold
    enable = 0;
    #20;

    $finish;
end

initial
begin
    $dumpfile("loadable_counter.vcd");
    $dumpvars(0, loadable_counter_tb);
end

endmodule

