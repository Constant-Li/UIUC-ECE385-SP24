module mux2    
    #(parameter width = 16) 
     (input logic [width - 1:0] d0, d1,
      input logic s,
      output logic [width - 1:0] y);
      
    always_comb
        begin
            if(s)
                begin
                    y = d1;
                end
            else
                begin
                    y = d0;
                end
        end
  
endmodule
