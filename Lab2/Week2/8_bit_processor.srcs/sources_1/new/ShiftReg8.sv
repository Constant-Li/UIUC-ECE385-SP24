//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2024 09:59:19 PM
// Design Name: 
// Module Name: ShiftReg8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ShiftReg8(
	input  logic        Clk, 
	input  logic        Reset,
	input  logic        A_In,
	input  logic        B_In,
	input  logic        Ld_A,
	input  logic        Ld_B, 
	input  logic        Shift_En,
	input  logic [7:0]  D, 

	output logic        A_out, 
	output logic        B_out, 
	output logic [7:0]  A,
	output logic [7:0]  B
);
	
    
    logic re1Aout, re1Bout;
     
    register_unit reg1 (
            .Clk        (Clk),
            .Reset      (Reset),
            .A_In       (A_In),
            .B_In       (B_In),
            .Ld_A       (Ld_A),
            .Ld_B       (Ld_B),
            .Shift_En   (Shift_En),
            .D          (D[7:4]),

            .A_out      (re1Aout),
            .B_out      (re1Bout),
            .A          (A[7:4]),
            .B          (B[7:4])
    );
    
        register_unit reg2 (
            .Clk        (Clk),
            .Reset      (Reset),
            .A_In       (re1Aout),
            .B_In       (re1Bout),
            .Ld_A       (Ld_A),
            .Ld_B       (Ld_B),
            .Shift_En   (Shift_En),
            .D          (D[3:0]),

            .A_out      (A_out),
            .B_out      (B_out),
            .A          (A[3:0]),
            .B          (B[3:0])
    );
    
    
    
    
    
endmodule
