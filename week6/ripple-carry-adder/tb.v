module tb_circuit;

reg [3:0] a, b;
reg cin;

wire cout;
wire [3:0] sum;

ripple_carry r1(a, b, cin, sum, cout);

initial begin

    #0  a = 4'b0101; b = 4'b1101; cin = 1'b1;

    #20 a = 4'b0111; b = 4'b1011; cin = 1'b1;

    #20 a = 4'b0100; b = 4'b0101; cin = 1'b0;

    #20 a = 4'b1001; b = 4'b0111; cin = 1'b0;

    #20 $finish;

end
initial begin
    $monitor($time,"a = %b, b = %b, cin = %b, sum = %b, cout = %b",a,b,cin,sum,cout);
end

initial begin

    $dumpfile("circuit1.vcd");
    $dumpvars(0, tb_circuit);

end

endmodule