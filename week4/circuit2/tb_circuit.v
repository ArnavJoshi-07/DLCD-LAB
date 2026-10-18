`define num 8
module tb_circuit;
reg a,b,s;
wire o;
mux2 madmux(.i0(a), .i1(b), .s(s), .y(o));
reg[2:0] test_vecs [0:`num-1];
integer i;
initial begin
    test_vecs[0] = 3'b000;
    test_vecs[1] = 3'b001;
    test_vecs[2] = 3'b010;
    test_vecs[3] = 3'b011;
    test_vecs[4] = 3'b100;
    test_vecs[5] = 3'b101;
    test_vecs[6] = 3'b110;
    test_vecs[7] = 3'b111;
end
initial begin
    #0 {a,b,s} = test_vecs[0];
    for(i = 1; i<`num; i = i+1)
    begin
        #20 {a,b,s} = test_vecs[i];
    end
    #20 $finish;
end
initial begin
    $dumpfile("circuit2.vcd");
    $dumpvars(0,tb_circuit);
end
initial begin
$monitor("At time = %t, I0 = %b, I1 = %b, S = %b, Y = %b",$time,a,b,s,o);    
end

endmodule