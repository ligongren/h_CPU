/*
dispIn：
    31:0    income signal
    32      low(32=0, show 15:0) or high(32=1, show 31:16)
    33      clk
    34      rst
    
put:
    7:0     control disp_data_o
    11:8    select disp_data_o
*/

`include "defines.v"

module disp(
    input   wire    clk,
	input   wire    rst,

    input   wire[`DispInBus]    disp_data_i,
    input   wire                lowOrHigh,
    
    output  wire[`DispLedBus]   disp_data_o,
    output  wire[`DispSelBus]   disp_sel_o
    );

//reg [31:0]  cyc;
reg [3:0]   in;
reg [`DispTempBus]  disp_temp;

initial begin
    disp_sel_o <= 4'b0001;
    sele_data_range <=4'b;
end

always @(lowOrHigh)begin
    disp_temp <= disp_data_i[(lowOrHigh)?`ShowHigh:`ShowLow];
end

always @(in)begin
    case(in)
        4'b0000: disp_data_o <= `ledZer;
        4'b0001: disp_data_o <= `ledOne;
        4'b0010: disp_data_o <= `ledTwo;
        4'b0011: disp_data_o <= `ledThr;
        4'b0100: disp_data_o <= `ledFou;
        4'b0101: disp_data_o <= `ledFiv;
        4'b0110: disp_data_o <= `ledSix;
        4'b0111: disp_data_o <= `ledSev;
        4'b1000: disp_data_o <= `ledEig;
        4'b1001: disp_data_o <= `ledNig;
        4'b1010: disp_data_o <= `ledA10;
        4'b1011: disp_data_o <= `ledB11;
        4'b1100: disp_data_o <= `ledC12;
        4'b1101: disp_data_o <= `ledD13;
        4'b1110: disp_data_o <= `ledE14;
        4'b1111: disp_data_o <= `ledF15;
        default: disp_data_o <= `ledEmp;
    endcase
end

always @(posedge clkIn)begin
//always @(posedge clkIn or posedge rst)begin
    
    disp_sel_o <= {disp_sel_o[0],disp_sel_o[3:1]};
    case (disp_sel_o)
      default: in <= disp_temp[3:0];
      4'b0010: in <= disp_temp[7:4];
      4'b0100: in <= disp_temp[11:8];
      4'b1000: in <= disp_temp[15:12];
    endcase
end

endmodule

    // case(disp_data_o)
    //     4'b0001: dis
    // in <= disp_data_i{disp_sel_o[]};
    // in <= in+1;

    // if(rst)begin
    //     disp_data_o=`ledEmp;
    // end
		
    //disp_data_o=;end

    // else
    //     if(cyc==`DispSpeed) begin
    //         cyc <= 0;
    //         disp_sel_o <=;end
    //     else
    //         cyc <= cyc+1;end
    //         //disp_sel_o<=disp_sel_o+1;end