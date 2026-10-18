`define TESTVECS 32
module tb;
reg [2:0] i;
reg y, y0;
wire sum, cout;
reg [4:0] test_vecs [0:(`TESTVECS-1)];
integer k;

initial
begin
    $dumpfile("circuit2.vcd");
    $dumpvars(0, tb);
end

initial
begin
  test_vecs[0]=5'b00000;
  test_vecs[1]=5'b00001;
  test_vecs[2]=5'b00010;
  test_vecs[3]=5'b00011;
  test_vecs[4]=5'b00100;
  test_vecs[5]=5'b00101;
  test_vecs[6]=5'b00110;
  test_vecs[7]=5'b00111;
  test_vecs[8]=5'b01000;
  test_vecs[9]=5'b01001;
  test_vecs[10]=5'b01010;
  test_vecs[11]=5'b01011;
  test_vecs[12]=5'b01100;
  test_vecs[13]=5'b01101;
  test_vecs[14]=5'b01110;
  test_vecs[15]=5'b01111;
  test_vecs[16]=5'b10000;
  test_vecs[17]=5'b10001;
  test_vecs[18]=5'b10010;
  test_vecs[19]=5'b10011;
  test_vecs[20]=5'b10100;
  test_vecs[21]=5'b10101;
  test_vecs[22]=5'b10110;
  test_vecs[23]=5'b10111;
  test_vecs[24]=5'b11000;
  test_vecs[25]=5'b11001;
  test_vecs[26]=5'b11010;
  test_vecs[27]=5'b11011;
  test_vecs[28]=5'b11100;
  test_vecs[29]=5'b11101;
  test_vecs[30]=5'b11110;
  test_vecs[31]=5'b11111;
end

initial
begin
  {i, y, y0} = 0;
end

circuit circuit_0(i, y, y0, sum, cout);

initial
begin
for (k=0; k<`TESTVECS; k=k+1)
  begin
    #10 {i,y,y0} = test_vecs[k];
  end
  #10 $finish;
end

initial
begin
$monitor($time, " i=%b, y=%b, y0=%b, sum=%b, cout=%b", i, y, y0, sum, cout);
end
endmodule