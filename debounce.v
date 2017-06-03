//-----------------------------------------------------------------------------------
// DESCRIPTION   :  Debouncer
//                  Enable (EN) active                : high
//                  Outputs (data_out) active         : low
//-----------------------------------------------------------------------------------
module debounceinone(clk, rst, in, out);
input clk, rst;
input [7:0] in;
output [7:0] out;
debounce d0(clk, rst, in[0], out[0]);
debounce d1(clk, rst, in[1], out[1]);
debounce d2(clk, rst, in[2], out[2]);
debounce d3(clk, rst, in[3], out[3]);
debounce d4(clk, rst, in[4], out[4]);
debounce d5(clk, rst, in[5], out[5]);
debounce d6(clk, rst, in[6], out[6]);
debounce d7(clk, rst, in[7], out[7]);
endmodule

module debounce(clk, rst, button_in, button_out);
  input clk, rst, button_in;
  output button_out;
  wire a, b, c, d;
  assign d=~button_in;
  D_FF dff0(c, b, clk, rst);
  D_FF dff1(b, a, clk, rst);
  D_FF dff2(a, d, clk, rst); 
  and(button_out, a, b, c);
  endmodule
    
  module D_FF(q, d, clk, rst);
    output reg q;
    input d, clk, rst;
    
    always @(negedge clk or negedge rst)
    if (!rst)
      q <= 1'b0;
    else 
      q <= d;
    endmodule