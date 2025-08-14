//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    For use with ECE 385 text_mapper                                   --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input  logic [9:0]  DrawX, DrawY,                     
                       input logic [3:0] s10,s1,m1,m10,
                       input  logic [31:0] mem_reg[100],
                       output logic [3:0]  Red, Green, Blue );
    
    // col and row are offset into registers
    logic [9:0] col, row;
    logic [9:0] text_col, text_row;
    // cur_reg stores current register in VRAM
    logic [31:0] cur_reg; 
    logic [31:0] text_reg;
    logic [31:0] extra_reg;
    
    logic [7:0] s10_index;
    logic [7:0] s1_index;
    logic [7:0] m1_index;
    logic [7:0] m10_index;
    
    // stores current glyph to draw
    logic [7:0] cur_blk;
    logic [7:0] text_blk;
    
    // stores the character we are drawing, use it as index into font
    logic [4:0] addr;
    logic [10:0] text_addr;
    
    logic [23:0] data;
    logic [7:0] text_data;

    // get the pixel inside
    logic [4:0] inside_x, inside_y;
    logic [4:0] text_inside_x, text_inside_y;
    
    font_rom font(
        .addr(addr),
        .data(data)
    );
    
    text_font text(
        .addr(text_addr),
        .data(text_data)
    );
    
    // transfer numbers from 0-9 => font offset ex. 0x30, 0x31
    number sec10(
        .number(s10),
        .index(s10_index)
    );
    number sec1(
        .number(s1),
        .index(s1_index)
    );
    number min1(
        .number(m1),
        .index(m1_index)
    );
    number min10(
        .number(m10),
        .index(m10_index)
    );
    
    // draw boarder
    always_comb
    begin
        // if it's inside the board
        if ((DrawX >= 10'd127 && DrawX <= 10'd511) && (DrawY >= 10'd47 && DrawY <= 10'd431))
            begin
            // col = DrawX / 96
            col = (DrawX - 10'd127) / 96; 
            // row = DrawY / 24
            row = (DrawY - 10'd47)  / 24; 

            // DrawX % 24
            inside_x = (DrawX - 10'd127) % 24;
            inside_y = (DrawY - 10'd47) % 24;
            
            addr = inside_y;
            // current 16*16 glyph to draw
            cur_reg = mem_reg[col + row * 4];
            // inside_x % 4 to determine one of four glyph to draw

            case(((DrawX - 10'd127) % 96) / 24)
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
            if(inside_x == 5'd0 || inside_x == 5'd23 || inside_y == 5'd0 || inside_y == 5'd23)
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
        // draw text "GOMOKU"
        else if ((DrawX >= 10'd272 && DrawX <= 10'd399) && (DrawY >= 10'd10 && DrawY <= 10'd41))
            begin
                text_inside_x = ((DrawX - 10'd272) >> 1) % 8;
                text_inside_y = ((DrawY - 10'd10) >> 1) % 16;
                
                // text_reg = "GOMO"
                text_reg = 32'h4f4d4f47;
                // extra_reg = "KU\\"
                extra_reg = 32'h0000554b;
                case((DrawX - 10'd272) >> 6)  // DrawX / 64
                    2'b00:
                        case((DrawX - 10'd272) >> 4)  // DrawX / 16
                            2'b00:
                                text_blk = text_reg[7:0];
                             2'b01: 
                                text_blk = text_reg[15:8];
                            2'b10:
                                text_blk = text_reg[23:16];
                            2'b11: 
                                text_blk = text_reg[31:24];
                        endcase
                    2'b01:
                         case((DrawX - 10'd336) >> 4)  // DrawX / 16
                            2'b00:
                                text_blk = extra_reg[7:0];
                             2'b01: 
                                text_blk = extra_reg[15:8];
                            2'b10:
                                text_blk = extra_reg[23:16];
                            2'b11: 
                                text_blk = extra_reg[31:24];
                         endcase
                endcase
                
                text_addr = (text_blk << 4) + text_inside_y;
                
                if(text_data[7 - text_inside_x])
                    begin   // drawing font black
                        Red   = 4'h0;
                        Green = 4'h0;
                        Blue  = 4'h0;
                    end
                // we are drawing the background(white)
                else
                   begin
                       Red   = 4'hf;
                       Green = 4'hf;
                       Blue  = 4'hf;
                   end
                
            end
        // draw text "time"
        else if ((DrawX >= 10'd544 && DrawX <= 10'd575) && (DrawY >= 10'd145 && DrawY <= 10'd160))
            begin
                text_inside_x = (DrawX - 10'd544) % 8;
                text_inside_y = (DrawY - 10'd145) % 16;
                
                // text_reg = "TIME"
                text_reg = 32'h454d4954;
 
                case((DrawX - 10'd544) >> 3)  // DrawX / 8
                2'b00:
                    text_blk = text_reg[7:0];
                2'b01: 
                    text_blk = text_reg[15:8];
                2'b10:
                    text_blk = text_reg[23:16];
                2'b11: 
                    text_blk = text_reg[31:24];
                endcase
                
                text_addr = (text_blk << 4) + text_inside_y;
                
                if(text_data[7 - text_inside_x])
                    begin   // drawing font black
                        Red   = 4'h0;
                        Green = 4'h0;
                        Blue  = 4'h0;
                    end
                // we are drawing the background(white)
                else
                   begin
                       Red   = 4'hf;
                       Green = 4'hf;
                       Blue  = 4'hf;
                   end
            end
            
        // draw timer 
        else  if ((DrawX >= 10'd540 && DrawX <= 10'd579) && (DrawY >= 10'd167 && DrawY <= 10'd182))
            begin
                text_inside_x = (DrawX - 10'd540) % 8;
                text_inside_y = (DrawY - 10'd166) % 16;
                
                if((DrawX >= 10'd540) && (DrawX <= 10'd547)) 
                  begin  // min10
                    text_blk = m10_index;  
                  end
                else if ((DrawX >= 10'd548) && (DrawX <= 10'd555))
                  begin  // min1
                    text_blk = m1_index;
                  end
                else if ((DrawX >= 10'd556) && (DrawX <= 10'd563))
                  begin // :
                    text_blk = 8'h3a; 
                   
                  end
                else if ((DrawX >= 10'd564) && (DrawX <= 10'd571))
                  begin // sec1
                    text_blk = s1_index;
                  end
                else if ((DrawX >= 10'd572) && (DrawX <= 10'd579))
                  begin // sec10
                    text_blk = s10_index;
                  end
                  
                // addr into font is test_blk * 16 + drawY % 16 // 
                text_addr = (text_blk << 4) + text_inside_y;
                
                if(text_data[7 - text_inside_x])
                    begin   // drawing font black
                        Red   = 4'h0;
                        Green = 4'h0;
                        Blue  = 4'h0;
                    end
                // we are drawing the background(white)
                else
                   begin
                       Red   = 4'hf;
                       Green = 4'hf;
                       Blue  = 4'hf;
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
