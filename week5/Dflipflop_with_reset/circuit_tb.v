module tb_circuit;
reg clk,in,reset;
wire out;

initial begin
    $dumpfile("test_circuit.vcd");
    $dumpvars(0,tb_circuit);
end
initial clk = 1'b0;
always #5 clk = ~clk;
initial begin reset = 1'b1;
#12.5 reset = 0; end

dffwr dffwr1(clk,reset,in,out);
initial begin 
    #0 in = 1'b1;
    #5 in = 1'b0;
    #5 in = 1'b0;  
    #5 in = 1'b0;
    #5 in = 1'b1;
    #5 in = 1'b1;
    #5 in = 1'b0;
    #5 in = 1'b1;
    #5 in = 1'b0;
    #5 $finish;
end
initial begin
    $monitor($time, "clk = %b, reset = %b, in = %b, out = %b",clk,reset,in, out);
end
endmodule
