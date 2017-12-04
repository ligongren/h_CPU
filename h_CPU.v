module top(
	input   clk,
	input   rst,
	output  wire[7:0]   led,
	output  wire[3:0]   sele
);



disp disp0(
    .clk    (clk),
    .rst    (rst),
    .dispin (),
    .led    (led),
    .sele   (sele)
);

endmodule