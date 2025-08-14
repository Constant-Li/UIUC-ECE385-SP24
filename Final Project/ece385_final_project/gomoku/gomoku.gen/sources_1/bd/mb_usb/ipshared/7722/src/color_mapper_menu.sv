//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    For use with ECE 385 text_mapper                                   --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper_menu ( input  logic [9:0]  DrawX, DrawY,        
                       input logic [23:0] color_reg[24],
                       output logic [7:0]  Red, Green, Blue );
    // stores current glyph to draw
    
    // stores the character we are drawing, use it as index into font
    logic [18:0] write; 
    logic [18:0] read_addr;
    logic [5:0] read_data;
    
    // get the pixel inside
    logic [9:0] inside_x, inside_y;
    
    frameRAM header(
		.read_address(read_addr),
        .data_Out(read_data)
    );
    
    // draw header
    always_comb
    begin
        // 550 * 271 right now x:45-594, y:30-300
        if ((DrawX >= 10'd45 && DrawX <= 10'd594) && (DrawY >= 10'd30 && DrawY <= 10'd300))
        begin
            inside_x = (DrawX - 10'd45);
            inside_y = (DrawY - 10'd30 );
            
            read_addr = inside_y * 550 + inside_x;
            Red = color_reg[read_data][23:16]; // want red in 110 * 195
            Green = color_reg[read_data][15:8];
            Blue = color_reg[read_data][7:0];
            
        end
        else 
        begin  // else white
            Red = 8'hff;
            Green = 8'hff;
            Blue = 8'hff;
        end
    end
endmodule
