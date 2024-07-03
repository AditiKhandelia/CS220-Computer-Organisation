`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:44:59 03/06/2024 
// Design Name: 
// Module Name:    five_bit_operator
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
module five_bit_operator(x, addx, op,);
    input [3:0] x;
    input [1:0] addx;
    input op;

    output [4:0] sum_x;
    wire [4:0] sum_x;

    wire[4:0] coutx;
    full_operator FA0(x[0],addx[0],op, op,sum_x[0], coutx[0]);
    full_operator FA1(x[1],addx[1],op,coutx[0],sum_x[1], coutx[1]);
    full_operator FA2(x[2],1'b0,op,coutx[1],sum_x[2], coutx[2]);
    full_operator FA3(x[3],1'b0,op,coutx[2],sum_x[3], coutx[3]);
    full_operator FA4(1'b0,1'b0,op,coutx[3],sum_x[4], coutx[4]);	 
endmodule