module parameterized_fifo #(
    parameter DATA_WIDTH = 8,
    parameter DEPTH      = 4
)(
    input                       clk,
    input                       reset,
    input                       write_en,
    input                       read_en,
    input  [DATA_WIDTH-1:0]     data_in,

    output reg [DATA_WIDTH-1:0] data_out,
    output                      full,
    output                      empty
);

    // Calculate required widths
    localparam PTR_WIDTH   = (DEPTH <= 1) ? 1 : $clog2(DEPTH);
    localparam COUNT_WIDTH = $clog2(DEPTH + 1);

    // FIFO memory
    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

    // Read and write pointers
    reg [PTR_WIDTH-1:0] write_ptr;
    reg [PTR_WIDTH-1:0] read_ptr;

    // Number of stored entries
    reg [COUNT_WIDTH-1:0] occupancy;

    // Status flags
    assign empty = (occupancy == 0);
    assign full  = (occupancy == DEPTH);

    always @(posedge clk) begin

        if (reset) begin
            write_ptr <= 0;
            read_ptr  <= 0;
            occupancy <= 0;
            data_out  <= 0;
        end

        else begin

            // WRITE
            if (write_en && !full) begin

                mem[write_ptr] <= data_in;

                if (write_ptr == DEPTH-1)
                    write_ptr <= 0;
                else
                    write_ptr <= write_ptr + 1'b1;

            end

            // READ
            if (read_en && !empty) begin

                data_out <= mem[read_ptr];

                if (read_ptr == DEPTH-1)
                    read_ptr <= 0;
                else
                    read_ptr <= read_ptr + 1'b1;

            end

            // OCCUPANCY
            case ({write_en && !full, read_en && !empty})

                2'b10:
                    occupancy <= occupancy + 1'b1;

                2'b01:
                    occupancy <= occupancy - 1'b1;

                2'b11:
                    occupancy <= occupancy;

                2'b00:
                    occupancy <= occupancy;

            endcase

        end
    end

endmodule
