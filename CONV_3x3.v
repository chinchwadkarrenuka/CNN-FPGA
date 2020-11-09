`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2020 12:05:59
// Design Name: 
// Module Name: conv_3x3
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


module conv_3x3 #(parameter m=32, parameter n=5,parameter l=18)(
    input [m-1:0] a,
    //input [m-1:0] k,
    //input [7:0] k,
    input [n-1:0] addr,
    input clk,
    input en,
    output reg[m-1:0] out
    );
    
    reg[m-1:0]a1[l-1:0];
   reg[m-1:0]k1[l-1:0];
    //reg[7:0]k1[l-1:0];
    wire[2*m-1:0]out1[l-1:0];
   // wire[39:0]out1[l-1:0];
     //reg[m-1:0]out1[l-1:0];/////copying 24 bit lsb of out1 multiplication product in this register
    wire [m-1:0]out2[8:0];
     wire [m-1:0]out3[8:0];
      wire [m-1:0]out4[8:0];
       wire [m-1:0]out5;
    genvar i,j1;
    reg [m-1:0] k10,k11,k12,k13,k14,k15,k16,k17,k18;
    reg [m-1:0] a10,a11,a12,a13,a14,a15,a16,a17,a18;
   // reg [7:0] k10,k11,k12,k13,k14,k15,k16,k17,k18;
    always@(posedge clk)begin
    a1[addr]<=a;
    //k1[addr]<=k;
    end
    always@(posedge clk)begin
    a10<=a1[0];
     a11<=a1[1];
      a12<=a1[2];
       a13<=a1[3];
        a14<=a1[4];
         a15<=a1[5];
          a16<=a1[6];
           a17<=a1[7];
            a18<=a1[8];
         
    k10<=a1[9];
     k11<=a1[10];
      k12<=a1[11];
       k13<=a1[12];
        k14<=a1[13];
         k15<=a1[14];
          k16<=a1[15];
           k17<=a1[16];
            k18<=a1[17];
         
    end
  /*generate
 for(i=0;i<9;i=i+1)begin
  multiplier mult (.CLK(clk),.A(a1[i]),.B(k1[i]),.P(out1[i]));
  end
  endgenerate*/

   multiplier mult1 (.CLK(clk),.A(a10),.B(k10),.P(out1[0]));
   multiplier mult2 (.CLK(clk),.A(a11),.B(k11),.P(out1[1]));
    multiplier mult3 (.CLK(clk),.A(a12),.B(k12),.P(out1[2]));
     multiplier mult4 (.CLK(clk),.A(a13),.B(k13),.P(out1[3]));
      multiplier mult5 (.CLK(clk),.A(a14),.B(k14),.P(out1[4]));
       multiplier mult6 (.CLK(clk),.A(a15),.B(k15),.P(out1[5]));
        multiplier mult7 (.CLK(clk),.A(a16),.B(k16),.P(out1[6]));
         multiplier mult8 (.CLK(clk),.A(a17),.B(k17),.P(out1[7]));
          multiplier mult9 (.CLK(clk),.A(a18),.B(k18),.P(out1[8])); 
   /////////////////////////
  /* always@(posedge clk)begin
   //for(i1=0;i1<9;i1=i1+1)
   out1<=out11[23:0];
    a[j+1][N-1:j+1] <= a[j][N-1:j+1];
   end*/
     //generate////////////adder level 1
   //for(j1=0;j1<8;j1=j1+2)begin
   //adder add1 (.A(out1[j1][m-1:0]),.B(out1[j1+1][m-1:0]),.CLK(clk),.S(out2[j1]));////0,2,4,6
     //end
   //endgenerate
   //adder add11 (.A(out1[8][m-1:0]),.B(32'b0),.CLK(clk),.S(out2[8]));
   adder add11 (.A(out1[0][m-1:0]),.B(out1[1][m-1:0]),.CLK(clk),.S(out2[0]));
   
   adder add12 (.A(out1[2][m-1:0]),.B(out1[3][m-1:0]),.CLK(clk),.S(out2[1]));
   adder add13 (.A(out1[4][m-1:0]),.B(out1[5][m-1:0]),.CLK(clk),.S(out2[2]));
   adder add14 (.A(out1[6][m-1:0]),.B(out1[7][m-1:0]),.CLK(clk),.S(out2[3]));
   
   adder add15 (.A(out1[8][m-1:0]),.B(32'b0),.CLK(clk),.S(out2[4]));
  ////////////adder level 2
  
   adder add21 (.A(out2[0]),.B(out2[1]),.CLK(clk),.S(out3[0]));
    adder add22 (.A(out2[2]),.B(out2[3]),.CLK(clk),.S(out3[1]));
   adder add23 (.A(out2[4]),.B(32'b0),.CLK(clk),.S(out3[2]));
    ////////////adder level 3
   adder add31 (.A(out3[0]),.B(out3[1]),.CLK(clk),.S(out4[0]));
   adder add32 (.A(out3[2]),.B(32'b0),.CLK(clk),.S(out4[1]));
    ////////////adder level 4
   adder add41 (.A(out4[0]),.B(out4[1]),.CLK(clk),.S(out5));
   
   always@(posedge clk)begin
   if(en)
   out<=out5;
   else 
   out<=32'b0;
   end
    
endmodule









