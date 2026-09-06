`timescale 1ns/1ps

module vending_machine (
    input clk,
    input rst,

    input coin_5,
    input coin_10,

    output reg dispense,
    output reg [1:0] change
);

    // State encoding
    localparam IDLE      = 2'b00;
    localparam HAVE_5    = 2'b01;
    localparam HAVE_10   = 2'b10;
    localparam DISPENSE  = 2'b11;

    reg [1:0] current_state;
    reg [1:0] next_state;

    reg [1:0] change_reg;
    reg [1:0] next_change;


    //========================================================
    // State and Change Registers
    //========================================================

    always @(posedge clk) begin

        if (rst) begin
            current_state <= IDLE;
            change_reg    <= 2'b00;
        end

        else begin
            current_state <= next_state;
            change_reg    <= next_change;
        end

    end


    //========================================================
    // Next-State and Change Logic
    //========================================================

    always @(*) begin

        next_state  = current_state;
        next_change = change_reg;

        case (current_state)

            IDLE: begin

                if (coin_5 && !coin_10) begin
                    next_state = HAVE_5;
                end

                else if (coin_10 && !coin_5) begin
                    next_state = HAVE_10;
                end

            end


            HAVE_5: begin

                if (coin_5 && !coin_10) begin
                    next_state = HAVE_10;
                end

                else if (coin_10 && !coin_5) begin
                    next_state  = DISPENSE;
                    next_change = 2'b00;
                end

            end


            HAVE_10: begin

                if (coin_5 && !coin_10) begin
                    next_state  = DISPENSE;
                    next_change = 2'b00;
                end

                else if (coin_10 && !coin_5) begin
                    next_state  = DISPENSE;
                    next_change = 2'b01;   // ₹5 change
                end

            end


            DISPENSE: begin
                next_state  = IDLE;
                next_change = 2'b00;
            end


            default: begin
                next_state  = IDLE;
                next_change = 2'b00;
            end

        endcase

    end


    //========================================================
    // Output Logic
    //========================================================

    always @(*) begin

        dispense = 0;
        change   = 2'b00;

        case (current_state)

            IDLE: begin
                dispense = 0;
                change   = 2'b00;
            end


            HAVE_5: begin
                dispense = 0;
                change   = 2'b00;
            end


            HAVE_10: begin
                dispense = 0;
                change   = 2'b00;
            end


            DISPENSE: begin
                dispense = 1;
                change   = change_reg;
            end


            default: begin
                dispense = 0;
                change   = 2'b00;
            end

        endcase

    end

endmodule
