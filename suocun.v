`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:16:13 05/16/2013 
// Design Name: 
// Module Name:    suocun 
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
module suocun(LED_in, LED_out, clk, rst);
input clk, rst;
input [7:0] LED_in;
output [7:0] LED_out;

D_FF dffr0(LED_out[0], LED_in[0], clk, rst);
D_FF dffr1(LED_out[1], LED_in[1], clk, rst);
D_FF dffr2(LED_out[2], LED_in[2], clk, rst);
D_FF dffr3(LED_out[3], LED_in[3], clk, rst);
D_FF dffr4(LED_out[4], LED_in[4], clk, rst);
D_FF dffr5(LED_out[5], LED_in[5], clk, rst);
D_FF dffr6(LED_out[6], LED_in[6], clk, rst);
D_FF dffr7(LED_out[7], LED_in[7], clk, rst);

endmodule