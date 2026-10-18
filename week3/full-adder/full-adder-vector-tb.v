`define TESTVECS 8
module full_adder_tb;

reg i0,i1,cin;
wire sum,cout;
fa FA(i0,i1,cin,sum,cout);
reg [2:0] test_vecs[0:7];

integer i;
initial begin
    #0{i0,i1,cin} = test_vecs[0];
    for(i = 1; i<`TESTVECS; i = i+1)
    begin
        #20 {i0,i1,cin} = test_vecs[i];
    end
        #20 $finish;
end
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
	$dumpfile("full-adder-vector.vcd");
	$dumpvars(0,full_adder_tb);
	$monitor($time,"i0 = %b, i1 = %b, cin = %b, sum = %b, cout = %b",i0,i1,cin,sum,cout);
end
endmodule	

	
