//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    For use with ECE 385 text_mapper                                   --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper_menu ( input  logic [9:0]  DrawX, DrawY,       
                       input logic clk_1Hz, 
                       input logic [23:0] color_reg[24],
                       output logic [7:0]  Red, Green, Blue );
    // stores current glyph to draw
    
    // stores the character we are drawing, use it as index into font
    logic [18:0] write; 
    logic [18:0] read_addr;
    logic [5:0] read_data;
    logic [5:0] read_data0;
    logic [5:0] read_data1;
    logic frame_flag;

    // get the pixel inside
    logic [9:0] inside_x, inside_y;
    
    frameRAM header(
		.read_address(read_addr),
        .data_Out(read_data0),
        .data_Out1(read_data1)
    );
    
    always_ff @ (posedge clk_1Hz )
    begin
        if (frame_flag == 1'b0)
            begin
            read_data <= read_data0;
            frame_flag <= 1'b1;
            end
        else if(frame_flag == 1'b1)
            begin
            read_data <= read_data1;
            frame_flag <= 1'b0;
            end
        else
            begin
            frame_flag <= 1'b0;
            end
    end
    
    // draw header
    always_comb
    begin
        // 600 * 400 right now x:40-639, y:40-439
        if ((DrawX >= 10'd40 && DrawX <= 10'd639) && (DrawY >= 10'd40 && DrawY <= 10'd439))
        begin
            inside_x = (DrawX - 10'd40);
            inside_y = (DrawY - 10'd40);
            
            read_addr = inside_y * 600 + inside_x;
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
