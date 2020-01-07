module dodge(
	output [7:0] R, G, B,
	output reg [15:0] seconed,
	output reg [3:0] COMM,
	output reg [0:7] SevenSeg,
	input CLK,
	input left,right);
	
   parameter logic [7:0] Drop1 [7:0] = '{8'b11111111,
														8'b11111110,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111110,
														8'b11111110,
														8'b11111111};
	parameter logic [7:0] Drop2 [7:0] = '{8'b11111111,
														8'b11111101,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111101,
														8'b11111101,
														8'b11111111};
	parameter logic [7:0] Drop3 [7:0] = '{8'b11111111,
														8'b11111011,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111011,
														8'b11111011,
														8'b11111111};
	parameter logic [7:0] Drop4 [7:0] = '{8'b11111111,
														8'b11110111,
														8'b11111111,
														8'b11111110,
														8'b11111111,
														8'b11110110,
														8'b11110111,
														8'b11111110};								
	parameter logic [7:0] Drop5 [7:0] =  '{8'b11111111,
														8'b11101111,
														8'b11111111,
														8'b11111101,
														8'b11111111,
														8'b11101101,
														8'b11101111,
														8'b11111101};
	parameter logic [7:0] Drop6 [7:0] = '{8'b11111111,
														8'b11011111,
														8'b11111111,
														8'b11111011,
														8'b11111111,
														8'b11011011,
														8'b11011111,
														8'b11111011};
	parameter logic [7:0] Drop7 [7:0] = '{8'b11111111,
														8'b10111111,
														8'b11111110,
														8'b11110111,
														8'b11111110,
														8'b10110111,
														8'b10111110,
														8'b11110111};
	parameter logic [7:0] Drop8 [7:0] = '{8'b11111111,
														8'b01111111,
														8'b11111101,
														8'b11101111,
														8'b11111101,
														8'b01101111,
														8'b01111101,
														8'b11101111};
	parameter logic [7:0] Drop9 [7:0]=   '{8'b11111110,
														8'b11111111,
														8'b11111010,
														8'b11011111,
														8'b11111010,
														8'b11011111,
														8'b11111011,
														8'b11011111};
	parameter logic [7:0] Drop10 [7:0]=  '{8'b11111101,
														8'b11111111,
														8'b11110101,
														8'b10111111,
														8'b11110101,
														8'b10111111,
														8'b11110111,
														8'b10111111};
	parameter logic [7:0] Drop11 [7:0]=  '{8'b11111011,
														8'b11111111,
														8'b11101011,
														8'b01111111,
														8'b11101011,
														8'b01111111,
														8'b11101111,
														8'b01111111};
	parameter logic [7:0] Drop12 [7:0]=  '{8'b11110111,
														8'b11111111,
														8'b11010111,
														8'b11111111,
														8'b11010111,
														8'b11111111,
														8'b11011111,
														8'b11111111};
														
	parameter logic [7:0] Drop13 [7:0]=  '{8'b11101111,
														8'b11111111,
														8'b10101111,
														8'b11111111,
														8'b10101111,
														8'b11111111,
														8'b10111111,
														8'b11111111};
	parameter logic [7:0] Drop14 [7:0] = '{8'b11011111,
														8'b11111111,
														8'b01011111,
														8'b11111111,
														8'b01011111,
														8'b11111111,
														8'b01111111,
														8'b11111111};
	parameter logic [7:0] Drop15 [7:0] = '{8'b10111111,
														8'b11111111,
														8'b10111111,
														8'b11111111,
														8'b10111111,
														8'b11111111,
														8'b11111111,
														8'b11111111};
	parameter logic [7:0] Drop16 [7:0] = '{8'b01111111,
														8'b11111111,
														8'b01111111,
														8'b11111111,
														8'b01111111,
														8'b11111111,
														8'b11111111,
														8'b11111111};	
	parameter logic [7:0] Drop17 [7:0] = '{8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111};															
	parameter logic [7:0] Drop18 [7:0] = '{8'b11100000,//7O
														8'b01111111,//3
														8'b10111111,//5
														8'b11011111,//1
														8'b11011111,
														8'b10111111,//2
														8'b01111111,//4
														8'b11100000};//0
	
parameter logic [7:0] Drop19 [7:0] =  '{8'b01111110,//X
														8'b11100111,
														8'b11011011,
														8'b10111101,
														8'b10111101,
														8'b11011011,
														8'b11100111,
														8'b01111110};
	
	parameter logic [7:0] Move [7:0] = '{8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b01111111};
	parameter logic [7:0] Move1 [7:0] = '{8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b01111111,
														8'b11111111};														
	parameter logic [7:0] Move2 [7:0] = '{8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b01111111,
														8'b11111111,
														8'b11111111};	
	parameter logic [7:0] Move3 [7:0] = '{8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b01111111,
														8'b11111111,
														8'b11111111,
														8'b11111111};
   parameter logic [7:0] Move4 [7:0] = '{8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b01111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111};
   parameter logic [7:0] Move5 [7:0] = '{8'b11111111,
														8'b11111111,
														8'b01111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111};	
	parameter logic [7:0] Move6 [7:0] = '{8'b11111111,
														8'b01111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111};	
	parameter logic [7:0] Move7 [7:0] = '{8'b01111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111};	
	parameter logic [7:0] Move8 [7:0] ='{8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111};
	parameter logic [7:0] coin1 [7:0] =  '{8'b11111111,
														8'b11111111,
														8'b11111110,
														8'b11111111,
														8'b11111111,
														8'b11111110,
														8'b11111111,
														8'b11111111};
	parameter logic [7:0] coin2 [7:0] =  '{8'b11111111,
														8'b11111111,
														8'b11111101,
														8'b11111111,
														8'b11111111,
														8'b11111110,
														8'b11111111,
														8'b11111111};
	parameter logic [7:0] coin3 [7:0] =  '{8'b11111111,
														8'b11111111,
														8'b11111011,
														8'b11111111,
														8'b11111111,
														8'b11111101,
														8'b11111111,
														8'b11111111};								
	parameter logic [7:0] coin4 [7:0] =  '{8'b11111111,
														8'b11111111,
														8'b11110111,
														8'b11111111,
														8'b11111111,
														8'b11111011,
														8'b11111110,
														8'b11111111};
	parameter logic [7:0] coin5 [7:0] =  '{8'b11111111,
														8'b11111111,
														8'b11101111,
														8'b11111111,
														8'b11111111,
														8'b11110111,
														8'b11111101,
														8'b11111111};
	parameter logic [7:0] coin6 [7:0] =  '{8'b11111111,
														8'b11111111,
														8'b11011111,
														8'b11111111,
														8'b11111111,
														8'b11101111,
														8'b11111011,
														8'b11111111};
	parameter logic [7:0] coin7 [7:0] =  '{8'b11111111,
														8'b11111111,
														8'b10111111,
														8'b11111110,
														8'b11111111,
														8'b11011111,
														8'b11110111,
														8'b11111111};
	parameter logic [7:0] coin8 [7:0]=   '{8'b11111111,
														8'b11111111,
														8'b01111111,
														8'b11111101,
														8'b11111111,
														8'b10111111,
														8'b11101111,
														8'b11111111};
	parameter logic [7:0] coin9 [7:0]=   '{8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111011,
														8'b11111111,
														8'b01111111,
														8'b11011111,
														8'b11111111};
   parameter logic [7:0] coin10 [7:0]=   '{8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11110111,
														8'b11111111,
														8'b11111111,
														8'b10111111,
														8'b11111111};
	parameter logic [7:0] coin11 [7:0]=   '{8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11101111,
														8'b11111111,
														8'b11111111,
														8'b01111111,
														8'b11111111};
	parameter logic [7:0] coin12 [7:0]=   '{8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11011111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111};
	parameter logic [7:0] coin13 [7:0]=   '{8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b10111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111};
	parameter logic [7:0] coin14 [7:0]=   '{8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b01111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111};
														
	parameter logic [7:0] coin15 [7:0]=   '{8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111,
														8'b11111111};
	divfreq F0(CLK, CLK_div); CLK_one F1(CLK, CLK_1); CLK_two F2(CLK, CLK_2);
	byte num; int place; int Drop_num; int hit; int score; int touch1; int touch2; int touch3;int touch4;
	initial
		begin
		   place=3;
			num = 0;
			score = 0;
			touch1 = 0;
			touch2 = 0;
			touch3 = 0;
			touch4 = 0;
			Drop_num=0;
			hit=0;
			G = 8'b11111111;
			B = 8'b11111111;
			R = 8'b11111111;
			seconed = 16'b1111111111111111;
			SevenSeg = 8'b00000010;
		end
	
	
	
	    always @(posedge CLK_div) 
		  begin
			if(num >=7)
				num <= 0;
			else 
			   num <= num + 1;
			COMM <= {num, 1'b1}; 			
			if(place==7) R <= Move[num];
			else if(place==3) 
			   R <= Move1[num];
			else if(place==5) 
			   R <= Move2[num];
			else if(place==1) 
			   R <= Move3[num];
			else if(place==6) 
			   R <= Move4[num];
			else if(place==2) 
			   R <= Move5[num];
			else if(place==4) 
			   R <= Move6[num];
			else if(place==0) 
			   R <= Move7[num];
			else if(place==8) 
			 begin
			   R <= Move8[num];
			   B <= coin15[num];	
			 end	
			
			
			if(Drop_num==0) 
			   G <= Drop1[num];
			else if(Drop_num==1) 
				begin
					G <= Drop2[num];
					B <= coin1[num];
				end
			else if(Drop_num==2) 
			   begin
					G <= Drop3[num];
					B <= coin2[num];
				end
			else if(Drop_num==3) 
			   begin
					G <= Drop4[num];
					B <= coin3[num];
				end
			else if(Drop_num==4) 
			   begin
					G <= Drop5[num];
					B <= coin4[num];
				end
			else if(Drop_num==5) 
			   begin
					G <= Drop6[num];
					B <= coin5[num];
				end
			else if(Drop_num==6) 
			   begin
					G <= Drop7[num];
					B <= coin6[num];
				end
			else if(Drop_num==7) 
			  begin
			  	G <= Drop8[num];
				B <= coin7[num];
				if(place==5 || place==3 || place==4)  
					begin 
						hit <= 1;
					end
			  end
			else if(Drop_num==8) 
			   begin
					G <= Drop9[num];
					B <= coin8[num];
					if(place==2)  
					begin 
						touch1 <= 1;
						SevenSeg = 8'b10011110;
					end
				end
			else if(Drop_num==9) 
			   begin
					G <= Drop10[num];
					B <= coin9[num];
					if(place==5)  
					begin 
						touch4 <= 1;
						if(touch1 == 1&&touch4 == 1) SevenSeg = 8'b00100100;
						else SevenSeg = 8'b10011110;
					end
				end
			else if(Drop_num==10)
				begin
					G <= Drop11[num];
					B <= coin10[num];
					if(place==5 || place==6 || place==7) 
					begin 
						hit <= 1;
					end
				end
			else if(Drop_num==11)
				begin
					G <= Drop12[num];
					B <= coin11[num];
					if(place==3)  
					begin 
						touch2 <= 1;
						if(touch1 == 0&&touch4 == 0) SevenSeg = 8'b10011110;
						else if (touch1 == 1&&touch4 == 0) SevenSeg = 8'b00100100;
						else if (touch1 == 0&&touch4 == 1) SevenSeg = 8'b00100100;
						else SevenSeg = 8'b00001100;
					end
				end
			else if(Drop_num==12) 
				begin
					G <= Drop13[num];
					B <= coin12[num];
				end
			else if(Drop_num==13) 
				begin
					G <= Drop14[num];
					B <= coin13[num];
				end
			else if(Drop_num==14) 
				begin
					G <= Drop15[num];
					B <= coin14[num];
					if(place==3 || place==2 || place==1)  hit <= 1;
					else if(place==6) 
						begin 
							touch3 <= 1;
							if(touch1 == 0&&touch2 == 0&&touch4 == 0) SevenSeg = 8'b10011110;
							else if (touch1 == 1&&touch2 == 0&&touch4 == 0) SevenSeg = 8'b00100100;
							else if (touch1 == 0&&touch2 == 1&&touch4 == 0) SevenSeg = 8'b00100100;
							else if (touch1 == 0&&touch2 == 0&&touch4 == 1) SevenSeg = 8'b00100100;
							else if (touch1 == 1&&touch2 == 1&&touch4 == 0) SevenSeg = 8'b00001100;
							else if (touch1 == 1&&touch2 == 0&&touch4 == 1) SevenSeg = 8'b00001100;
							else if (touch1 == 0&&touch2 == 1&&touch4 == 1) SevenSeg = 8'b00001100;
							else SevenSeg = 8'b10011000;
						end
				end
			else if(Drop_num==15) 
			   begin
					G <= Drop16[num];
				   B <= coin15[num];	
					if(place==0 || place==2 || place==1)  
					begin 
						hit <= 1;
					end
				end
			else if(Drop_num==16) 
					G <= Drop17[num];
			else if(Drop_num==17) 
			   G <= Drop18[num];
			else if(Drop_num==18) 
			   G <= Drop19[num];
		  end
	    
		 always@(touch1)
			begin 
			score <= score + 1;
				
end			
		 
		  always @(posedge CLK_1)
		     begin
			  if(hit == 1 || Drop_num == 17)
					place <= 8;
			   else if(left)			   
				begin
			    if(place==7)
				    place<=place;
				 else
			       place <= place+1;				
				end
			
			  else if(right)
			    begin
			      if(place==0)
				    place<=place;
				   else
			       place <= place-1;				
				 end
				 
			  else
			    place <= place;		     
		     end
			  
	
		always @(posedge CLK_2)
				  if(hit == 1) 
					begin
						Drop_num <= 18;
					end
				  else if(Drop_num <17) Drop_num <= Drop_num+1;
				  
	always @(posedge CLK_2)
		begin
		if(hit == 1) seconed <= 16'b0000000000000000;
		else seconed <= {1'b0,seconed[15:1]};
			
		end
	
endmodule

module divfreq(input CLK, output reg CLK_div); 
	reg [24:0] Count; 
	always @(posedge CLK) 
		begin 
			if(Count > 10000) 
				begin 
					Count <= 25'b0; 
					CLK_div <= ~CLK_div; 
				end 
			else Count <= Count + 1'b1; 
		end 
endmodule

module CLK_one(input CLK, output reg CLK_1); 
	reg [24:0] Count; 
	always @(posedge CLK) 
		begin 
			if(Count > 3000000) 
				begin 
					Count <= 25'b0; 
					CLK_1 <= ~CLK_1; 
				end 
			else Count <= Count + 1'b1; 
		end 
endmodule


module CLK_two(input CLK, output reg CLK_2); 
	reg [24:0] Count; 
	always @(posedge CLK) 
		begin 
			if(Count >= 25000000) 
				begin 
					Count <= 25'b0; 
					CLK_2<= ~CLK_2; 
				end 
			else Count <= Count + 1'b1; 
		end 
endmodule
