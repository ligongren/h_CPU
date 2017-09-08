`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:02:48 06/26/2017 
// Design Name: 
// Module Name:    Ctr 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "defines.v"

`define         lw_add                  4'b0010
`define         sw_sub                  4'b0110
`define         r_add                   4'b0010
`define         r_sub                   4'b0110
`define         r_and                   4'b0000
`define         r_or                    4'b0001
`define         r_setOnLessThan         4'b0111



module Ctr(
    input wire  [5:0] OpCode,
    input wire  [5:0] Funct,
    output reg  RegDst,
    output reg  ALUSrc,
    output reg  RegWrite,
    output reg  MemWrite,
    output reg  MemRead,
    output reg  MemtoReg,
    output reg  Branch,
    output reg  Jump,
    output reg [3:0] ALUControl,
	 output reg [1:0] ALUOp						//ָ�������޴˴����壬ȱ�ټ���������
    );
	 //�������Ϊreg�ͣ��ҵ��������Ϊreg��ֻ��ʱ�����ڱ仯ʱ�仯����wire���κ�ʱ�򶼿��ܱ仯��
always @(OpCode)begin
	case (OpCode)
		`r_format:begin
			RegDst          =1;
			ALUSrc          =0;
			MemtoReg        =0;
            RegWrite        =1;
            MemRead         =0;
            MemWrite        =0;
            Branch          =0;
            ALUOp           <=2'b10;
            Jump            =0;
		end
		`lw:begin
			RegDst          =1;
			ALUSrc          =0;
			MemtoReg        =0;
            RegWrite        =1;
            MemRead         =0;
            MemWrite        =0;
            Branch          =0; 
            ALUOp           =2'b00;
            Jump            =0;           
            
		end
		`sw:begin
			RegDst          =1;
			ALUSrc          =0;
			MemtoReg        =0;
            RegWrite        =1;
            MemRead         =0;
            MemWrite        =0;
            Branch          =0;
            ALUOp           =2'b00;
            Jump            =0;
            
		end
		`beq:begin
			//RegDst          =0;
			ALUSrc          =0;
			//MemtoReg        =0;
            RegWrite        =0;
            MemRead         =0;
            MemWrite        =0;
            Branch          =1;
            ALUOp           =2'b01;
            Jump            =0;
		end
	endcase
end

always @(ALUOp or Funct)begin
    casex ({ALUOp,Funct})
        8'b00xxxxxx:    ALUControl =`lw_add; //lw:       add
        8'b00xxxxxx:    ALUControl =`sw_sub; //sw:       substract
        8'b1xxx0000:    ALUControl =`r_add; //r-type:   add
        8'b1xxx0010:    ALUControl =`r_sub; //r-type:   substract
        8'b1xxx0100:    ALUControl =`r_and; //r-type:   and
        8'b1xxx0101:    ALUControl =`r_or; //r-type:   or
        8'b1xxx1010:    ALUControl =`r_setOnLessThan; //r-type:   set on less than
        default:        ALUControl =`r_and; 
    endcase
end

endmodule
