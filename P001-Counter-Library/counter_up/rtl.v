module counter_up #

(
    parameter WIDTH = 4
)

(
    input clk,
    input rst,

    output reg [WIDTH-1:0] count
);

always @(posedge clk)

begin

    if(rst)

        count <= 0;

    else

        count <= count + 1;

end

endmodule
