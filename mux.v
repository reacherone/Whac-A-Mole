`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:00:09 05/15/2013 
// Design Name: 
// Module Name:    mux 
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
module mux(d1, d2, d3, d4, se1, se2, dout);
input d1, d2, d3, d4;
input se1, se2;
output reg dout;

always @(d1 or d2 or d3 or d4 or se1 or se2)
case({se1,se2})
2'b00 : dout=d1;
2'b01 : dout=d2;
2'b10 : dout=d3;
2'b11 : dout=d4;
endcase
endmodule
