module testbench();

	timeunit 10ns;	// This is the amount of time represented by #1 
	timeprecision 1ns;

	// These signals are internal because the processor will be 
	// instantiated as a submodule in testbench.

	logic reset;
    logic run_i;
    logic continue_i;
    logic [15:0] hex_display_debug;
    logic [15:0] led_o;
    
    logic [15:0] mem_addr;
    logic [15:0] mem_rdata;
    logic [15:0] mem_wdata;

    logic mem_mem_ena;
    logic mem_wr_ena;
	
	logic [15:0] pc;
	logic [15:0] mar;
	logic [15:0] mdr;
	logic [15:0] ir;


    cpu cpu_simulation(.*);
    
    assign pc = cpu_simulation.pc;
    assign mar = cpu_simulation.mar;
    assign mdr = cpu_simulation.mdr;
    assign ir = cpu_simulation.ir;


    logic clk;
    
	initial begin: CLOCK_INITIALIZATION
		clk = 1;
	end 
	
	always begin : CLOCK_GENERATION
		#1 clk = ~clk;
	end
	
	initial begin: TEST_VECTORS
	    reset <= 1'b0;
		repeat (3) @(posedge clk);
        reset <= 1'b1;

		repeat (3) @(posedge clk);
        reset <= 1'b0;
		repeat (3) @(posedge clk);
//        #1 force processor.pc = 16'b1000000000000000;
        mem_rdata <= 16'b0001001001000010;  
        run_i <= 1'b1;
		
		repeat (10) @(posedge clk);
		run_i <= 1'b0;
		repeat (5) @(posedge clk);
//		# 1 release processor.pc;
        continue_i <= 1'b1;
		repeat (5) @(posedge clk);
        continue_i <= 1'b0;
		repeat (5) @(posedge clk);

		$finish(); //this task will end the simulation if the Vivado settings are properly configured


	end

endmodule
