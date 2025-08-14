module adder_test(); //even though the testbench doesn't create any hardware, it still needs to be a module

	timeunit 10ns;	// This is the amount of time represented by #1 
	timeprecision 1ns;

	// These signals are internal because the processor will be 
	// instantiated as a submodule in testbench.

	logic [7:0] A;
    logic [7:0] B;
    logic        fn;
			
	logic [8:0] S;

    //	ripple_adder processor0(.*);
    adder_9 processor1(.*);

    logic clk;
    
	initial begin: CLOCK_INITIALIZATION
		clk = 1;
	end 
	
	always begin : CLOCK_GENERATION
		#1 clk = ~clk;
	end
	
	initial begin: TEST_VECTORS
        // testing add
	    fn <= 1'b0;
	  
	    A <= 8'b01100011;
	    
		B <= 8'b00000111;
		
		repeat (10) @(posedge clk);
        // testing minus
	    fn <= 1'b1;
	    
		repeat (4) @(posedge clk);
	    A <= 8'b00000011;
	    
		B <= 8'b00000111;
		
		repeat (10) @(posedge clk);


		$finish(); //this task will end the simulation if the Vivado settings are properly configured


	end

endmodule