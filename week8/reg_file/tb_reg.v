module tb;

reg clk, reset, wr;
reg [2:0] rd_addr_a, rd_addr_b, wr_addr;
reg [15:0] d_in;

wire [15:0] d_out_a, d_out_b;

reg_file reg_file_0 (
    clk, reset, wr,
    rd_addr_a, rd_addr_b, wr_addr,
    d_in, d_out_a, d_out_b
);


initial begin
    wr = 0;
    rd_addr_a = 0;
    rd_addr_b = 0;
    wr_addr = 0;
    d_in = 0;
end


initial begin
    $dumpfile("tb_reg_file.vcd");
    $dumpvars(0, tb);
end


initial begin
    reset = 1'b1;
    #12.5 reset = 1'b0;
end


initial clk = 1'b0;
always #5 clk = ~clk;


initial begin
    #0;
    wr = 1'b1;
    rd_addr_a = 3'bxxx;
    rd_addr_b = 3'bxxx;
    wr_addr = 3'o3;
    d_in = 16'hcdef;

    #10;
    wr = 1'b1;
    rd_addr_a = 3'bxxx;
    rd_addr_b = 3'bxxx;
    wr_addr = 3'o7;
    d_in = 16'h3210;

    #10;
    wr = 1'b1;
    rd_addr_a = 3'bxxx;
    rd_addr_b = 3'o7;
    wr_addr = 3'h5;
    d_in = 16'h4567;

    #10;
    wr = 1'b1;
    rd_addr_a = 3'o1;
    rd_addr_b = 3'o5;
    wr_addr = 3'o0;
    d_in = 16'hba98;

    #10;
    wr = 1'b0;
    rd_addr_a = 3'o0;
    rd_addr_b = 3'o5;
    wr_addr = 3'bxxx;
    d_in = 16'hxxxx;

    #10;
    wr = 1'b0;
    rd_addr_a = 3'o0;
    rd_addr_b = 3'o0;
    wr_addr = 3'bxxx;
    d_in = 16'hxxxx;

    #10;
    $finish;
end


initial begin
    $monitor("Time = %0t | clk = %b | reset = %b | wr = %b | rd_addr_a = %b | rd_addr_b = %b | wr_addr = %b | d_in = %h | d_out_a = %h | d_out_b = %h",
             $time, clk, reset, wr, rd_addr_a, rd_addr_b, wr_addr, d_in, d_out_a, d_out_b);
end

endmodule