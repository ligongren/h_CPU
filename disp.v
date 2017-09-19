`define ledZer  2'hfa
`define ledOne  2'h60
`define ledTwo  2'h60
`define ledThr  2'h60
`define ledFou  2'h60
`define ledFiv  2'h60
`define ledSix  2'h60
`define ledSev  2'h60
`define ledEig  2'h60
`define ledNin  2'h60

module disp(
    input   clkIn,
    input   rst,
    input   [31:0]in,
    output  [7:0]lced,
    output  reg[3:0]sele
    );


parameter speed = 32'h003f_0000;

reg [31:0]cyc;
reg sig;

always @(posedge clkIn or posedge rst)begin

    if(rst)begin
        led<=`ledNin;end

    else
        if(cyc==speed) begin
            cyc<=0;
            led<={`ledZer};end
        else
            cyc <=cyc+1;
            sele<=sele+1;end


endmodule