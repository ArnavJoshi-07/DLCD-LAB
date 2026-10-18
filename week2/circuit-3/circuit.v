module and1(a,b,c);
input a,b;
output c;
assign c = a & b;
endmodule

module or1(a,b,c);
input a,b;
output c;
assign c = a | b;
endmodule

module circuit(a,b,c,y);
input a,b,c;
output y;
wire w1, w2, w3;
and1 g1 (c,b,w1);
or1 g2 (a,w1,w2);
and1 g3 (a,b,w3);
or1 g4 (w2,w3,y);
endmodule