//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    For use with ECE 385 text_mapper                                   --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input  logic [9:0]  DrawX, DrawY,
                       input  logic Clk,
                       input  logic [31:0] mem_reg[300],
                       output logic [3:0]  Red, Green, Blue );
    
    // col and row are offset into registers
    logic [9:0] col, row;
    // cur_reg stores current register in VRAM
    logic [31:0] cur_reg; 
    // stores current glyph to draw
    logic [7:0] cur_blk;
    
    // stores the character we are drawing, use it as index into font
    logic [4:0] addr;
    logic [15:0] data;
    
    // offset into data that correspond to pixel value
    logic [2:0] pixel;

    // get the pixel inside
    logic [3:0] inside_x, inside_y;

    font_rom font(
        .addr(addr),
        .data(data)
    );
    
    // draw boarder
    always_comb
    begin
        // if it's inside the board
        if ((DrawX >= 10'd119 && DrawX <= 10'd503) && (DrawY >= 10'd39 && DrawY <= 10'd423))
            begin
            // col = DrawX / 64
            col = (DrawX - 10'd119) >> 6; 
            // row = DrawY / 16
            row = (DrawY - 10'd39) >> 4; 

            // DrawX % 16
            inside_x = (DrawX - 10'd119) % 16;
            inside_y = (DrawY - 10'd39) % 16;

            // current 16*16 glyph to draw
            cur_reg = mem_reg[col + row * 6];
            // inside_x % 4 to determine one of foue glyph to draw

            case(((DrawX - 10'd119) % 64) / 16)
                2'b00:
                    cur_blk = cur_reg[7:0];
                2'b01: 
                    cur_blk = cur_reg[15:8];
                2'b10:
                    cur_blk = cur_reg[23:16];
                2'b11: 
                    cur_blk = cur_reg[31:24];
            endcase             
            
            // if we are drawing the boarder of 16*16 glyph
            if(inside_x == 4'h0 || inside_x == 4'hf || inside_y == 4'h0 || inside_y == 4'hf)
                begin
                    // drawing highlighting boarder(red)
                    if(cur_blk >= 4'h3)
                        begin
                            Red   = 4'hf;
                            Green = 4'h0;
                            Blue  = 4'h0;
                        end
                    // drawing normal boarder(black)
                    else
                        begin
                            Red   = 4'h0;
                            Green = 4'h0;
                            Blue  = 4'h0;
                        end
                end
             
             else
                begin
                    // empty glyph, just the background(brown)
                    if(cur_blk == 4'h0 || cur_blk == 4'h3)
                        begin
                            Red   = 4'hf;
                            Green = 4'ha;
                            Blue  = 4'h0;
                        end
                    // black chess, with brown background
                    else if(cur_blk == 4'h1 || cur_blk == 4'h4)
                        begin
                            addr = inside_y;
                            // if we are drawing the chess
                            if(data[inside_x])
                                begin
                                    Red   = 4'h0;
                                    Green = 4'h0;
                                    Blue  = 4'h0;
                                end
                            // we are drawing the background(brown)
                            else
                                begin
                                    Red   = 4'hf;
                                    Green = 4'ha;
                                    Blue  = 4'h0;
                                end
                        
                        end
                    // white chess, with brown background
                    else 
                        begin
                            addr = inside_y;
                            // if we are drawing the chess
                            if(data[inside_x])
                                begin
                                    Red   = 4'hf;
                                    Green = 4'hf;
                                    Blue  = 4'hf;
                                end
                            // we are drawing the background(brown)
                            else
                                begin
                                    Red   = 4'hf;
                                    Green = 4'ha;
                                    Blue  = 4'h0;
                                end      
                        end        
                end
            end
        // we are drawing outside of the board
        else
            begin
            Red   = 4'hf;
            Green = 4'hf;
            Blue  = 4'hf;
            end
   
    end 
  


endmodule
