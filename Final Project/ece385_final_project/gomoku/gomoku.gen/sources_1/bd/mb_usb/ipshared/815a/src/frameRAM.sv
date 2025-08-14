/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  frameRAM
(
		input logic [18:0] read_address,
		output logic [4:0] data_Out,
		output logic [4:0] data_Out1
);

// mem has width of 5 bits and a total of 240000 addresses
logic [4:0] mem [240000]; // 600 * 400 = 240000
logic [4:0] mem1[240000];

initial
begin
	 $readmemh("/VivadoProject/ip_repo/hdmi_text_controller_1_0/src/sprite_originalsmenu2.txt", mem);
	 $readmemh("/VivadoProject/ip_repo/hdmi_text_controller_1_0/src/sprite_originalsmenu1.txt", mem1);

end


assign data_Out = mem[read_address];
assign data_Out1 = mem1[read_address];


endmodule
