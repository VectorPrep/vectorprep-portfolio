`timescale 1ns/1ps

module tb_counter_v2;

reg clk;
reg reset;
wire [3:0] count;

// Instantiate DUT(Design Under Test)
counter_4bit uut(
    .clk(clk),
    .reset(reset),
    .count(count)
);

//Clock generation
always #5 clk=~clk;

initial begin
    $dumpfile("counter_v2.vcd");
    $dumpvars(0,tb_counter_v2);

    //Initial state
    clk=0;
    reset=1;

    // Hold for some time
    #10 reset=0;

    // Let counter run
    #40;

    // Apply reset again mid-operation
    reset=1;
    #10
    reset=0;

    //Let it run again
    #50;

    //Reset again quickly
    reset=1;
    #5;
    reset=0;

    #50;
    $finish;
end
endmodule
