module tb_circuit;
reg clk,in;
wire out;

initial begin
    $dumpfile("test_circuit.vcd");
    $dumpvars(0,tb_circuit);
end
initial clk = 1'b0;
always #5 clk = ~clk;

dff dff1(clk, in, out);
initial begin 
    #0 in = 1'b1;
    #5 in = 1'b0;
    #5 in = 1'b1;
    #5 in = 1'b0;
    #5 in = 1'b1;
    #5 in = 1'b1;
    #5 in = 1'b0;
    #5 in = 1'b1;
    #5 in = 1'b0;
    #5 $finish;
end
initial begin
    $monitor($time, "clk = %b, in = %b, out = %b",clk, in, out);
end
endmodule

