module counter_up_down(
    input clk,
    input reset,
    input enable,
    input up_down,
    output reg [3:0] count
);

always @(posedge clk)
begin
    if (reset)
        count <= 4'd0;

    else if (enable)
    begin
        if (up_down)
            count <= count + 1;
        else
            count <= count - 1;
    end
end

endmodule

