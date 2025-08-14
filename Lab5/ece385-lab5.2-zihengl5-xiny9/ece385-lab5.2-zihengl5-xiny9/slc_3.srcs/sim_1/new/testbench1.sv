module testbench1();

	timeunit 10ns;	// This is the amount of time represented by #1 
	timeprecision 1ns;

	// These signals are internal because the processor will be 
	// instantiated as a submodule in testbench.
	logic		clk;
	logic 		reset;

	logic 		run_i;
	logic 		continue_i;
	logic [15:0] sw_i;

	logic [15:0] led_o;
	logic [7:0]  hex_seg_left;
	logic [3:0]  hex_grid_left;
	logic [7:0]  hex_seg_right;
	logic [3:0]  hex_grid_right;

    processor_top top_simulation(.*);
    
    logic [15:0] pc, BUS;
    assign pc =  processor_top.slc3.cpu.pc;
    assign BUS =  processor_top.slc3.cpu.BUS;
    
    
    
	initial begin: CLOCK_INITIALIZATION
		clk = 1;
	end 
	
	always begin : CLOCK_GENERATION
		#1 clk = ~clk;
	end
	
	initial begin: TEST_VECTORS
	    reset <= 1'b1;
		repeat (3) @(posedge clk);
        reset <= 1'b1;

		repeat (3) @(posedge clk);
        reset <= 1'b0;
		repeat (3) @(posedge clk);
//        #1 force processor.pc = 16'b1000000000000000;
        sw_i <= 4'h0003;  
        run_i <= 1'b1;
		
		repeat (10) @(posedge clk);
		run_i <= 1'b0;
		
		repeat (5) @(posedge clk);
//		# 1 release processor.pc;
        continue_i <= 1'b1;

		repeat (5) @(posedge clk);
        continue_i <= 1'b0;
        
		repeat (5) @(posedge clk);
        continue_i <= 1'b1;
//        sw_i <= 4'h0005;  
		repeat (5) @(posedge clk);
        continue_i <= 1'b0;
        
		repeat (10) @(posedge clk);
		continue_i <= 1'b1;
		
		repeat (10) @(posedge clk);
		continue_i <= 1'b0;
		
        
		repeat (10) @(posedge clk);
		continue_i <= 1'b1;
//		sw_i <= 4'h4005; 
		repeat (10) @(posedge clk);
		continue_i <= 1'b0;
		
		repeat (10) @(posedge clk);
		continue_i <= 1'b1;
		
		repeat (10) @(posedge clk);
		continue_i <= 1'b0;
		
		repeat (10) @(posedge clk);
		continue_i <= 1'b1;
		
		repeat (10) @(posedge clk);
		continue_i <= 1'b0;
		
		$finish(); //this task will end the simulation if the Vivado settings are properly configured


	end

endmodule

