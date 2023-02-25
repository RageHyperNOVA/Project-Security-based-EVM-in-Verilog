//add reset to make all zero in continous running condition
//say about push button in the ppt
module evmachine(vswitch, clk,en,dout,seg0,seg1,seg2,inv);
input [2:0] vswitch;
input clk,en;
output reg [2:0] dout = 3'b000,seg0=3'b000,seg1=3'b000,seg2=3'b000;
output reg inv;

always @(posedge clk)
begin
if(en==1 && vswitch==3'b001)
begin
inv<=1'b0;
seg0 <= seg0 + 3'b001;
dout <= dout + 3'b001;
end
else if(en==1 && vswitch == 3'b010)
begin
inv<=1'b0;
seg1<=seg1+3'b001;
dout<=dout+3'b001;
end
else if(en==1 && vswitch == 3'b100)
begin
inv<=3'b0;
seg2 <= seg2+3'b001;
dout<=dout+3'b001;
end
else
begin
inv<=1'b1;
seg0 <= seg0;
seg1<=seg1;
seg2<=seg2;
dout<=dout;
end
end
endmodule

module evmachine_tb();
reg [2:0] vstch;
reg clk,en;
wire [2:0] dout,s0,s1,s2;
wire inv;
evmachine ev1(vstch,clk,en,dout,s0,s1,s2,inv);
always #5 clk=~clk;
initial 
begin
clk=0;
en=0;
vstch = 3'b000;

#10
en = 1;
vstch = 3'b001;
#10
en=1;
vstch = 3'b001;
#10
vstch = 3'b010;
#10 vstch = 3'b100;
#10 $stop;
end
endmodule
