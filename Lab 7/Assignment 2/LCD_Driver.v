`timescale 1ns / 1ps	 
`define TIMER 1000000
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:32:37 13/04/2024
// Design Name: 
// Module Name:    LCD_driver 
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
module LCD_driver(first_line,second_line,clk,LCD_RS,LCD_W,LCD_E,data_3,data_2,data_1,data_0 );
	 //Inputs
	 input [127:0]first_line;
	 input [127:0]second_line;
	 input clk;

	 //Outputs
	 output LCD_RS, LCD_W, LCD_E, data_3, data_2, data_1, data_0;
	 reg LCD_RS, LCD_W, LCD_E, data_3, data_2, data_1, data_0;

	 //Internal Variables
	 reg [32:0] counter;
	 reg [30:0] state_1;
	 reg [10:0] index_1;
	 reg [10:0] index_2;
	 reg [10:0] index_3;
	 reg [10:0] index_4;
	 reg state_2;

	 //Initial Block
	 initial begin
		counter=0;
		state_1=0;
		state_2=0;
		index_1=127;
		index_2=126;
		index_3=125;
		index_4=124;
		LCD_RS=0;
		LCD_W=0;
		LCD_E=0;
		data_3=0;
		data_2=0;
		data_1=0;
		data_0=0;
	end
	
	 always@(posedge clk)
	 begin
	 if((counter==`TIMER))
	 begin
		 if((state_1==0 || state_1==3 || state_1==6))	begin
				LCD_E<=0;
				state_1<=state_1+1;
		 end
		 else if((state_1==1 || state_1==4 || state_1==7))	begin
				LCD_RS<=0;
				LCD_W<=0;
				data_3<=0;
				data_2<=0;
				data_1<=1;
				data_0<=1;
				state_1<=state_1+1;
		 end
		 else if((state_1==137 || state_1==134 || state_1==131 || state_1==128 || state_1==125 || state_1==122 || state_1==119 || state_1==116 || state_1==113 || state_1==110 || state_1==107 || state_1==104 || state_1==101 || state_1==98 || state_1==95 || state_1==92 || state_1==89 || state_1==86 || state_1==83 || state_1==80 || state_1==77 || state_1==74 || state_1==71 || state_1==68 || state_1==65 || state_1==62 || state_1==59 || state_1==56 || state_1==53 || state_1==50 || state_1==47 || state_1==44 || state_1==41 || state_1==38 || state_1==35 || state_1==32 || state_1==29 || state_1==26 || state_1==23 || state_1==20 || state_1==17 || state_1==14 || state_1==2 || state_1==5 || state_1==8 || state_1==11))	begin
				LCD_E<=1;
				state_1<=state_1+1;
		 end
		 else if((state_1==135 || state_1==132 || state_1==129 || state_1==126 || state_1==123 || state_1==120 || state_1==117 || state_1==114 || state_1==111 || state_1==108 || state_1==105 || state_1==102 || state_1==99 || state_1==96 || state_1==93 || state_1==90 || state_1==87 || state_1==84 || state_1==81 || state_1==78 || state_1==75 || state_1==72 || state_1==69 || state_1==66 || state_1==63 || state_1==60 || state_1==57 || state_1==54 || state_1==51 || state_1==48 || state_1==45 || state_1==42 || state_1==39 || state_1==36 || state_1==33 || state_1==30 || state_1==27 || state_1==24 || state_1==21 || state_1==18 || state_1==15 || state_1==9 || state_1==12))	begin
				LCD_E<=0;
				state_1<=state_1+1;
		 end
		 else if((state_1==136 || state_1==133 || state_1==130 || state_1==127 || state_1==124 || state_1==121 || state_1==118 || state_1==115 || state_1==112 || state_1==109 || state_1==106 || state_1==103 || state_1==100 || state_1==97 || state_1==94 || state_1==91 || state_1==88 || state_1==85 || state_1==82 || state_1==79 || state_1==76 || state_1==73 || state_1==70 || state_1==67 || state_1==64 || state_1==61 || state_1==58 || state_1==55 || state_1==52 || state_1==49 || state_1==46 || state_1==43))	begin
				LCD_RS<=1;
				LCD_W<=0;
				if(state_2==0)
				begin
				data_3<=first_line[index_1];
				data_2<=first_line[index_2];
				data_1<=first_line[index_3];
				data_0<=first_line[index_4];
				end
				if(state_2==1)
				begin
				data_3<=second_line[index_1];
				data_2<=second_line[index_2];
				data_1<=second_line[index_3];
				data_0<=second_line[index_4];
				end
				index_1<=index_1-4;
				index_2<=index_2-4;
				index_3<=index_3-4;
				index_4<=index_4-4;
				state_1<=state_1+1;
		 end
		 else if((state_1==10 || state_1==13))	begin
				LCD_RS<=0;
				LCD_W<=0;
				data_3<=0;
				data_2<=0;
				data_1<=1;
				data_0<=0;
				state_1<=state_1+1;
		 end
		 else if((state_1==16 || state_1==37))	begin
				LCD_RS<=0;
				LCD_W<=0;
				data_3<=1;
				data_2<=0;
				data_1<=0;
				data_0<=0;
				state_1<=state_1+1;
		 end
		 else if((state_1==142 || state_1==40 || state_1==31 || state_1==19 || state_1==25))	begin
				LCD_RS<=0;
				LCD_W<=0;
				data_3<=0;
				data_2<=0;
				data_1<=0;
				data_0<=0;
				state_1<=state_1+1;
		 end
		 else if((state_1==22))	begin
				LCD_RS<=0;
				LCD_W<=0;
				data_3<=0;
				data_2<=1;
				data_1<=1;
				data_0<=0;
				state_1<=state_1+1;
		 end
		 else if((state_1==139 || state_1==28))	begin
				LCD_RS<=0;
				LCD_W<=0;
				data_3<=1;
				data_2<=1;
				data_1<=0;
				data_0<=0;
				state_1<=state_1+1;
		 end
		 else if((state_1==34))	begin
				LCD_RS<=0;
				LCD_W<=0;
				data_3<=0;
				data_2<=0;
				data_1<=0;
				data_0<=1;
				state_1<=state_1+1;
		 end
		 else if((state_1==143))	begin
			LCD_E<=1;
			
			state_2<=1;
			
			index_1<=127;
			index_2<=126;
			index_3<=125;
			index_4<=124;
			state_1<=42;
		 end
		 else if((state_1==138 || state_1==141))	begin
				LCD_E<=0;
				if(state_2==1)	begin
				counter<=0;
		state_1<=0;
		state_2<=0;
		index_1<=127;
		index_2<=126;
		index_3<=125;
		index_4<=124;
		LCD_RS<=0;
		LCD_W<=0;
		LCD_E<=0;
		data_3<=0;
		data_2<=0;
		data_1<=0;
		data_0<=0;
				end
				else	begin
				state_1<=state_1+1;
				end
		 end
		 else if((state_1==140))	begin
				LCD_E<=1;
				state_1<=state_1+1;
		 end
		 
			counter<=0;
	 end
	 else 
			counter<=counter+1;
	 end
	 
endmodule