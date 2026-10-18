module mux2(i0,i1,s,y);
input i0,i1,s;
output y;
assign y = (s==0)?i0:i1;
endmodule
