`timescale 1ns/1ps

module tb;

    reg clk;
    reg rst;

    wire A_red;
    wire A_yellow;
    wire A_green;

    wire B_red;
    wire B_yellow;
    wire B_green;


    //========================================================
    // DUT
    //========================================================

    traffic_light #(
        .GREEN_TIME(5),
        .YELLOW_TIME(2)
    ) dut (

        .clk(clk),
        .rst(rst),

        .A_red(A_red),
        .A_yellow(A_yellow),
        .A_green(A_green),

        .B_red(B_red),
        .B_yellow(B_yellow),
        .B_green(B_green)

    );


    //========================================================
    // Clock Generation
    // 10 ns clock period
    //========================================================

    always #5 clk = ~clk;


    //========================================================
    // Waveform Dump
    //========================================================

    initial begin

        $dumpfile("traffic_light.vcd");
        $dumpvars(0, tb);

    end


    //========================================================
    // Test Sequence
    //========================================================

    initial begin

        clk = 0;
        rst = 1;

        // Reset
        #20;

        rst = 0;

        // Run long enough to observe
        // multiple complete traffic cycles
        #150;

        $finish;

    end


    //========================================================
    // Monitor
    //========================================================

    initial begin

        $monitor(
            "Time=%0t | rst=%b | A(RYG)=%b%b%b | B(RYG)=%b%b%b | state=%b | timer=%0d | done=%b",
            $time,
            rst,
            A_red,
            A_yellow,
            A_green,
            B_red,
            B_yellow,
            B_green,
            dut.current_state,
            dut.timer_count,
            dut.timer_done
        );

    end

endmodule
