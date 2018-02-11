`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:30:49 01/09/2016 
// Design Name: 
// Module Name:    final 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module final(input sw0,input sw1,input sw2,input sw3,input rst,output VGA_HSYNC,output VGA_VSYNC,output reg VGA_RED,output reg VGA_BLUE,output reg VGA_GREEN,input clk,input kdata,input kclk);

reg signed[11:0] col;
reg signed[11:0] row;
reg signed[10:0] up,left;
reg n_state,c_state;
reg [21:0]key_reg;
reg [7:0]key_data;
wire check;
wire visible;

wire body1,body2,body3,body4,body5,body6,body7,body8,body9,body10;
reg [22:0]cou1,count;
reg clk_new;
wire tail1;
wire tail2;
wire tail3;
wire tail4;
wire tail5;
wire tail6;
wire tail7;
wire tail8;
wire tail9;
wire tail10;


wire tail11;
wire tail12;
wire tail13;
wire tail14;
wire tail15;
wire tail16;
wire tail17;
wire tail18;
wire tail19;
wire tail20;
reg over,G,G1;
reg eat1,eat2,eat3,eat4,eat5,eat6,eat7,eat8,eat9,eat10;
wire [8:0] big1,big2,big3,big4;
wire [8:0] sm1,sm2,sm3,sm4;
wire [19:0] g1,g2,g3,g4,g5,g6,g7,g8,g9,g10,g11,g12,g13,g14,g15,g16,g17,g18,g19,g20;


assign check=key_reg[1]^key_reg[2]^key_reg[3]^key_reg[4]^key_reg[5]^key_reg[6]^key_reg[7]^key_reg[8]^key_reg[9];

assign VGA_HSYNC = ~((col >= 919) & (col < 1039) );
assign VGA_VSYNC = ~((row >= 659) & (row < 665) );
assign visible = ((col >= 104 ) & (col < 904 ) & (row >= 23) & (row < 623));   
assign  g1=20'b00000001111111100000;
assign  g2=20'b00001111111111100000;
assign  g3=20'b00111000000000000000;
assign  g4=20'b01110000000000000000;
assign  g5=20'b11100000000000000000;
assign  g6=20'b11100000000000000000;
assign  g7=20'b11100000000000000000;
assign  g8=20'b11100000000000000000;
assign  g9=20'b11100000111111100000;
assign g10=20'b11100000111111100000;
assign g11=20'b11100000000001100000;
assign g12=20'b11100000000001100000;
assign g13=20'b11100000000001100000;
assign g14=20'b11100000000001100000;
assign g15=20'b01110000000001100000;
assign g16=20'b00111000000001100000;
assign g17=20'b00011100000001100000;
assign g18=20'b00001110000001100000;
assign g19=20'b00000111111111100000;
assign g20=20'b00000001111111100000;




always @(posedge clk or posedge rst)begin
if(rst)
over<=0;
else if(eat1==0 && eat2==0 && eat3==0 && eat4==0)
over<=1;
else
over<=over;
end

always@(posedge clk)
begin
	if(rst)
		G<=0;
	else if(over==1 &&col<410 &&col>=390)
	begin
		case(row)
		500:G<=g1[409-col];
		501:G<=g2[409-col];
		502:G<=g3[409-col];
		503:G<=g4[409-col];
		504:G<=g5[409-col];
		505:G<=g6[409-col];
		506:G<=g7[409-col];
		507:G<=g8[409-col];
		508:G<=g9[409-col];
		509:G<=g10[409-col];
		510:G<=g11[409-col];
		511:G<=g12[409-col];
		512:G<=g13[409-col];
		513:G<=g14[409-col];
		514:G<=g15[409-col];
		515:G<=g16[409-col];
		516:G<=g17[409-col];
		517:G<=g18[409-col];
		518:G<=g19[409-col];
		519:G<=g20[409-col];
		endcase
		
	end
	else 
		 G<=0;

end

always@(posedge clk)
begin
	if(rst)
		G1<=0;
	else if(over==1 &&col<440 &&col>=420)
	begin
		case(row)
		500:G1<=g1[439-col];
		501:G1<=g2[439-col];
		502:G1<=g3[439-col];
		503:G1<=g4[439-col];
		504:G1<=g5[439-col];
		505:G1<=g6[439-col];
		506:G1<=g7[439-col];
		507:G1<=g8[439-col];
		508:G1<=g9[439-col];
		509:G1<=g10[439-col];
		510:G1<=g11[439-col];
		511:G1<=g12[439-col];
		512:G1<=g13[439-col];
		513:G1<=g14[439-col];
		514:G1<=g15[439-col];
		515:G1<=g16[439-col];
		516:G1<=g17[439-col];
		517:G1<=g18[439-col];
		518:G1<=g19[439-col];
		519:G1<=g20[439-col];
		endcase
		
	end
	else 
		 G1<=0;

end



fish fish1(body1,tail1,tail2,clk,rst,row,col,key_data,16'd10,sw0,0,eat1,big1,sm1);
fish fish2(body2,tail3,tail4,clk,rst,row,col,key_data,16'd12,sw1,100,eat2,big2,sm2);
fish fish3(body3,tail5,tail6,clk,rst,row,col,key_data,16'd13,sw2,200,eat3,big3,sm3);
fish fish4(body4,tail7,tail8,clk,rst,row,col,key_data,16'd14,sw3,350,eat4,big4,sm4);

fish_fake fish_fake1(body5,tail9,tail10,clk,rst,row,col,16'd15,350,eat5,1,0,10);
fish_fake fish_fake2(body6,tail11,tail12,clk,rst,row,col,16'd16,350,eat6,0,1,110);
fish_fake fish_fake3(body7,tail13,tail14,clk,rst,row,col,16'd17,350,eat7,1,1,210);
fish_fake fish_fake4(body8,tail15,tail16,clk,rst,row,col,16'd18,350,eat8,0,0,800);
fish_fake fish_fake5(body9,tail17,tail18,clk,rst,row,col,16'd19,350,eat9,1,0,700);
fish_fake fish_fake6(body10,tail19,tail20,clk,rst,row,col,16'd11,350,eat10,0,1,600);





always @(posedge clk)begin
c_state<=n_state;
n_state<=kclk;
end

always @(posedge clk)begin
if(cou1==6250000 && (key_data==8'b01101011 || key_data==8'b01110100 || key_data==8'b01110101 || key_data==8'b01110010))
key_reg<=22'b0000000000000000000000;
else if(cou1==500000 && (key_data==8'b01011010 || key_data==8'b00101001))
key_reg<=22'b0000000000000000000000;

else
begin
case({c_state,n_state})
2'b10:begin
key_reg<={kdata,key_reg[21:1]};
end
default:key_reg<=key_reg;
endcase
end


end

always @(posedge clk or posedge rst)begin
if(rst)
cou1<=0;
else if(cou1==6250000)
cou1<=0;
else if(c_state==1 && n_state==0)
cou1<=0;
else if(key_reg>=0)
cou1<=cou1+1;
else 
cou1<=cou1;
end



always @(posedge clk or posedge rst)
begin
	if(rst)
	begin
		key_data<=8'b01101011;

	end
	else if( check==1'b1)
	begin
		if(key_reg[19:12]==8'b01101011)begin
			key_data<=8'b01101011;

			end
		else if (key_reg[19:12]==8'h74)begin
			key_data<=8'b01110100;

			end
		else
		begin
			key_data<=key_reg[19:12];
	
		end
	end

			else
			begin
			key_data<=key_reg[19:12];	
		
end			
end




always@(posedge clk or posedge rst)
begin
	if(rst) col <= 0;
	else if(col == 1039) col <= 0;
	else col <= col + 1;
end

always@(posedge clk or posedge rst)
begin
	if(rst) row <= 0;
	else if(row == 665) row <= 0;
	else if(col == 1039) row <= row + 1;
	else row <= row;
end



always@(posedge clk or posedge rst)
begin
	if(rst)begin
		VGA_RED <= 0;
		VGA_GREEN <= 0;
		VGA_BLUE <= 0;
	end

     else if(G || G1)
		begin
			VGA_RED <= 1;
			VGA_GREEN <= 0;
			VGA_BLUE <= 0;
		end
	else if(body1)
	begin
			VGA_RED <= 1;
			VGA_GREEN <= 1;
			VGA_BLUE <= 1;
	end
	else if(body2)
	begin
			VGA_RED <= 0;
			VGA_GREEN <= 1;
			VGA_BLUE <= 1;
	end
		
	else if(body3)
	begin
			VGA_RED <= 0;
			VGA_GREEN <= 1;
			VGA_BLUE <= 0;
	end
	
	else if(body4)
	begin
			VGA_RED <= 1;
			VGA_GREEN <= 0;
			VGA_BLUE <= 1;
	end
	else if(body5)
	begin
			VGA_RED <= 1;
			VGA_GREEN <= 1;
			VGA_BLUE <= 0;
	end
	else if(body6)
	begin
			VGA_RED <= 1;
			VGA_GREEN <= 1;
			VGA_BLUE <= 0;
	end
	else if(body7)
	begin
			VGA_RED <= 1;
			VGA_GREEN <= 1;
			VGA_BLUE <= 0;
	end
	else if(body8)
	begin
			VGA_RED <= 1;
			VGA_GREEN <= 1;
			VGA_BLUE <= 0;
	end
	else if(body9)
	begin
			VGA_RED <= 1;
			VGA_GREEN <= 1;
			VGA_BLUE <= 0;
	end
	else if(body10)
	begin
			VGA_RED <= 1;
			VGA_GREEN <= 1;
			VGA_BLUE <= 0;
	end
		
		else if(tail1)
		begin
			VGA_RED <= 1;
			VGA_GREEN <= 0;
			VGA_BLUE <= 0;
		end
		
		else if(tail2)
		begin
			VGA_RED <= 1;
			VGA_GREEN <= 0;
			VGA_BLUE <= 0;
		end
		
			else if(tail3)
		begin
			VGA_RED <= 1;
			VGA_GREEN <= 0;
			VGA_BLUE <= 0;
		end
		
		else if(tail4)
		begin
			VGA_RED <= 1;
			VGA_GREEN <= 0;
			VGA_BLUE <= 0;
		end
		
			else if(tail5)
		begin
			VGA_RED <= 1;
			VGA_GREEN <= 0;
			VGA_BLUE <= 0;
		end
		
		else if(tail6)
		begin
			VGA_RED <= 1;
			VGA_GREEN <= 0;
			VGA_BLUE <= 0;
		end
		
			else if(tail7)
		begin
			VGA_RED <= 1;
			VGA_GREEN <= 0;
			VGA_BLUE <= 0;
		end
		
		else if(tail8)
		begin
			VGA_RED <= 1;
			VGA_GREEN <= 0;
			VGA_BLUE <= 0;
		end
		
		else if(tail9)
		begin
			VGA_RED <= 1;
			VGA_GREEN <= 0;
			VGA_BLUE <= 0;
		end
		else if(tail10)
		begin
			VGA_RED <= 1;
			VGA_GREEN <= 0;
			VGA_BLUE <= 0;
		end
		else if(tail11)
		begin
			VGA_RED <= 1;
			VGA_GREEN <= 0;
			VGA_BLUE <= 0;
		end
		else if(tail12)
		begin
			VGA_RED <= 1;
			VGA_GREEN <= 0;
			VGA_BLUE <= 0;
		end
		else if(tail13)
		begin
			VGA_RED <= 1;
			VGA_GREEN <= 0;
			VGA_BLUE <= 0;
		end
		else if(tail14)
		begin
			VGA_RED <= 1;
			VGA_GREEN <= 0;
			VGA_BLUE <= 0;
		end
		else if(tail15)
		begin
			VGA_RED <= 1;
			VGA_GREEN <= 0;
			VGA_BLUE <= 0;
		end
		else if(tail16)
		begin
			VGA_RED <= 1;
			VGA_GREEN <= 0;
			VGA_BLUE <= 0;
		end
		else if(tail17)
		begin
			VGA_RED <= 1;
			VGA_GREEN <= 0;
			VGA_BLUE <= 0;
		end
		else if(tail18)
		begin
			VGA_RED <= 1;
			VGA_GREEN <= 0;
			VGA_BLUE <= 0;
		end
		else if(tail19)
		begin
			VGA_RED <= 1;
			VGA_GREEN <= 0;
			VGA_BLUE <= 0;
		end
		else if(tail20)
		begin
			VGA_RED <= 1;
			VGA_GREEN <= 0;
			VGA_BLUE <= 0;
		end
		
	else if(visible && !G&& !G1&& !tail1 &&!tail2&& !tail3&& !tail4&& !tail5&& !tail6&& !tail7&& !tail8&& !tail9&& !tail10&& !tail11&& !tail12&& !tail13&& !tail14&& !tail15&& !tail16&& !tail17&& !tail18&& !tail19&& !tail20 &&!body1&&!body2&&!body3&&!body4&&!body5&&!body6&&!body7&&!body8&&!body9&&!body10)
		begin
			VGA_RED <= 0;
			VGA_GREEN <= 0;
			VGA_BLUE <= 1;
		end
	
	else 
		begin
			VGA_RED <= 0;
			VGA_GREEN <= 0;
			VGA_BLUE <= 0;
		end
end



always @(posedge clk or posedge rst)
begin
if(rst)begin
eat1<=1;
eat2<=1;
eat3<=1;
eat4<=1;
eat5<=1;
eat6<=1;
eat7<=1;
eat8<=1;
eat9<=1;
eat10<=1;
end

else if(body1==1 && body2==1)begin
if((10+big1-sm1)>(12+big2-sm2))
eat2<=0;
else
eat1<=0;
end

else if(body1==1 && body3==1)begin
if((10+big1-sm1)>(13+big3-sm3))
eat3<=0;
else
eat1<=0;
end

else if(body1==1 && body4==1)begin
if((10+big1-sm1)>(14+big4-sm4))
eat4<=0;
else
eat1<=0;
end

else if(body1==1 && body5==1)begin
if((10+big1-sm1)>15)
eat5<=0;
else
eat1<=0;
end

else if(body1==1 && body6==1)begin
if((10+big1-sm1)>16)
eat6<=0;
else
eat1<=0;
end

else if(body1==1 && body7==1)begin
if((10+big1-sm1)>17)
eat7<=0;
else
eat1<=0;
end

else if(body1==1 && body8==1)begin
if((10+big1-sm1)>18)
eat8<=0;
else
eat1<=0;
end

else if(body1==1 && body9==1)begin
if((10+big1-sm1)>19)
eat9<=0;
else
eat1<=0;
end

else if(body1==1 && body10==1)begin
if((10+big1-sm1)>11)
eat10<=0;
else
eat1<=0;
end




else if(body2==1 && body3==1)begin
if((12+big2-sm2)>(13+big3-sm3))
eat3<=0;
else
eat2<=0;
end

else if(body2==1 && body4==1)begin
if((12+big2-sm2)>(14+big4-sm4))
eat4<=0;
else
eat2<=0;
end
else if(body2==1 && body5==1)begin
if((12+big2-sm2)>15)
eat5<=0;
else
eat2<=0;
end
else if(body2==1 && body6==1)begin
if((12+big2-sm2)>16)
eat3<=0;
else
eat2<=0;
end
else if(body2==1 && body7==1)begin
if((12+big2-sm2)>17)
eat3<=0;
else
eat2<=0;
end
else if(body2==1 && body8==1)begin
if((12+big2-sm2)>18)
eat8<=0;
else
eat2<=0;
end
else if(body2==1 && body9==1)begin
if((12+big2-sm2)>19)
eat9<=0;
else
eat2<=0;
end
else if(body2==1 && body10==1)begin
if((12+big2-sm2)>11)
eat10<=0;
else
eat2<=0;
end



else if(body3==1 && body4==1)begin
if((13+big3-sm3)>(14+big4-sm4))
eat4<=0;
else
eat3<=0;
end
else if(body3==1 && body5==1)begin
if((13+big3-sm3)>15)
eat5<=0;
else
eat3<=0;
end
else if(body3==1 && body6==1)begin
if((13+big3-sm3)>16)
eat6<=0;
else
eat3<=0;
end
else if(body3==1 && body7==1)begin
if((13+big3-sm3)>17)
eat7<=0;
else
eat3<=0;
end
else if(body3==1 && body8==1)begin
if((13+big3-sm3)>18)
eat8<=0;
else
eat3<=0;
end
else if(body3==1 && body9==1)begin
if((13+big3-sm3)>19)
eat9<=0;
else
eat3<=0;
end
else if(body3==1 && body10==1)begin
if((13+big3-sm3)>11)
eat10<=0;
else
eat3<=0;
end



else if(body4==1 && body5==1)begin
if((14+big4-sm4)>15)
eat5<=0;
else
eat4<=0;
end
else if(body4==1 && body6==1)begin
if((14+big4-sm4)>16)
eat6<=0;
else
eat4<=0;
end
else if(body4==1 && body7==1)begin
if((14+big4-sm4)>17)
eat7<=0;
else
eat4<=0;
end
else if(body4==1 && body8==1)begin
if((14+big4-sm4)>18)
eat8<=0;
else
eat4<=0;
end
else if(body4==1 && body9==1)begin
if((14+big4-sm4)>19)
eat9<=0;
else
eat4<=0;
end
else if(body4==1 && body10==1)begin
if((14+big4-sm4)>11)
eat10<=0;
else
eat4<=0;
end




else if(body5==1 && body6==1)
eat5<=0;

else if(body5==1 && body7==1)

eat5<=0;

else if(body5==1 && body8==1)
eat5<=0;

else if(body5==1 && body9==1)
eat5<=0;

else if(body5==1 && body10==1)

eat10<=0;







else if(body6==1 && body7==1)
eat6<=0;

else if(body6==1 && body8==1)
eat6<=0;
else if(body6==1 && body9==1)
eat6<=0;


else if(body6==1 && body10==1)
eat10<=0;



else if(body7==1 && body8==1)
eat7<=0;

else if(body7==1 && body9==1)
eat7<=0;

else if(body7==1 && body10==1)

eat10<=0;


else if(body8==1 && body9==1)
eat8<=0;

else if(body8==1 && body10==1)
eat10<=0;


else if(body9==1 && body10==1)
eat10<=0;


end




endmodule