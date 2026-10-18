`define TESTVECS 8

module tb;
reg [2:0]i1;
reg i2;
wire sum1, cout1;
reg [3:0] tests [0:`TESTVECS - 1];
integer i;

initial begin
    tests[0] = 4'b0000;
    tests[1] = 4'b0011;
    tests[2] = 4'b0100;
    tests[3] = 4'b0111;
    tests[4] = 4'b1000;
    tests[5] = 4'b1011;
    tests[6] = 4'b1100;
    tests[7] = 4'b1111;
end
initial begin
    {i1,i2} = 0;
end
initial begin
    for(i=0; i<`TESTVECS ; i = i+1)
    begin
        #10 {i1,i2} = tests[i];
    end
    #10 $finish;
end
circuit3 g1(i1,i2,sum1,cout1);

initial begin
    $dumpfile("circuit.vcd");
    $dumpvars(0,tb);
    $monitor($time, "i1= %b, i2 = %b, sum = %b, cout = %b ",i1,i2,sum1,cout1);
end
endmodule