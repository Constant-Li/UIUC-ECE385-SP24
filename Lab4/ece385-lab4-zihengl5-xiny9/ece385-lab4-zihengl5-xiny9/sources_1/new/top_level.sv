module top_level(
	input  logic        Clk,     
	input  logic        Reset_LB_CA,   
	input  logic        Run,   
	input  logic [7:0]  SW,       

	output logic        Xval,    
	output logic [7:0]  Aval,   
	output logic [7:0]  Bval,   
	output logic [7:0]  hex_seg, // Hex display control 
	output logic [3:0]  hex_grid // Hex display control
);
    
//    logic [7:0] A; // stores A's value
//    logic [7:0] B; // stores B's value
//    logic       X; // stores X's value 
    logic       shift; // control reg to shift
    logic       clear_load; // control reg to load
    logic       add; // determine adding
    logic       sub; // determine subtracting
    logic [8:0] adder_result;
    logic       m;  // last bit of B
    logic [7:0] SW_S; // 
    logic       Reset_LB_CA_SH; // synchornized botton
    logic       Run_SH; // synchornized botton
    logic [16:0]XAB;
    logic       clear_XA;
 
    
    assign Aval = XAB[15:8];
    assign Bval = XAB[7:0];
    assign Xval = XAB[16];


	reg_full reg_unit (
		.Clk          (Clk),
		.Reset_Load   (clear_load),
		.Shift_En     (shift),
		.Add          (add),
		.Sub          (sub),
		.D            (SW_S),
		.Adder_result (adder_result),
		.clr_XA       (clear_XA),
		
		.M            (m),
		.out_val      (XAB)
	);
	
	adder_9 adder_unit (
		.A            (Aval),
		.B            (SW_S),
        .fn           (sub),

		.S            (adder_result)
	);
	
	control_unit control_part (
		.Clk          (Clk),
		.Reset_LB_CA  (Reset_LB_CA_SH),
		.Run          (Run_SH),
		.M            (m),
		
		.Clr_Ld       (clear_load),
		.Shift        (shift),
		.Add          (add),
		.Sub          (sub),
		.conseq_clr   (clear_XA)
	);
	
	HexDriver HexA (
		.Clk        (Clk),
		.reset      (Reset_LB_CA_SH),

		.in         ({Aval[7:4], Aval[3:0], Bval[7:4], Bval[3:0]}),
		.hex_seg    (hex_seg),
		.hex_grid   (hex_grid)
	);
	
	// used for switches
	sync_debounce Din_sync [7:0] (
		.Clk  (Clk), 

		.d    (SW), 
		.q    (SW_S) 
	);
	
	// used for bottons
	sync_debounce button_sync [1:0] (
		.Clk  (Clk),

		.d    ({Reset_LB_CA, Run}),
		.q    ({Reset_LB_CA_SH, Run_SH})
	);         
endmodule
