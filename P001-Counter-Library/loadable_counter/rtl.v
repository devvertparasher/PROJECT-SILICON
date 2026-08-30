module loadable_counter(

    input clk,
    input reset,
    input enable,
    input load,
    input [3:0] data,

    output reg [3:0] count

);

always @(posedge clk)
begin

    if(reset)
        count <= 4'd0;

    else if(load)
        count <= data;

    else if(enable)
        count <= count + 1;

end

endmodule

