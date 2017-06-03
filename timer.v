//-----------------------------------------------------------------------------------
// DESCRIPTION   :  Timer
//                  Enable (EN) active                : high
//                  Outputs (data_out) active         : low
//-----------------------------------------------------------------------------------

module timer(origin, carry_in, t_1);
  input origin;
  input carry_in;
  reg [19:0] weight;
  output reg t_1;
  reg [19:0] k;
  
  initial
  begin
  t_1 = 1'b0;
  k=0;
  weight = 1;
  end
  
  always @(posedge carry_in)
  weight = weight + 10;
  always @(posedge origin)
  begin
    if(k>=50)
      begin
        t_1<=~t_1;
        k<=0;
      end
    else
      k<=k + weight;
    end
  endmodule