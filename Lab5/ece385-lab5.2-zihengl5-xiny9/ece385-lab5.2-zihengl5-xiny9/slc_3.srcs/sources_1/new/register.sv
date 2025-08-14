module resigter (
    input  logic        clk,
    input  logic        ld_reg,
    input  logic        reset,
    
    input logic [15:0]  BUS,
    
    input  logic [2:0]  DR,
    input  logic [2:0]  SR1,
    input  logic [2:0]  SR2,
   

    output logic [15:0] SR1_out,
    output logic [15:0] SR2_out
);

    logic [15:0] R0, R0_old;
    logic [15:0] R1, R1_old; 
    logic [15:0] R2, R2_old;
    logic [15:0] R3, R3_old;
    logic [15:0] R4, R4_old;
    logic [15:0] R5, R5_old;
    logic [15:0] R6, R6_old;;
    logic [15:0] R7, R7_old;;
        
	always_ff @(posedge clk) 
	   begin
	       if(reset) // if reset, then clear all reg
	           begin
	               R0_old <= 16'b0000000000000000;
	               R1_old <= 16'b0000000000000000;
	               R2_old <= 16'b0000000000000000;
	               R3_old <= 16'b0000000000000000;
	               R4_old <= 16'b0000000000000000;
	               R5_old <= 16'b0000000000000000;
	               R6_old <= 16'b0000000000000000;
	               R7_old <= 16'b0000000000000000;
	           end
	       else if(ld_reg) // if ld_reg, load into specific destination register depends on DR signal
	           begin
                    case (DR)
                        3'b000:     R0_old <= BUS;
                        3'b001:     R1_old <= BUS;
                        3'b010:     R2_old <= BUS;
                        3'b011:     R3_old <= BUS;
                        3'b100:     R4_old <= BUS;
                        3'b101:     R5_old <= BUS;
                        3'b110:     R6_old <= BUS;
                        3'b111:     R7_old <= BUS;
                    endcase 
	           end
	       else // otherwise keep original value
	           begin
	               R0 <= R0_old;
	               R1 <= R1_old;
	               R2 <= R2_old;
	               R3 <= R3_old;
	               R4 <= R4_old;
	               R5 <= R5_old;
	               R6 <= R6_old;
	               R7 <= R7_old;
	           end
	   end
    
    always_comb
        begin
            case (SR1) // output depends on SRs
                3'b000:     SR1_out = R0;
                3'b001:     SR1_out = R1;
                3'b010:     SR1_out = R2;
                3'b011:     SR1_out = R3;
                3'b100:     SR1_out = R4;
                3'b101:     SR1_out = R5;
                3'b110:     SR1_out = R6;
                3'b111:     SR1_out = R7;
            endcase
            
            case (SR2)
                3'b000:     SR2_out = R0;
                3'b001:     SR2_out = R1;
                3'b010:     SR2_out = R2;
                3'b011:     SR2_out = R3;
                3'b100:     SR2_out = R4;
                3'b101:     SR2_out = R5;
                3'b110:     SR2_out = R6;
                3'b111:     SR2_out = R7;
            endcase
            
        end

    
    
endmodule
