module t_conv(input in, reset, output df_in);
assign df_in = in & !reset;
endmodule

module dff(input in, clk, output out);
reg df_out;
always@(posedge clk)
    df_out <= in; /*means that input is continuous 
array of values and out keeps getting value 
of in at positive edge of clock*/
assign out = df_out;
endmodule

module dffwr(input clk, reset, in, output out);
    wire df_in;
    t_conv t1(in, reset, df_in);
    dff d1(df_in, clk,out);
endmodule

