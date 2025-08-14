module reg_full( 
	input  logic        Clk, 
	input  logic        Reset_Load,
	input  logic        Shift_En,
	input  logic        Add,
	input  logic        Sub,
	input  logic [7:0]  D, 
	input  logic [8:0]  Adder_result, 
	input  logic        clr_XA,

	output logic        M, 
	output logic [16:0] out_val
    );


	logic [16:0] out_val_d;

	always_comb
	begin
        if (Reset_Load)
        begin
            out_val_d = out_val;
        end
        
//		else if (clr_XA)
//		begin
//		    out_val_d [16:8] = 9'b0;
//		end
		
		else if (Shift_En)
		begin
            out_val_d = {out_val[16], out_val[16:1]};
		end
		
		else if (Add | Sub)
		begin
            out_val_d = {Adder_result, out_val[7:0]};
		end
		
		else
		begin
			out_val_d = out_val; // Required to avoid synthesis inferring a latch
		end

	end
	always_ff @(posedge Clk) 
    begin
	   if(Reset_Load)
           begin
           out_val [16:8] <= 9'b0; // clear XA
           out_val [7:0] <= D;     // load B
           end
           
	   else if(clr_XA)
	   begin
           out_val [16:8] <= 9'b0; // clear XA
	   end
	   else
	       begin 
	       out_val <= out_val_d;
	       end
    end
    
    assign 	M = out_val_d[0];  
endmodule
