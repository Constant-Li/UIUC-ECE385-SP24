module testbench(); //even though the testbench doesn't create any hardware, it still needs to be a module

	timeunit 10ns;	// This is the amount of time represented by #1 
	timeprecision 1ns;

	// These signals are internal because the processor will be 
	// instantiated as a submodule in testbench.

	logic        Clk;     
	logic        Reset_LB_CA;   
	logic        Run;   
	logic [7:0]  SW;       

	logic        Xval;    
	logic [7:0]  Aval;   
	logic [7:0]  Bval;   
	logic [7:0]  hex_seg; // Hex display control 
	logic [3:0]  hex_grid; // Hex display control
    //	ripple_adder processor0(.*);
    top_level processor1(.*);

    
	initial begin: CLOCK_INITIALIZATION
		Clk = 1;
	end 
	
	always begin : CLOCK_GENERATION
		#1 Clk = ~Clk;
	end
	
	initial begin: TEST_VECTORS
	    SW <= 8'b11111111;
	    Reset_LB_CA = 0;
	    repeat (3) @(posedge Clk);
	    Reset_LB_CA = 1'b1;
		
	    repeat (3) @(posedge Clk);
	    Reset_LB_CA <= 1'b0;
	    SW <= 8'b11111111;
	    
		repeat (3) @(posedge Clk);
	    Run <= 1'b1;

		
		repeat (30) @(posedge Clk);
        Run <= 1'b0;
        
        repeat (10) @(posedge Clk);
        Run <= 1'b1;
        
        repeat (30) @(posedge Clk);
        Run <= 1'b0;
        
        repeat (10) @(posedge Clk);
        Run <= 1'b1;
        
        repeat (30) @(posedge Clk);
        Run <= 1'b0;
        

		$finish(); //this task will end the simulation if the Vivado settings are properly configured


	end

endmodule