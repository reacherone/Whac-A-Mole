//-----------------------------------------------------------------------------------
// Company: Fudan University
// Engineer: Yijing Sun
// Design Name: 
// Module Name: BIN divider and to Seven Segments Converter 
// Project Name: Whac-A-Mole
// Target Devices: Xilinx Spartan3E XC3S500E
// Tool versions: 9.1i
// Description:
//-----------------------------------------------------------------------------------
module bindiv(data_in, reset, ge, shi, bai);

parameter B_SIZE = 8; //B_IZEΪ����������ռ��λ�����ɸ�����Ҫ������չ
input [B_SIZE-1 : 0] data_in;
input reset; //ena�ߵ�ƽ��Ч���͵�ƽʱbcd=0 
output reg [3:0] ge, shi, bai;  
reg [B_SIZE-1 : 0] bin; 
reg [B_SIZE+3 : 0] bcd;  // bcd�ĳ���Ӧ����ʵ����������޸�
reg [B_SIZE+3 : 0] result; //result�ĳ���=bcd�ĳ��� 

always@( data_in or reset ) 
begin
	bin = data_in;
	result = 0;
	if ( reset == 0 )
	begin
	bcd <= 0;
	result = 0;
	end
	else begin
	repeat ( B_SIZE-1 ) //ʹ��repeat������ѭ������
		begin 
		result[0] = bin[B_SIZE-1]; 
		if ( result[3 : 0] > 4 ) 
			result[3 : 0] = result[3 : 0] + 4'd3; 
		if ( result[7 : 4] > 4 ) 
			result[7 : 4] = result[7 : 4] + 4'd3; 
		if ( result[11 : 8] > 4 ) 
			result[11 : 8] = result[11 : 8] + 4'd3; //��չʱӦ���մ�����if�����д
			result = result << 1; 
			bin = bin << 1; 
			end 
		result[0] = bin[B_SIZE-1]; 
		bcd <= result; 
		end 
		ge = result[3 : 0];
		shi = result[7 : 4];
		bai = result[11 : 8];
	end
endmodule