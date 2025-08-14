module mux4    
    #(parameter width = 16) 
     (input logic [width - 1:0] d0, d1, d2, d3,
      input logic [1:0]s,
      output logic [width - 1:0] y);
      
    always_comb
        begin
            if(s == 2'b00)
                begin
                    y = d0;
                end
            else if(s == 2'b01)
                begin
                    y = d1;
                end
            else if(s == 2'b10)
                begin
                    y = d2;
                end
            else 
                begin
                    y = d3;
                end
        end
        
endmodule
