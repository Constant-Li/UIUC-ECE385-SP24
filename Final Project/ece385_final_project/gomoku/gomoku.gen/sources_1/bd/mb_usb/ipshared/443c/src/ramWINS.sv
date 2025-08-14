/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  ramWINS
(
		input logic [18:0] read_address,
		input logic [2:0] wins,
		output logic [2:0] data_Out
);

// mem has width of 3 bits and a total of 8520 addresses
logic [2:0] mem [8520]; // 120 * 71 = 8520     BLACK
logic [2:0] mem1 [8520];// WHITE
logic [2:0] mem2 [8520];// HUMAN
logic [2:0] mem3 [8520];// AI
initial
begin
	 $readmemh("/VivadoProject/ip_repo/hdmi_text_controller_1_0/src/BLACKWINS.txt", mem);
	 $readmemh("/VivadoProject/ip_repo/hdmi_text_controller_1_0/src/WHITEWINS.txt", mem1);
	 $readmemh("/VivadoProject/ip_repo/hdmi_text_controller_1_0/src/HUMANWINS.txt", mem2);
	 $readmemh("/VivadoProject/ip_repo/hdmi_text_controller_1_0/src/AIWINS.txt", mem3);
end

always_comb
begin
    case(wins)
        3'b001:
            data_Out = mem[read_address];
        3'b010:
            data_Out = mem1[read_address];
        3'b011:
            data_Out = mem2[read_address];
        3'b100:
            data_Out = mem3[read_address];
    endcase
end

endmodule
