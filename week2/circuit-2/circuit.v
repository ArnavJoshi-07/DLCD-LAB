module and1(c,b,x);
input c,b;
output x;
assign x = c&b;
endmodule 

module or1(a,x,y);
input a,x;
output y;
assign y = a|x;
endmodule 

module circuit(a,b,c,y);
input a,b,c;
output y;
wire x;
and1 g1(c,b,x);
or1 g2(a,x,y);
endmodule
