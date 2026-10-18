module dff(clk,in,out);
input clk,in;
output out;
reg df_out;
always@(posedge clk)
    df_out <= in; /*means that input is continuous 
array of values and out keeps getting value 
of in at positive edge of clock*/
assign out = df_out;
endmodule 

