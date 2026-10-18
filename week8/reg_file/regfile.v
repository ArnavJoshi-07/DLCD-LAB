module dfrl_16(
    input wire clk, reset, load,
    input wire [0:15] in,
    output wire [0:15] out
);

dfrl dfrl_f0 (clk, reset, load, in[0], out[0]);
dfrl dfrl_f1 (clk, reset, load, in[1], out[1]);
dfrl dfrl_f2 (clk, reset, load, in[2], out[2]);
dfrl dfrl_f3 (clk, reset, load, in[3], out[3]);
dfrl dfrl_f4 (clk, reset, load, in[4], out[4]);
dfrl dfrl_f5 (clk, reset, load, in[5], out[5]);
dfrl dfrl_f6 (clk, reset, load, in[6], out[6]);
dfrl dfrl_f7 (clk, reset, load, in[7], out[7]);
dfrl dfrl_f8 (clk, reset, load, in[8], out[8]);
dfrl dfrl_f9 (clk, reset, load, in[9], out[9]);
dfrl dfrl_f10 (clk, reset, load, in[10], out[10]);
dfrl dfrl_f11 (clk, reset, load, in[11], out[11]);
dfrl dfrl_f12 (clk, reset, load, in[12], out[12]);
dfrl dfrl_f13 (clk, reset, load, in[13], out[13]);
dfrl dfrl_f14 (clk, reset, load, in[14], out[14]);
dfrl dfrl_f15 (clk, reset, load, in[15], out[15]);

endmodule


module mux8_16(
    input wire [0:15] i0, i1, i2, i3, i4, i5, i6, i7,
    input wire [0:2] j,
    output wire [0:15] o
);

genvar k;

generate
    for (k = 0; k < 16; k = k + 1) begin : mux_bits
        mux8 mux8_inst(
            {i0[k], i1[k], i2[k], i3[k],
             i4[k], i5[k], i6[k], i7[k]},
            j[0], j[1], j[2],
            o[k]
        );
    end
endgenerate

endmodule


module reg_file(
    input wire clk, reset, wr,
    input wire [0:2] rd_addr_a, rd_addr_b, wr_addr,
    input wire [0:15] d_in,
    output wire [0:15] d_out_a, d_out_b
);

wire [7:0] load;

wire [0:15] dout_0, dout_1, dout_2, dout_3;
wire [0:15] dout_4, dout_5, dout_6, dout_7;

dfrl_16 dfrl_16_0(clk, reset, load[0], d_in, dout_0);
dfrl_16 dfrl_16_1(clk, reset, load[1], d_in, dout_1);
dfrl_16 dfrl_16_2(clk, reset, load[2], d_in, dout_2);
dfrl_16 dfrl_16_3(clk, reset, load[3], d_in, dout_3);
dfrl_16 dfrl_16_4(clk, reset, load[4], d_in, dout_4);
dfrl_16 dfrl_16_5(clk, reset, load[5], d_in, dout_5);
dfrl_16 dfrl_16_6(clk, reset, load[6], d_in, dout_6);
dfrl_16 dfrl_16_7(clk, reset, load[7], d_in, dout_7);

demux8 demux8_0(
    wr,
    wr_addr[0], wr_addr[1], wr_addr[2],
    load
);

mux8_16 mux_16_9(
    dout_0, dout_1, dout_2, dout_3,
    dout_4, dout_5, dout_6, dout_7,
    rd_addr_a, d_out_a
);

mux8_16 mux_16_10(
    dout_0, dout_1, dout_2, dout_3,
    dout_4, dout_5, dout_6, dout_7,
    rd_addr_b, d_out_b
);

endmodule