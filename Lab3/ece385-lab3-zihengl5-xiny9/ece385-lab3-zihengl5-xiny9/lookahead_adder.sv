module lookahead_adder (
	input  logic  [15:0] a, 
    input  logic  [15:0] b,
	input  logic         cin,
	
	output logic  [15:0] s,
	output logic         cout
);

	/* TODO
		*
		* Insert code here to implement a CLA adder.
		* Your code should be completly combinational (don't use always_ff or always_latch).
		* Feel free to create sub-modules or other files. */
		
		logic m1, m2, m3;
		
        lookahead4 LA0 (.A (a[3:0]), .B (b[3:0]), .c_in (cin), .S (s[3:0]), .c_out (m1));
        lookahead4 LA1 (.A (a[7:4]), .B (b[7:4]), .c_in (m1), .S (s[7:4]), .c_out (m2));
        lookahead4 LA2 (.A (a[11:8]), .B (b[11:8]), .c_in (m2), .S (s[11:8]), .c_out (m3));
        lookahead4 LA3 (.A (a[15:12]), .B (b[15:12]), .c_in (m3), .S (s[15:12]), .c_out (cout));


endmodule

module lookahead4(input logic [3:0] A, B, input logic c_in, 
              output logic [3:0]S, output logic c_out);
              
              logic c1, c2, c3;
              logic g0, g1, g2, g3;
              logic p0, p1, p2, p3;
              
              always_comb
              begin
                    g0 = A[0] & B[0];
                    g1 = A[1] & B[1];
                    g2 = A[2] & B[2];
                    g3 = A[3] & B[3];   
                                     
                    p0 = A[0] ^ B[0];
                    p1 = A[1] ^ B[1];
                    p2 = A[2] ^ B[2];
                    p3 = A[3] ^ B[3];
                    
                    c1 = (c_in & p0) | g0;
                    c2 = (c_in & p0 & p1) | (g0 & p1) | g1;
                    c3 = (c_in & p0 & p1 & p2) | (g0 & p1 & p2) | (g1 & p2) | g2;
                    c_out = (c_in & p0 & p1 & p2 & p3) | (g0 & p1 & p2 & p3) | (g1 & p2 & p3) | (g2 & p3) | g3;
                    
                    
                    S[0] = A[0] ^ B[0] ^ c_in;
                    S[1] = A[1] ^ B[1] ^ c1;
                    S[2] = A[2] ^ B[2] ^ c2;
                    S[3] = A[3] ^ B[3] ^ c3;
                 
               end
                    

endmodule

