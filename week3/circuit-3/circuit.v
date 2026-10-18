module xor3(a,b,c,d);
input a,b,c;
output d;
assign d = a ^ b ^ c;
endmodule

module and3(a,b,c,d);
input a,b,c;
output d;
assign d = a & b & c;
endmodule 

module xor2(a,b,c);
input a,b;
output c;
assign c = a ^ b;
endmodule 

module and2(a,b,c);
input a,b;
output c;
assign c = a & b;
endmodule 

module not1(a,b);
input a;
output b;
assign b =  !a;
endmodule

module or2(a,b,c);
input a,b;
output c;
assign c = a | b;
endmodule 

module or3(a,b,c,d);
input a,b,c;
output d;
assign d = a | b | c;
endmodule 


module fa(a,b,c,sum,cout);
input a, b, c;
output sum,cout;
wire w1,w2,w3;
xor3 g1(a,b,c,sum);
and2 g2(a,b,w1);
and2 g3(b,c,w2);
and2 g4(c,a,w3);
or3 g5(w1,w2,w3,cout);
endmodule

module mid(a,b,c,d);
input a,b,c;
output d;
wire w1;
not1 g1(a,w1);
and3 g2(w1,b,c,d);
endmodule

module ha(a,b,sum,cout);
input a,b;
output sum, cout;
xor2 g1(a,b,sum);
and2 g2(a,b,cout);
endmodule

//full circuit

module circuit(
    input wire [2:0]i,
    input wire y,
    input wire y0,
    output wire sum, 
    output wire cout
    );
    wire x1,x2,x3;

    fa G1(i[0], i[1], i[2],x1,x2);
    mid G2(y, x1,x2, x3);
    ha G3(x3, y0, sum, cout);
endmodule