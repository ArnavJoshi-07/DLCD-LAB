module tb_circuit;
reg [0:3]i;
reg j0;
reg j1;
wire o;

mux4 madmux(i,j1,j0,o);
initial begin
    $dumpfile("mux4.vcd");
    $dumpvars(0,tb_circuit);
end
initial begin
    #5 i = 4'b1000; j0 = 1'b0; j1 = 1'b0;
    #5 i = 4'b0100; j0= 1'b0; j1 = 1'b1;
    #5 i = 4'b0010; j0 = 1'b1; j1 = 1'b0;
    #5 i = 4'b0001; j0 = 1'b1; j1 = 1'b1;
    #5 $finish;
end

always@(i or j0 or j1)
$monitor("At time = %t, input i = %b, j0 = %b, j1 = %b, output o  = %b",$time, i,j0,j1,o);
endmodule