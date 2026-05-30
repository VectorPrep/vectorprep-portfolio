module counter #(
    parameter WIDTH = 4
)
(
    input clk,
    input reset,
    input enable,
    output reg [WIDTH-1:0] count
);

always @(posedge clk or posedge reset) begin
    if(reset)
    count <= {WIDTH{1'b0}}; // reset to 0 (generic)
    else if(enable)
    count <= count + 1;
    else
    count <= count;
end
endmodule