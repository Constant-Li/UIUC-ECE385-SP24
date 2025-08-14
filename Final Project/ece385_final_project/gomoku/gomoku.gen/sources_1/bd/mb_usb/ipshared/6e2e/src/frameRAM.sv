/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  frameRAM
(
		input logic [18:0] read_address,
		output logic [4:0] data_Out
);

// mem has width of 5 bits and a total of 166500 addresses
logic [4:0] mem [166500]; 

initial
begin
	 $readmemh("/VivadoProject/ip_repo/hdmi_text_controller_1_0/src/sprite_originalsmenu1.txt", mem);


end

assign data_Out = mem[read_address];



endmodule
