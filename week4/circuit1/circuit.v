module and2(a,b,c);
input a,b;
output c;
assign c = a & b;
endmodule

module or2(a,b,c);
input a,b;
output c;
assign c = a | b;
endmodule

module not1(a,b);
input a;
output b;
assign b = !a;
endmodule

module mux2to1(i0,i1,s,y);
input i0,i1,s;
output y;
wire w0, w1,sb;
not1 g1(s,sb);
and2 g2(sb,i0,w0);
and2 g3(s,i1,w1);
or2 g4(w1,w0,y);
endmodule