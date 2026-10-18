module and1_test;
reg a,b;
wire c;
and1 and1_test(c,a,b);
initial begin
    #000 a =0; b = 0;
    #100 a = 0; b = 1;
    #100 a = 1; b = 0;
    #100 a = 1; b = 1;
    #100 $finish;
end
initial begin
    $monitor($time, "a = %b, b = %b, c = %b",a,b,c); //binary output
end
initial begin
    $dumpfile ("and1_test.vcd"); //waveform output
    $dumpvars (0,and1_test);

end
endmodule
