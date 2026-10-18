module xor2(a,b,c);
input a,b;
output c;
assign c = a&!b | !a&b;
endmodule

module and2(a,b,c);
input a,b;
output c;
assign c = a&b;
endmodule

module or2(a,b,c);
input a,b;
output c;
assign c = a | b;
endmodule 


module fa(a,b,c,sum,cout);
input a,b,c;
output sum, cout;
wire w1, w2,w3;
xor2 G1(a,b,w1);
xor2 G2(w1,c,sum);

and2 G3(w1,c,w2);
and2 G4(a,b,w3);

or2 G5(w2,w3,cout);
endmodule