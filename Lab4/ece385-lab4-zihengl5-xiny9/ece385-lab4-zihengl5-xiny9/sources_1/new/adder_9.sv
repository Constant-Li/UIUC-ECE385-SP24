module adder_9(
	input  logic  [7:0] A, 
    input  logic  [7:0] B,
	input  logic        fn, // fn = 0, add   fn = 1, sub
	
	output logic  [8:0] S 
    );
    
    logic [8:0] new_A;
    logic [7:0] xor_B;
    logic [8:0] new_B;
    logic [7:0] new_fn;
    
    assign new_fn = {8{fn}};
    assign new_A = {A[7], A[7:0]};
    assign xor_B = B ^ new_fn; 
    assign new_B = {xor_B[7], xor_B[7:0]};
    
//    assign S = new_A + new_B + fn;
           
    full_adder_9_bits add_9 (
            .A      (new_A),
            .B      (new_B),
            .c_in   (fn),
            
            .S      (S)
    );
endmodule
