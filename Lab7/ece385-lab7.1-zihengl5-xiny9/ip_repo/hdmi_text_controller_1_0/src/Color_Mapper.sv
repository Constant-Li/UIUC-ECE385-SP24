//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    For use with ECE 385 text_mapper                                   --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input  logic [9:0]  DrawX, DrawY,
                       input  logic [31:0] mem_reg[601],
                       output logic [3:0]  Red, Green, Blue );
    
    // col and row are offset into registers
    logic [9:0] col, row;
    // cur_reg stores current register in VRAM
    logic [31:0] cur_reg, control_reg;   
    assign control_reg = mem_reg[600];
    // current character (0-3)
    logic [9:0] cur_char;
    
    // stores the character we are drawing, use it as index into font
    logic [10:0] addr;
    logic [7:0] data;
    // stores the char that we are drawing e.g. smile face is 0x01
    logic [7:0] char;
    
    // offset into data that correspond to pixel value
    logic [2:0] pixel;
    
    font_rom font(
        .addr(addr),
        .data(data)
    );
    
    
    always_comb
    begin
        // col = DrawX / 32
        col = DrawX >> 5; 
        // row = DrawY / 16
        row = DrawY >> 4; 
        cur_reg = mem_reg[col + row * 20];
   
        // (DrawX % 32) / 8, which get current character
        cur_char = (DrawX & 10'b0000011111) >> 3;
        // pixel = (DrawX % 32) % 8
        pixel = (DrawX & 10'b0000011111) & 10'b0000000111;
        
        case(cur_char)
            2'b00:
                char = cur_reg[7:0];
            2'b01: 
                char = cur_reg[15:8];
            2'b10:
                char = cur_reg[23:16];
            2'b11:
                char = cur_reg[31:24];
        endcase 
    end 
    
    // addr into font is char * 16 + drawY % 16
    assign addr = (char << 4) + (DrawY & 10'b0000001111);
    
    always_comb
    begin
        // if the pixel is font
        if(data[7 - pixel])
        begin
                // if we want invert, then we draw bg color
                if(char[7])
                begin
                    Red = control_reg[12:9];
                    Green = control_reg[8:5];
                    Blue = control_reg[4:1];
                end
                // we dont invert, just draw font color
                else
                begin
                    Red = control_reg[24:21];
                    Green = control_reg[20:17];
                    Blue = control_reg[16:13];
                end
        end
        // if the pixel is background
        else
        begin
                // if we want invert, then we draw font color
                if(char[7])
                begin
                    Red = control_reg[24:21];
                    Green = control_reg[20:17];
                    Blue = control_reg[16:13];
                end
                // we dont invert, just draw bg color
                else
                begin
                    Red = control_reg[12:9];
                    Green = control_reg[8:5];
                    Blue = control_reg[4:1];
                end
        end

    end  

    
endmodule
