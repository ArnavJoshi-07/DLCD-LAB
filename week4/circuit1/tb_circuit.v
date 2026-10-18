`define TESTVECS 8
module tb_circuit;

reg i0,i1,s;
wire y;
mux2to1 mux(i0,i1,s,y);
reg [2:0] test_vecs[0:7];

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
    #0 {i0,i1,s} = test_vecs[0];
    for(i = 1; i<`TESTVECS;i = i+1)
    begin
        #20 {i0,i1,s} = test_vecs[i];
    end
        #20 $finish;
end
initial begin
    $dumpfile("circuit1.vcd");
    $dumpvars(0,tb_circuit);
    $monitor("At time = %t , i0 = %b, i1 = %b, s = %b, y = %b",$time,i0,i1,s,y);

end
endmodule

