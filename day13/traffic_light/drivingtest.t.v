`include "fsm.v"

// This module is made to test fsm.v, the traffic light fsm example.

module driver();
reg [1:0] light = 3'b00;
reg clk;
reg dutpassed =0;

// instantiate device under test
finiteStateMachine dut(light ,clk,driving,stopped,braking);

// start clock
initial clk=0;
always #10 clk=!clk;

initial begin
//displays, just for the easy check.
    $dumpfile("traffic.vcd");
    $dumpvars();
    $display("Green light = 00");
    $display("Yellow light = 01");
    $display("Red light = 10");
    $display(" light  | driving braking stopped");
    light = 2'b00;
    #50
    $display("  %b    |   %b       %b       %b", light, driving, braking, stopped);
    light = 2'b01;
    #1000
    $display("  %b    |   %b       %b       %b", light, driving, braking, stopped);
    light = 2'b10;
    #1000
    $display("  %b    |   %b       %b       %b", light, driving, braking, stopped);
    light = 2'b00;
    #1000
    $display("  %b    |   %b       %b       %b", light, driving, braking, stopped);
    light = 2'b01;
    #1000
    $display("  %b    |   %b       %b       %b", light, driving, braking, stopped);
    #50
    $finish;
end
endmodule
