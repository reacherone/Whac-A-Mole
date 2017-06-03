//-----------------------------------------------------------------------------------
// DESCRIPTION   :  Generating 8-bits random number                 
//                  Enable (EN) active                : high
//                  Outputs (data_out) active         : low
//-----------------------------------------------------------------------------------

module randomnum(rst, up, clk, EN, data_out);
input rst;
input clk;
input EN;
input up;
reg [2:0] state = 3'b101;
output reg [7:0] data_out;
assign sign = clk || up;

always@(posedge sign)
begin
    if(!rst)
        data_out = 8'b00000000;
    else begin
        state[2] <= state[1];
        state[1] <= state[2]^state[0];
        state[0] <= state[2];
        end
		  if(EN == 0)
		  case(state )
		  3'b000: data_out = 8'b00000001;
		  3'b001: data_out = 8'b00000010;
		  3'b010: data_out = 8'b00000100;
		  3'b011: data_out = 8'b00001000;
		  3'b100: data_out = 8'b00010000;
		  3'b101: data_out = 8'b00100000;
		  3'b110: data_out = 8'b01000000;
		  3'b111: data_out = 8'b10000000;
		  default: data_out = 8'b00000000;
		  endcase
		  end
		  endmodule
