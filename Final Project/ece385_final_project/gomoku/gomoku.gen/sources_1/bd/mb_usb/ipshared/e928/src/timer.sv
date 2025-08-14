`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/18 17:42:43
// Design Name: 
// Module Name: timer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module timer(
    input logic reset,
    input logic clk, // it is now 125 mhz
    input logic [31:0] status_reg,
    output logic clk_1Hz,
    
    output logic [3:0] s10,
    output logic [3:0] s1,
    output logic [3:0] m1,
    output logic [3:0] m10
    );
    
    logic [20:0]countMax;
    logic [20:0]count_60hz;
    logic [20:0]count_1hz;
    logic [11:0]seconds;
    
    logic [3:0] sec10;
    logic [3:0] sec1;
    logic [3:0] min1;
    logic [3:0] min10;
    logic [11:0] temp1;
    logic [11:0] temp2;
    logic after_7 = 0;
    
    assign countMax = 20'd1041666;    
    always_comb
    begin
        temp1 = (seconds % 60);
        sec10 = temp1 % 10;
        sec1 = temp1 / 10;
        
        temp2 = (seconds / 60);
        min1 = temp2 % 10;
        min10 = temp2 / 10;
        
        s10 = sec10;
        s1 = sec1;
        m1 = min1;
        m10 = min10;
    end
    
    always_ff @ (posedge clk )
    begin : timer_func
        if (reset || (status_reg == 32'h00000000)) 
        begin
            seconds <= 1'b0;
            sec10 <= 1'b0;
            count_60hz <= 1'b0;
            count_1hz <= 1'b0;
            clk_1Hz <= 1'b0;
        end
        else
        begin
            if (count_1hz == 8'd120)  // 60 is a bit too fast
            begin
                clk_1Hz <= 1'b1;
                seconds <= seconds + 1;
                sec10 <= sec10 + 1;
                count_1hz <= 1'b0;
                if (sec10 == 4'd10)
                    sec10 <= 1'b0;
            end
            else
            begin
                clk_1Hz <= 1'b0;
                if (count_60hz == countMax) // means 1/60 second
                    begin
                        count_60hz <= 1'b0;
                        count_1hz <= count_1hz + 1;
                    end
                else
                    begin
                        count_60hz <= count_60hz + 1;
                    end
            end
        end
    end
endmodule
