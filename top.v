//-----------------------------------------------------------------------------------
// DESCRIPTION   :  Top
//                  Enable (EN) active                : high
//                  Outputs (data_out) active         : low
//-----------------------------------------------------------------------------------
module Top(EN, button, Clk, LEDs, reset, mo0, mo1, mo2, mo3, mo4, mo5, mo6, di);

input EN;
input [7:0] button;
input Clk;
input reset;
wire [7:0] button_j, ledi, out;
wire clk, t_1, up, carry, clock, miss;
wire [3:0] ge, shi, bai, saomiao;
wire [6:0] ge1, shi1, bai1;
wire [1:0] state;
output [7:0] LEDs;
output [3:0] di;
output mo0, mo1, mo2, mo3, mo4, mo5, mo6;

assign LEDs = ledi;
assign di = saomiao;

fenpin f1(Clk, clk, clock);
debounceinone d11(Clk, reset, button, button_j);
randomnum r1(reset, up, clock, EN, ledi);

judgel j1(ledi, button_j, EN, out, up);

dongtai dt1(clk, saomiao, state);
bindiv b1(out, reset, ge, shi, bai);
mux m0(ge1[0], shi1[0], bai1[0], bai1[0], state[1], state[0], mo0);
mux m1(ge1[1], shi1[1], bai1[1], bai1[1], state[1], state[0], mo1);
mux m2(ge1[2], shi1[2], bai1[2], bai1[2], state[1], state[0], mo2);
mux m3(ge1[3], shi1[3], bai1[3], bai1[3], state[1], state[0], mo3);
mux m4(ge1[4], shi1[4], bai1[4], bai1[4], state[1], state[0], mo4);
mux m5(ge1[5], shi1[5], bai1[5], bai1[5], state[1], state[0], mo5);
mux m6(ge1[6], shi1[6], bai1[6], bai1[6], state[1], state[0], mo6);
bin27seg i1(ge, EN, ge1);
bin27seg i2(shi, EN, shi1);
bin27seg i3(bai, EN, bai1);
endmodule