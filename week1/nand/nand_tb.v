module nand_test;
reg a,b;
wire c;
nand1 nand_test(a,b,c);
initial begin
    #00 a = 0; b = 0;
    #100 a = 0; b = 1;
    #100 a = 1; b = 0;
    #100 a = 1; b = 1;
    #100 $finish; //delay
end
initial begin
    $monitor($time,"a = %b, b = %b and c = %b",a,b,c);
end
initial begin
    $dumpfile("nand1test.vcd");
    $dumpvars(0,nand_test);
end
endmodule
