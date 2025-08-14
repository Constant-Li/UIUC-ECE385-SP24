//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    For use with ECE 385 text_mapper                                   --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input  logic [9:0]  DrawX, DrawY,
                       input  logic [15:0] color_reg[16],
                       input  logic Clk,
                       input  logic [31:0] cm_dataout,
                       output logic [10:0] cm_addr,
                       output logic [3:0]  Red, Green, Blue );
    
    // col and row are offset into registers
    logic [9:0] col, row;
    // cur_reg stores current register in VRAM
    logic [31:0] cur_reg, control_reg;   
    // stores front and back color
    logic [15:0] fg_color, bg_color;
    // current character (0-3)
    logic [9:0] cur_char;
    
    // stores the character we are drawing, use it as index into font
    logic [10:0] addr;
    logic [7:0] data;
    // stores the char that we are drawing e.g. smile face is 0x01
    logic [15:0] char;
    
    // offset into data that correspond to pixel value
    logic [2:0] pixel;

    font_rom font(
        .addr(addr),
        .data(data)
    );
    
    always_comb
    begin
        // col = DrawX / 16
        col = DrawX >> 4; 
        // row = DrawY / 16
        row = DrawY >> 4; 
        // calculate addresss
        cm_addr = col + row * 40;
   
        // (DrawX % 16) / 8, which get current character
        cur_char = (DrawX & 10'b0000001111) >> 3;
        // pixel = (DrawX % 16) % 8
        pixel = (DrawX & 10'b0000001111) & 10'b0000000111;
        
        // Use the registered dataout to handle 1 cycle latency
        cur_reg = cm_dataout;
        
        case(cur_char)
            2'b00:
                char = cur_reg[15:0];
            2'b01: 
                char = cur_reg[31:16];
        endcase 
    end 
    
    // addr into font is char * 16 + drawY % 16
    assign addr = (char[14:8] << 4) + (DrawY & 10'b0000001111);
    
    // stores front and back color coorespondingly
    assign bg_color = color_reg[char[3:0]];
    assign fg_color = color_reg[char[7:4]];
    
    always_comb
    begin
        // if the pixel is font
        if(data[7 - pixel])
        begin
                // if we want invert, then we draw bg color
                if(char[15])
                begin
                    Red = bg_color[11:8];
                    Green = bg_color[7:4];
                    Blue = bg_color[3:0];
                end
                // we dont invert, just draw font color
                else
                begin
                    Red = fg_color[11:8];
                    Green = fg_color[7:4];
                    Blue = fg_color[3:0];
                end
        end
        // if the pixel is background
        else
        begin
                // if we want invert, then we draw font color
                if(char[15])
                begin
                    Red = fg_color[11:8];
                    Green = fg_color[7:4];
                    Blue = fg_color[3:0];
                end
                // we dont invert, just draw bg color
                else
                begin
                    Red = bg_color[11:8];
                    Green = bg_color[7:4];
                    Blue = bg_color[3:0];
                end
        end

    end  

endmodule
