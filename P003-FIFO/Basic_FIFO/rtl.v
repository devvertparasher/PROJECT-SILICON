module basic_fifo (
    input        clk,
    input        reset,
    input        write_en,
    input        read_en,
    input  [7:0] data_in,

    output reg [7:0] data_out,
    output            full,
    output            empty
);

    // FIFO storage: 4 entries, each 8 bits
    reg [7:0] mem [0:3];

    // Pointers
    reg [1:0] write_ptr;
    reg [1:0] read_ptr;

    // Number of valid entries currently stored
    reg [2:0] occupancy;

    // Status flags
    assign empty = (occupancy == 3'd0);
    assign full  = (occupancy == 3'd4);

    always @(posedge clk) begin

        if (reset) begin
            write_ptr <= 2'd0;
            read_ptr  <= 2'd0;
            occupancy <= 3'd0;
            data_out  <= 8'd0;
        end

        else begin

            // WRITE
            if (write_en && !full) begin
                mem[write_ptr] <= data_in;

                if (write_ptr == 2'd3)
                    write_ptr <= 2'd0;
                else
                    write_ptr <= write_ptr + 1'b1;
            end

            // READ
            if (read_en && !empty) begin
                data_out <= mem[read_ptr];

                if (read_ptr == 2'd3)
                    read_ptr <= 2'd0;
                else
                    read_ptr <= read_ptr + 1'b1;
            end

            // OCCUPANCY UPDATE
            case ({write_en && !full, read_en && !empty})

                2'b10: occupancy <= occupancy + 1'b1; // write only
                2'b01: occupancy <= occupancy - 1'b1; // read only
                2'b11: occupancy <= occupancy;        // read + write
                2'b00: occupancy <= occupancy;        // no operation

            endcase
        end
    end

endmodule
