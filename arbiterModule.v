module arbiter(clk,req,gnt,frame,irdy,trdy);

input wire [7:0] req;
output reg [7:0] gnt;
input wire frame,irdy,trdy;
input wire clk;
reg [3:0]fifs[0:7];
reg [2:0]pointer;
reg no_of_pushes;
reg [7:0]last_gnt;
reg gnt_or_not;
reg check;
reg f;



initial begin
f=0;
pointer=0;
no_of_pushes=0;
fifs[0]=10;
fifs[1]=10;
fifs[2]=10;
fifs[3]=10;
fifs[4]=10;
fifs[5]=10;
fifs[6]=10;
fifs[7]=10;
gnt[0]=1;
gnt[1]=1;
gnt[2]=1;
gnt[3]=1;
gnt[4]=1;
gnt[5]=1;
gnt[6]=1;
gnt[7]=1;
gnt_or_not=0;
check=1;

//fifs[]
end

always@(negedge (clk))
begin

//if(gnt_or_not==0)
if(frame==1&&irdy==1)
begin
if(~(pointer==0))
begin
check<=~check;
gnt[fifs[0]]<=0;
gnt[last_gnt]<=1;
last_gnt<=fifs[0];
pointer<=pointer-1;
fifs[0]<=fifs[1];
fifs[1]<=fifs[2];
fifs[2]<=fifs[3];
fifs[3]<=fifs[4];
fifs[4]<=fifs[5];
fifs[5]<=fifs[6];
fifs[6]<=fifs[7];
//gnt_or_not<=1;


end



end
end

always@(posedge(clk))
begin

if((req[0]==0)&&((fifs[0]!=0)&&(gnt[0]!=0))&&(fifs[1]!=0)&&(fifs[2]!=0)&&(fifs[3]!=0)
&&(fifs[4]!=0)&&(fifs[5]!=0)&&(fifs[6]!=0)&&(fifs[7]!=0))
begin
fifs[pointer]<=0;
pointer<=pointer+1;
end
if((req[1]==0)&&((fifs[0]!=1)&&(gnt[1]!=0))&&(fifs[1]!=1)&&(fifs[2]!=1)&&(fifs[3]!=1)
&&(fifs[4]!=1)&&(fifs[5]!=1)&&(fifs[6]!=1)&&(fifs[7]!=1))
begin
fifs[pointer]<=1;
pointer<=pointer+1;
end
if((req[2]==0)&&((fifs[0]!=2)&&(gnt[2]!=0))&&(fifs[1]!=2)&&(fifs[2]!=2)&&(fifs[3]!=2)
&&(fifs[4]!=2)&&(fifs[5]!=2)&&(fifs[6]!=2)&&(fifs[7]!=2))
begin
fifs[pointer]<=2;
pointer<=pointer+1;
end
if((req[3]==0)&&((fifs[0]!=3)&&(gnt[3]!=0))&&(fifs[1]!=3)&&(fifs[2]!=3)&&(fifs[3]!=3)
&&(fifs[4]!=3)&&(fifs[5]!=3)&&(fifs[6]!=3)&&(fifs[7]!=3))
begin
fifs[pointer]<=3;
pointer<=pointer+1;
end
if((req[4]==0)&&((fifs[0]!=4)&&(gnt[4]!=0))&&(fifs[1]!=4)&&(fifs[1]!=4)&&(fifs[2]!=4)&&(fifs[3]!=4)
&&(fifs[4]!=4)&&(fifs[5]!=4)&&(fifs[6]!=4)&&(fifs[7]!=4))
begin
fifs[pointer]<=4;
pointer<=pointer+1;
end
if((req[5]==0)&&((fifs[0]!=5)&&(gnt[5]!=0))&&(fifs[1]!=5)&&(fifs[1]!=5)&&(fifs[2]!=5)&&(fifs[3]!=5)
&&(fifs[4]!=5)&&(fifs[5]!=5)&&(fifs[6]!=5)&&(fifs[7]!=5))
begin
fifs[pointer]<=5;
pointer<=pointer+1;
end
if((req[6]==0)&&((fifs[0]!=6)&&(gnt[6]!=0))&&(fifs[1]!=6)&&(fifs[1]!=6)&&(fifs[2]!=6)&&(fifs[3]!=6)
&&(fifs[4]!=6)&&(fifs[5]!=6)&&(fifs[6]!=6)&&(fifs[7]!=6))
begin
fifs[pointer]<=6;
pointer<=pointer+1;
end
if((req[7]==0)&&((fifs[0]!=7)&&(gnt[7]!=0))&&(fifs[1]!=7)&&(fifs[1]!=7)&&(fifs[2]!=7)&&(fifs[3]!=7)
&&(fifs[4]!=7)&&(fifs[5]!=7)&&(fifs[6]!=7)&&(fifs[7]!=7))
begin
fifs[pointer]<=7;
pointer<=pointer+1;
end


end
always@(negedge(frame))
begin
f<=1;
end

always@(posedge(frame))
//@(negedge(frame))
begin
if(frame==0&&f==1)
begin


if(~(pointer==0))
begin
gnt[last_gnt]<=1;
gnt[fifs[0]]<=0;
last_gnt=fifs[0];
pointer<=pointer-1;
fifs[0]<=fifs[1];
fifs[1]<=fifs[2];
fifs[2]<=fifs[3];
fifs[3]<=fifs[4];
fifs[4]<=fifs[5];
fifs[5]<=fifs[6];
fifs[6]<=fifs[7];
f<=0;
end
end
end
//end




initial 
begin
$monitor("%d ch=%d fr=%d %d %d %d %d %d %d %d %d  p=%d g0=%d g1=%d g2=%d g3=%d g4=%d g5=%d g6=%d g7=%d fi[0]=%d fi[1]=%d fi[2]=%d fi[3]=%d fi[4]=%d fi[5]=%d fi[6]=%d fi[7]=%d ",clk,check,frame,req[0],req[1],req[2],req[3],req[4],req[5],req[6],req[7],pointer,gnt[0],gnt[1],gnt[2],gnt[3],gnt[4],gnt[5],gnt[6],gnt[7],fifs[0],fifs[1],fifs[2],fifs[3],fifs[4],fifs[5],fifs[6],fifs[7]);
end
///*fifs[0]=%d fifs[1]=%d fifs[2]=%d fifs[3]=%d fifs[4]=%d fifs[5]=%d fifs[6]=%d fifs[7]=%d */
//,fifs[0],fifs[1],fifs[2],fifs[3],fifs[4],fifs[5],fifs[6],fifs[7]

endmodule




/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
module arbiterTB;

reg clk ;
wire [7:0] GNT;

wire [7:0] FRAMES , IRDYS, I_AM_OWNERS;
wire GLOBAL_IRDY , GLOBAL_FRAME;
wire [7:0]REQ;
reg [7:0] STARTS = 8'h00;


always 
begin
#5
clk <= ~ clk;
end

initial 
begin
clk <= 0 ;

# 20
STARTS[0] <= 1 ;

#20
STARTS[1] <=1;
#20
STARTS[2] <=1;
#20
STARTS[3] <=1;


# 200
STARTS[3] <=0;
#20 
STARTS[5] <=1;
STARTS[7] <=1;
STARTS[1] <=0;
STARTS[0] <=0;
#1000
$finish;

end

SpecializedMux myMux(I_AM_OWNERS,IRDYS,FRAMES,GLOBAL_IRDY,GLOBAL_FRAME);

arbiter A(clk,REQ,GNT,GLOBAL_FRAME,GLOBAL_IRDY, 1'b1);

SimpleInitiator simple0 (STARTS[0],clk,REQ[0],GNT[0],FRAMES[0],IRDYS[0],I_AM_OWNERS[0] , GLOBAL_IRDY,GLOBAL_FRAME);
SimpleInitiator simple1 (STARTS[1],clk,REQ[1],GNT[1],FRAMES[1],IRDYS[1],I_AM_OWNERS[1] , GLOBAL_IRDY,GLOBAL_FRAME);
SimpleInitiator simple2 (STARTS[2],clk,REQ[2],GNT[2],FRAMES[2],IRDYS[2],I_AM_OWNERS[2] , GLOBAL_IRDY,GLOBAL_FRAME);
SimpleInitiator simple3 (STARTS[3],clk,REQ[3],GNT[3],FRAMES[3],IRDYS[3],I_AM_OWNERS[3] , GLOBAL_IRDY,GLOBAL_FRAME);
SimpleInitiator simple4 (STARTS[4],clk,REQ[4],GNT[4],FRAMES[4],IRDYS[4],I_AM_OWNERS[4] , GLOBAL_IRDY,GLOBAL_FRAME);
SimpleInitiator simple5 (STARTS[5],clk,REQ[5],GNT[5],FRAMES[5],IRDYS[5],I_AM_OWNERS[5] , GLOBAL_IRDY,GLOBAL_FRAME);
SimpleInitiator simple6 (STARTS[6],clk,REQ[6],GNT[6],FRAMES[6],IRDYS[6],I_AM_OWNERS[6] , GLOBAL_IRDY,GLOBAL_FRAME);
SimpleInitiator simple7 (STARTS[7],clk,REQ[7],GNT[7],FRAMES[7],IRDYS[7],I_AM_OWNERS[7] , GLOBAL_IRDY,GLOBAL_FRAME);



endmodule



module SimpleInitiator (start,clk,REQ,GNT,FRAME,IRDY,I_AM_OWNER , GLOBAL_IRDY,GLOBAL_FRAME);
input wire clk,GNT,start;
input wire GLOBAL_IRDY , GLOBAL_FRAME;
output reg REQ = 1,FRAME = 1,I_AM_OWNER = 0,IRDY =1  ;

integer counter = 0;

wire IDLE ;
assign IDLE = GLOBAL_FRAME & GLOBAL_IRDY ;

reg pipeline1 =1,pipeline2 =1,pipeline3 =1,pipeline4 =1,pipeline5 = 1 ;

always @(posedge clk)
begin
if(start & (GNT) & FRAME)
begin
	@(negedge clk)
	REQ<=0;
end
else if ((~GNT)  && IDLE & (~ REQ) )
begin
	@(negedge clk)
	REQ<=1;
	FRAME <= 0 ;
end
else if(~ pipeline4 && pipeline5)
begin
@(negedge clk)
FRAME <=1 ;
end


end

always @(posedge clk)
begin

if(~ pipeline1 && pipeline2)
begin
@(negedge clk)
IRDY <= 0;
end

else if (~ pipeline5)
begin
@(negedge clk)
IRDY <=1;
end

end


always @(posedge clk)
begin

 if ((~GNT)  && IDLE & (~ REQ) )
begin
	@(negedge clk)
	I_AM_OWNER<=1;
end
else if (~ pipeline5)
begin
@(negedge clk)
I_AM_OWNER<=0;
end

end


always @(posedge clk)
begin
pipeline1 <= FRAME ;
pipeline2 <= pipeline1;
pipeline3 <= pipeline2;
pipeline4 <= pipeline3;
pipeline5 <= pipeline4;


end


endmodule



module SpecializedMux(I_AM_OWNERS,IRDYS,FRAMES,GLOBAL_IRDY,GLOBAL_FRAME);


input [7:0] I_AM_OWNERS,IRDYS,FRAMES;
output wire GLOBAL_IRDY,GLOBAL_FRAME;

assign {GLOBAL_IRDY,GLOBAL_FRAME} = 
(I_AM_OWNERS[0]) ? {IRDYS[0],FRAMES[0]} :
(I_AM_OWNERS[1]) ? {IRDYS[1],FRAMES[1]} :
(I_AM_OWNERS[2]) ? {IRDYS[2],FRAMES[2]} :
(I_AM_OWNERS[3]) ? {IRDYS[3],FRAMES[3]} :
(I_AM_OWNERS[4]) ? {IRDYS[4],FRAMES[4]} :
(I_AM_OWNERS[5]) ? {IRDYS[5],FRAMES[5]} :
(I_AM_OWNERS[6]) ? {IRDYS[6],FRAMES[6]} :
(I_AM_OWNERS[7]) ? {IRDYS[7],FRAMES[7]} : {1'b1,1'b1};



endmodule