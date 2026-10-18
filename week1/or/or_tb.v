module or_test;
reg a,b;
wire y;
or1 or_test(a,b,y);
initial begin
    #0 a = 0; b = 0;
    #1 a = 0; b =1;
    #1 a = 1; b = 0;
    #1 a  = 1; b= 1;
    #1 $finish;
end
initial begin
    $monitor($time,"a = %b,b = %b, c = %b",a,b,y);
end
initial begin
    $dumpfile("test_or.vcd");
    $dumpvars(0,or_test);
end
endmodule