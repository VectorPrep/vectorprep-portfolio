`timescale 1ns/1ps

module tb_counter;

reg clk;
reg reset;
wire [3:0] count;

//Instantiate the counter
counter_4bit uut(
    .clk(clk),
    .reset(reset),
    .count(count)
);

//Clock generation: toggle every 5 time units
always #5 clk=~clk;

initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0, tb_counter);

    clk=0;
    reset=1;

    #10 reset=0; // release reset after some time
    #100 $finish; //stop simulation
end
endmodule
