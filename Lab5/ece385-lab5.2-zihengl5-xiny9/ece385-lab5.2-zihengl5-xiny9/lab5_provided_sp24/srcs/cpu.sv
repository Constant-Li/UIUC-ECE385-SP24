//------------------------------------------------------------------------------
// Company: 		 UIUC ECE Dept.
// Engineer:		 Stephen Kempf
//
// Create Date:    
// Design Name:    ECE 385 Given Code - SLC-3 core
// Module Name:    SLC3
//
// Comments:
//    Revised 03-22-2007
//    Spring 2007 Distribution
//    Revised 07-26-2013
//    Spring 2015 Distribution
//    Revised 09-22-2015 
//    Revised 06-09-2020
//	  Revised 03-02-2021
//    Xilinx vivado
//    Revised 07-25-2023 
//    Revised 12-29-2023
//------------------------------------------------------------------------------

module cpu (
    input   logic        clk,
    input   logic        reset,

    input   logic        run_i,
    input   logic        continue_i,
    output  logic [15:0] hex_display_debug,
    output  logic [15:0] led_o,
   
    input   logic [15:0] mem_rdata,
    output  logic [15:0] mem_wdata,
    output  logic [15:0] mem_addr,
    output  logic        mem_mem_ena,
    output  logic        mem_wr_ena
);


// Internal connections
logic ld_mar; 
logic ld_mdr; 
logic ld_ir; 
logic ld_ben; 
logic ld_cc; 
logic ld_reg; 
logic ld_pc; 
logic ld_led;

logic gate_pc;
logic gate_mdr;
logic gate_alu; 
logic gate_marmux;

logic [1:0] pcmux;
logic       drmux;
logic       sr1mux;
logic       sr2mux;
logic       addr1mux;
logic [1:0] addr2mux;
logic [1:0] aluk;
logic       mio_en;

logic [15:0] mdr_in;
logic [15:0] mar; 
logic [15:0] mdr;
logic [15:0] ir;
logic [15:0] pc;
logic [15:0] BUS;
logic ben;

logic [15:0] SR1_OUT;
logic [15:0] SR2_OUT;

logic [15:0] SR2MUX_OUT;
logic [15:0] ADDR1MUX_OUT;
logic [15:0] ADDR2MUX_OUT;
logic [15:0] MDRMUX_OUT;
logic [15:0] PCMUX_OUT;
logic [15:0] ALU_OUT;
logic [2:0]  SR1MUX_OUT;
logic [2:0]  DRMUX_OUT;

assign mem_addr = mar;
assign mem_wdata = mdr;

// State machine, you need to fill in the code here as well
// .* auto-infers module input/output connections which have the same name
// This can help visually condense modules with large instantiations, 
// but can also lead to confusing code if used too commonly
control cpu_control (
    .*
);


assign led_o = ir;
assign hex_display_debug = ir;

// special register
///////////////////////////////////////////////////////////////////////////////////////////
load_reg #(.DATA_WIDTH(16)) ir_reg (
    .clk    (clk),
    .reset  (reset),

    .load   (ld_ir),
    .data_i (BUS),

    .data_q (ir)
);

load_reg #(.DATA_WIDTH(16)) pc_reg (
    .clk(clk),
    .reset(reset),

    .load(ld_pc),
    .data_i(PCMUX_OUT),

    .data_q(pc)
);

load_reg #(.DATA_WIDTH(16)) mar_reg (
    .clk    (clk),
    .reset  (reset),

    .load   (ld_mar),
    .data_i (BUS),

    .data_q (mar)
);

load_reg #(.DATA_WIDTH(16)) mdr_reg (
    .clk    (clk),
    .reset  (reset),

    .load   (ld_mdr),
    .data_i (MDRMUX_OUT),

    .data_q (mdr)
);

// general purpose register R0-7
///////////////////////////////////////////////////////////////////////////////////////////
resigter gp_reg (
    .clk    (clk),
    .ld_reg (ld_reg),
    .reset  (reset),
    
    .BUS    (BUS),
    
    .DR     (DRMUX_OUT),
    .SR1    (SR1MUX_OUT),
    .SR2    (ir[2:0]),
    
    .SR1_out (SR1_OUT),
    .SR2_out (SR2_OUT)


);

// 2-1 mux
///////////////////////////////////////////////////////////////////////////////////////////
mux2 #(3) DRMUX (
    .d0     (ir[11:9]),
    .d1     (3'b111),
    
    .s      (drmux),
    .y      (DRMUX_OUT)
);

mux2 #(3) SR1MUX (
    .d0     (ir[11:9]),
    .d1     (ir[8:6]),
    
    .s      (sr1mux),
    .y      (SR1MUX_OUT)
);

logic [15:0] sext4_0;
assign sext4_0 = {{11{ir[4]}}, ir[4:0]};

mux2 SR2MUX (
    .d0     (SR2_OUT),
    .d1     (sext4_0),
    
    .s      (sr2mux),
    .y      (SR2MUX_OUT)
);

mux2 ADDR1MUX (
    .d0     (pc),
    .d1     (SR1_OUT),
    
    .s      (addr1mux),
    .y      (ADDR1MUX_OUT)
);

mux2 MDRMUX (
    .d0     (mem_rdata),
    .d1     (BUS),
    
    .s      (mio_en),
    .y      (MDRMUX_OUT)
);

// 4-1 mux
///////////////////////////////////////////////////////////////////////////////////////////
logic [15:0] sext5_0;
logic [15:0] sext8_0;
logic [15:0] sext10_0;

assign sext5_0 = {{10{ir[5]}}, ir[5:0]};
assign sext8_0 = {{7{ir[8]}}, ir[8:0]};
assign sext10_0 = {{5{ir[10]}}, ir[10:0]};

mux4 ADDR2MUX (
    .d0     (16'b0000000000000000),
    .d1     (sext5_0),
    .d2     (sext8_0),
    .d3     (sext10_0),
    
    .s      (addr2mux),
    .y      (ADDR2MUX_OUT)
);

mux4 PCMUX (
    .d0     (pc + 1'b1),
    .d1     (BUS),
    .d2     (ADDR1MUX_OUT + ADDR2MUX_OUT),
    .d3     (16'b0000000000000000),
    
    .s      (pcmux),
    .y      (PCMUX_OUT)
);
// bus
///////////////////////////////////////////////////////////////////////////////////////////
bus BUS_FULL (
    .pc     (pc),  
    .mdr    (mdr),     
    .alu    (ALU_OUT),  
    .mar    (ADDR1MUX_OUT + ADDR2MUX_OUT),  
    
    .gate_pc     (gate_pc),  
    .gate_mdr    (gate_mdr),     
    .gate_alu    (gate_alu),  
    .gate_marmux (gate_marmux),  
    
    .BUS     (BUS)
);
// alu
///////////////////////////////////////////////////////////////////////////////////////////
ALU alu_full (
    .SR1_out     (SR1_OUT),  
    .SR2MUX_out  (SR2MUX_OUT),     
    .ALUK        (aluk),  

    .ALU_out     (ALU_OUT)
);

///////////////////////////////////////////////////////////////////////////////////////////

ben_reg ben_full(
    .BUS        (BUS),
    .ir         (ir),
    .reset      (reset),
    .clk        (clk),
    .ld_cc      (ld_cc),
    .ld_ben     (ld_ben),
    
    .ben        (ben)
    );
    
endmodule