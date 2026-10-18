
module tb_circuit;

reg [1:0] A;
wire [3:0]Y;
decoder d1(A,Y);

initial begin
    #0  A = 2'b00;
    #10 A = 2'b01;
    #10 A = 2'b10;
    #10 A = 2'b11;
    #10 $finish;
end
initial begin
    $dumpfile("decoder.vcd");
    $dumpvars(0,tb_circuit);
    $monitor($time, " A[0] = %b, A[1] = %b, Y[0]=%b, Y[1]=%b, Y[2]=%b, Y[3]=%b",A[0], A[1], Y[0], Y[1], Y[2], Y[3]);
end
endmodule


