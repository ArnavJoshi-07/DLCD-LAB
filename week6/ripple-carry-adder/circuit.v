module fa(input a,b,cin, output sum, cout);
wire x1;
wire c1,c2,c3;
xor(x1,a,b);
xor(sum,x1,cin);
and(c1,a,b);
and(c2,b,cin);
and(c3,a,cin);

or(cout,c1,c2,c3);
endmodule

module ripple_carry(input [3:0] a, input [3:0] b, input cin, output [3:0] sum, output cout);

wire c1,c2,c3;

fa fa0(a[0], b[0], cin, sum[0],c1);
fa fa1(a[1], b[1], c1, sum[1], c2);
fa fa2(a[2], b[2], c2, sum[2], c3);
fa fa3(a[3], b[3], c3, sum[3], cout);

endmodule