module top(
	input clkIn,
	input rst,
	output wire  [7:0]led,
	output wire  [3:0]sele
);



disp disp0(
    .clkIn  (clkIn),
    .rst    (rst),
    .in     (),
    .led    (led),
    .sele   (sele)
);

endmodule