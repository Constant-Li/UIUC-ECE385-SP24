module register_test(); //even though the testbench doesn't create any hardware, it still needs to be a module

	timeunit 10ns;	// This is the amount of time represented by #1 
	timeprecision 1ns;

	// These signals are internal because the processor will be 
	// instantiated as a submodule in testbench.
	logic       Clk;
	logic       Reset_Load;
	logic       Add;
	logic       Sub;
	logic       Shift_En;
	logic [7:0] D;
	logic [8:0] Adder_result;
	

	logic       M;
	logic [16:0] out_val;

			

	// To store expected results

	
	// Instantiating the DUT (Device Under Test)
	// Make sure the module and signal names match with those in your design
	// Note that if you called the 8-bit version something besides 'Processor'
	// You will need to change the module name
	reg_full processor0(.*);	


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
		Reset_Load = 1;		// Toggle Reset (use blocking operator), because we want to have this happen 'first'
		Add <= 0;
		Sub <= 0;
		Shift_En <= 0;
		D <= 8'h33;	// Specify Din, F, and R
		Adder_result <= 9'h93;

		repeat (2) @(posedge Clk); //each @(posedge Clk) here means to wait for 1 clock edge, so this waits for 3 clock edges
		Reset_Load = 0;		// Toggle Reset (use blocking operator), because we want to have this happen 'first'
		Add <= 0;
		Sub <= 1;
		
		repeat (3) @(posedge Clk); //each @(posedge Clk) here means to wait for 1 clock edge, so this waits for 3 clock edges
		Sub <= 0;
		Shift_En <= 1;

		repeat (1) @(posedge Clk)
		Shift_En <= 1;	// Toggle LoadA
		
		repeat (1) @(posedge Clk)
		Shift_En <= 0;	// Toggle LoadA
		
		repeat (1) @(posedge Clk)
		Shift_En <= 1;	// Toggle LoadA
		
		repeat (1) @(posedge Clk)
		Shift_En <= 0;	// Toggle LoadA
		
	    repeat (10) @(posedge Clk)
		Shift_En <= 0;	// Toggle LoadA
		

		$finish(); //this task will end the simulation if the Vivado settings are properly configured


	end

endmodule
