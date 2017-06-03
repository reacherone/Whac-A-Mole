//-----------------------------------------------------------------------------------
// Company: Fudan University
// Engineer: Yijing Sun
// Design Name: 
// Module Name: BIN divider and to Seven Segments Converter 
// Project Name: Whac-A-Mole
// Target Devices: Xilinx Spartan3E XC3S500E
// Tool versions: 9.1i
// DESCRIPTION   :  Counter
//                  Enable (EN) active                : high
//                  Outputs (data_out) active         : low
//-----------------------------------------------------------------------------------

module counter(clk, carry_in, out);
  output reg [5:0] out;
  input clk, carry_in;
  reg[1:0] weight = 2'b01;
  
  initial
  begin
  out = 0;
  end
  always @(posedge carry_in)
  begin
    weight = weight + 1;
	end
	always @(posedge clk)
	begin
	out = out + weight;
	end
  endmodule