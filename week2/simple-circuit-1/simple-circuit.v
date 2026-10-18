module and2(a,b,c);
input a,b;
output c;
assign c = a&b;
endmodule

module not1(a,c);
input a;
output c;
assign c = !a;
endmodule

module or2(a,b,c);
input a,b;
output c;
assign c = a | b;
endmodule

module simple_circuit(A,B,C,D,E);
output D,E;
input A,B,C;
wire w1;
and2 G1 (A,B,w1);
not1 G2 (C,E);
or2 G3 (w1,E,D);
endmodule