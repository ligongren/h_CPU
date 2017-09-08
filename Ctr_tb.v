`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:11:01 06/26/2017
// Design Name:   Ctr
// Module Name:   D:/h_CPU/Ctr_tb.v
// Project Name:  h_CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ctr
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Ctr_tb;

	// Inputs
	reg [5:0] OpCode;
	reg [5:0] Funct;

	// Outputs
	wire RegDst;
	wire ALUSrc;
	wire RegWrite;
	wire MemWrite;
	wire MemRead;
	wire MemtoReg;
	wire Branch;
	wire Jump;

	// Instantiate the Unit Under Test (UUT)
	Ctr uut (
		.OpCode(OpCode), 
		.Funct(Funct), 
		.RegDst(RegDst), 
		.ALUSrc(ALUSrc), 
		.RegWrite(RegWrite), 
		.MemWrite(MemWrite), 
		.MemRead(MemRead), 
		.MemtoReg(MemtoReg), 
		.Branch(Branch), 
		.Jump(Jump)
	);

	initial begin
		// Initialize Inputs
		//OpCode = 0;
		//Funct = 0;
		
		OpCode	=6'b000000;
		Funct		=6'b100000;
		#10;
		
		OpCode	=6'b000000;
		Funct		=6'b100010;
		#10;

		// Wait 100 ns for global reset to finish
		//#100;
        
		// Add stimulus here

	end
      
endmodule

