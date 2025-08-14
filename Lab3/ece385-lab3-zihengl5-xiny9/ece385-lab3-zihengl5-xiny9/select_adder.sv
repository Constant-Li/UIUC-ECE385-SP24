module select_adder (
	input  logic  [15:0] a, 
    input  logic  [15:0] b,
	input  logic         cin,
	
	output logic  [15:0] s,
	output logic         cout
);

	/* TODO
		*
		* Insert code here to implement a CSA adder.
		* Your code should be completly combinational (don't use always_ff or always_latch).
		* Feel free to create sub-modules or other files. */
		
              logic n1, n2, n3;

              select_adder_fourbits SA0 (.a (a[3:0]), .b (b[3:0]), .cin (cin), .s (s[3:0]), .cout (n1));
              select_adder_fourbits SA1 (.a (a[7:4]), .b (b[7:4]), .cin (n1), .s (s[7:4]), .cout (n2));
              select_adder_fourbits SA2 (.a (a[11:8]), .b (b[11:8]), .cin (n2), .s (s[11:8]), .cout (n3));
              select_adder_fourbits SA3 (.a (a[15:12]), .b (b[15:12]), .cin (n3), .s (s[15:12]), .cout (cout));

endmodule

module select_adder_fourbits (
	input  logic  [3:0] a, 
    input  logic  [3:0] b,
	input  logic         cin,
	
	output logic  [3:0] s,
	output logic         cout
);


            logic [3:0] s1, s2;
            logic cout_1, cout_2;
                  
                  adder4 AD0 (.A (a[3:0]), .B (b[3:0]), .c_in (0), .S (s1[3:0]), .c_out (cout_1));
                  adder4 AD1 (.A (a[3:0]), .B (b[3:0]), .c_in (1), .S (s2[3:0]), .c_out (cout_2));
    /* mux for s0 */
    always_comb
    begin                  
            unique case(cin)
                    1'b0    :s[0] = s1[0];
                    1'b1    :s[0] = s2[0];
            endcase
    end
    /* mux for s1 */
    always_comb
    begin                  
            unique case(cin)
                    1'b0    :s[1] = s1[1];
                    1'b1    :s[1] = s2[1];
            endcase
    end
    /* mux for s2 */
    always_comb
    begin                  
            unique case(cin)
                    1'b0    :s[2] = s1[2];
                    1'b1    :s[2] = s2[2];
            endcase
    end
    /* mux for s3 */
    always_comb
    begin                  
            unique case(cin)
                    1'b0    :s[3] = s1[3];
                    1'b1    :s[3] = s2[3];
            endcase
    end
    /* mux for s0 */
    always_comb
    begin                  
            unique case(cin)
                    1'b0    :cout = cout_1;
                    1'b1    :cout = cout_2;
            endcase
    end
    
endmodule


