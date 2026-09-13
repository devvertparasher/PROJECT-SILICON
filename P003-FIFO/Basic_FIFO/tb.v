module tb;

    reg        clk;
    reg        reset;
    reg        write_en;
    reg        read_en;
    reg  [7:0] data_in;

    wire [7:0] data_out;
    wire       full;
    wire       empty;

    // DUT
    basic_fifo dut (
        .clk      (clk),
        .reset    (reset),
        .write_en (write_en),
        .read_en  (read_en),
        .data_in  (data_in),
        .data_out (data_out),
        .full     (full),
        .empty    (empty)
    );

    // Clock: 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Waveform dump
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
    end

    // Test sequence
    initial begin

        // Initial values
        reset    = 1;
        write_en = 0;
        read_en  = 0;
        data_in  = 8'h00;

        // -----------------------------
        // RESET
        // -----------------------------

        #10;

        reset = 0;

        $display("RESET COMPLETE");
        $display("EMPTY = %b, FULL = %b", empty, full);

        // -----------------------------
        // WRITE 1
        // -----------------------------

        #10;

        write_en = 1;
        data_in  = 8'hA1;

        #10;

        write_en = 0;

        $display("WROTE A1");

        // -----------------------------
        // WRITE 2
        // -----------------------------

        #10;

        write_en = 1;
        data_in  = 8'hB2;

        #10;

        write_en = 0;

        $display("WROTE B2");

        // -----------------------------
        // WRITE 3
        // -----------------------------

        #10;

        write_en = 1;
        data_in  = 8'hC3;

        #10;

        write_en = 0;

        $display("WROTE C3");

        // -----------------------------
        // READ 1
        // -----------------------------

        #10;

        read_en = 1;

        #10;

        read_en = 0;

        $display("READ DATA = %h", data_out);

        // -----------------------------
        // READ 2
        // -----------------------------

        #10;

        read_en = 1;

        #10;

        read_en = 0;

        $display("READ DATA = %h", data_out);

        // -----------------------------
        // READ 3
        // -----------------------------

        #10;

        read_en = 1;

        #10;

        read_en = 0;

        $display("READ DATA = %h", data_out);

        // -----------------------------
        // FILL FIFO
        // -----------------------------

        #10;

        write_en = 1;
        data_in  = 8'h11;

        #10;

        data_in = 8'h22;

        #10;

        data_in = 8'h33;

        #10;

        data_in = 8'h44;

        #10;

        write_en = 0;

        $display("FIFO FILLED");
        $display("EMPTY = %b, FULL = %b", empty, full);

        // -----------------------------
        // POINTER WRAP TEST
        // -----------------------------

        #10;

        read_en = 1;

        #10;

        read_en = 0;

        $display("WRAP READ 1 = %h", data_out);

        #10;

        read_en = 1;

        #10;

        read_en = 0;

        $display("WRAP READ 2 = %h", data_out);

        // -----------------------------
        // END
        // -----------------------------

        #20;

        $display("--------------------------------");
        $display("BASIC FIFO TEST COMPLETE");
        $display("--------------------------------");

        $finish;

    end

endmodule
