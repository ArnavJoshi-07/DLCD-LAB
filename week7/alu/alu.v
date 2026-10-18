module fa(input wire i0, i1, cin, output wire sum, cout);
wire t0, t1, t2;

assign sum = i0 ^ i1 ^ cin;
assign t0 = i0 & i1;
assign t1 = i0 & cin;
assign t2 = i1 & cin;
assign cout = t0 | t1 | t2;

endmodule


module addsub(input wire addsub, i0, i1, cin, output wire sumdiff, cout);
wire t;

assign t = i1 ^ addsub;
fa fa_i0(i0, t, cin, sumdiff, cout);

endmodule


module alu_slice(input wire [1:0] op, input wire i0, i1, cin,
                 output wire o, cout);

wire t_sumdiff, t_and, t_or, t_andor;

addsub addsub_i0(op[0], i0, i1, cin, t_sumdiff, cout);

assign t_and = i0 & i1;
assign t_or = i0 | i1;

assign t_andor = (op[0] == 1'b0) ? t_and : t_or;

assign o = (op[1] == 1'b0) ? t_andor : t_sumdiff;

endmodule


module alu(input wire [1:0] op,
           input wire [15:0] i0, i1,
           output wire [15:0] o,
           output wire cout);

wire [15:0] c;

alu_slice alu_slice_i0 (op, i0[0],  i1[0],  op[0], o[0],  c[0]);
alu_slice alu_slice_i1 (op, i0[1],  i1[1],  c[0],  o[1],  c[1]);
alu_slice alu_slice_i2 (op, i0[2],  i1[2],  c[1],  o[2],  c[2]);
alu_slice alu_slice_i3 (op, i0[3],  i1[3],  c[2],  o[3],  c[3]);
alu_slice alu_slice_i4 (op, i0[4],  i1[4],  c[3],  o[4],  c[4]);
alu_slice alu_slice_i5 (op, i0[5],  i1[5],  c[4],  o[5],  c[5]);
alu_slice alu_slice_i6 (op, i0[6],  i1[6],  c[5],  o[6],  c[6]);
alu_slice alu_slice_i7 (op, i0[7],  i1[7],  c[6],  o[7],  c[7]);
alu_slice alu_slice_i8 (op, i0[8],  i1[8],  c[7],  o[8],  c[8]);
alu_slice alu_slice_i9 (op, i0[9],  i1[9],  c[8],  o[9],  c[9]);
alu_slice alu_slice_i10(op, i0[10], i1[10], c[9],  o[10], c[10]);
alu_slice alu_slice_i11(op, i0[11], i1[11], c[10], o[11], c[11]);
alu_slice alu_slice_i12(op, i0[12], i1[12], c[11], o[12], c[12]);
alu_slice alu_slice_i13(op, i0[13], i1[13], c[12], o[13], c[13]);
alu_slice alu_slice_i14(op, i0[14], i1[14], c[13], o[14], c[14]);
alu_slice alu_slice_i15(op, i0[15], i1[15], c[14], o[15], c[15]);

assign cout = c[15];

endmodule