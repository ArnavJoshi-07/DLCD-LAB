module circuit_tb;
reg a,b,c;
wire y;
circuit c2(a,b,c,y);
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
    $monitor($time,"A2 = %b, B2 = %b, C2 = %b, Output = %b",a,b,c,y);
end
initial begin
    $dumpfile("circuit_3.vcd");
    $dumpvars(0,circuit_tb);
end
endmodule