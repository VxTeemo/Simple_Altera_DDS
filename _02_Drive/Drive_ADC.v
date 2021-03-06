/*******************************(C) COPYRIGHT 2017 Wind（谢玉伸）*********************************/
/**============================================================================
* @FileName    : Drive_ADC.v
* @Description : ADC文件
* @Date        : 2017/5/1
* @By          : Wind（谢玉伸）
* @Email       : 1659567673@ qq.com
* @Platform    : Quartus II 15.0 (64-bit) (EP4CE22E22C8)
* @Explain     : ADC文件
*=============================================================================*/ 
module Drive_ADC
(   
	 input in_clr
	 ,input in_clk  
	 ,input [9:0]in_ADC_data  
	 ,input in_wrFIFOfull
	 
	 ,output reg out_OE    
	 ,output reg out_PD    
	 ,output out_CLK   
	 ,output reg [9:0]out_ADC_data  
	  
        
	 ,output reg out_wrFIFOclk
	 ,output reg out_wrFIFOreq
	 
);	

reg out_CLK_reg;
//reg wrflag;

assign out_CLK = out_CLK_reg;

always @(in_clk)
begin
	out_OE <= 0;	
	out_PD <= 0;
    
//    wrflag <= !wrflag;
    if(in_wrFIFOfull == 0)
        out_wrFIFOreq <= 1;
    else
        out_wrFIFOreq <= 0;

  
	out_CLK_reg <= !in_clk;	
	if(in_clk)
	begin 
		//芯片是这样的
//		out_ADC_data[9] <= in_ADC_data[0];
//		out_ADC_data[8] <= in_ADC_data[1];
//		out_ADC_data[7] <= in_ADC_data[2];
//		out_ADC_data[6] <= in_ADC_data[3];
//		out_ADC_data[5] <= in_ADC_data[4];
//		out_ADC_data[4] <= in_ADC_data[5];
//		out_ADC_data[3] <= in_ADC_data[6];
//		out_ADC_data[2] <= in_ADC_data[7];
//		out_ADC_data[1] <= in_ADC_data[8];
//		out_ADC_data[0] <= in_ADC_data[9];
        //FPGA中倒序数据，STM32直接接收
		out_ADC_data <= in_ADC_data; 
		
	end
	
end
	
	
	
	
	
	
endmodule


/*******************************(C) COPYRIGHT 2017 Wind（谢玉伸）*********************************/













