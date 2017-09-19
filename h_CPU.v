module top(
    input   clkIn,
    input   rst,
    output  led[7:0],
    output  sele[3:0],
    );


disp disp0(
    .clkIn  (clkIn),
    .rst    (rst),
    .in     (),
    .led    (led),
    .sele   (sele)
);

endmodule