`timescale 1ns/1ps

module tb;

    parameter DATA_WIDTH = 8;
    parameter DEPTH      = 4;

    reg                     clk;
    reg                     reset;
    reg                     write_en;
    reg                     read_en;
    reg  [DATA_WIDTH-1:0]   data_in;

    wire [DATA_WIDTH-1:0]   data_out;
    wire                    full;
    wire                    empty;

    parameterized_fifo #(
        .DATA_WIDTH(DATA_WIDTH),
        .DEPTH(DEPTH)
    ) dut (
        .clk(clk),
        .reset(reset),
        .write_en(write_en),
        .read_en(read_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    // Clock
    always #5 clk = ~clk;

    initial begin

        // Initial values
        clk      = 0;
        reset    = 1;
        write_en = 0;
        read_en  = 0;
        data_in  = 0;

        // Reset
        #10;
        reset = 0;

        // -------------------------
        // WRITE A1
        // -------------------------
        #10;
        write_en = 1;
        data_in = 8'hA1;

        // WRITE B2
        #10;
        data_in = 8'hB2;

        // WRITE C3
        #10;
        data_in = 8'hC3;

        write_en = 0;

        // -------------------------
        // READ A1
        // -------------------------
        #10;
        read_en = 1;

        // READ B2
        #10;

        // READ C3
        #10;

        read_en = 0;

        // -------------------------
        // FILL FIFO
        // -------------------------
        #10;
        write_en = 1;
        data_in = 8'h11;

        #10;
        data_in = 8'h22;

        #10;
        data_in = 8'h33;

        #10;
        data_in = 8'h44;

        write_en = 0;

        // FIFO should now be FULL

        // -------------------------
        // READ TWO VALUES
        // -------------------------
        #10;
        read_en = 1;

        #10;
        #10;

        read_en = 0;

        // -------------------------
        // END
        // -------------------------
        #20;

        $finish;

    end

    // VCD waveform dump
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
    end

endmodule
