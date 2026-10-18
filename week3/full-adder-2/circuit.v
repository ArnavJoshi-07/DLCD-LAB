module and2(a,b,c);
input a,b;
output c;
assign c = a&b;
endmodule

module or3(a,b,c,y);
input a,b,c;
output y;
assign y = a | b | c;
endmodule 

module xor3(a,b,c,y);
input a,b,c;
output y;
assign y = a ^ b ^ c;
endmodule

module fa(a,b,c,sum,cout);
input a,b,c;
output sum, cout;
wire w1,w2,w3;
xor3 g1(a,b,c,sum);
and2 g2(a,b,w1);
and2 g3(a,c,w2);
and2 g4(b,c,w3);
or3 g5(w1,w2,w3,cout);
endmodule

//for the circuit of 2 full-adders
module circuit3(
    input wire [2:0]i1, 
    input wire i2,
    
    output wire sum1,cout1
);
wire x1,x2;
fa fa_1(i1[0],i1[1],i1[2],x1,x2);
fa fa_2(x1,x2,i2,sum1,cout1);

endmodule

