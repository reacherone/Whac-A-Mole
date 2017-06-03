//-----------------------------------------------------------------------------------
// DESCRIPTION   :  Stimulus
//                  
//                  Enable (EN) active                : high
//                  Outputs (data_out) active         : low
//-----------------------------------------------------------------------------------
`timescale 1us/10ns

module stimulus;
reg rst=1'b1;
reg clk;
reg EN=1'b0;
wire [7:0] data_out;

randomnum r1(rst, clk, EN, data_out);

  initial
  clk=1'b0;
  always
  #5 clk = ~clk;
  
  initial
  begin
	#500 $finish;
  end
  
  initial
  begin
  $dumpfile("test.vcd");
  $dumpvars(0,stimulus);
  end
endmodule              