`timescale 1ns/1ps

module traffic_light #(
    parameter GREEN_TIME  = 5,
    parameter YELLOW_TIME = 2
)(
    input clk,
    input rst,

    output reg A_red,
    output reg A_yellow,
    output reg A_green,

    output reg B_red,
    output reg B_yellow,
    output reg B_green
);

    //========================================================
    // State Encoding
    //========================================================

    localparam A_GREEN  = 2'b00;
    localparam A_YELLOW = 2'b01;
    localparam B_GREEN  = 2'b10;
    localparam B_YELLOW = 2'b11;


    //========================================================
    // State Registers
    //========================================================

    reg [1:0] current_state;
    reg [1:0] next_state;


    //========================================================
    // Timer Signals
    //========================================================

    reg [31:0] timer_count;
    reg [31:0] timer_limit;
    reg        timer_done;


    //========================================================
    // State Register
    //========================================================

    always @(posedge clk) begin

        if (rst)
            current_state <= A_GREEN;

        else
            current_state <= next_state;

    end


    //========================================================
    // Timer Limit Selection
    //========================================================

    always @(*) begin

        case (current_state)

            A_GREEN,
            B_GREEN:
                timer_limit = GREEN_TIME;

            A_YELLOW,
            B_YELLOW:
                timer_limit = YELLOW_TIME;

            default:
                timer_limit = GREEN_TIME;

        endcase

    end


    //========================================================
    // Timer Counter
    //========================================================

    always @(posedge clk) begin

        if (rst) begin

            timer_count <= 0;
            timer_done  <= 0;

        end

        else if (timer_count >= timer_limit - 1) begin

            timer_count <= 0;
            timer_done  <= 1;

        end

        else begin

            timer_count <= timer_count + 1;
            timer_done  <= 0;

        end

    end


    //========================================================
    // Next-State Logic
    //========================================================

    always @(*) begin

        // Hold current state unless timer expires
        next_state = current_state;

        case (current_state)

            A_GREEN: begin
                if (timer_done)
                    next_state = A_YELLOW;
            end

            A_YELLOW: begin
                if (timer_done)
                    next_state = B_GREEN;
            end

            B_GREEN: begin
                if (timer_done)
                    next_state = B_YELLOW;
            end

            B_YELLOW: begin
                if (timer_done)
                    next_state = A_GREEN;
            end

            default:
                next_state = A_GREEN;

        endcase

    end


    //========================================================
    // Output Logic
    //========================================================

    always @(*) begin

        // Default: all lights OFF
        A_red    = 0;
        A_yellow = 0;
        A_green  = 0;

        B_red    = 0;
        B_yellow = 0;
        B_green  = 0;


        case (current_state)

            A_GREEN: begin
                A_green = 1;
                B_red   = 1;
            end

            A_YELLOW: begin
                A_yellow = 1;
                B_red    = 1;
            end

            B_GREEN: begin
                A_red   = 1;
                B_green = 1;
            end

            B_YELLOW: begin
                A_red    = 1;
                B_yellow = 1;
            end

            default: begin
                A_green = 1;
                B_red   = 1;
            end

        endcase

    end

endmodule
