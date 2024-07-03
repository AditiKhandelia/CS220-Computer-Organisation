`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:01:12 13/04/2024 
// Design Name: 
// Module Name:    lcd_top 
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
module lcd_top(ROT_A,ROT_B,clk,x,LCD_RS, LCD_W, LCD_E, b3, b2, b1, b0,min);
	//Inputs
	input clk;
	input ROT_A;
	input ROT_B;
	input [2:0] x;

	//Outputs
	output LCD_RS, LCD_W, LCD_E, b3, b2, b1, b0;
	wire LCD_RS, LCD_W, LCD_E, b3, b2, b1, b0;
	output [3:0] min;
	wire[3:0] min;

	//Internal Variables
	reg [127:0] first_line;
	reg [127:0] second_line;
    reg prev_rotation_event;
    wire rotation_event;
    reg [3:0] counter;
	reg [2:0] numbers[3:0];

	//Initialise First and Second Line
    initial begin
		prev_rotation_event = 1;
    	counter = 0;
		first_line = 128'h202C20202C20202C2020202020202020;
		second_line = 128'h20202020202020202020202020202020;
    end

		
	always@(posedge clk)
    begin
        if(prev_rotation_event =  = 0 && rotation_event =  = 1)  begin
		  if(counter =  = 0)	begin
			numbers[0] < =  x;
			counter < =  counter+1;
		end
		  else if(counter =  = 1)	begin
		  numbers[1] < =  x;
		  counter < =  counter+1;
		end
		  else if(counter =  = 2)	begin
			numbers[2] < =  x;
			counter < =  counter+1;
		end
		  else if(counter =  = 3)	begin
		  numbers[3] < =  x;
		 end
		end

		//Internal ROM and declaration for first and second lines of LCD display.
		first_line[127:124] < =  4'b0011;
		first_line[123:120] < =  {0,numbers[0]};
		first_line[103:100] < =  4'b0011;
		first_line[99:96] < =  {0,numbers[1]};
		first_line[79:76] < =  4'b0011;
		first_line[75:72] < =  {0,numbers[2]};
		first_line[55:52] < =  4'b0011;
		first_line[51:48] < =  {0,numbers[3]};
		second_line[127:124] < =  4'b0011;
		second_line[123:120] < =  min;
		prev_rotation_event < =  rotation_event;
    end
	 
	
	rotary_shaft rot(clk,ROT_A,ROT_B,rotation_event);
	minimum M(clk,numbers[0],numbers[1],numbers[2],numbers[3],min);
	LCD_driver LCD(first_line,second_line,clk,LCD_RS,LCD_W,LCD_E,b3,b2,b1,b0);
endmodule
