module mux2(input i0, i1, j, output o);
assign o = (j==0)?i0:i1;
endmodule

module df(input clk, in, output out);
reg df_out;
always@(posedge clk)
df_out <= in; /*means that input is continuous 
array of values and out keeps getting value 
of in at positive edge of clock*/
assign out = df_out;
endmodule


module dfr(input clk,reset,in,output out);
wire reset_,df_in;

assign df_in = in & !reset;
df d1(clk, df_in, out);
endmodule

module dfrl(input clk, reset, load,in, output out);
wire _in;
mux2 yum(out,in,load,_in);
dfr dfr1(clk, reset,_in,out);
endmodule
