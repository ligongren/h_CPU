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


`include "defines.v"

module openmips_min_sopc(

    input   wire    clk,
    input   wire    rst,
    input   wire    DispClk
    output  
);

  //连接指令存储器
  wire[`InstAddrBus] inst_addr;
  wire[`InstBus] inst;
  wire rom_ce;
 

 openmips openmips0(
		.clk(clk),
		.rst(rst),
	
		.rom_addr_o(inst_addr),
		.rom_data_i(inst),
		.rom_ce_o(rom_ce)
	
	);
	
	inst_rom inst_rom0(
		.addr(inst_addr),
		.inst(inst),
		.ce(rom_ce)	
	);


endmodule