`timescale 1ns/1ps

module tb_counter;

reg clk;
reg reset;
reg enable;
wire[7:0] count;    // testing 8-bit

//Instantiate with WIDTH = 8
counter #(.WIDTH(8)) uut(
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .count(count)
);

//Clock

always #5 clk = ~clk;

initial begin
    $dumpfile("counter_param.vcd");
    $dumpvars(0, tb_counter);

    clk=0;
    reset=1;
    enable=0;

    #10 reset=0;

    enable = 1;
    #100;

    enable = 0;
    #30;

    enable = 1;
    #50;

    $finish;
end
endmodule
