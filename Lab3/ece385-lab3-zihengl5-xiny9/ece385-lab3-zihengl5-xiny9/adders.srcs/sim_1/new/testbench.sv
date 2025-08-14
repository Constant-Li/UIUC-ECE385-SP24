module testbench(); //even though the testbench doesn't create any hardware, it still needs to be a module

	timeunit 10ns;	// This is the amount of time represented by #1 
	timeprecision 1ns;

	// These signals are internal because the processor will be 
	// instantiated as a submodule in testbench.

	logic [15:0] a;
    logic [15:0] b;
    logic        cin;
			
	logic [15:0] s;
	logic        cout;
	
	// To store expected results
	logic [16:0] ans_1a;
	
	// Instantiating the DUT (Device Under Test)
	// Make sure the module and signal names match with those in your design
	// Note that if you called the 8-bit version something besides 'Processor'
	// You will need to change the module name
//	ripple_adder processor0(.*);
    select_adder processor0(.*);

    logic clk;
    
	initial begin: CLOCK_INITIALIZATION
		clk = 1;
	end 
	
	always begin : CLOCK_GENERATION
		#1 clk = ~clk;
	end
	
	initial begin: TEST_VECTORS

	    cin <= 0;
	    
	    a <= 16'h25;
	    
		repeat (4) @(posedge clk);
		b <= 16'h47;
		
		repeat (3) @(posedge clk);

		ans_1a = (16'h6c); 
		

		assert (s == ans_1a) else $display("ERROR: Answer is %h", s);


		$finish(); //this task will end the simulation if the Vivado settings are properly configured


	end

endmodule
