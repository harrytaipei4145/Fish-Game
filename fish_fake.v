module fish_fake(body,tail1,tail2,clk ,rst,row,col,size,ini,eat,x,y,ini_x);
input x,y;
input signed[10:0]ini,ini_x;

input signed[11:0] size;
input signed[11:0] row;
input signed[11:0]col;
input rst;
input clk;
input eat;

reg flag;
output body;
output tail1;
output tail2;


reg clk_new;
reg [22:0]count;
reg temp_x,temp_y;
reg signed[11:0] left,up;




assign body =(col-75-left-ini_x)*(col-75-left-ini_x)+(row-ini-195-up)*(row-ini-195-up)<{0,(size)*(size)}&(eat);
assign tail1= ((row + col > 302+left+up+ini+ini_x) & (row -94+left-up-ini+ini_x< col) & (col<= ini_x+150+left) &(flag==1)&(eat));
assign tail2= ((col>=left+ini_x )&(row + col < 242+left+up+ini+ini_x )& (row -137+left-up-ini+ini_x> col) &(flag==0)&(eat));






always @(posedge clk or posedge rst)
begin
if(rst)begin
count<=0;
clk_new<=0;
end
else if(count<=3125000)begin
count<=count+1;
clk_new<=1;
end
else if(count<=6250000)begin
count<=0;
clk_new<=0;
end
else
begin
count<=count+1;
clk_new<=clk_new;
end
end


always @(posedge clk_new or posedge rst)begin
if(rst)begin
up<=0;
temp_y<=y;
end
else if(ini+195+up-size==23)begin
temp_y<=1;
up<=up+1;
end
else if(ini+195+up+size==623)begin
temp_y<=0;
up<=up-1;
end
else if(temp_y==1)begin
up<=up+1;
temp_y<=temp_y;
end
else if(temp_y==0)begin
up<=up-1;
temp_y<=temp_y;
end
else
begin
up<=up;
temp_y<=temp_y;
end
end






always @(posedge clk_new or posedge rst)begin
if(rst)begin
left<=0;
temp_x<=x;
flag<=1-x;
end
else if(75+left-size+ini_x==104)begin
temp_x<=1;
left<=left+1;
flag<=0;
end
else if(75+left+size+ini_x==903)begin
temp_x<=0;
left<=left-1;
flag<=1;
end
else if(temp_x==1)begin
temp_x<=temp_x;
left<=left+1;
flag<=flag;
end
else if(temp_x==0)begin
temp_x<=temp_x;
left<=left-1;
flag<=flag;
end
else
begin
left<=left;
temp_x<=temp_x;
flag<=flag;
end
end





endmodule