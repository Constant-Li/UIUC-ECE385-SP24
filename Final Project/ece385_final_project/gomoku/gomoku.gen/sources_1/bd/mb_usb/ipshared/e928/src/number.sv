module number(
    input logic [3:0] number,
    output logic [7:0] index
    );
    always_comb
    begin
        case(number)
            4'b0000:
                index = 8'h30;
            4'b0001:
                index = 8'h31;
            4'b0010:
                index = 8'h32;
            4'b0011:
                index = 8'h33;
            4'b0100:
                index = 8'h34;
            4'b0101:
                index = 8'h35;
            4'b0110:
                index = 8'h36;
            4'b0111:
                index = 8'h37;
            4'b1000:
                index = 8'h38;
            4'b1001:
                index = 8'h39;
        endcase
    end
endmodule
