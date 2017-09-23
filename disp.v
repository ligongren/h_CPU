//`define ledZer  2'hfa
`define ledZer  8'b1100_0000
`define ledOne  8'b1111_1001
`define ledTwo  8'b1010_0100
`define ledThr  2'h60
`define ledFou  2'h60
`define ledFiv  2'h60
`define ledSix  2'h60
`define ledSev  2'h60
`define ledEig  2'h60
//`define ledNin  2'h60
`define ledNin  8'b0110_1100

module disp(
    input   clkIn,
    input   rst,
    input   [31:0]in,
    output  reg[7:0]led,
    output  reg[3:0]sele
    );


parameter speed = 32'h003f_0000;

reg [31:0]cyc;
reg sig;

always @(posedge clkIn or posedge rst)begin

    if(rst)begin
        led=`ledTwo;end
		  //led=;end

    else
        if(cyc==speed) begin
            cyc<=0;
            led=`ledZer;end
        else
            cyc <=cyc+1;end
            //sele<=sele+1;end


endmodule