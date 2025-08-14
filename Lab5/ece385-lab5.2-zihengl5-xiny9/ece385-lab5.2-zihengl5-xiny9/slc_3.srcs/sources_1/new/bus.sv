module bus(
    input logic [15:0] pc,
    input logic [15:0] mdr,
    input logic [15:0] alu,
    input logic [15:0] mar,
    
    input logic gate_pc,
    input logic gate_mdr,
    input logic gate_alu,
    input logic gate_marmux,
    
    output logic [15:0] BUS
    );
    
    always_comb
        begin
            unique case ({gate_pc, gate_mdr, gate_alu, gate_marmux})
                4'b1000:     BUS = pc;
                4'b0100:     BUS = mdr;
                4'b0010:     BUS = alu;
                4'b0001:     BUS = mar;
            endcase
        end
        
endmodule
