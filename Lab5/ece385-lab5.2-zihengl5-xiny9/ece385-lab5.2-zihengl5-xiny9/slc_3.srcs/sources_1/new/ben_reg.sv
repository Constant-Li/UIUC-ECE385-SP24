module ben_reg(
    input logic [15:0] BUS,
    input logic [15:0] ir,
    input logic        reset,
    input logic        clk,
    input logic        ld_cc,
    input logic        ld_ben,
    
    output logic       ben
    );
    
    logic n, z, p;
    logic next_n, next_z, next_p;
    always_comb
        begin
            if(BUS == 16'b0000000000000000)
                begin
                    n = 1'b0;
                    z = 1'b1;
                    p = 1'b0;
                end
            else if(BUS[15] == 1'b1)
                begin
                    n = 1'b1;
                    z = 1'b0;
                    p = 1'b0;
                end
            else 
                begin
                    n = 1'b0;
                    z = 1'b0;
                    p = 1'b1;
                end
        end
        
    always_ff @(posedge clk)
       begin
            if (reset)
                 begin
                    ben <= 1'b0;
                 end
                 
            if (ld_ben) // is it really necessary???
                begin
                    ben <= ((ir[11] & next_n) | (ir[10] & next_z) | (ir[9] & next_p));
                end
            if (ld_cc) // only setting nzp when ld_cc is high
                begin
                next_n <= n;
                next_z <= z;
                next_p <= p;
                end
       end
endmodule
