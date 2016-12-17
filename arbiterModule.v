module arbiter(clk,req,gnt,frame,irdy,trdy);

input wire [7:0] req;
output wire [7:0] gnt;
input wire frame,irdy,trdy;
input wire clk;
reg [2:0]fifs[0:7];
reg [2:0]pointer;
reg no_of_pushes;
reg [7:0]last_gnt;
initial begin
pointer=0;
no_of_pushes=0;
//fifs[0]=0;
end
//assign gnt[fifs[0]] = (~(pointer==0)&&(frame==1)&&irdy==0)?(1):(0);
//assign gnt[last_gnt] = (~(pointer==0)&&(frame==1)&&irdy==0)? 0:1;

always@(negedge(req[0]) or negedge(req[0]) or negedge(req[1]) or 
negedge(req[2]) or negedge(req[3]) or negedge(req[4]) or 
negedge(req[5]) or negedge(req[6]) or negedge(req[7]) )
begin

end


always@(negedge(req[0]))
begin
fifs[pointer]<=0;
pointer<=pointer+1;
end
always@(negedge(req[1]))
begin
fifs[pointer]<=1;
pointer<=pointer+1;
end
always@(negedge(req[2]))
begin
fifs[pointer]<=2;
pointer<=pointer+1;
end
always@(negedge(req[3]))
begin
fifs[pointer]<=3;
pointer<=pointer+1;
end
always@(negedge(req[4]))
begin
fifs[pointer]<=4;
pointer<=pointer+1;
end
always@(negedge(req[5]))
begin
fifs[pointer]<=5;
pointer<=pointer+1;
end
always@(negedge(req[6]))
begin
fifs[pointer]<=6;
pointer<=pointer+1;
end
always@(negedge(req[7]))
begin
fifs[pointer]<=7;
pointer<=pointer+1;
end

initial 
begin
$monitor("%d %d %d  fifs[0]=%d fifs[1]=%d",req[0],req[1],req[2],fifs[0],fifs[1]);
end



endmodule


module tb;

reg [7:0]req;
wire [7:0]gnt;
wire clk,trdy,irdy,frame;

initial
begin
//$monitor("%d %d",req[0],req[1]);

req[0]=1;
req[1]=1;
req[2]=1;
req[3]=1;
req[4]=1;
req[5]=1;
req[6]=1;
req[7]=1;
#5
req[0]=0;
req[1]=0;
#5
$finish;


end

arbiter x(clk,req,gnt,trdy,irdy,frame);

endmodule
