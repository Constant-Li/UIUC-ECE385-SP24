module control_unit (
	input  logic Clk, 
	input  logic Reset_LB_CA,
	input  logic Run,
    input  logic M,
    
	output logic Clr_Ld, 
	output logic Shift,
	output logic Add,
	output logic Sub,
	output logic conseq_clr
);
// Declare signals curr_state, next_state of type enum
    enum logic [4:0] {
        s_start,
        s_loadB,
        s_loadB2,
        s_haltB,
        s_begin,
        s_shift,
        s_add,
        s_sub,
        s_end
        } curr_state, next_state; 
        
    logic [3:0] counter, temp_count;
        
	always_comb
	begin
	// Assign outputs based on state
		unique case (curr_state) 
			s_start: 
			begin
                Clr_Ld = 1'b0; 
	            Shift = 1'b0;
	            Add = 1'b0;
	            Sub = 1'b0;
	            temp_count = 4'b0000;
	            conseq_clr = 1'b0;
			end
//////////////////////////////////////////////////////////
			s_loadB: 
			begin
                Clr_Ld = 1'b1; 
	            Shift = 1'b0;
	            Add = 1'b0;
	            Sub = 1'b0;
	            temp_count = 4'b0000;
		        conseq_clr = 1'b0;
			end
			s_loadB2: 
			begin
                Clr_Ld = 1'b1; 
	            Shift = 1'b0;
	            Add = 1'b0;
	            Sub = 1'b0;
	            temp_count = 4'b0000;
	            conseq_clr = 1'b0;
			end
//////////////////////////////////////////////////////////
			s_haltB: 
			begin
                Clr_Ld = 1'b0; 
	            Shift = 1'b0;
	            Add = 1'b0;
	            Sub = 1'b0;
	            temp_count = 4'b0000;
	            conseq_clr = 1'b0;
			end
//////////////////////////////////////////////////////////		
			s_begin: 
			begin
                Clr_Ld = 1'b0; 
	            Shift = 1'b0;
	            Add = 1'b0;
	            Sub = 1'b0;
	            temp_count = 4'b0000;
	            conseq_clr = 1'b1;
			end			
//////////////////////////////////////////////////////////	
			s_add: 
			begin
                Clr_Ld = 1'b0; 
	            Shift = 1'b0;
	            Add = 1'b1;
	            Sub = 1'b0;
	            temp_count = counter;
	            conseq_clr = 1'b0;
			end			
//////////////////////////////////////////////////////////	
			s_shift: 
			begin
                Clr_Ld = 1'b0; 
	            Shift = 1'b1;
	            Add = 1'b0;
	            Sub = 1'b0;
	            temp_count = counter + 1;
	            conseq_clr = 1'b0;
			end			
//////////////////////////////////////////////////////////
			s_sub: 
			begin
                Clr_Ld = 1'b0; 
	            Shift = 1'b0;
	            Add = 1'b0;
	            Sub = 1'b1;
	            temp_count = counter;
	            conseq_clr = 1'b0;
			end		
//////////////////////////////////////////////////////////
			s_end: 
			begin
                Clr_Ld = 1'b0; 
	            Shift = 1'b0;
	            Add = 1'b0;
	            Sub = 1'b0;
	            temp_count = 4'b0000;
	            conseq_clr = 1'b0;
			end
//////////////////////////////////////////////////////////
			default:  //default case, can also have default assignments for Ld_A and Ld_B before case
			begin 
                Clr_Ld = 1'b0; 
	            Shift = 1'b0;
	            Add = 1'b0;
	            Sub = 1'b0;
	            temp_count = 4'b0000;
	            conseq_clr = 1'b0;
			end
		endcase
	end
        
//////////////////////////////////////////////////////////     
        
        
// Assign outputs based on state
	always_comb
	begin

		next_state  = curr_state;	//required because I haven't enumerated all possibilities below. Synthesis would infer latch without this
		unique case (curr_state) 
//////////////////////////////////////////////////////////
			s_start:    
			begin
//				if (Reset_LB_CA) 
//				begin
//					next_state = s_loadB;
//				end
				
//				else
//				begin
//				    next_state = s_start;
//				end
            next_state = s_loadB;
		    end
//////////////////////////////////////////////////////////
			s_loadB:
			begin
			    if(~Reset_LB_CA)
			    begin
                    next_state = s_loadB2;
                end
                else
                begin
                    next_state = s_loadB; 
                end
            end
            
			s_loadB2:
			begin
                    next_state = s_haltB;
            end
 //////////////////////////////////////////////////////////         
 			s_haltB:
			begin
				if (Reset_LB_CA) // if reset is 1
				begin
					next_state = s_loadB;
				end
				else
				begin
				    next_state = s_haltB;
				end
				
				if (Run)  // if run is 1
				begin
				    next_state = s_begin;
		        end
		        
		        else  // if run is 0
		        begin
		            next_state = s_haltB;
		        end
            end  
//////////////////////////////////////////////////////////            
			s_begin:
			begin
                if (~M) // if M is zero
                begin
                    next_state = s_shift;
                end
                
                else
                begin
                    next_state = s_add;
                end
            end
//////////////////////////////////////////////////////////            
            s_add:
            begin
                next_state = s_shift;
            end
 //////////////////////////////////////////////////////////           
            s_shift:
            begin
            
                if (temp_count == 4'b1000)
                begin
                    next_state = s_end;
                end
                
                else
                begin
                    if (M) // if M == 1
                    begin
                        if (temp_count == 4'b0111) // if it's the last bit is one, then subtract
                        begin
                            next_state = s_sub;
                        end
                        
                        else  // if the bit is one, then add
                        begin
                            next_state = s_add;
                        end
                    end
                    
                    else  // if M==0
                    begin
                        next_state = s_shift;
                    end
                end

            end
 //////////////////////////////////////////////////////////           
			s_sub:    
			begin
				next_state = s_shift;
			end
//////////////////////////////////////////////////////////
			s_end:    
			begin
				if (~Run) 
				begin
					next_state = s_haltB;
				end
				
				else
				begin
				    next_state = s_end;
				end
			end
//////////////////////////////////////////////////////////					
		endcase
	end

	//updates flip flop, current state is the only one
	always_ff @(posedge Clk)  
	begin
		if (Reset_LB_CA)
		begin
			curr_state <= s_start;
		end
		
		else 
		begin
			curr_state <= next_state;
			counter <= temp_count;
		end
	end
endmodule
