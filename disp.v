`include "defines.v"

/*
dispIn：
    31:0    income signal
    32      low(32=0, show 15:0) or high(32=1, show 31:16)
    33      clk
    34      rst
    
output:
    7:0     control disp_data_o
    11:8    select disp_data_o
*/

module disp(
    input   wire    clk,
	input   wire    rst,

    input   wire[`DispInBus]    disp_data_i,
    output  wire[`DispLedBus]   disp_data_o,
    output  wire[`DispAddrBus]  disp_addr_o
    );

reg [31:0]  cyc;
reg [3:0]   

initial begin
    disp_addr_o <= 4'b0001;end

always @(in)begin
    case(in)
        4'b0000:out<=`ledZer;
        default:out=`ledEmp;


always @(posedge clkIn)begin
//always @(posedge clkIn or posedge rst)begin

    disp_addr_o <= {disp_addr_o[0],disp_addr_o[3:1]}
    
    if(rst)begin
        disp_data_o=`ledEmp;end
		//disp_data_o=;end

    else
        if(cyc==`DispSpeed) begin
            cyc <= 0;
            disp_data_o = `ledZer;end
        else
            cyc <= cyc+1;end
            //disp_addr_o<=disp_addr_o+1;end

endmodule