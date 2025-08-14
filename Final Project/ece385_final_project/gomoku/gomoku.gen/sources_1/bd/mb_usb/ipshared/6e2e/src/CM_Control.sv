module CM_Control(
    input  logic [9:0]  DrawX, DrawY,
    input logic [3:0] s10,s1, m1, m10,
    input logic clk_25MHz,
    
    input logic [23:0] color_reg[24],
    input logic [31:0] mem_reg[100],

    output logic [7:0]  Out_Red, Out_Green, Out_Blue
    
    );
    
    logic [7:0] menu_Red, menu_Green, menu_Blue;
    logic [7:0] game_Red, game_Green, game_Blue;
    
    logic [31:0] status_reg_temp;
    
    assign status_reg_temp = mem_reg[65];
    
    //Color Mapper of Main Menu
    color_mapper_menu color_menu(
        .DrawX(DrawX),
        .DrawY(DrawY),
        .clk_25MHz(clk_25MHz),
        .color_reg(color_reg),
        .Red(menu_Red),
        .Green(menu_Green),
        .Blue(menu_Blue)
    );   
    
    //Color Mapper of Game
    color_mapper color_instance(
        .DrawX(DrawX),
        .DrawY(DrawY),              
        .s10(s10),
        .s1(s1),
        .m1(m1),
        .m10(m10),
        .mem_reg(mem_reg),
        .Red(game_Red),
        .Green(game_Green),
        .Blue(game_Blue)
     );
     
    always_comb
    begin
        if(status_reg_temp == 31'h0)
            begin
                Out_Red = menu_Red;
                Out_Green = menu_Green; 
                Out_Blue = menu_Blue;
            end
        else
            begin
                Out_Red = game_Red;
                Out_Green = game_Green;
                Out_Blue = game_Blue;
            end
    end
endmodule
