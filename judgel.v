//-----------------------------------------------------------------------------------
// DESCRIPTION   :  Judging Logic
//                  Enable (EN) active                : high
//                  Outputs (data_out) active         : low
//-----------------------------------------------------------------------------------

module judgel(led, button, EN, out, up);
  input [7:0] led;
  input [7:0] button;
  input EN;
  output up;
  output reg [7:0] out=0;
  reg [3:0] count=0;
  reg [2:0] weight=1;
  wire u0, u1, u2, u3, u4, u5, u6, u7, ledz;
  
  and a0(u0, led[0], button[0], ~EN);
  and a1(u1, led[1], button[1], ~EN);
  and a2(u2, led[2], button[2], ~EN);
  and a3(u3, led[3], button[3], ~EN);
  and a4(u4, led[4], button[4], ~EN);
  and a5(u5, led[5], button[5], ~EN);
  and a6(u6, led[6], button[6], ~EN);
  and a7(u7, led[7], button[7], ~EN);
  or o1(up, u0, u1, u2, u3, u4, u5, u6, u7);
  
always@(negedge up)
	begin
		if(count == 8)
			begin
				weight = weight + 1;
				count = 0;
			end
		else if(weight ==4)
			weight = 0;
		else
			begin
			count = count + 1;
			out = out + weight;
			end
	end
endmodule
