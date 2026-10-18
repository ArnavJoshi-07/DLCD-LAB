module tb_circuit;

reg clk, reset, load, in;

wire out;

initial begin

    $dumpfile("test_circuit.vcd");

    $dumpvars(0, tb_circuit);

end

initial clk = 1'b0;

always #5 clk = ~clk;

dfrl dfrl2(clk, reset, load, in, out);

initial begin

    reset = 1'b1;
    load  = 1'b0;
    in    = 1'b0;

    #5 reset = 1'b0;

    #5 load = 1'b1;
        in = 1'b1;

    #5 in = 1'b0;

    #5 in = 1'b1;

    #5 load = 1'b0;
        in = 1'b0;

    #5 in = 1'b1;

    #5 in = 1'b0;

    #5 load = 1'b1;
        in = 1'b0;

    #5 in = 1'b1;

    #5 $finish;

end

initial begin

    $monitor($time, " clk = %b, reset = %b, load = %b, in = %b, out = %b",
             clk, reset, load, in, out);

end

endmodule