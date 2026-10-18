module tb;
reg clk, reset;
reg [1:0] op;
reg [15:0] i0, i1;
wire [15:0] o;
wire cout;

alu alu_0(op, i0, i1, o, cout);

initial begin
    $dumpfile("tb_alu.vcd");
    $dumpvars(0, tb);
end

initial begin
    reset = 1'b1;
    #12.5 reset = 1'b0;
end

initial clk = 1'b0;
always #5 clk = ~clk;

initial begin
$monitor("time=%0t op=%b i0=%h i1=%h o=%h cout=%b", $time, op, i0, i1, o, cout);
    #0  op = 2'b00; i0 = 16'haa55; i1 = 16'h55aa;  
    #10 op = 2'b01; i0 = 16'haa55; i1 = 16'h55aa;   
    #10 op = 2'b10; i0 = 16'haa55; i1 = 16'h55aa;   
    #10 op = 2'b11; i0 = 16'haa55; i1 = 16'h55aa;   
    #10 $finish;
end
endmodule