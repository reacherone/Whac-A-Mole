`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:59:46 05/15/2013 
// Design Name: 
// Module Name:    dongtai 
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
module fenpin(clk_in, clk_out1, clk_out2);
  input clk_in;
  output reg clk_out1=1'b0;
  output reg clk_out2=1'b0;
  reg [31:0] k=0;
  reg [31:0] j=32768;

always @( posedge clk_in)
	if(k==j)
		begin
			clk_out1<=~clk_out1;
			j=j+32768;
			k<=k+1;
			end
		else if(k==33554431)
		begin
		clk_out1<=~clk_out1;
		clk_out2<=~clk_out2;
		k<=0;
		j=32768;
		end
		else
         k<=k+1;
endmodule

module dongtai(clk, data_out, state);
input clk;
output reg [3:0] data_out;
output reg [1:0] state;

parameter s0 = 2'b00;
parameter s1 = 2'b01;
parameter s2 = 2'b10;
parameter s3 = 2'b11;

always @(posedge clk)
	begin
		state <= s0;
			case (state)
				s0:
				begin
				state <= s1;
				data_out <= 4'b1110;
				end
				s1:
				begin
				state <= s2;
				data_out <= 4'b1101;
				end
				s2:
				begin
				state <= s3;
				data_out <= 4'b1011;
				end
				s3:
				begin
				state <= s0;
				data_out <= 4'b0111;
				end
			endcase
	end
endmodule
