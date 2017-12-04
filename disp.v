`include "def.v"

/*
dispIn：
    31:0    income signal
    32      low(32=0, show 15:0) or high(32=1, show 31:16)
    33      clk
    34      rst
    
output:
    7:0     control led
    11:8    select led
*/

module disp(
    input   [34:0]dispIn,
    output  reg[7:0]led,
    output  reg[3:0]sele
    );

parameter speed <= 32'h003f_0000;

reg [31:0]  cyc;
reg [3:0]   

initial begin
    sele <= 4'b0001;end


always @(in)begin
    case(in)
        4'b0000:out<=`ledZer;
        default:out=`ledEmp;


always @(posedge clkIn)begin
//always @(posedge clkIn or posedge rst)begin

    sele <= {sele[0],sele[3:1]}
    
    if(rst)begin
        led=`ledEmp;end
		//led=;end

    else
        if(cyc==speed) begin
            cyc <= 0;
            led = `ledZer;end
        else
            cyc <= cyc+1;end
            //sele<=sele+1;end

endmodule