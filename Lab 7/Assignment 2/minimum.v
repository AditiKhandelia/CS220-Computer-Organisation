`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:17:21 13/04/2024 
// Design Name: 
// Module Name:    minimum 
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
module minimum(clk,a,b,c,d,min_pos);
	//Inputs
	 input clk;
	 input [2:0] a,b,c,d;

	 //Outputs
	 output [3:0] min_pos;
	 reg[3:0] min_pos=0;
	 
	 always@(posedge clk)	begin
		if(a<=b && a<=c && a<=d) begin
			min_pos<=0;
		end
		if(b<=a && b<=c && b<=d) begin
			min_pos<=4'b01;
		end
		if(c<=b && c<=a && c<=d) begin 
			min_pos<=4'b10;
		end
		if(d<=b && d<=c && d<=a) begin 
			min_pos<=4'b11;
		end	
	 end
endmodule
