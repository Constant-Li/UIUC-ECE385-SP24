module ALU(
    input logic [15:0] SR1_out,
    input logic [15:0] SR2MUX_out,
    input logic [1:0]  ALUK, // 00->add, 01->and, 10->not, 11->SR1_out
    
    output logic [15:0] ALU_out
    );
    
    always_comb
        begin
            unique case(ALUK)
                2'b00:      ALU_out = SR1_out + SR2MUX_out;
                2'b01:      ALU_out = SR1_out & SR2MUX_out;
                2'b10:      ALU_out = ~SR1_out;
                2'b11:      ALU_out = SR1_out;
            endcase
        end
    
endmodule
