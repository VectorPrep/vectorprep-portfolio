`timescale 1ns/1ps

module tb_counter_with_enable;

reg clk;
reg reset;
reg enable;
wire [3:0] count;

counter_4bit_with_enable uut(
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .count(count)
);

// Clock
always #5 clk=~clk;

initial begin
    $dumpfile("counter_enable.vcd");
    $dumpvars(0, tb_counter_with_enable);

    clk=0;
    reset=1;
    enable=0;

    #10 reset=0;

    //Enable counting
    enable=1;
    #40;

    // Disable counting(should Freeze)
    enable=0;
    #30;

    //Enable again
    enable=1;
    #40;

    $finish;
end
endmodule
