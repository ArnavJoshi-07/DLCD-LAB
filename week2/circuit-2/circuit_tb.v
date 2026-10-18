module circuit_2_tb;
reg a,c,b;
wire y;
circuit c1(a,b,c,y);
initial begin
    #0 a = 1'b0; b = 1'b0; c = 1'b0;
    #1 a = 1'b0; b = 1'b0; c = 1'b1;
    #1 a = 1'b0; b = 1'b1; c = 1'b0;
    #1 a = 1'b0; b = 1'b1; c = 1'b1;
    #1 a = 1'b1; b = 1'b0; c = 1'b0;
    #1 a = 1'b1; b = 1'b0; c = 1'b1;
    #1 a = 1'b1; b = 1'b1; c = 1'b0;
    #1 a = 1'b1; b = 1'b1; c = 1'b1;
    #1 $finish;
end
initial begin
    $monitor($time, "A = %b, B = %b, C = %b, Output = %b",a,b,c,y);
end
initial begin
    $dumpfile("circuit_2.vcd");
    $dumpvars(0,circuit_2_tb);
end
endmodule