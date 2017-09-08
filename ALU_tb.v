`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:59:20 06/26/2017
// Design Name:   ALU
// Module Name:   D:/h_CPU/ALU_tb.v
// Project Name:  h_CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

	// Inputs
	reg [7:0] SrcA;
	reg [7:0] SrcB;
	reg [3:0] ALUCtr;

	// Outputs
	wire Zero;
	wire [7:0] ALURes;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.SrcA(SrcA), 
		.SrcB(SrcB), 
		.ALUCtr(ALUCtr), 
		.Zero(Zero), 
		.ALURes(ALURes)
	);

	initial begin
		// Initialize Inputs
		SrcA = 8'hf0;
		SrcB = 8'h05;
		ALUCtr = 0;

		// Wait 100 ns for global reset to finish
		#10;
		
		ALUCtr = 4'b0001;
		
		#10;
		
		ALUCtr = 4'b0010;
        
		// Add stimulus here

	end
      
endmodule

