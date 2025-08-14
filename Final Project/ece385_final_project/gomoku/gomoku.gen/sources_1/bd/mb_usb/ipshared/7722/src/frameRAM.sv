/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  frameRAM
(
		input logic [18:0] read_address,
		output logic [5:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [5:0] mem [149050]; // 550 * 271 = 149050

initial
begin
	 $readmemh("/VivadoProject/ip_repo/hdmi_text_controller_1_0/src/sprite_originalsgomoku.txt", mem);

end


assign data_Out = mem[read_address];


endmodule
