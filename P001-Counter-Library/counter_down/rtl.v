module counter_down(
    input clk,
    input reset,
    input enable,
    output reg [3:0] count
);

always @(posedge clk)
begin
    if(reset)
        count <= 4'd15;
    else if(enable)
        count <= count - 1;
end

endmodule
