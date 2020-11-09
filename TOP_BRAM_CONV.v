`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2020 12:13:43
// Design Name: 
// Module Name: TOP_BRAM_CONV
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TOP_BRAM_CONV #(parameter DATA_WIDTH=32)(
input axi_clk,
input axi_reset_n,
//input [11:0]addra,
//Axi-stream slave interface
input s_axis_valid,
input [DATA_WIDTH-1:0] s_axis_data,
output  s_axis_ready,
//Axi-stream master interface
output reg m_axis_valid,
output [DATA_WIDTH-1:0] m_axis_data,
input m_axis_ready//, wea_out
);
wire[DATA_WIDTH-1:0]dout, dout_1;
reg[DATA_WIDTH-1:0]a[4095:0];
wire[DATA_WIDTH-1:0]b[4095:0];
reg [11:0]addra;
integer i;
reg wea_out;
reg[4:0]addr1,addr2,addr3,addr4,addr5,addr6,addr7,addr8;

assign s_axis_ready = m_axis_ready;
always @(posedge axi_clk)
begin
    if( s_axis_valid & m_axis_ready)

 m_axis_valid = m_axis_ready;
 end
always @(posedge axi_clk)begin
wea_out<=s_axis_valid & m_axis_ready;
end
always @(posedge axi_clk)
begin/*
//if(axi_reset_n)begin
    if( s_axis_valid | m_axis_ready==0)
begin
 addra<=12'b0; 
 end  
   else  */
   /*if(axi_reset_n)begin
   addra<=12'b0;
      addr1<=5'b0;
      addr2<=5'b0;
      addr3<=5'b0;
      addr4<=5'b0;
      addr5<=5'b0;
      addr6<=5'b0;
      addr7<=5'b0;
      addr8<=5'b0;
     end 
   else */
   if( s_axis_valid & m_axis_ready)
     begin 
       addra<=addra+1;     
   /*     if(addra==12'b0000000000001001)///addra=9
       addr1<=addr1;
       else
       addr1<=addr1+1;
       
        if(addra==12'b0000000000010010)///addra=18
       addr2<=addr2+1;
       else
       addr2<=addr2;
       
       if(addra==12'b0000000000011011)///addra=27
       addr3<=addr3+1;
       else
       addr3<=addr3;
       
       if(addra==12'b0000000000100100)///addra=36
       addr4<=addr4+1;
       else
       addr4<=addr4;
      
       if(addra==12'b0000000000101101)///addra=45
       addr5<=addr5+1;
       else
       addr5<=addr5;
       
       if(addra==12'b0000000000110110)///addra=54
       addr6<=addr6+1;
       else
       addr6<=addr6;
       
       
       if(addra==12'b0000000000111111)///addra=63
       addr7<=addr7+1;
       else
       addr7<=addr7;
       */
       if(addra>12'b0000000001001000)///addra=63
       begin
       addr1<=addr1+1;
      
      end
      end
      else begin
     addra<=12'b0;
      addr1<=5'b0;
     
       end
       end
     /*  
      else begin
     // addra<=addra+1;
      addr1<=addr1+1;
      addr2<=addr2+1;
      addr3<=addr3+1;
      addr4<=addr4+1;
      addr5<=addr5+1;
      addr6<=addr6+1;
      addr7<=addr7+1;
      addr8<=addr8+1;
    */  /*addra<=12'b0;
      addr1<=5'b0;
      addr2<=5'b0;
      addr3<=5'b0;
      addr4<=5'b0;
      addr5<=5'b0;
      addr6<=5'b0;
      addr7<=5'b0;
      addr8<=5'b0;
      */
//      end  
//      end
 
 blk_mem_gen_0 In_Mem (.clka(axi_clk),.ena(axi_reset_n),.wea(s_axis_valid & m_axis_ready), .addra(addra), .dina(s_axis_data), .douta(dout));
 /*always@(posedge axi_clk)begin
 if(s_axis_valid & m_axis_ready)begin
 a[addra]<=dout;
 end
 else begin
 for(i=0;i<4000;i=i+1)
 a[i]<=32'b0;
 end
 end*/
 conv_3x3 MM0(.a(dout),.addr(addr1),.clk(axi_clk),.en(s_axis_valid & m_axis_ready),.out(b[0]));
 conv_3x3 MM1(.a(dout),.addr(addr1),.clk(axi_clk),.en(s_axis_valid & m_axis_ready),.out(b[1]));
 conv_3x3 MM2(.a(dout),.addr(addr1),.clk(axi_clk),.en(s_axis_valid & m_axis_ready),.out(b[2]));
 conv_3x3 MM3(.a(dout),.addr(addr1),.clk(axi_clk),.en(s_axis_valid & m_axis_ready),.out(b[3]));
 conv_3x3 MM4(.a(dout),.addr(addr1),.clk(axi_clk),.en(s_axis_valid & m_axis_ready),.out(b[4]));
 conv_3x3 MM5(.a(dout),.addr(addr1),.clk(axi_clk),.en(s_axis_valid & m_axis_ready),.out(b[5]));
 conv_3x3 MM6(.a(dout),.addr(addr1),.clk(axi_clk),.en(s_axis_valid & m_axis_ready),.out(b[6]));
 conv_3x3 MM7(.a(dout),.addr(addr1),.clk(axi_clk),.en(s_axis_valid & m_axis_ready),.out(b[7]));
    
     /*CONV_3x3 MM0(.a10(a[0]),.a11(a[1]),.a12(a[2]),.a13(a[3]),.a14(a[4]),.a15(a[5]),.a16(a[6]),.a17(a[7]),
   .a18(a[8]),.k10(a[8]),.k11(a[9]),.k12(a[10]),.k13(a[11]),.k14(a[12]),.k15(a[13]),.k16(a[14]),
   .k17(a[15]),.k18(a[16]),.clk(axi_clk),.en(axi_reset_n),.out(b[0]));
    
  CONV_3x3 MM1(.a10(a[17]),.a11(a[18]),.a12(a[19]),.a13(a[20]),.a14(a[21]),.a15(a[22]),.a16(a[23]),.a17(a[24]),
   .a18(a[25]),.k10(a[26]),.k11(a[27]),.k12(a[28]),.k13(a[29]),.k14(a[30]),.k15(a[31]),.k16(a[32]),
   .k17(a[33]),.k18(a[34]),.clk(axi_clk),.en(axi_reset_n),.out(b[1]));
 
  CONV_3x3 MM2(.a10(a[35]),.a11(a[36]),.a12(a[37]),.a13(a[38]),.a14(a[39]),.a15(a[40]),.a16(a[41]),.a17(a[42]),
   .a18(a[43]),.k10(a[44]),.k11(a[45]),.k12(a[46]),.k13(a[47]),.k14(a[48]),.k15(a[49]),.k16(a[50]),
   .k17(a[51]),.k18(a[52]),.clk(axi_clk),.en(axi_reset_n),.out(b[2]));
  
  CONV_3x3 MM3(.a10(a[53]),.a11(a[54]),.a12(a[55]),.a13(a[56]),.a14(a[57]),.a15(a[58]),.a16(a[59]),.a17(a[60]),
   .a18(a[61]),.k10(a[62]),.k11(a[63]),.k12(a[64]),.k13(a[65]),.k14(a[66]),.k15(a[67]),.k16(a[68]),
   .k17(a[69]),.k18(a[70]),.clk(axi_clk),.en(axi_reset_n),.out(b[3]));
 
  CONV_3x3 MM4(.a10(a[71]),.a11(a[72]),.a12(a[73]),.a13(a[74]),.a14(a[75]),.a15(a[76]),.a16(a[77]),.a17(a[78]),
   .a18(a[79]),.k10(a[80]),.k11(a[81]),.k12(a[82]),.k13(a[83]),.k14(a[84]),.k15(a[85]),.k16(a[86]),
   .k17(a[87]),.k18(a[88]),.clk(axi_clk),.en(axi_reset_n),.out(b[4]));
  
  CONV_3x3 MM5(.a10(a[89]),.a11(a[90]),.a12(a[91]),.a13(a[92]),.a14(a[93]),.a15(a[94]),.a16(a[95]),.a17(a[96]),
   .a18(a[97]),.k10(a[98]),.k11(a[99]),.k12(a[100]),.k13(a[101]),.k14(a[102]),.k15(a[103]),.k16(a[104]),
   .k17(a[105]),.k18(a[106]),.clk(axi_clk),.en(axi_reset_n),.out(b[5]));
   
  CONV_3x3 MM6(.a10(a[107]),.a11(a[108]),.a12(a[109]),.a13(a[110]),.a14(a[111]),.a15(a[112]),.a16(a[113]),.a17(a[114]),
   .a18(a[115]),.k10(a[116]),.k11(a[117]),.k12(a[118]),.k13(a[119]),.k14(a[120]),.k15(a[121]),.k16(a[122]),
   .k17(a[123]),.k18(a[124]),.clk(axi_clk),.en(axi_reset_n),.out(b[6]));
 
  CONV_3x3 MM7(.a10(a[125]),.a11(a[126]),.a12(a[127]),.a13(a[128]),.a14(a[129]),.a15(a[130]),.a16(a[131]),.a17(a[132]),
   .a18(a[133]),.k10(a[134]),.k11(a[135]),.k12(a[136]),.k13(a[137]),.k14(a[138]),.k15(a[139]),.k16(a[140]),
   .k17(a[141]),.k18(a[142]),.clk(axi_clk),.en(axi_reset_n),.out(b[7]));
 */
   blk_mem_gen_1 Mem_out (.clka(axi_clk),.ena(axi_reset_n),.wea(s_axis_valid & m_axis_ready), .addra(addra),.dina(b[addra]), .douta(m_axis_data) );
  
  /*always @(posedge axi_clk)
begin
if(s_axis_valid & m_axis_ready)
 m_axis_data<=32'b0;
 else 
 m_axis_data<=dout_1;
   //m_axis_valid<=s_axis_valid & s_axis_ready;
   end*/
endmodule


