module fish(body,tail1,tail2,clk ,rst,row,col,key_data,size,in_valid,ini,eat,big,sm);
input signed[10:0]ini;

input in_valid;
input signed[11:0] size;
input signed[11:0] row;
input signed[11:0]col;
input rst;
input clk;
input eat;
input [7:0]key_data;
reg flag;
output body;
output tail1;
output tail2;

reg signed [1:0]i;

output reg signed [8:0]big,sm;

reg [22:0]cou2,cou9;
reg signed[10:0]left,up;






assign body =(col-458-left)*(col-458-left)+(row-ini-195-up)*(row-ini-195-up)<{0,(size+big-sm)*(size+big-sm)}&(eat);
assign tail1= ((row + col > 667+left+up+big-sm+ini) & (row +271+left+big-up-sm-ini < col) & (col <= 495+left+big+big-sm-sm) &(flag==1)&(eat));
assign tail2= ((col>=425+left-big-big+sm+sm)&(row + col < 647+left+up+ini-big+sm)& (row +251+left-big-up-ini+sm > col) &(flag==0)&(eat));


always @(posedge clk or posedge rst)begin
if(rst)begin
cou9<=0;

end
else 
	begin
		if(cou9==1562500)
			cou9<=0;
		else
			cou9<=cou9+1;
	end
end

always @(posedge clk or posedge rst)
begin
if(rst)
flag<=0;
else if(key_data==8'b01101011 &&in_valid)
flag<=1;

else if (key_data==8'h74 &&in_valid)
flag<=0;

else if(in_valid==0 && cou9==1562500)
	begin
		if(475+left-size+sm-big!=104 && 475+left+size-sm+big!=903)
			flag<=flag;
			else if(475+left-size+sm-big==104)
			begin
			flag<=0;
			
		end
		else if(475+left+size-sm+big==903)
		begin
			flag<=1;
		end
		else
			flag<=flag;
	end
else 
flag<=flag;
			

end





always @(posedge clk or posedge rst)begin
if(rst)begin
cou2<=0;
end
 else if((key_data==8'b01101011 || key_data==8'b00101001 || key_data==8'b01011010 || key_data==8'b01110010 || key_data==8'b01110101 || key_data==8'b01110100) && in_valid)begin
		
		if(cou2==1562500)
		cou2<=0;
		
		else
		cou2<=cou2+1;
     end
	 else
	 cou2<=cou2;
end


always @(posedge clk or posedge rst)
begin
	if(rst)begin
		up<=0;
		end
	else if(cou2==1562500 && key_data==8'b01110101)begin
	if(ini+195+up-size-big+sm==23)
	up<=up;
	else
	
		up<=up-1;
		end
	else if(cou2==1562500 && key_data==8'b01110010)begin
		if(ini+195+up+size+big-sm==622)
	   up<=up;
	   else
		up<=up+1;
		end
		else 
		begin
		up<=up;		
		end
end

always @(posedge clk or posedge rst)
begin
	if(rst)begin
		left<=0;
		i<=1;
		end
		
	else if(in_valid==0 && cou9==1562500)
	begin
	if(475+left-size+sm-big!=104 && 475+left+size-sm+big!=903)
		left<=left+i;
	else if(475+left-size+sm-big==104)
	begin
		i<=1;
		left<=left+i;
		
	end
	else if(475+left+size-sm+big==903)
	begin
		i<=-1;
		left<=left+i;
	end
	else
		left<=left;
	end
	
	else if(cou2==1562500 && key_data==8'b01101011)begin
	if(475+left-size+sm-big==104)
	left<=left;
	else
	
		left<=left-1;
		end
	else if(cou2==1562500 && key_data==8'b01110100)begin
		if(475+left+size-sm+big==903)
	   left<=left;
	   else
		left<=left+1;
		end
		else 
		begin
		left<=left;		
		end
end

always @(posedge clk or posedge rst)
begin
	if(rst)begin
	big<=0;
	end
	
	else if(cou2==500000 && key_data==8'b01011010)begin
	if(big==200)
	big<=big;
	else
	begin
		big<=big+10;
	end
	end
	else
	begin
    big<=big;
    end

end


always @(posedge clk or posedge rst)
begin
	if(rst)begin
	sm<=0;
	end
	else if(cou2==500000 && key_data==8'b00101001)begin
	if(sm==200 || (big-sm+size<=10))
	sm <=sm;
	else
	begin
		sm<=sm+10;
	end
	end
	else
	begin
    sm<=sm;
    end

end

endmodule