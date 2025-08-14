//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    For use with ECE 385 text_mapper                                   --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper_menu ( input  logic [9:0]  DrawX, DrawY,       
                       input logic clk_25MHz, 
                       input logic [23:0] color_reg[24],
                       output logic [7:0]  Red, Green, Blue );
    // stores current glyph to draw
    
    // stores the character we are drawing, use it as index into font
    logic [18:0] write; 
    logic [18:0] read_addr;
    logic [4:0] read_data;
    logic [4:0] read_data0;
    logic [4:0] read_data1;
    
    logic clk_1Hz;
    
    // 1Hz clock generator
    logic [24:0] counter;
    
    // get the pixel inside
    logic [9:0] inside_x, inside_y;
    
    frameRAM header(
		.read_address(read_addr),
        .data_Out(read_data0)
    );
    ram2 header2(
		.read_address(read_addr),
        .data_Out(read_data1)
    );
    

    always_ff @(posedge clk_25MHz) begin
        if (counter == 25'd24999999) 
        begin
            counter <= 25'd0;
            clk_1Hz <= ~clk_1Hz;
        end 
        
        else 
        begin
            counter <= counter + 25'd1;
        end
    end
    
    // draw header
    always_comb
    begin
        // 600 * 400 right now x:40-639, y:40-439
        if ((DrawX >= 10'd70 && DrawX <= 10'd569) && (DrawY >= 10'd73 && DrawY <= 10'd405))
        begin
            inside_x = (DrawX - 10'd70);
            inside_y = (DrawY - 10'd73);
            read_addr = inside_y * 500 + inside_x;
            
            if(clk_1Hz)
            begin
                Red = color_reg[read_data0][23:16]; // want red in 110 * 195
                Green = color_reg[read_data0][15:8];
                Blue = color_reg[read_data0][7:0];
            end
            else
            begin
                Red = color_reg[read_data1][23:16]; // want red in 110 * 195
                Green = color_reg[read_data1][15:8];
                Blue = color_reg[read_data1][7:0];
            end
        end
        
        else 
        begin  // else white
            Red = 8'hff;
            Green = 8'hff;
            Blue = 8'hff;
        end
    end
endmodule
