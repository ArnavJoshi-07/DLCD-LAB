module xnor_tb;
reg a, b;
wire c;
xnor1 xnor_tb(a,b,c);
initial begin
    #0 a = 0; b = 0;
    #100 a = 0; b = 1;
    #100 a = 1; b = 0; 
    #100 a = 1; b = 1;
    #100 $finish;
end
initial begin
    $monitor($time,"a=%b, b = %b and c = %b",a,b,c);
end
initial begin
    $dumpfile("xnor1test.vcd");
    $dumpvars(0,xnor_tb);
end
endmodule