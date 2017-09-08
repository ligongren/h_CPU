`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:18 06/26/2017 
// Design Name: 
// Module Name:    ALU 
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

`define         lw_add          4'b0010
`define         sw_sub          4'b0110
`define         r_add           4'b0010
`define         r_sub           4'b0110
`define         r_and           4'b0000
`define         r_or            4'b0001
`define         r_set           4'b0111

`define         r_nor   4'b1100


module ALU(
    input wire	[7:0] SrcA,
    input wire	[7:0] SrcB,
    input wire [3:0] ALUCtr,
    output reg Zero,
    output reg [7:0] ALURes
    );

assign Zero = (ALURes ==1'b0);

always @ (SrcA or SrcB or ALUCtr)begin
    case (ALUCtr)
        `r_and:     ALURes = SrcA & SrcB;
        `r_or:      ALURes = SrcA | SrcB;
        `r_add:     ALURes = SrcA + SrcB;
        `r_sub:     ALURes = SrcA - SrcB;
        `r_set:     ALURes = SrcA < SrcB ? 1:0;
        `r_nor:     ALURes = ~(SrcA|SrcB);
        default:    ALURes = 7'h0;
    endcase
end

endmodule
