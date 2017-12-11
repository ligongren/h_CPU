//数码管显示数字
`define ledZer  8'b0000_0011
`define ledOne  8'b1001_1111
`define ledTwo  8'b0010_0101
`define ledThr  8'b0000_1101
`define ledFou  8'b1001_1001
`define ledFiv  8'b0101_1011
`define ledSix  8'b0110_0001
`define ledSev  8'b0001_1111
`define ledEig  8'b0000_0001
`define ledNin  8'b0000_1001
`define ledA10  8'b0001_0001
`define ledB11  8'b1100_0001
`define ledC12  8'b0110_0011
`define ledD13  8'b1000_0101
`define ledE14  8'b0110_0001
`define ledF15  8'b0111_0001
`define ledEmp  8'b0000_0000

`define DispInBus       31:0                //数码管显示模块宽度
`define DispAddrBus     3:0
`define DispLedBus      7:0

`define DispSpeed       32'h003f_0000       //数码管刷新速度

`define InstAddrBus 31:0            //ROM的地址总线宽度
`define InstBus 31:0                //ROM的数据总线宽度

//全局
`define RstEnable 1'b1              //复位信号有效
`define RstDisable 1'b0             //复位信号无效
`define ZeroWord 32'h00000000       //32位的数值0
`define WriteEnable 1'b1            //使能写
`define WriteDisable 1'b0           //禁止写
`define ReadEnable 1'b1             //使能读
`define ReadDisable 1'b0            //禁止读
`define AluOpBus 7:0                //译码阶段的输出aluop_o的宽度
`define AluSelBus 2:0               //译码阶段的输出alusel_o的宽度
`define InstValid 1'b0              //指令有效
`define InstInvalid 1'b1            //指令无效
`define Stop 1'b1                   
`define NoStop 1'b0
`define InDelaySlot 1'b1
`define NotInDelaySlot 1'b0
`define Branch 1'b1
`define NotBranch 1'b0
`define InterruptAssert 1'b1
`define InterruptNotAssert 1'b0
`define TrapAssert 1'b1
`define TrapNotAssert 1'b0
`define True_v 1'b1                 //逻辑“真”
`define False_v 1'b0                //逻辑“假”
`define ChipEnable 1'b1             //芯片使能
`define ChipDisable 1'b0            //芯片禁止


//指令
`define EXE_ORI  6'b001101          //指令ori的指令码


`define EXE_NOP 6'b000000


//AluOp
`define EXE_OR_OP    8'b00100101
`define EXE_ORI_OP  8'b01011010


`define EXE_NOP_OP    8'b00000000

//AluSel
`define EXE_RES_LOGIC 3'b001

`define EXE_RES_NOP 3'b000


//指令存储器inst_rom
`define InstAddrBus 31:0            //ROM的地址总线宽度
`define InstBus 31:0                //ROM的数据总线宽度
`define InstMemNum 131071           //ROM的实际大小为128KB
`define InstMemNumLog2 17           //ROM实际使用的地址线宽度


//通用寄存器regfile
`define RegAddrBus 4:0              //Regfile模块的地址线宽度
`define RegBus 31:0                 //Regfile的数据线宽度
`define RegWidth 32                 //通用寄存器的宽度
`define DoubleRegWidth 64           //两倍的通用寄存器宽度
`define DoubleRegBus 63:0           //两倍的通用寄存器
`define RegNum 32                   //通用寄存器的数量
`define RegNumLog2 5                //寻址通用寄存器使用的地址位数
`define NOPRegAddr 5'b00000         
