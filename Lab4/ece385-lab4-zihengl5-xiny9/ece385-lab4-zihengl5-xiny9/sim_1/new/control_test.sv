module control_test(); //even though the testbench doesn't create any hardware, it still needs to be a module

	timeunit 10ns;	// This is the amount of time represented by #1 
	timeprecision 1ns;

	// These signals are internal because the processor will be 
	// instantiated as a submodule in testbench.
	logic       Clk;
	logic       Reset_LB_CA;
	logic       Run;
	logic       M;
	
	logic       Clr_Ld;
	logic       Shift;
	logic       Add;
	logic       Sub;


			

	// To store expected results

	
	// Instantiating the DUT (Device Under Test)
	// Make sure the module and signal names match with those in your design
	// Note that if you called the 8-bit version something besides 'Processor'
	// You will need to change the module name
	control_unit processor0(.*);	


	initial begin: CLOCK_INITIALIZATION
		Clk = 1;
	end 

	// Toggle the clock
	// #1 means wait for a delay of 1 timeunit, so simulation clock is 50 MHz technically 
	// half of what it is on the FPGA board 

	// Note: Since we do mostly behavioral simulations, timing is not accounted for in simulation, however
	// this is important because we need to know what the time scale is for how long to run
	// the simulation
	always begin : CLOCK_GENERATION
		#1 Clk = ~Clk;
	end

	// Testing begins here
	// The initial block is not synthesizable on an FPGA
	// Everything happens sequentially inside an initial block
	// as in a software program

	// Note: Even though the testbench happens sequentially,
	// it is recommended to use non-blocking assignments for most assignments because
	// we do not want any dependencies to arise between different assignments in the 
	// same simulation timestep. The exception is for reset, which we want to make sure
	// happens first. 
	initial begin: TEST_VECTORS
		Reset_LB_CA = 1;		// Toggle Reset (use blocking operator), because we want to have this happen 'first'
		Run <= 0;
		M <= 0;
		
		repeat (3) @(posedge Clk)
		Reset_LB_CA = 1;		// Toggle Reset (use blocking operator), because we want to have this happen 'first'
		
		repeat (3) @(posedge Clk)
		Reset_LB_CA = 0;
		
		
		repeat (3) @(posedge Clk)

		Run <= 1;
		M <= 0;
		repeat (5) @(posedge Clk)
		M <= 1;
		repeat (20) @(posedge Clk)
		M <= 0;
		
//		repeat (3) @(posedge Clk); //each @(posedge Clk) here means to wait for 1 clock edge, so this waits for 3 clock edges
//		Reset_LB_CA = 1;
//		Run <= 0;
//		M <= 0;
		
//		repeat (3) @(posedge Clk); //each @(posedge Clk) here means to wait for 1 clock edge, so this waits for 3 clock edges
//		Reset_LB_CA = 0;
//		Shift_En <= 1;

//		repeat (3) @(posedge Clk)
//		Reset_LB_CA = 0;
//		Run <= 0;
//		M <= 0;
		
//		repeat (3) @(posedge Clk)
//		Shift_En <= 0;	// Toggle LoadA
		
//		repeat (3) @(posedge Clk)
//		Shift_En <= 1;	// Toggle LoadA
		
//		repeat (3) @(posedge Clk)
//		Shift_En <= 0;	// Toggle LoadA
		

		$finish(); //this task will end the simulation if the Vivado settings are properly configured


	end

endmodule
